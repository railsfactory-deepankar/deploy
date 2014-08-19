class BlogsController < ApplicationController
	before_filter :check_privileges!, only: [:index, :new, :create, :show, :edit, :update, :destroy]
	def index
	    @blog = Blog.where(user_id: current_user.id)#.paginate(page: params[:page], per_page: 2)
	   # @blog1 = Blog.where.not(user_id: current_user.id, visible: 0)
	     
	end

	def show
	    @blog = Blog.find(params[:id])
	   
	end

	def new
	   @blog = Blog.new
	end

	def create
	   @blog = Blog.new(params[:blog ].permit(:title, :content, :visible))
	   @blog.user = current_user
	   if @blog.save
	    redirect_to blogs_path,:notice => "Your blog was saved"
	   else
	     render "new"
           end
	end

	def edit
	   @blog = Blog.find(params[:id])
	end

	def update
	   @blog = Blog.find(params[:id])
	   if @blog.update(params[:blog].permit(:title, :content))
 	    redirect_to blogs_path, :notice => "Your blog was updated"
	   else
	     render "edit"
	   end
	end

	def destroy
	  @blog = Blog.find(params[:id])
	   @blog.destroy
	  redirect_to blogs_path, :notice => "Your blog was deleted"
	
	end
end
