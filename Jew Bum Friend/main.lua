local Mod = RegisterMod("Jew Bum Friend", 1)
local mySound = Isaac.GetSoundIdByName("Hawa Nagila")

function Mod:OnPickupCollision(pickup, collider, low)
    if collider.Type == EntityType.ENTITY_FAMILIAR and collider.Variant == FamiliarVariant.BUM_FRIEND then
        if pickup.Variant == PickupVariant.PICKUP_COIN then
            if SFXManager():IsPlaying(SoundEffect.SOUND_PENNYPICKUP) or SFXManager():IsPlaying(SoundEffect.SOUND_DIMEPICKUP) or SFXManager():IsPlaying(SoundEffect.SOUND_NICKELPICKUP) then
                SFXManager():Stop(SoundEffect.SOUND_PENNYPICKUP)
                SFXManager():Stop(SoundEffect.SOUND_DIMEPICKUP)
                SFXManager():Stop(SoundEffect.SOUND_NICKELPICKUP)
                SFXManager():Play(mySound)
            end
        end
    end
end

Mod:AddCallback(ModCallbacks.MC_POST_PICKUP_COLLISION, Mod.OnPickupCollision)
