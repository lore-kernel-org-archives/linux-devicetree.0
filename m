From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/3] add hisilicon clk-hix5hd2
Date: Tue, 22 Apr 2014 19:46:51 +0800
Message-ID: <1398167214-1604-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Zhangfei Gao (3):
  clk: hisi: use clk_register_mux_table in hisi_clk_register_mux
  clk: hisi: add hisi_clk_register_gate
  clk: hisi: add clk-hix5hd2.c

 .../devicetree/bindings/clock/hix5hd2-clock.txt    |   31 ++++++
 drivers/clk/Makefile                               |    1 +
 drivers/clk/hisilicon/Makefile                     |    1 +
 drivers/clk/hisilicon/clk-hix5hd2.c                |  101 ++++++++++++++++++++
 drivers/clk/hisilicon/clk.c                        |   41 +++++++-
 drivers/clk/hisilicon/clk.h                        |    3 +
 include/dt-bindings/clock/hix5hd2-clock.h          |   58 +++++++++++
 7 files changed, 231 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/hix5hd2-clock.txt
 create mode 100644 drivers/clk/hisilicon/clk-hix5hd2.c
 create mode 100644 include/dt-bindings/clock/hix5hd2-clock.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
