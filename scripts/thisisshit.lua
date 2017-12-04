local shitoldInit = init
local shitoldUpdate = update

function init()
	shitoldInit()
	self.donedidboi = false
end

function update(dt)
  shitoldUpdate(dt)
  if mcontroller.crouching() then if not self.donedidboi then
    self.donedidboi = true
    local pos = mcontroller.position()
    local colli = world.lineTileCollisionPoint(pos, vec2.add(pos, {0, -5}), {"Platform", "Block"})

    if colli and not world.tileIsOccupied(colli[1]) and not world.isTileProtected(colli[1]) then
      world.placeObject("poop", colli[1])
      animator.playSound("msThisIsShit")
    end
  else self.donedidboi = false end end
end