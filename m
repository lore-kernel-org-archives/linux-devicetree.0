From: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v4 0/3] clk: rockchip: support clk controller for RK3128 SoC
Date: Fri,  2 Jun 2017 09:47:22 +0800
Message-ID: <1496368045-17746-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, xf-TNX95d0MmH7DzftRWevZcw@public.gmane.org
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The driver and clk ID\SRST ID it's also applies to the RK3126 SoC.

change in V4:
remove the clk ID of usb480m_phy

change in V3:
export clk ID for usb480m and usb480m_phy

change in V2:
rename the rk312x to rk3128.

Elaine Zhang (3):
  clk: rockchip: add dt-binding header for rk3128
  dt-bindings: add bindings for rk3128 clock controller
  clk: rockchip: add clock controller for rk3128

 .../bindings/clock/rockchip,rk3128-cru.txt         |  56 ++
 drivers/clk/rockchip/Makefile                      |   1 +
 drivers/clk/rockchip/clk-rk3128.c                  | 612 +++++++++++++++++++++
 include/dt-bindings/clock/rk3128-cru.h             | 282 ++++++++++
 4 files changed, 951 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.txt
 create mode 100644 drivers/clk/rockchip/clk-rk3128.c
 create mode 100644 include/dt-bindings/clock/rk3128-cru.h

-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
