class LabelsController < ApplicationController
  before_filter :authorize
  before_action :set_label, only: [:show, :edit, :update, :destroy]

def index
  @labels = current_user.labels.all
end

def show
  @label = current_user.labels.all
end


def edit
    @label = Label.find(params[:id])
  end

def update
    
     @label.update(label_params)
     redirect_to labels_path
       
  end

  # DELETE /book_marks/1
  # DELETE /book_marks/1.json
  def destroy
    @label.destroy
    redirect_to labels_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_label
      @label = Label.find(params[:id])
    end
   

    # Never trust parameters from the scary internet, only allow the white list through.
    def label_params
      params.require(:label).permit(:name)
    end

end
