class PagesController < ApplicationController
  # view all the pages
  def index
    @pages = Page.all
    # renders index.html.erb
  end
  
  # showing a single page
  def show
    # Page.find(1), below is a placeholder for id
    @page = Page.find(params[:id])
    # renders show.html.erb
  end
  
  # displays the form to create the new page
  def new
    @page = Page.new
    # renders new.html.erb
  end

# post request to create the page

def create
  @page = Page.new(pages_params)

  if @page.save
    redirect_to pages_path
  else
    render :new
  end

end

# edit form
  def edit
    @page = Page.find(params[:id])
  end

  # update the page
def update
  @page = Page.find(params[:id])

  if @page.update(pages_params)
    redirect_to pages_path
  else
    # takes them back to edit if they can't or don't edit
    render :edit
  end
end

def destroy
  Page.find(params[:id]).destroy
  redirect_to pages_path
end

#  anything inside the private won't get 
  private
  # This is creating an object of key value pairs, {title: 'adsd', author: 'asds'}
  def pages_params
    params.require(:page).permit(:title, :author, :body)
  end

end
