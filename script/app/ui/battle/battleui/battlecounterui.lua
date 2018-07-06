local BattleCounterUI = class("BattleCounterUI", BaseUI)

function BattleCounterUI:ctor()
    self.uiIndex = GAME_UI.UI_BATTLE_COUNTER
end

function BattleCounterUI:init()
    local counterBgImg = self.root:getChildByName("counter_bg_img")
    local counterAlphaImg = counterBgImg:getChildByName("counter_alpha_img")
    self:adaptUI(counterBgImg, counterAlphaImg)

    local counterImg = counterAlphaImg:getChildByName("counter_img")
    local closeBtn = counterImg:getChildByName("close_btn")
    closeBtn:addClickEventListener(function ()
        self:hideUI()
    end)

    local arenaNeiImg = counterImg:getChildByName("arena_nei_img")
    local titleLabel = arenaNeiImg:getChildByName("title_tx")
    local label1 = arenaNeiImg:getChildByName("text_1")
    local label2 = arenaNeiImg:getChildByName("text_2")
    local label3 = arenaNeiImg:getChildByName("text_3")
    titleLabel:setString(GlobalApi:getLocalStr("STR_COUNTER_RELATION1"))
    label1:setString(GlobalApi:getLocalStr("STR_COUNTER"))
    label2:setString(GlobalApi:getLocalStr("STR_COUNTER"))
    label3:setString(GlobalApi:getLocalStr("STR_COUNTER"))

    local infoLabel1 = arenaNeiImg:getChildByName("info_tx1")
    local infoLabel2 = arenaNeiImg:getChildByName("info_tx2")
    local infoLabel3 = arenaNeiImg:getChildByName("info_tx3")
    infoLabel1:setString(GlobalApi:getLocalStr("STR_COUNTER_INFO_1"))
    infoLabel2:setString(GlobalApi:getLocalStr("STR_COUNTER_INFO_2"))
    infoLabel3:setString(GlobalApi:getLocalStr("STR_COUNTER_INFO_3"))

    local nameLabel1 = arenaNeiImg:getChildByName("name_1")
    local nameLabel2 = arenaNeiImg:getChildByName("name_2")
    local nameLabel3 = arenaNeiImg:getChildByName("name_3")
    nameLabel1:setString(GlobalApi:getLocalStr("SOLDIER_TYPE_2"))
    nameLabel2:setString(GlobalApi:getLocalStr("SOLDIER_TYPE_1"))
    nameLabel3:setString(GlobalApi:getLocalStr("SOLDIER_TYPE_3"))

    local sv = counterImg:getChildByName("sv")
    sv:setScrollBarEnabled(false)

    local rightimgArr = {}
    for i = 1, 3 do
        local rightimg = sv:getChildByName("rightimg_" .. i)
        rightimgArr[i] = rightimg
        local rightLabel1 = rightimg:getChildByName("text_1")
        local rightLabel2 = rightimg:getChildByName("text_2")
        local rightLabel3 = rightimg:getChildByName("text_3")
        local rightLabel4 = rightimg:getChildByName("text_4")
        local rightLabel5 = rightimg:getChildByName("text_5")
        local rightLabel6 = rightimg:getChildByName("text_6")
        local rightLabel7 = rightimg:getChildByName("text_7")
        rightLabel1:setString(GlobalApi:getLocalStr("SOLDIER_TYPE_" .. i))
        rightLabel3:setString(GlobalApi:getLocalStr("STR_ATTACK_SPEED"))
        rightLabel5:setString(GlobalApi:getLocalStr("STR_MOVE_SPEED"))
        if i == 1 then
            rightLabel2:setString(GlobalApi:getLocalStr("STR_ATTACK_MELEE"))
            rightLabel4:setString(GlobalApi:getLocalStr("SOLDIER_SPEED_TYPE_2"))
            rightLabel6:setString(GlobalApi:getLocalStr("SOLDIER_SPEED_TYPE_2"))
        elseif i == 2 then
            rightLabel2:setString(GlobalApi:getLocalStr("STR_ATTACK_REMOTE"))
            rightLabel4:setString(GlobalApi:getLocalStr("SOLDIER_SPEED_TYPE_1"))
            rightLabel6:setString(GlobalApi:getLocalStr("SOLDIER_SPEED_TYPE_3"))
        else
            rightLabel2:setString(GlobalApi:getLocalStr("STR_ATTACK_MELEE"))
            rightLabel4:setString(GlobalApi:getLocalStr("SOLDIER_SPEED_TYPE_2"))
            rightLabel6:setString(GlobalApi:getLocalStr("SOLDIER_SPEED_TYPE_1"))
        end
        rightLabel7:setString(GlobalApi:getLocalStr("STR_SEARCH_AI_" .. i))
    end

    local richText1 = xx.RichText:create()
    richText1:setContentSize(cc.size(272, 40))
    local re11 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_4"), 21, cc.c4b(110, 71, 48, 255))
    re11:setFont("font/gamefont.ttf")
    re11:setStrokeSize(0)
    re11:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    local re12 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_5"), 21, COLOR_TYPE.RED)
    re12:setFont("font/gamefont.ttf")
    re12:setStrokeSize(0)
    re12:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    local re13 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_6"), 21, cc.c4b(110, 71, 48, 255))
    re13:setFont("font/gamefont.ttf")
    re13:setStrokeSize(0)
    re13:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    richText1:addElement(re11)
    richText1:addElement(re12)
    richText1:addElement(re13)
    richText1:setPosition(cc.p(10, 96))
    richText1:setAlignment('left')
    richText1:setAnchorPoint(cc.p(0, 1))
    rightimgArr[1]:addChild(richText1)

    local richText2 = xx.RichText:create()
    richText2:setContentSize(cc.size(272, 40))
    local re21 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_7"), 21, cc.c4b(110, 71, 48, 255))
    re21:setFont("font/gamefont.ttf")
    re21:setStrokeSize(0)
    re21:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    local re22 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_8"), 21, COLOR_TYPE.RED)
    re22:setFont("font/gamefont.ttf")
    re22:setStrokeSize(0)
    re22:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    local re23 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_6"), 21, cc.c4b(110, 71, 48, 255))
    re23:setFont("font/gamefont.ttf")
    re23:setStrokeSize(0)
    re23:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    richText2:addElement(re21)
    richText2:addElement(re22)
    richText2:addElement(re23)
    richText2:setPosition(cc.p(282, 96))
    richText2:setAlignment('left')
    richText2:setAnchorPoint(cc.p(0, 1))
    rightimgArr[1]:addChild(richText2)

    local richText3 = xx.RichText:create()
    richText3:setContentSize(cc.size(272, 40))
    local re31 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_9"), 21, cc.c4b(110, 71, 48, 255))
    re31:setFont("font/gamefont.ttf")
    re31:setStrokeSize(0)
    re31:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    local re32 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_10"), 21, COLOR_TYPE.RED)
    re32:setFont("font/gamefont.ttf")
    re32:setStrokeSize(0)
    re32:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    local re33 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_6"), 21, cc.c4b(110, 71, 48, 255))
    re33:setFont("font/gamefont.ttf")
    re33:setStrokeSize(0)
    re33:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    richText3:addElement(re31)
    richText3:addElement(re32)
    richText3:addElement(re33)
    richText3:setPosition(cc.p(10, 106))
    richText3:setAlignment('left')
    richText3:setAnchorPoint(cc.p(0, 1))
    rightimgArr[2]:addChild(richText3)

    local richText4 = xx.RichText:create()
    richText4:setContentSize(cc.size(272, 40))
    local re41 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_11"), 21, cc.c4b(110, 71, 48, 255))
    re41:setFont("font/gamefont.ttf")
    re41:setStrokeSize(0)
    re41:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    local re42 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_12"), 21, COLOR_TYPE.RED)
    re42:setFont("font/gamefont.ttf")
    re42:setStrokeSize(0)
    re42:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    local re43 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_6"), 21, cc.c4b(110, 71, 48, 255))
    re43:setFont("font/gamefont.ttf")
    re43:setStrokeSize(0)
    re43:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    richText4:addElement(re41)
    richText4:addElement(re42)
    richText4:addElement(re43)
    richText4:setPosition(cc.p(282, 106))
    richText4:setAlignment('left')
    richText4:setAnchorPoint(cc.p(0, 1))
    rightimgArr[2]:addChild(richText4)

    local richText5 = xx.RichText:create()
    richText5:setContentSize(cc.size(272, 40))
    local re51 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_4"), 21, cc.c4b(110, 71, 48, 255))
    re51:setFont("font/gamefont.ttf")
    re51:setStrokeSize(0)
    re51:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    local re52 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_5"), 21, COLOR_TYPE.RED)
    re52:setFont("font/gamefont.ttf")
    re52:setStrokeSize(0)
    re52:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    local re53 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_6"), 21, cc.c4b(110, 71, 48, 255))
    re53:setFont("font/gamefont.ttf")
    re53:setStrokeSize(0)
    re53:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    richText5:addElement(re51)
    richText5:addElement(re52)
    richText5:addElement(re53)
    richText5:setPosition(cc.p(10, 96))
    richText5:setAlignment('left')
    richText5:setAnchorPoint(cc.p(0, 1))
    rightimgArr[3]:addChild(richText5)

    local richText6 = xx.RichText:create()
    richText6:setContentSize(cc.size(272, 40))
    local re61 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_13"), 21, cc.c4b(110, 71, 48, 255))
    re61:setFont("font/gamefont.ttf")
    re61:setStrokeSize(0)
    re61:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    local re62 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_14"), 21, COLOR_TYPE.RED)
    re62:setFont("font/gamefont.ttf")
    re62:setStrokeSize(0)
    re62:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    local re63 = xx.RichTextLabel:create(GlobalApi:getLocalStr("STR_SEARCH_AI_6"), 21, cc.c4b(110, 71, 48, 255))
    re63:setFont("font/gamefont.ttf")
    re63:setStrokeSize(0)
    re63:setShadow(COLOR_TYPE.WHITE, cc.size(0, -1))
    richText6:addElement(re61)
    richText6:addElement(re62)
    richText6:addElement(re63)
    richText6:setPosition(cc.p(282, 96))
    richText6:setAlignment('left')
    richText6:setAnchorPoint(cc.p(0, 1))
    rightimgArr[3]:addChild(richText6)
