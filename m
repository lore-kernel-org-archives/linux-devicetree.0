From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 7/7] clk: rockchip: document hdmi_phy external input for rk3328
Date: Mon, 22 Jan 2018 15:15:30 +0100
Message-ID: <20180122141530.12398-8-heiko@sntech.de>
References: <20180122141530.12398-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180122141530.12398-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yang.zheng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The hdmi-phy block inside the soc also loops its pll output back
into the clock controller, so document that already used input clock.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/rockchip,rk3328-cru.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3328-cru.txt b/Documentation/devicetree/bindings/clock/rockchip,rk3328-cru.txt
index e71c675ba5da..904ae682ea90 100644
--- a/Documentation/devicetree/bindings/clock/rockchip,rk3328-cru.txt
+++ b/Documentation/devicetree/bindings/clock/rockchip,rk3328-cru.txt
@@ -32,6 +32,7 @@ clock-output-names:
  - "clkin_i2s" - external I2S clock - optional,
  - "gmac_clkin" - external GMAC clock - optional
  - "phy_50m_out" - output clock of the pll in the mac phy
+ - "hdmi_phy" - output clock of the hdmi phy pll - optional
 
 Example: Clock controller node:
 
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
