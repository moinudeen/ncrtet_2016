class PaymentDetailsController < ApplicationController
  before_action :set_payment_detail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html
def index
    @journal = Journal.new
    @journals = Journal.all
    @payment_details = PaymentDetail.all
    if current_user.email != "admin@ncrtet2015.com"
      if @payment_details.find_by_user_id(current_user.id)

      else
        redirect_to new_payment_detail_path
      end
    else
      respond_to do |format|
        format.html
        format.xlsx
      end
    end
  end

  def show
    respond_with(@payment_detail)
  end

  def new
    @journal = Journal.new
    @journals = Journal.all
    @payment_detail = PaymentDetail.new

    respond_with(@payment_detail)
  end

 def download_pdf
  send_file(
    "#{Rails.root}/public/ticket#{current_user.id}.pdf",
    filename: "ticket.pdf",
    type: "application/pdf"
  )
  end

  def edit
  end

  def create
    @payment_detail = PaymentDetail.new(payment_detail_params)
    @payment_detail.user_id = current_user.id
    @amounts = payment_detail_params[:staff]
    @amount = payment_detail_params[:students]
    puts @amounts
    @payment_detail.amount = @amounts.to_i * 1500 + @amount.to_i  * 1000
    @payment_detail.save
    if @payment_detail.save
      @payment_detail.user_number = "C16#{@payment_detail.id}"
      @payment_detail.save
      # RegistrationMailer.registration_success(@registration).deliver_now
      # format.html { redirect_to papers_path, notice: 'Paper was successfully Uploaded.' }
      # format.json { render :show, status: :created, location: @paper }
    else
      # flash[:notice] = "Post successfully created"
    end
    # render :layout => false
    html = render_to_string(:action => :pdf,:layout => false)
    pdf = WickedPdf.new.pdf_from_string(html)
    save_path = Rails.root.join('public',"ticket#{current_user.id}.pdf")
    File.open(save_path, 'wb') do |file|
      file << pdf
    end
    redirect_to payment_details_path
  end

  def update
    @payment_detail.update(payment_detail_params)
    respond_with(@payment_detail)
  end

  def destroy
    @payment_detail.destroy
    respond_with(@payment_detail)
  end

  def pdf

  #  respond_to do |format|
  #     format.html
  #     format.pdf do
  #       render pdf: "file_name"   # Excluding ".pdf" extension.
  #     end
  #   end
  render :layout => false
end


  private
    def set_payment_detail
      @payment_detail = PaymentDetail.find(params[:id])
    end

    def payment_detail_params
      params.require(:payment_detail).permit(:amount, :dd_number, :bank, :branch,:dd_copy, :accept, :staff, :students)
    end


end
