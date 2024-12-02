const gameLevels = <GameLevel>[
  (
    number: 1,
    giftType: (
      name: "Partridge",
      imageAssetPath: "gifts/partridge.png",
      countRequired: 1
    ),
    canSpawnFlying: false,
  ),
  (
    number: 2,
    giftType: (
      name: "Turtle Dove",
      imageAssetPath: "gifts/dove.png",
      countRequired: 2
    ),
    canSpawnFlying: false,
  ),
  (
    number: 3,
    giftType: (
      name: "French Hens",
      imageAssetPath: "gifts/hen.png",
      countRequired: 3
    ),
    canSpawnFlying: false,
  ),
  (
    number: 4,
    giftType: (
      name: "Calling Birds",
      imageAssetPath: "gifts/calling-bird.png",
      countRequired: 4
    ),
    canSpawnFlying: true,
  ),
  (
    number: 5,
    giftType: (
      name: "Gold Rings",
      imageAssetPath: "gifts/ring.png",
      countRequired: 5
    ),
    canSpawnFlying: true,
  ),
  (
    number: 6,
    giftType: (
      name: "Geese a-laying",
      imageAssetPath: "gifts/goose.png",
      countRequired: 6
    ),
    canSpawnFlying: true,
  ),
  (
    number: 7,
    giftType: (
      name: "Swans a-swimming",
      imageAssetPath: "gifts/swan.png",
      countRequired: 7
    ),
    canSpawnFlying: true,
  ),
  (
    number: 8,
    giftType: (
      name: "Maids a-milking",
      imageAssetPath: "gifts/milk.png",
      countRequired: 8
    ),
    canSpawnFlying: true,
  ),
  (
    number: 9,
    giftType: (
      name: "Ladies Dancing",
      imageAssetPath: "gifts/dancing.png",
      countRequired: 9
    ),
    canSpawnFlying: true,
  ),
  (
    number: 10,
    giftType: (
      name: "Lords a-leaping",
      imageAssetPath: "gifts/lord.png",
      countRequired: 10
    ),
    canSpawnFlying: true,
  ),
  (
    number: 11,
    giftType: (
      name: "Pipers Piping",
      imageAssetPath: "gifts/piper.png",
      countRequired: 11
    ),
    canSpawnFlying: true,
  ),
  (
    number: 12,
    giftType: (
      name: "Drummers Drumming",
      imageAssetPath: "gifts/drum.png",
      countRequired: 12
    ),
    canSpawnFlying: true,
  )
];

typedef GameLevel = ({
  int number,
  GiftType giftType,
  bool canSpawnFlying,
});

typedef GiftType = ({
  String name,
  String imageAssetPath,
  int countRequired,
});
