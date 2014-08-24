# Jekyll-to-Ghost
#
# This Jekyll plugin exports your Markdown posts into a format that can be easily imported by Ghost.
# http://ghost.org
#
# Author: Matt Harzewski
# Copyright: Copyright 2013 Matt Harzewski
# License: GPLv2 or later
# Version: 1.0.0


require 'json'



module Jekyll

	class GhostPage < StaticFile

		def initialize(site, base, dir, name, contents)
			@site = site
			@base = base
			@dir  = dir
			@name = name
			@contents = contents
		end

		def write(dest)
			File.open(File.join(@site.config['destination'], 'ghost_export.json'), 'w') do |f|
				f.write(@contents.to_json.to_s)
			end
			true
		end
	end



	class JsonFileGenerator < Generator
		safe true
		def initialize(site)
			super
			@tags = []
			@postTagMap = Hash.new
		end


		def generate(site)

			converter = site.getConverterImpl(Jekyll::Converters::Markdown)
			ex_posts = []
			id = 0

			site.posts.each do |post|

				timestamp = post.date.to_i * 1000

				ex_post = {
                    "id" => id,
                    "slug" => post.slug,
                    "title" => post.title,
                    "passage" => post['passage'],
                    "state" => "published",
                    "__v" => 0,
                    "audio" => {
                        "filename" => "#{post.slug}.mp3",
                        "path" => "",
                        "filetype" => "audio/mp3",
                        "url" => "//s3-ap-southeast-2.amazonaws.com/static.melbourneevangelicalchurch.com.au/#{post.date}/#{post.slug}.mp3"
                    },
                    "author" => post['author'],
                    "content" => converter.convert(post.content),
                    "date" => post.date
                }

				ex_posts.push(ex_post)

				id += 1
			end


			site.static_files << GhostPage.new(site, site.source, site.config['destination'], 'ghost_export.json', ex_posts)

		end
	end
end
