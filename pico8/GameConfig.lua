GAME_ID="picoSnake"
GAME_LOGS=true
DEBUG_STATS = false
-- Snake Scene ++++++++++++
-- GUI --
SPRITE_MESSAGE_SPRITES = {9,10,11,25,26,27,41,42,43}
-- Snake Config
SNAKE_HEAD_SPRITES={16,17,18,19}
SNAKE_BLOCK_SPRITES={20,20,20,20}
SNAKE_BLOCK_HEIGHT=0
SNAKE_BLOCK_WIDTH=0
SNAKE_BLOCK_LENGTH_COLLISION=20
SNAKE_INIT_POS_X = 30
SNAKE_INIT_POS_Y = 30
SNAKE_HEAD_COLLIDER_FLAG=1
SNAKE_DEFAULT_VELOCITY=2
SNAKE_SCENE_MAP_X = 0
SNAKE_SCENE_MAP_Y = 0
SNAKE_SCENE_ID = 2
-- PickUps
PICKUP_1_SPRITE=21
-- Terrain
TERRAIN_FLAG=8 --GREEN COLOR FLAG
TERRAIN_MAX_X=16
TERRAIN_MAX_Y=16
-- MAP
MAP_MAX_X=16
MAP_MAX_Y=16
-- Home Scene +++++++++++
HOME_SCENE_MAP_X = 16
HOME_SCENE_MAP_Y = 0
HOME_SCENE_ID = 1
-- About Scene ++++++++++
ABOUT_SCENE_ID = 3
-- Pickups +++++++++
PICKUP_POWERUP_CROSS_ID = 1
PICKUP_POWERUP_CROSS_SPRITE = 79
PICKUP_POWERUP_CROSS_MESSAGE = "press button X"
PICKUP_POWERUP_CROSS_PROB = 1
PICKUP_POWERUP_CROSS_POWERDURATION_SECONDS = 15
PICKUP_POWERUP_BULLET_ID = 2
PICKUP_POWERUP_BULLET_SPRITE = 76
PICKUP_POWERUP_BULLET_PROB = 3
PICKUP_POWERUP_BULLET_BULLET_DURATION_SECONDS = 0.4
PICKUP_POWERUP_BULLET_BULLET_VELOCITY = 8
PICKUP_POWERUP_BULLET_BULLET_SPRITE = 111
PICKUP_POWERUP_BULLET_POWERDURATION_SECONDS = 15
PICKUP_POWERUP_BULLET_PROB = 2
PICKUP_POWERUP_TAIL_PROB = 1
PICKUP_POWERUP_TAIL_ID = 4
PICKUP_POWERUP_TAIL_SPRITE=78

-- Particles +++++++
PARTICLES_MAX_LIFE_TIME_SECONDS = 3
