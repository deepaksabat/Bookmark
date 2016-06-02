class BookMarksController < ApplicationController
  before_filter :authorize
  before_action :set_book_mark, only: [:show, :edit, :update, :destroy]
  
   #helper_method :sort_column, :sort_direction
  # GET /book_marks
  # GET /book_marks.json
  def index
      #@book_marks = current_user.book_marks.all
       if params[:search]
        @book_marks = current_user.book_marks.search(params[:search])
      else
        @book_marks = current_user.book_marks.all
      end
      @labels = current_user.labels.all
      #@book_marks = BookMark.order(params[:sort])
     # @book_marks = BookMark.order(:name)
    respond_to do |format|
      format.html
      format.csv { render text: @book_marks.to_csv }
      format.xlsx 
    end
  end

  # GET /book_marks/1
  # GET /book_marks/1.json
  def show
    @book_mark = BookMark.find(params[:id])
  end


  def tag
    if params[:name]
      @book_marks = Label.labled(params[:name])
    else
      @book_marks = current_user.book_marks.all
    end
end
  


  # GET /book_marks/new
  def new
    @book_mark = BookMark.new
  end

  # GET /book_marks/1/edit
  def edit
    @book_mark = BookMark.find(params[:id])
  end

  # POST /book_marks
  # POST /book_marks.json
  def create
    b = book_mark_params
   # b.delete(:label_id)
    @book_mark = BookMark.create(b.merge(user_id: current_user.id))
    params[:book_mark][:label].split(',').each do |label|
     l = Label.where(:name => label, user_id: current_user.id).first_or_create
   BookMarkLabel.create(:label_id => l.id, :book_mark_id => @book_mark.id)
    end
    respond_to do |format|
   if @book_mark.save
      format.html { redirect_to @book_mark, notice: 'book mark created successfully' }
    else
      format.html { render :new}
    end
  end
end
    #params[:book_mark][:label].split(',').each do |label|
     # Label.where(:name => label).first_or_create
      #b = BookMarkLabel.create(:label_id => @label, :book_mark_id => @book_mark)
     #render :action => :index
    #end
 #end
   # PATCH/PUT /book_marks/1
  # PATCH/PUT /book_marks/1.json
  def update
    respond_to do |format|
      if @book_mark.update(book_mark_params)
        format.html { redirect_to @book_mark, notice: 'Book mark was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_mark }
      else
        format.html { render :edit }
        format.json { render json: @book_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_marks/1
  # DELETE /book_marks/1.json
  def destroy
    labels = @book_mark.labels
    BookMark.delete(labels)
    @book_mark.destroy
    respond_to do |format|
      format.html { redirect_to book_marks_url, notice: 'Book mark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_mark
      @book_mark = BookMark.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def book_mark_params
      params.require(:book_mark).permit(:name, :url, :label, :note, :user_id)
    end
end