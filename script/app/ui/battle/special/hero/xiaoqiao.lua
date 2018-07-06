local BaseClass = require("script/app/ui/battle/special/hero/base")

local XiaoQiao = class("XiaoQiao", BaseClass)

-- 所有敌方武将攻击下降
function XiaoQiao:effectBeforeCreate(owner, army, enemy)
	if self.skill1 then
		for k, v in ipairs(enemy) do
			v.heroInfo.atk = v.heroInfo.atk + v.heroInfo.baseAtk*self.value1[1]/100
		end
	end
end

function XiaoQiao:effectWhenDie(killer)
	if self.skill2 then
		if self.owner.angerSkill then
			local buffId = self.owner.angerSkill.baseInfo.buffId
			if buffId > 0 then
				local armyArr = self.owner.battlefield.armyArr[self.owner.guid]
				for k, v in ipairs(armyArr) do
					if not v:isDead() then
						if not v.heroObj:isDead() then
							self.owner:createBuff(buffId, v.heroObj)
						end
					end
				end
			end
		end
	end
end


return XiaoQiao