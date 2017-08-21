From: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 0/4] clk: rockchip: rv1108: support mac clk
Date: Mon, 21 Aug 2017 16:16:03 +0800
Message-ID: <1503303367-17915-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wdc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

change in V2:
[PATCH v2 1/4] : NONE
[PATCH v2 2/4] : NONE
[PATCH v2 3/4] : NONE
[PATCH v2 4/4] : fix up the clk_mac mux regs description error

Elaine Zhang (4):
  clk: rockchip: add rv1108 ACLK_GAMC and PCLK_GMAC ID
  clk: rockchip: rv1108: add ACLK_GMAC and PCLK_GMAC clk id
  clk: rockchip: rv1108: rename macphy to mac
  clk: rockchip: rv1108: fix up the clk_mac sel register description

 drivers/clk/rockchip/clk-rv1108.c      | 14 ++++++++------
 include/dt-bindings/clock/rv1108-cru.h |  8 +++++---
 2 files changed, 13 insertions(+), 9 deletions(-)

-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
