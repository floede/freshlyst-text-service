require 'sinatra'
require 'sinatra/reloader'

def formatted_list (list)
    list&.gsub(/\([^()]*\)/, '')
end

def format_rioc_list (list)
    list&.gsub!(/\([^()]*\)/, '')
    list&.gsub!(/^[0-9,.,\s]+/, '')
end

def format_lfhq_list (list)
    list&.gsub!(/\([^()]*\)/, '')
    list&.gsub!(/[–]+/, ' - ')
    list&.gsub!(/^[0-9,.,\s]+/, '')
end

get '/' do
    org_list = params["list"]
    formatted_list = formatted_list(org_list)
    erb :index, :locals => {:formatted_list => formatted_list}
end

get '/rioc' do
    org_list = params["list"]
    formatted_list = format_rioc_list(org_list)
    erb :index, :locals => {:formatted_list => formatted_list}
end

get '/lfhq' do
    org_list = params["list"]
    formatted_list = format_lfhq_list(org_list)
    erb :index, :locals => {:formatted_list => formatted_list}
end