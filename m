From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 0/4] RK3399 dw-mipi-dsi patches
Date: Thu, 16 Mar 2017 11:31:43 +0800
Message-ID: <1489635107-21327-1-git-send-email-zyw@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all

This series set the phy_cfg_clk to be a required clock for RK3399, and
add a grf clock control in dw-mipi-dsi driver. And then correct a
register name.


Changes in v2:
- check the grf_clk only for RK3399

Chris Zhong (4):
  drm/rockchip/dsi: check phy_cfg_clk only for RK3399
  dt-bindings: add the grf clock for dw-mipi-dsi
  drm/rockchip/dsi: enable the grf clk before writing grf registers
  drm/rockchip/dsi: correct the grf_switch_reg name

 .../display/rockchip/dw_mipi_dsi_rockchip.txt      |  2 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi.c             | 35 +++++++++++++++++-----
 2 files changed, 28 insertions(+), 9 deletions(-)

-- 
2.6.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
