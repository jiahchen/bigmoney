__author__ = 'can'
import logging
import time
from functools import wraps

log = logging.getLogger(__name__)

def fn_timer(function):
    @wraps(function)
    def function_timer(*args, **kwargs):
        t0 = time.time()
        result = function(*args, **kwargs)
        t1 = time.time()
        log.info("Total time running %s: %s seconds" % (function.__name__, str(t1-t0)))
        return result
    return function_timer
