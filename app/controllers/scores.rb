
module Judy
  class Web < Sinatra::Base

    get '/scores/?' do
      @sort = params[:sort] || 'mean'
      @abstracts = Abstract.fetch_all_abstracts_and_scores(:sort => @sort)
      status 200
      erb :'scores/index', :locals => { :abstracts => @abstracts, :sort => @sort, :user => session[:user] }
    end

    get '/scores/csv/aggregate?' do
      @sort = params[:sort] || 'mean'
      @abstracts = Abstract.fetch_all_abstracts_and_scores(:sort => @sort)
      content_type 'application/csv'
      attachment "Accelerate CFP Review - Aggregated Scores.csv"
      status 200
      erb :'scores/csv-aggregate', :layout => false, :locals => { :abstracts => @abstracts, :sort => @sort, :user => session[:user] }
    end

    get '/scores/csv/individual?' do
      @sort = params[:sort] || 'mean'
      @abstracts = Abstract.fetch_all_abstracts_and_scores(:sort => @sort)
      content_type 'application/csv'
      attachment "Accelerate CFP Review - Individual Scores and Comments.csv"
      status 200
      erb :'scores/csv-individual', :layout => false, :locals => { :abstracts => @abstracts, :sort => @sort, :user => session[:user] }
    end
  end
end
