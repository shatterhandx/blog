# RVM
 
#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
#require "rvm/capistrano"
#set :rvm_ruby_string, 'default'
#set :rvm_type, :user
 
# Bundler
 
require "bundler/capistrano"
 
# General
 
set :application, "blog"
set :user, "app"
 
set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :copy
 
set :use_sudo, false
 
set :normalize_asset_timestamps, false
 
# Git

set :scm, :git
set :repository,  "git@github.com:shatterhandx/#{application}.git"
set :branch, "master"
 
# VPS
 
role :web, "208.73.23.214"
role :app, "208.73.23.214"
role :db,  "208.73.23.214", :primary => true
role :db,  "208.73.23.214"
 
# Passenger
 
namespace :deploy do
	task :start do ; end
	task :stop do ; end
	task :restart, :roles => :app, :except => { :no_release => true } do
		run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
	end
end