end

-- 新手引导用
function BattleCounterUI:guideLeftContent()
    local counterBgImg = self.root:getChildByName("counter_bg_img")
    local counterAlphaImg = counterBgImg:getChildByName("counter_alpha_img")
    local counterImg = counterAlphaImg:getChildByName("counter_img")
    local cover_img_2 = counterImg:getChildByName("cover_img_2")
    cover_img_2:setVisible(true)
end

function BattleCounterUI:guideRightContent()
    local guidetextConf = GameData:getConfData("local/guidetext")["GUIDE_TIPS_19"]
    local counterBgImg = self.root:getChildByName("counter_bg_img")
    local counterAlphaImg = counterBgImg:getChildByName("counter_alpha_img")
    local counterImg = counterAlphaImg:getChildByName("counter_img")
    local cover_img_1 = counterImg:getChildByName("cover_img_1")
    cover_img_1:setVisible(true)
    local dialogNode = cc.Node:create()
    local dialog = cc.Sprite:create("uires/ui/guide/bg_dialog3.png")
    local npc = GlobalApi:createSpineByName("guide_npc_7", "spine/guide_npc_7/guide_npc_7", 1)
    npc:setScaleX(0.6)
    npc:setScaleY(0.6)
    npc:setAnimation(0, "idle", true)
    npc:setPosition(cc.p(50, 0))
    local label = cc.Label:createWithTTF(guidetextConf.text, "font/gamefont1.TTF", 21)
    label:setTextColor(COLOR_TYPE.BLACK)
    label:enableOutline(cc.c4b(255, 255, 255, 255), 1)
    dialogNode:addChild(npc)
    dialogNode:addChild(dialog)
    dialogNode:addChild(label)
    cover_img_1:addChild(dialogNode)
    dialogNode:setPosition(cc.p(180, 25))
    AudioMgr.playEffect("media/guide/" .. guidetextConf.soundRes, false)

    local hand = GlobalApi:createLittleLossyAniByName("guide_finger")
    hand:getAnimation():play("idle02", -1, -1)
    hand:getAnimation():gotoAndPause(0)
    hand:setRotation(90)
    counterImg:addChild(hand)
    local startPos = cc.p(644, 180)
    local endPos = cc.p(644, 300)
    hand:setPosition(startPos)
    hand:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveTo:create(0.5, endPos), cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
        hand:setPosition(startPos)
    end))))

    local sv = counterImg:getChildByName("sv")
    sv:addEventListener(function (sender, evenType)
        if hand then
            hand:stopAllActions()
            hand:removeFromParent()
            hand = nil
        end
    end)
    GuideMgr:finishCurrGuide()
end

return BattleCounterUI