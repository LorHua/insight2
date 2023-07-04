DEBUG = True

PORT = 8001

DB_HOST = '127.0.0.1'
DB_PORT = 3306
DB_NAME = 'insight2'
DB_USER = 'root'
DB_PASS = 'crediteaseitsec'

REDIS_HOST = '127.0.0.1'
REDIS_PORT = 6379
REDIS_PASS = ''
REDIS_DB = 0
REDIS_CHANNEL = "SERVICE_CHANNEL"


ACTION_DIR_NAME = ("action", )

STATIC_DIR_NAME = "static"

TEMPLATE_DIR_NAME = "template"

COOKIE_SECRET = "U2FsdGVkX1/u1YaeTuRdWM9adoqFpGm9seFRccbhRR/O2qyTwP78Cok="
COOKIE_EXPIRES_DAYS = 30

API_VERSION = "/api"

FROM_DB = dict(
            host = '127.0.0.1',
            port = 3306,
            user = "root",
            password = "crediteaseitsec",
            database = "insight"
        )

