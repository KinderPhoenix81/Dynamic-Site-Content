CREATE TABLE `ItemHistory` (
  `ItemHistoryID` int NOT NULL,
  `ItemID` int NOT NULL,
  `Description` text COLLATE utf8mb4_general_ci NOT NULL,
  `VersionNum` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ItemHistory`
--

INSERT INTO `ItemHistory` (`ItemHistoryID`, `ItemID`, `Description`, `VersionNum`) VALUES
(1, 1, 'Base speed benefit of Elusive Antlers is removed; movement speed is only granted via orbs.', 3),
(2, 1, 'Antler Shield is renamed to Elusive Antlers, increases movement speed by 7% and spawns energy orbs nearby every 10 seconds, granting 12% movement speed up to 3 times.', 2),
(3, 1, '55% chance to reflect 10% damage back to the attacker on hit.', 1),
(4, 2, 'Attack speed bonus reduced from 10% to 7.5% per enemy within 20 meters.', 3),
(5, 2, 'Increase your attack speed by 10% for up to 4 enemies and allies within 20 meters; scales in attack speed and meters.', 2),
(6, 2, 'When below 50% health, receive a damage increase of 20%.', 1),
(7, 3, 'Every 5 enemies slain grants a damage bonus increasing the player\'s damage by 10%, lasting as long as the player is in combat.', 1),
(8, 4, 'Warped Echo first-hit damage reduction lowered to 20%, and delayed damage ticks benefit from items like Planula and Razorwire.', 3),
(9, 4, 'The next source of damage is reduced by 30% and spread into 3 hits. All echoed damage is non-lethal except the last hit. Recharges every 15 seconds.', 2),
(10, 4, 'On damage taken 50% of the damage is dealt immediately while the other 50% is delayed for 3 seconds. Recharges after 10 seconds.', 1),
(11, 5, 'Grounded enemies hit with any skill are launched and stunned. Enemies hit while airborne are launched up to 2 more times. Launched enemeis take 20% more damage from all sources per launch. Renamed from Knockback Fin to Breaching Fin.', 2),
(12, 5, '7.5% chance on hit to knock enemies in the air', 1),
(13, 7, 'Using the secondary skill charges the next primary attack, dealing 150% more damage per charge up to 5 times.', 1),
(14, 8, '25% chance on being hit to inflict nearby enemies with 2 stacks of bleed. Enemies with other debuffs have a stack added to those instead.', 1),
(15, 11, 'Unstable Transmitter can only be activated once per stage, barrier gain reduced to 35% of max health. Regenerates at the start of each stage. One shot protection removed.', 3),
(16, 11, 'Falling below 25% health gives you 75% of your maximum health as a temporary barrier. Gain a dimensional aura for 8s that bleeds and teleports away enemies. Enemies killed by the aura extend the duration by 1 second. Recharges every 45 seconds.', 2),
(17, 11, 'When reaching below 25% health the Survivor explodes, dealing 350% damage to nearby enemies and teleporting to a random location. This effect has a cooldown of 2 minutes.', 1),
(18, 12, 'A bug existed that allowed Electric Boomerang to apply bleed while holding the Sawmerang equipment item', 1),
(19, 13, 'Grants 7% increase to all stats for each buff, up to 4 per stack.', 2),
(20, 13, 'Having 5+ unique buffs grants 20% increased stats for 5 seconds.', 1),
(21, 14, 'Overspill. 5% chance (+1% per 100% done on initial hit) on hit to summon a meteor on the target, dealing 2000% damage (+50% damage per 100% damage done on initial hit).', 1),
(22, 15, 'Large monsters will always drop an item upon being killed, elites have a 15% chance to drop an item on death.', 1),
(23, 16, 'War Bonds proc chance reduced to 0. Missile gold cost increased to 50 gold from 25 gold.', 3),
(24, 16, 'During boss events, 5 missiles bombard the area, dealing 2.5% of the bosses Max Health in damage. Before the boss event, gain additional missiles, up to a maximum of 20 per 25 gold gained. Gold requirement scales over time.', 2),
(25, 16, 'Yields 75 gold based on current difficulty level and the survivor\'s level at the start of every stage.', 1),
(26, 17, 'The \"free unlock\" buff provided to the player would disappear between stages, and gold costs in multiplayer were increased by 100%.', 1);

--
-- Indexes for table `ItemHistory`
--
ALTER TABLE `ItemHistory`
  ADD PRIMARY KEY (`ItemHistoryID`),
  ADD KEY `ItemID` (`ItemID`);

--
-- AUTO_INCREMENT for table `ItemHistory`
--
ALTER TABLE `ItemHistory`
  MODIFY `ItemHistoryID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for table `ItemHistory`
--
ALTER TABLE `ItemHistory`
  ADD CONSTRAINT `ItemHistory_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `Items` (`Item_ID`);
COMMIT;
