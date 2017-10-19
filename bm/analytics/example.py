import logging
import logging.config

from bm.common.decorators import fn_timer
from bm.common.consts import LOG_CFG

logging.config.fileConfig(LOG_CFG)
log = logging.getLogger("example")

@fn_timer
def say_hello():
    log.info("Hello Big Money")
    print("Hello Big Money")

if __name__ == "__main__":
    say_hello()

