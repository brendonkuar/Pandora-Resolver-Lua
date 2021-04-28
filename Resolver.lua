local angles = {
    [1] = -55,
    [2] = 55,
    [3] = 38,
    [4] = -38,
    [5] = -29,
    [6] = 29,
    [7] = -15,
    [8] = 15,
    [9] = 0
    [10] = 180,
    [11] = -180,
    [12] = 360,
    [13] = -360,
    [14] = 20,
    [15] = -29,
    [16] = -12,
    [17] = 12,
    [18] = 40,
    [19] = -40
}
-- good values could be better
local last_angle = 0
local new_angle = 0
local switch1 = false
local switch2 = false
local i = 1
local function resolve(player)
    plist.set(player, "Correction active", false) -- disable default correction because i have a superiority complex
    plist.set(player, "Force body yaw", true) -- enable the forcing of the body yaw

    if last_angle == -new_angle and switch1 then
        new_angle = -angles[i]
        if switch2 == true then
            switch1 = not switch1
        end
    else
        if i < #angles then
            i = i + 1
        else
            i = 1
        end
        new_angle = angles[i]
    end
  plist.set(player, "Force body yaw value", new_angle) -- force yaw value to random
    last_angle = new_angle
    switch2 = false
end
