class ItemsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @item = current_user.items.build( item_params )
    #@item.user = @user
    @new_item = Item.new

    if @item.save
     flash[:notice] = "Task was created."
    else
     flash[:error] = "There was an error saving the task. Please try again."
    end
      respond_to do |format|
      format.html
      format.js   # calls the create.js.erb 
    end
  end

  def destroy

    # authorize @item
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])

    if @item.destroy
     flash[:notice] = "Item was removed."
    else
     flash[:error] = "Item couldn't be deleted. Try again."
    end
    
     respond_to do |format|
     format.html
     format.js     # calls the create.js.erb 
    end
  end 
  
  private 

  def item_params
   params.require(:item).permit(:name, :user_id)
  end
end



