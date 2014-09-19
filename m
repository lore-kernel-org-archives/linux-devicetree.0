From: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: rockchip: Remove "regulator-always-on" in vcc_rmii for Radxa Rock
Date: Fri, 19 Sep 2014 12:36:27 +0000
Message-ID: <1411130187-4966-1-git-send-email-romain.perier@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Rockchip RK3188 SoCs the platform driver emac_rockchip is used. This variant driver
enables this regulator when the device driver is loaded. The phy no longer needs
to be always on.

Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/rk3188-radxarock.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3188-radxarock.dts b/arch/arm/boot/dts/rk3188-radxarock.dts
index e04bf8f..d95f881 100644
--- a/arch/arm/boot/dts/rk3188-radxarock.dts
+++ b/arch/arm/boot/dts/rk3188-radxarock.dts
@@ -176,7 +176,6 @@
 				regulator-name = "VCC_RMII";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
 			};
 
 			vccio_wl: REG10 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
