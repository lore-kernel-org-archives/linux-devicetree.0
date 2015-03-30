From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/5] clk: hisilicon: support stub clock
Date: Mon, 30 Mar 2015 13:24:19 +0800
Message-ID: <1427693064-11062-1-git-send-email-leo.yan@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Dan Zhao <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds support for hisilicon stub clock driver. On hi6220,
the bootloader needs load the firmware image and set info for OPPs;
after run into kernel, the stub clock driver is used to communicate
w/t firmware for cpu dynamic frequency scaling. So finally s/w will
simply write request in sram and send ipc to power controller.

These patches have been tested on 96board hikey and will be used by
cpufreq driver.

Changes from v1:
* Refine parameter checking for init flow
* Remove unnecessary debugging info
* Modify to check spinlock pointer when register clocks


Leo Yan (5):
  clk: hisi: refine parameter checking for init
  clk: hisi: add API for allocation clk data struct
  dt-bindings: clk: hisilicon: Document stub clock driver
  clk: hisi: add stub clk driver
  clk: hisi: add stub clock register function

 .../devicetree/bindings/clock/hisi,stub-clock.txt  |  38 +++
 drivers/clk/hisilicon/Makefile                     |   2 +-
 drivers/clk/hisilicon/clk-stub.c                   | 282 +++++++++++++++++++++
 drivers/clk/hisilicon/clk.c                        |  64 ++++-
 drivers/clk/hisilicon/clk.h                        |  17 ++
 include/dt-bindings/clock/hisi,stub-clock.h        |  26 ++
 6 files changed, 416 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/hisi,stub-clock.txt
 create mode 100644 drivers/clk/hisilicon/clk-stub.c
 create mode 100644 include/dt-bindings/clock/hisi,stub-clock.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
