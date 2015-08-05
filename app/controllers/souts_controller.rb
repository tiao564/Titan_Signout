class SoutsController < ApplicationController
 def index
  @souts = Sout.all
 end

 def show
  @sout = Sout.find(params[:id])
 end

 def new
  @sout = Sout.new
 end

 def edit
  @sout = Sout.find(params[:id])
 end

 def create
  @sout = Sout.new(sout_params)
  @sout.date_borrowed = Time.now.to_s[0..-7]

  if @sout.save
   redirect_to souts_path
  else
   render 'new'
  end
 end

 def update
  @sout = Sout.find(params[:id])

  if @sout.update(sout_params)
   redirect_to souts_path
  else
   render 'edit'
  end
 end

 def sign_out
  @sout = Sout.find(params[:sout_id])
  @sout.update_attribute(:date_returned, Time.now.to_s[0..-7])
 end

 def destroy
  @sout = Sout.find(params[:id])
  @sout.destroy
  redirect_to souts_path
 end

private
 def sout_params
  params.require(:sout).permit(:item_name, :borrowed_by, :date_to_be_returned)
 end 
end
