class RequestsController < ApplicationController
  # GET /requests
  # GET /requests.xml
  
  def index    
    @requests = Request.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.xml
  def show
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.xml
  def new
    
    @request = Request.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
  end

  # POST /requests
  # POST /requests.xml
  def create
    
    @request = Request.new(params[:request])
    @request[:user_id] = session.data[:user_id];
    
    
=begin

    puts "\n\n\n\n\n This is params:"
    pp params

    puts "\n\n\n\n\n This is @request:"
    pp @request

    puts "\n\n\n\n\n This is Request:"
    pp Request


Example Output:

This is params:
  {"commit"=>"Create",
 "authenticity_token"=>"e917bdbdfb1b233ca4cd4ef50e276452824831cb",
 "action"=>"create",
 "controller"=>"requests",
 "request"=> {"price"=>"222", "max"=>"1", "date_initiated"=>"", "query"=>"fourth baby"}}

This is @request:
  #<Request id: nil, user_id: nil, query: "fourth baby", price: #<BigDecimal:22a52cc,'0.222E3',4(8)>, date_initiated: nil, date_found: nil, done: nil, max: 1, created_at: nil, updated_at: nil>

This is Request:
  Request(id: integer, user_id: integer, query: string, price: decimal, date_initiated: datetime, date_found: datetime, done: boolean, max: integer, created_at: datetime, updated_at: datetime)
    
=end

    

    respond_to do |format|
      if @request.save
        flash[:notice] = 'Request was successfully created.'
        format.html { redirect_to(@request) }
        format.xml  { render :xml => @request, :status => :created, :location => @request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.xml
  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        flash[:notice] = 'Request was successfully updated.'
        format.html { redirect_to(@request) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.xml
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to(requests_url) }
      format.xml  { head :ok }
    end
  end
end
