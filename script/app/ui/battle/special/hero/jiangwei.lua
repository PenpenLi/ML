local BaseClass = require("script/app/ui/battle/special/hero/base")

local JiangWei = class("JiangWei", BaseClass)

-- 每次被攻击时会额外反弹伤害
function JiangWei:effectBeforeFight()
	if self.skill1 then
		self.owner.reboundDmg = self.owner.reboundDmg + self.value1[1]/100
	end
end

-- 反弹时会将伤害会转化为自身生命值
function JiangWei:effectWhenHurtTarget(hpNum, flag, target)
	if self.skill2 and flag == 4 and hpNum < 0 then
		self.owner:getEffect(self.owner, -hpNum, false, 0, 0, 1, true)
	end
	return hpNum
end

return JiangWei