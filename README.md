

Dev Environment
----------------

### Dependencies 

* Ruby (Dont use OSX's default. Get [Homebrew] and run `brew install ruby`. This removes any need to sudo anything)
* [bundler] `gem install bundler`


### Setup & Deploy

1. Clone the repo
2. Run `bundle install` to install the required dependencies.
3. Either compile the site or run a local server:
    * `jekyll build`
    * `jekyll serve --watch`
4. Make sure that the relevant S3 credentials are in your environment. Use `echo $S3_ID` to test.
```
export S3_ID=[Access Key ID]
export S3_SECRET=[Secret Key]
```
5. Run `s3_website push` to deploy.





[Homebrew]: http://brew.sh/
[s3_website]: https://github.com/laurilehmijoki/s3_website
[bundler]: http://bundler.io/


