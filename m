From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 09/11] ARM: dts: rockchip: add rk3288 lcdc0 pinmux settings
Date: Sat, 31 Jan 2015 17:33:02 +0100
Message-ID: <1422721984-27782-10-git-send-email-heiko@sntech.de>
References: <1422721984-27782-1-git-send-email-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422721984-27782-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org
Cc: robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add pinctrl settings for the configurable lcdc0 signals dclk, den, hsync
and vsync. The lcdc0 data pin configuration is not software controlable.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/rk3288.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index d771f68..846d961 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -910,6 +910,15 @@
 			};
 		};
 
+		lcdc0 {
+			lcdc0_ctl: lcdc0-ctl {
+				rockchip,pins = <1 24 RK_FUNC_1 &pcfg_pull_none>,
+						<1 25 RK_FUNC_1 &pcfg_pull_none>,
+						<1 26 RK_FUNC_1 &pcfg_pull_none>,
+						<1 27 RK_FUNC_1 &pcfg_pull_none>;
+			};
+		};
+
 		sdmmc {
 			sdmmc_clk: sdmmc-clk {
 				rockchip,pins = <6 20 RK_FUNC_1 &pcfg_pull_none>;
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
