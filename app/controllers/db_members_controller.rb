class DbMembersController < ApplicationController
  before_action :set_db_member, only: [:show, :edit, :update, :destroy]

  # GET /db_members
  # GET /db_members.json
  def index
    require_user()
    @db_members = DbMember.all
  end

  # GET /db_members/1
  # GET /db_members/1.json
  def show
    require_user()
  end

  # GET /db_members/new
  def new
    require_user()
    @db_member = DbMember.new
  end

  # GET /db_members/1/edit
  def edit
    require_user()
  end

  # POST /db_members
  # POST /db_members.json
  def create
    require_user()
    @db_member = DbMember.new(db_member_params)

    respond_to do |format|
      if @db_member.save
        format.html { redirect_to @db_member, notice: 'Db member was successfully created.' }
        format.json { render :show, status: :created, location: @db_member }
      else
        format.html { render :new }
        format.json { render json: @db_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /db_members/1
  # PATCH/PUT /db_members/1.json
  def update
    require_user()
    respond_to do |format|
      if @db_member.update(db_member_params)
        format.html { redirect_to @db_member, notice: 'Db member was successfully updated.' }
        format.json { render :show, status: :ok, location: @db_member }
      else
        format.html { render :edit }
        format.json { render json: @db_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /db_members/1
  # DELETE /db_members/1.json
  def destroy
    require_user()
    @db_member.destroy
    respond_to do |format|
      format.html { redirect_to db_members_url, notice: 'Db member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_db_member
      @db_member = DbMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def db_member_params
      params.require(:db_member).permit(:MembershipId, :MembershipType, :Certified, :Prefix, :FirstName, :MiddleName, :LastName, :Title, :ShortSummary, :FullSammary, :Address, :City, :Pin, :MobilePhone, :LandLine, :EmailPrimary, :Email, :Secondary, :WebsitePrimary, :WebsiteSecondary, :DisplayOrder, :active, :IsAdmin)
    end
end
