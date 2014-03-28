require 'date'

module Jekyll
  class TalkURL < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = tag_name
    end

    def render(context)
      page = context.environments.first['page']
      staticURL = context.registers[:site].config['staticURL']
      year = page['date'].strftime('%Y')
      date = page['date'].strftime('%Y-%m-%d')
      passage = page['passage'].downcase.gsub(' ','_')
      author = page['author'].downcase.gsub(' ','_')

      return "#{staticURL}#{year}/#{date}-#{passage}-#{author}.mp3"
    end
  end
end

Liquid::Template.register_tag('talkURL', Jekyll::TalkURL)
