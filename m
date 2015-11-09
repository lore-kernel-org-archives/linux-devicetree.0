From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v4 09/10] arm64: dts: Add main Thermal info to rk3368.dtsi
Date: Mon,  9 Nov 2015 12:49:01 +0800
Message-ID: <1447044542-30859-10-git-send-email-wxt@rock-chips.com>
References: <1447044542-30859-1-git-send-email-wxt@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447044542-30859-1-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch add the thermal needed info on RK3368.
Meanwhile, support the trips to throttle for thermal.

Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Acked-by: Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---

Changes in v4: None
Changes in v3: None
Changes in v2:
- fix a copy wrong name.

Changes in v1:
- support the opt gpio pinctrl state.

 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index cc093a4..83a2bd2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -45,6 +45,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	compatible = "rockchip,rk3368";
@@ -123,6 +124,8 @@
 			reg = <0x0 0x0>;
 			cpu-idle-states = <&cpu_sleep>;
 			enable-method = "psci";
+
+			#cooling-cells = <2>; /* min followed by max */
 		};
 
 		cpu_l1: cpu@1 {
@@ -155,6 +158,8 @@
 			reg = <0x0 0x100>;
 			cpu-idle-states = <&cpu_sleep>;
 			enable-method = "psci";
+
+			#cooling-cells = <2>; /* min followed by max */
 		};
 
 		cpu_b1: cpu@101 {
@@ -404,6 +409,27 @@
 		status = "disabled";
 	};
 
+	thermal-zones {
+		#include "rk3368-thermal.dtsi"
+	};
+
+	tsadc: tsadc@ff280000 {
+		compatible = "rockchip,rk3368-tsadc";
+		reg = <0x0 0xff280000 0x0 0x100>;
+		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_TSADC>, <&cru PCLK_TSADC>;
+		clock-names = "tsadc", "apb_pclk";
+		resets = <&cru SRST_TSADC>;
+		reset-names = "tsadc-apb";
+		pinctrl-names = "init", "default", "sleep";
+		pinctrl-0 = <&otp_gpio>;
+		pinctrl-1 = <&otp_out>;
+		pinctrl-2 = <&otp_gpio>;
+		#thermal-sensor-cells = <1>;
+		rockchip,hw-tshut-temp = <95000>;
+		status = "disabled";
+	};
+
 	gmac: ethernet@ff290000 {
 		compatible = "rockchip,rk3368-gmac";
 		reg = <0x0 0xff290000 0x0 0x10000>;
@@ -829,6 +855,16 @@
 			};
 		};
 
+		tsadc {
+			otp_gpio: otp-gpio {
+				rockchip,pins = <0 10 RK_FUNC_GPIO &pcfg_pull_none>;
+			};
+
+			otp_out: otp-out {
+				rockchip,pins = <0 10 RK_FUNC_1 &pcfg_pull_none>;
+			};
+		};
+
 		uart0 {
 			uart0_xfer: uart0-xfer {
 				rockchip,pins = <2 24 RK_FUNC_1 &pcfg_pull_up>,
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
