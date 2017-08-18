From: Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH] arm64: dts: rockchip: Add basic DVFS support for RK3368
Date: Fri, 18 Aug 2017 09:50:53 +0200
Message-ID: <20170818075053.8779-1-romain.perier@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds and enable the operating points that have been tested and are
currently supported by the SoC.

Signed-off-by: Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---

Note: RK3288 is using operating-points binding v1, while RK3399 is using
binding v2. I can send another iteration for switching to binding v2,
if required.

 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 6d5dc0587e59..f2ae3bf9377a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -113,8 +113,18 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			clocks = <&cru ARMCLKL>;
+			operating-points = <
+				/* KHz    uV */
+				312000 950000
+				408000 950000
+				600000 950000
+				816000 1025000
+				1008000 1125000
+			>;
 
 			#cooling-cells = <2>; /* min followed by max */
+			clock-latency = <40000>;
 		};
 
 		cpu_l1: cpu@1 {
@@ -122,6 +132,7 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			clocks = <&cru ARMCLKL>;
 		};
 
 		cpu_l2: cpu@2 {
@@ -129,6 +140,7 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			clocks = <&cru ARMCLKL>;
 		};
 
 		cpu_l3: cpu@3 {
@@ -136,6 +148,7 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			clocks = <&cru ARMCLKL>;
 		};
 
 		cpu_b0: cpu@100 {
@@ -143,8 +156,18 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			clocks = <&cru ARMCLKB>;
+			operating-points = <
+				/* KHz    uV */
+				312000 950000
+				408000 950000
+				600000 950000
+				816000 975000
+				1008000 1050000
+			>;
 
 			#cooling-cells = <2>; /* min followed by max */
+			clock-latency = <40000>;
 		};
 
 		cpu_b1: cpu@101 {
@@ -152,6 +175,7 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			clocks = <&cru ARMCLKB>;
 		};
 
 		cpu_b2: cpu@102 {
@@ -159,6 +183,7 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			clocks = <&cru ARMCLKB>;
 		};
 
 		cpu_b3: cpu@103 {
@@ -166,9 +191,11 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			clocks = <&cru ARMCLKB>;
 		};
 	};
 
+
 	amba {
 		compatible = "simple-bus";
 		#address-cells = <2>;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
