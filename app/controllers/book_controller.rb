class BookController < ApplicationController
def list
      @books = Book.all
   end
   def show
      @book = Book.find(params[:id])
   end
   def new
      @book = Book.new
      @subjects = Subject.all
   end
   def create

      @book = Book.create(:title => params[:title],:price => params[:price],:subject_id => params[:book][:subject_id],:description => params[:description])
      if @book.save
            redirect_to :action => 'list'
      else
            @subjects = Subject.all
            render :action => 'new'
      end
   end
   def edit
      @book = Book.find(params[:id])
      @subjects = Subject.find(:all)
   end
   def update
      @book = Book.find(params[:id])
      if @book.update_attributes(params[:book])
         redirect_to :action => 'show', :id => @book
      else
         @subjects = Subject.find(:all)
         render :action => 'edit'
      end
   end
   def delete
      Book.find(params[:id]).destroy
      redirect_to :action => 'list'
   end
   def show_subjects
      @subject = Subject.find(params[:id])
   end
end
