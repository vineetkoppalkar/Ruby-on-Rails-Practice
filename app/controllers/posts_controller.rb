class PostsController < ApplicationController

    # http_basic_authenticate_with name: "John", password: "1234", except: [:index, :show]

    def index
        # Get all posts
        @posts = Post.all
    end

    def show
        # Find the post object from sqlite using the id
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        # Will print out all the parameters sent from the form
        # render plain: params[:post].inspect

        # Create a new post with the form data
        @post = Post.new(post_params)

        # Save post in sqlite
        if(@post.save)
            # Redirect to show view (show method)
            redirect_to @post
        else
            # If form validation fails show 'new' page
            render 'new'
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        # Update post in sqlite
        if(@post.update(post_params))
            # Redirect to show view (show method)
            redirect_to @post
        else
            # If form validation fails show 'edit' page
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to posts_path
    end

    private def post_params
        params.require(:post).permit(:title, :body)
    end
end
