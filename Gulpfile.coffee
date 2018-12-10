gulp = require 'gulp'
sourceMaps = require 'gulp-sourcemaps'
liveReload = require 'gulp-livereload'
sass = require 'gulp-sass'
browserify = require 'browserify'
watchify = require 'watchify'
sourceStream = require 'vinyl-source-stream'
concat = require 'gulp-concat'

gulp.task 'default', ['scss', 'coffee']

gulp.task 'scss', ->
  gulp.src 'app/assets/stylesheets/**/*.scss'
  .pipe sourceMaps.init()
  .pipe sass(
    sourceComments: true
    outputStyle: 'compressed'
  )
  .pipe concat('application.css')
  .pipe sourceMaps.write()
  .pipe gulp.dest('public/stylesheets')
  .pipe liveReload()

coffeeStream = browserify
  entries: ['app/assets/javascripts/application.coffee']
  extensions: ['.coffee']
  debug: true

transformCoffee = (stream) ->
  stream
    .transform 'coffeeify'
    .transform 'uglifyify'

bundleCoffee = (stream) ->
  stream
    .bundle()
    .pipe sourceStream('application.js')
    .pipe gulp.dest('public/javascripts')
    .pipe liveReload()

gulp.task 'coffee', ->
  bundleCoffee transformCoffee(coffeeStream)
