local RoleCellBeAssistUI = class("RoleCellBeAssistUI")
local ClassRoleObj = require('script/app/obj/roleobj')
local ClassItemCell = require('script/app/global/itemcell')

function RoleCellBeAssistUI:ctor(parentUI,pos, obj)
	self.parentUI = parentUI
	self.obj = obj
	self.nor_pl = nil     		--右边主panel
	self.funcbtn = nil			--获取或者上阵按钮
	self.lv = nil				--等级
	self.soldiertypeimg = nil   --兵种类型
    self.pos = pos
	self:initPanel()
	self.isBeassist = false
	self.iscanmerge = false
end

function RoleCellBeAssistUI:initPanel()
	local panel = cc.CSLoader:createNode("csb/rolecellbeassist.csb")
    local bgimg = panel:getChildByName("bg_img")
    bgimg:removeFromParent(false)
    self.panel = ccui.Widget:create()
    self.bgimg = bgimg
    self.panel:addChild(bgimg)
    self.panel:setName("rolecellbeassist" .. self.pos)
	self.nor_pl = bgimg:getChildByName('nor_pl')
	self.headIcon = bgimg:getChildByName('head_icon')
	
	local namebg = self.nor_pl:getChildByName('namebg_img')
	self.name = namebg:getChildByName('name_tx')
	self.lv = namebg:getChildByName('lv_tx')
	self.soldiertypeimg = namebg:getChildByName('soldiertype_img')
	self.soulimg = self.nor_pl:getChildByName('soul_img')
	self.soulnumtx = self.nor_pl:getChildByName('soulnum_tx')
	self.funcbtn = self.nor_pl:getChildByName('func_btn')
	self.funcbtn:addClickEventListener(function (sender, eventType)
		if self.isBeassist then
			--换将
			local args = {
    			pos = RoleMgr:getSelectRolePos(),
                hid = self.obj:getId()
    		}
			MessageMgr:sendPost("exchange", "hero", json.encode(args), function (jsonObj)
				print(json.encode(jsonObj))
				local code = jsonObj.code
				if code == 0 then
					local awards = jsonObj.data.awards
					GlobalApi:parseAwardData(awards)
					local costs = jsonObj.data.costs
                    if costs then
                        GlobalApi:parseAwardData(costs)
                    end
					RoleMgr:setCurHeroChange(true)
					RoleData:exchangeRole(RoleMgr:getSelectRolePos(),self.obj:getId(),false)
					RoleMgr:updateRoleMainUI()
					RoleMgr:hideRoleSelectListOutSide()
					RoleMgr:updateRoleList(true)
					RoleMgr:setDirty()
				elseif code == 101 then
					promptmgr:showSystenHint(GlobalApi:getLocalStr_new('ROLE_SELECT_INFO5'), COLOR_TYPE.RED)
				end
			end)
		else
			local function callback()
				local args = {
	                cid = self.obj:getId(),
	                num = 1
	    		}
				MessageMgr:sendPost("resolve_card", "hero", json.encode(args), function (jsonObj)
					print(json.encode(jsonObj))
					local code = jsonObj.code
					if code == 0 then
						local awards = jsonObj.data.awards
						GlobalApi:parseAwardData(awards)
						local costs = jsonObj.data.costs
	                    if costs then
	                        GlobalApi:parseAwardData(costs)
	                    end
						if self.obj:getNum() > 0 then
							self:setType()
						else
							RoleMgr:updateRoleList(true)
						end
						local disaward = DisplayData:getDisplayObj(awards[1])
						local str = string.format(GlobalApi:getLocalStr_new('ROLE_SELECT_INFO6'),self.obj:getName(),tonumber(disaward:getNum()))
						promptmgr:showSystenHint(str, COLOR_TYPE.GREEN)
					end
				end)
			end
			--分解武将
		    if self.obj:getQuality() >= 5 then
                promptmgr:showMessageBox(string.format(GlobalApi:getLocalStr_new("ROLE_SELECT_INFO7")), MESSAGE_BOX_TYPE.MB_OK_CANCEL, function ()
                    callback()
                end)
            else
                callback()
            end
		end
	end)

   	bgimg:setTouchEnabled(true)
   	local beginPoint = cc.p(0,0)
    local endPoint = cc.p(0,0)
   	bgimg:addTouchEventListener(function (sender, eventType)
   		if eventType ==  ccui.TouchEventType.ended then
            ChartMgr:showChartInfo(nil,ROLE_SHOW_TYPE.CARD_DECOMPOSE,self.obj)
		end
	end)
end

function RoleCellBeAssistUI:getPanel()
	return self.panel
end

function RoleCellBeAssistUI:setVisible(vis)
	self.panel:setVisible(vis)
end

function RoleCellBeAssistUI:upDateUI()
	local obj =self.obj
	if obj:getId() ~= 0 then
		self.name:setString(obj:getName())
		self.name:setTextColor(obj:getNameColor())
		self.soldiertypeimg:loadTexture('uires/ui_new/common/soldier_'..self.obj:getSoldierId()..'.png')
		self.soldiertypeimg:ignoreContentAdaptWithSize(true)
		self.soulnumtx:setString(obj:getSoulNum())
	end
end

function RoleCellBeAssistUI:update(index,obj)
	if not obj then
		return
	end
	self.obj = obj
	self.pos = self.obj:getPosId()
	self.index = index
	self:setType()
end

function RoleCellBeAssistUI:setType( isBeassist )
	self.isBeassist = isBeassist or false
	local tx =self.funcbtn:getChildByName('btn_tx')
	if self.isBeassist then
		tx:setString(GlobalApi:getLocalStr_new("COMMON_STR_ASSIST"))
		self.lv:setString("")
		self.soulnumtx:setVisible(false)
		self.soulimg:setVisible(false)
	else
		tx:setString(GlobalApi:getLocalStr_new("COMMON_STR_RESOLVE"))
		self.lv:setString('X' .. self.obj:getNum())
		self.soulnumtx:setVisible(true)
		self.soulimg:setVisible(true)
	end
	self.headIcon:loadTexture(self.obj:getIcon())
	local quality = self.obj:getQuality()
	self.bgimg:loadTexture(COLOR_ROLE_BG[quality])
	self:upDateUI()
end

return RoleCellBeAssistUI