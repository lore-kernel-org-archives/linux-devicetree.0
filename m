From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/7] clk: rockchip: rk3328 fixes in preparation of graphics support
Date: Mon, 22 Jan 2018 15:15:23 +0100
Message-ID: <20180122141530.12398-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yang.zheng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fix some clock issues on rk3328 to make way for the upcoming graphics
support on rk3328.

Heiko Stuebner (6):
  clk: rockchip: fix hclk_vio_niu on rk3328
  clk: rockchip: remove HCLK_VIO from rk3328 dt header
  clk: rockchip: export sclk_hdmi_sfc on rk3328
  clk: rockchip: protect all remaining rk3328 interconnect clocks
  clk: rockchip: remove ignore_unused flag from rk3328 vio_h2p clocks
  clk: rockchip: document hdmi_phy external input for rk3328

Zheng Yang (1):
  clk: rockchip: add flags for rk3328 dclk_lcdc

 .../bindings/clock/rockchip,rk3328-cru.txt         |  1 +
 drivers/clk/rockchip/clk-rk3328.c                  | 67 ++++++++++++++--------
 include/dt-bindings/clock/rk3328-cru.h             |  1 -
 3 files changed, 44 insertions(+), 25 deletions(-)

-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
