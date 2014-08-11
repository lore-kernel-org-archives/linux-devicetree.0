From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] ARM: dts: Move the PMIC interrupt pinctrl line to rk3288-evb common
Date: Mon, 11 Aug 2014 11:47:29 -0700
Message-ID: <1407782849-11056-1-git-send-email-dianders@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The PMIC interrupt pinctrl line was added to the rk3288-evb-act8846,
but it's the same line on both the ACT8846 version and the RK808
version.  This makes a lot of sense since they share the same SoC
daugherboard.  Move the pinctrl definition to the common file so we
can use it for the RK808 version.

NOTE: The PMIC interrupt doesn't _actually_ go to the PMIC on the
ACT8846 version of the board (it does on the RK808), but our
convention is to label things as they're labelled on the schematics.
In the very least you can argue that this is the interrupt from the
PMIC daughtercard even if it doesn't actually go to the PMIC chip.

Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/arm/boot/dts/rk3288-evb-act8846.dts | 10 +---------
 arch/arm/boot/dts/rk3288-evb.dtsi        |  6 ++++++
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-evb-act8846.dts b/arch/arm/boot/dts/rk3288-evb-act8846.dts
index 7d59ff4..a76dd44 100644
--- a/arch/arm/boot/dts/rk3288-evb-act8846.dts
+++ b/arch/arm/boot/dts/rk3288-evb-act8846.dts
@@ -26,7 +26,7 @@
 		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&hym8563_int>;
+		pinctrl-0 = <&pmic_int>;
 
 		#clock-cells = <0>;
 		clock-output-names = "xin32k";
@@ -124,11 +124,3 @@
 		};
 	};
 };
-
-&pinctrl {
-	hym8563 {
-		hym8563_int: hym8563-int {
-			rockchip,pins = <RK_GPIO0 4 RK_FUNC_GPIO &pcfg_pull_up>;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi b/arch/arm/boot/dts/rk3288-evb.dtsi
index 4f57209..ae3e10b 100644
--- a/arch/arm/boot/dts/rk3288-evb.dtsi
+++ b/arch/arm/boot/dts/rk3288-evb.dtsi
@@ -84,6 +84,12 @@
 		};
 	};
 
+	pmic {
+		pmic_int: pmic-int {
+			rockchip,pins = <RK_GPIO0 4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	usb {
 		host_vbus_drv: host-vbus-drv {
 			rockchip,pins = <0 14 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.0.0.526.g5318336

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
