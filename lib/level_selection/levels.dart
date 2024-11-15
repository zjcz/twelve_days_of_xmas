const gameLevels = <GameLevel>[
  (
    number: 1,
    giftType: GiftType.partridge,
    countRequired: 1,
    canSpawnFlying: false,
  ),
  (
    number: 2,
    giftType: GiftType.turtleDove,
    countRequired: 2,
    canSpawnFlying: false,
  ),
    (
    number: 3,
    giftType: GiftType.frenchHen,
    countRequired: 3,
    canSpawnFlying: false,
  ),
  (
    number: 4,
    giftType: GiftType.birds,
    countRequired: 4,
    canSpawnFlying: true,
  ),
  (
    number: 5,
    giftType: GiftType.goldRings,
    countRequired: 5,
    canSpawnFlying: true,
  ),
  (
    number: 6,
    giftType: GiftType.geese,
    countRequired: 6,
    canSpawnFlying: true,
  ),
  (
    number: 7,
    giftType: GiftType.swans,
    countRequired: 7,
    canSpawnFlying: true,
  ),  
  (
    number: 8,
    giftType: GiftType.maids,
    countRequired: 8,
    canSpawnFlying: true,
  ),
  (
    number: 9,
    giftType: GiftType.ladies,
    countRequired: 9,
    canSpawnFlying: true,
  ),
  (
    number: 10,
    giftType: GiftType.lords,
    countRequired: 10,
    canSpawnFlying: true,
  ),
  (
    number: 11,
    giftType: GiftType.pipers,
    countRequired: 11,
    canSpawnFlying: true, 
  ),
  (
    number: 12,
    giftType: GiftType.drummers,
    countRequired: 12,
    canSpawnFlying: true,
  )
];

typedef GameLevel = ({
  int number,
  GiftType giftType,
  int countRequired,
  bool canSpawnFlying,
});

enum GiftType {
  partridge,
  turtleDove,
  frenchHen,
  birds,
  goldRings,
  geese,
  swans,
  maids,
  ladies,
  lords,
  pipers,
  drummers
}
