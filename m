From: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v4 2/5] ARM: dts: rockchip: add ARM Mali GPU node for rk3288
Date: Tue, 25 Apr 2017 14:16:17 +0100
Message-ID: <a63b581014030f635835109901c29a86041cd766.1493125299.git.guillaume.tucker@collabora.com>
References: <cover.1493125299.git.guillaume.tucker@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1493125299.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
In-Reply-To: <cover.1493125299.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
References: <cover.1493125299.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>, Wookey <wookey-Xpnwy/r4z8dg9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add Mali GPU device tree node for the rk3288 SoC, with devfreq
opp table.

Tested-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Signed-off-by: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 arch/arm/boot/dts/rk3288.dtsi | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index df8a0dbe9d91..35969041eae2 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -43,6 +43,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/clock/rk3288-cru.h>
+#include <dt-bindings/power/rk3288-power.h>
 #include <dt-bindings/thermal/thermal.h>
 #include <dt-bindings/power/rk3288-power.h>
 #include <dt-bindings/soc/rockchip,boot-mode.h>
@@ -1117,6 +1118,48 @@
 		};
 	};
 
+	gpu: mali@ffa30000 {
+		compatible = "rockchip,rk3288-mali", "arm,mali-t760", "arm,mali-midgard";
+		reg = <0xffa30000 0x10000>;
+		interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "job", "mmu", "gpu";
+		clocks = <&cru ACLK_GPU>;
+		operating-points-v2 = <&gpu_opp_table>;
+		power-domains = <&power RK3288_PD_GPU>;
+		status = "disabled";
+	};
+
+	gpu_opp_table: opp_table0 {
+		compatible = "operating-points-v2";
+
+		opp@100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <950000>;
+		};
+		opp@200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <950000>;
+		};
+		opp@300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <1000000>;
+		};
+		opp@400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1100000>;
+		};
+		opp@500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <1200000>;
+		};
+		opp@600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <1250000>;
+		};
+	};
+
 	qos_gpu_r: qos@ffaa0000 {
 		compatible = "syscon";
 		reg = <0xffaa0000 0x20>;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
