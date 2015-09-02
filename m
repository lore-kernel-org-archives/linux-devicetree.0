From: Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] ARM: dts: rk3288: pull up cts lines
Date: Wed,  2 Sep 2015 15:20:06 -0700
Message-ID: <1441232406-32628-1-git-send-email-amstan@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Neil Hendin <nhending-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The flow control lines from a user accessible UART are optional,
the user might not have anything connected to those pins.
In order to prevent random interrupts happening and noise affecting
that pin it should be pulled up.

Note that the default state for those pins on the rk3288 is pulled up,
so this patch merely restores them.

Suggested-by: Neil Hendin <nhendin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/arm/boot/dts/rk3288.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 906e938..a059367 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -1211,11 +1211,11 @@
 			};
 
 			uart0_cts: uart0-cts {
-				rockchip,pins = <4 18 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <4 18 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			uart0_rts: uart0-rts {
-				rockchip,pins = <4 19 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <4 19 RK_FUNC_1 &pcfg_pull_up>;
 			};
 		};
 
@@ -1226,11 +1226,11 @@
 			};
 
 			uart1_cts: uart1-cts {
-				rockchip,pins = <5 10 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <5 10 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			uart1_rts: uart1-rts {
-				rockchip,pins = <5 11 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <5 11 RK_FUNC_1 &pcfg_pull_up>;
 			};
 		};
 
@@ -1249,11 +1249,11 @@
 			};
 
 			uart3_cts: uart3-cts {
-				rockchip,pins = <7 9 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <7 9 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			uart3_rts: uart3-rts {
-				rockchip,pins = <7 10 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <7 10 RK_FUNC_1 &pcfg_pull_up>;
 			};
 		};
 
@@ -1264,11 +1264,11 @@
 			};
 
 			uart4_cts: uart4-cts {
-				rockchip,pins = <5 14 3 &pcfg_pull_none>;
+				rockchip,pins = <5 14 3 &pcfg_pull_up>;
 			};
 
 			uart4_rts: uart4-rts {
-				rockchip,pins = <5 15 3 &pcfg_pull_none>;
+				rockchip,pins = <5 15 3 &pcfg_pull_up>;
 			};
 		};
 
-- 
2.5.0.457.gab17608

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
