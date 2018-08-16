class StoresController < ApplicationController
	before_action :find_store, only: [:show, :edit, :update, :destroy]
	before_action :set_toilets, except: [:show, :index]

	def index
		if params[:toilet].blank?
			@stores = Store.all.order("created_at DESC")
		else
			@toilet_id = Toilet.find_by(toilet_available: params[:toilet]).id
		  @stores = Store.where(:toilet_id => @toilet_id).order("created_at DESC")
		end
	end

	def show
	end

	def edit
		@toilets = Toilet.all.map{ |t| [t.toilet_available, t.id] }
	end

	def update
		@store.toilet_id = params[:toilet_id] 
		if @store.update(store_params)
			redirect_to store_path(@store)
		else
			render 'edit'
		end
	end

	def new
		@store = current_user.stores.build
		@toilets = Toilet.all.map{ |t| [t.toilet_available, t.id] }
	end

	def create
		@store = current_user.stores.build(store_params)
		@store.toilet_id = params[:toilet_id] 

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
			params.require(:store).permit(:name, :address, :address_line2, :address_line3, :beer_cost, :toilet_id)
		end

		def find_store
			@store = Store.find(params[:id])
		end

		def set_toilets 
		  @toilets = Toilet.all.pluck(:toilet_available, :id) 
		end
end

 