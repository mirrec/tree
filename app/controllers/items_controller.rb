class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]



  # GET /items
  # GET /items.json
  def index
   if params[:q]

    najdene =Item.where("name LIKE ?", "%#{params[:q]}%" )
    list = parent_items_list(najdene)

    @items = Item.where(:id => list )
  
  else
    #@products = []
    # puts "prazdne"
    @items = Item.all

  end

  
  respond_to do |format|
  format.html # index.html.erb
  format.xml  { render :xml => @items }
  format.json { render :json => Item.json_tree(@items.arrange(:order => :created_at))}
 end

end

  # GET /items/1
  # GET /items/1.json
  def show

  end

  # GET /items/new
  def new
    #@item = Item.new
  #  if params[:parent_id]
  @item = Item.new(:parent_id=> params[:parent_id])
   #   else
    #      @item = Item.new
    # end   
    
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    puts "********************* " + item_params.to_s
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def render_json_tree (items)
      Item.json_tree(items)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def add_item(items_with_parents,item)

    end  

    def parent_items_list (items, list = [])


      if items.respond_to?(:each)
       items.each { |item| 
        list << item.id
        if item.parent
         parent_items_list(item.parent,list)
         list << item.parent.id
         puts "v cykle " + item.parent.name 
       end   
     }


   else
     if items.parent
       parent_items_list(items.parent,list)
       list << items.parent.id
       puts "uz iba item " + items.parent.name
     end 
   end
   return list
 end

 def parent_items(items,items_with_parents = Item.none)

  if items.respond_to?(:each)
   items.each { |item| 
    if item.parent
     parent_items(item.parent,items_with_parents )
     items_with_parents << item.parent
     puts "v cykle " + item.parent.name 
   end   
 }


else
 if items.parent
   parent_items(items.parent,items_with_parents)
   items_with_parents << items.parent
   puts "uz iba item " + items.parent.name
 end 

end

items_with_parents 
end 

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name,:parent_id)
    end
  end
