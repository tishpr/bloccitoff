class ItemsController < ApplicationController

  def create
    @user = User.find(params[:user_id])

    @item = current_user.items.build( item_params )    
    @new_item = Item.new
   authorize @item #works here.. not on line 5 as i tried earlier
     if @item.save
       flash[:notice] = "Task was created."
     else
       flash[:error] = "There was an error saving the task. Please try again."
     end
      respond_to do |format|
      format.html 
      format.js  
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = current_user.items.find(params[:id])

      if @item.destroy
        flash[:notice] = "Item was removed."
      else
        flash[:error] = "Item couldn't be deleted. Try again."
      end
    
     respond_to do |format|
     format.html
     format.js     
    end
  end 
  
  private 

  def item_params
   params.require(:item).permit(:name, :user_id)
  end
end



