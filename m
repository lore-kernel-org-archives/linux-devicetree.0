From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] ARM: dts: Bump SD card pin drive strength up on rk3288-evb
Date: Wed, 10 Dec 2014 12:55:29 -0800
Message-ID: <1418244929-8254-1-git-send-email-dianders@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Addy Ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seungwon Jeon <tgih.jun-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

It seems that ever since (536f6b9 mmc: dw_mmc: Reset DMA before
enabling IDMAC) landed upstream that SD cards have been very unhappy
on rk3288-evb.  They were a little unhappy before that change, but
after that change they're REALLY unhappy.

It turns out that the above fix happens to fix a corruption when
reading card information during probe time.  Without the fix we didn't
detect that high speed SD cards could actually support high speed.
With the fix we suddenly detect that they're high speed and we try to
use them at 50MHz.  That doesn't work so well on EVB with the default
drive strength (maybe because there are two physical SD card slots
hooked up to the same pin?).

Fix the problem by bumping up the drive strength of the sdmmc lines.

Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Fixes: 536f6b91d21b ("mmc: dw_mmc: Reset DMA before enabling IDMAC")
---
 arch/arm/boot/dts/rk3288-evb.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi b/arch/arm/boot/dts/rk3288-evb.dtsi
index 3e067dd..6194d67 100644
--- a/arch/arm/boot/dts/rk3288-evb.dtsi
+++ b/arch/arm/boot/dts/rk3288-evb.dtsi
@@ -155,6 +155,15 @@
 };
 
 &pinctrl {
+	pcfg_pull_none_drv_8ma: pcfg-pull-none-drv-8ma {
+		drive-strength = <8>;
+	};
+
+	pcfg_pull_up_drv_8ma: pcfg-pull-up-drv-8ma {
+		bias-pull-up;
+		drive-strength = <8>;
+	};
+
 	backlight {
 		bl_en: bl-en {
 			rockchip,pins = <7 2 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -173,6 +182,27 @@
 		};
 	};
 
+	sdmmc {
+		/*
+		 * Default drive strength isn't enough to achieve even
+		 * high-speed mode on EVB board so bump up to 8ma.
+		 */
+		sdmmc_bus4: sdmmc-bus4 {
+			rockchip,pins = <6 16 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
+					<6 17 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
+					<6 18 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
+					<6 19 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
+		};
+
+		sdmmc_clk: sdmmc-clk {
+			rockchip,pins = <6 20 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
+		};
+
+		sdmmc_cmd: sdmmc-cmd {
+			rockchip,pins = <6 21 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
+		};
+	};
+
 	usb {
 		host_vbus_drv: host-vbus-drv {
 			rockchip,pins = <0 14 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.2.0.rc0.207.ga3a616c

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
