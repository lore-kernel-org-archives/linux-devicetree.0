From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/2] add clk-hi3660
Date: Thu, 29 Dec 2016 10:33:23 +0800
Message-ID: <1482978805-6981-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Address comments from Rob and Stephen.
Rebase to 4.10-rc1

Zhangfei Gao (2):
  dt-bindings: Document the hi3660 clock bindings
  clk: hisilicon: Add clock driver for hi3660 SoC

 .../devicetree/bindings/clock/hi3660-clock.txt     |  42 ++
 drivers/clk/hisilicon/Kconfig                      |   7 +
 drivers/clk/hisilicon/Makefile                     |   1 +
 drivers/clk/hisilicon/clk-hi3660.c                 | 592 +++++++++++++++++++++
 include/dt-bindings/clock/hi3660-clock.h           | 194 +++++++
 5 files changed, 836 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/hi3660-clock.txt
 create mode 100644 drivers/clk/hisilicon/clk-hi3660.c
 create mode 100644 include/dt-bindings/clock/hi3660-clock.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
