From: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] arm64: dts: rockchip: add ap_pwroff and ddrio_pwroff pins for rk3399
Date: Tue, 14 Jun 2016 13:21:11 -0700
Message-ID: <1465935671-13890-1-git-send-email-dianders@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

There are two sleep related pins on rk3399: ap_pwroff and ddrio_pwroff.
Let's add the definition of these two pins to rk3399's main dtsi file so
that boards can use them.

These two pins are similar to the global_pwroff and ddrio_pwroff pins in
rk3288 and are expected to be used in the same way: boards will likely
want to configure these pinctrl settings in their global pinctrl hog
list.

Note that on rk3288 there were two additional pins in the "sleep"
section: "ddr0_retention" and "ddr1_retention".  On rk3288 designs these
pins appeared to actually route from rk3288 back to rk3288.  Presumably
on rk3399 this is simply not needed since the pins don't appear to exist
there.

Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index d331e800c00a..209f555b7c29 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -806,6 +806,16 @@
 			};
 		};
 
+		sleep {
+			ap_pwroff: ap-pwroff {
+				rockchip,pins = <1 5 RK_FUNC_1 &pcfg_pull_none>;
+			};
+
+			ddrio_pwroff: ddrio-pwroff {
+				rockchip,pins = <0 1 RK_FUNC_1 &pcfg_pull_none>;
+			};
+		};
+
 		spdif {
 			spdif_bus: spdif-bus {
 				rockchip,pins =
-- 
2.8.0.rc3.226.g39d4020

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
