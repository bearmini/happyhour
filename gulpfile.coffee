gulp = require 'gulp'

gulp.task 'default', ['run']

gulp.task 'run', ['jade', 'sass', 'uglify', 'copy']

gulp.task 'jade', () ->
  del = require 'del'
  del.sync '.dist/**/*.html'
  jade = require 'gulp-jade'
  gulp.src 'ui/**/*.jade'
      .pipe jade()
      .pipe gulp.dest('.dist/')


gulp.task 'sass', () ->
  del = require 'del'
  del.sync '.dist/**/*.css'
  sass = require 'gulp-sass'
  gulp.src 'ui/sass/**/*.scss'
    .pipe sass()
    .pipe gulp.dest('.dist/css')

gulp.task 'uglify', () ->
  del = require 'del'
  del.sync '.dist/**/*.js'
  uglify = require 'gulp-uglify'
  gulp.src 'ui/**/*.js'
    .pipe uglify()
    .pipe gulp.dest('.dist/')

gulp.task 'copy', () ->
  del = require 'del'
  del.sync '.dist/bower_components'
  del.sync '.dist/vendor'
  gulp.src 'vendor/**/*'
    .pipe gulp.dest('.dist/vendor')
  gulp.src 'bower_components/**/*'
    .pipe gulp.dest('.dist/bower_components')
