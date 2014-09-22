From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5 0/4] clk: hix5hd2: clocks update
Date: Mon, 22 Sep 2014 11:20:12 +0800
Message-ID: <1411356016-20553-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

v5:
0001:
Suggested by Mike, change to clk_ether_prepare since delay required inside

v4:
Drop ir clock, whose register is not in the same region

v3: 
Add patches 3, 4, 5 for clocks of watchdog, ir, and i2c
Patches 1, 2 are same as v2

Guoxiong Yan (1):
  clk: hix5hd2: add watchdog0 clocks

Jiancheng Xue (1):
  clk: hix5hd2: add sd clk

Wei Yan (1):
  clk: hix5hd2: add I2C clocks

Zhangfei Gao (1):
  clk: hix5hd2: add complex clk

 drivers/clk/hisilicon/clk-hix5hd2.c       |  236 ++++++++++++++++++++++++++++-
 include/dt-bindings/clock/hix5hd2-clock.h |   27 ++++
 2 files changed, 257 insertions(+), 6 deletions(-)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
