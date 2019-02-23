class StoresController < ApplicationController
	before_action :find_store, only: [:show, :edit, :update, :destroy]

	def index
		@stores = Store.all.order("created_at DESC")
	end

	def show
	end

	def edit
	end

	def update
		if @store.update(store_params)
			redirect_to store_path(@store)
		else
			render 'edit'
		end
	end

	def new
		@store = current_user.stores.build
	end

	def create
		@store = current_user.stores.build(store_params)
		if @store.save 
			redirect_to root_path
		else
			render 'new'
		end
	end

	def destroy
		@store.destroy
		redirect_to root_path
	end

	private

		def store_params
			params.require(:store).permit(:name, :address, :address_line2, :address_line3, :beer_cost, :toilet_available)
		end

		def find_store
			@store = Store.find(params[:id])
		end
end

 