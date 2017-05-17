From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 2/3] arm: dts: rk322x: correct uart2 pinctrl and add another sets
Date: Wed, 17 May 2017 11:40:50 +0800
Message-ID: <1494992451-32542-3-git-send-email-frank.wang@rock-chips.com>
References: <1494992451-32542-1-git-send-email-frank.wang@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494992451-32542-1-git-send-email-frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, charles.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cody.xie-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kevan.lan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, sugar.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wmc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Correct UART2 PINCTRL flag and add another PINCTRL sets for UART2
in case of confict with SDMMC.

Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 arch/arm/boot/dts/rk322x.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index cc6a27d..ea1239a 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -222,7 +222,7 @@
 		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
 		clock-names = "baudclk", "apb_pclk";
 		pinctrl-names = "default";
-		pinctrl-0 = <&uart2_xfer>;
+		pinctrl-0 = <&uart21_xfer>;
 		reg-shift = <2>;
 		reg-io-width = <4>;
 		status = "disabled";
@@ -693,7 +693,7 @@
 
 		uart2 {
 			uart2_xfer: uart2-xfer {
-				rockchip,pins = <1 18 RK_FUNC_2 &pcfg_pull_none>,
+				rockchip,pins = <1 18 RK_FUNC_2 &pcfg_pull_up>,
 						<1 19 RK_FUNC_2 &pcfg_pull_none>;
 			};
 
@@ -705,5 +705,12 @@
 				rockchip,pins = <0 24 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
+
+		uart2-1 {
+			uart21_xfer: uart21-xfer {
+				rockchip,pins = <1 10 RK_FUNC_2 &pcfg_pull_up>,
+						<1 9 RK_FUNC_2 &pcfg_pull_none>;
+			};
+		};
 	};
 };
-- 
2.0.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
