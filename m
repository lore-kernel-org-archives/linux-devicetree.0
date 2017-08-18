From: Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v2] arm64: dts: rockchip: Add basic DVFS support for RK3368
Date: Fri, 18 Aug 2017 14:17:01 +0200
Message-ID: <20170818121701.12668-1-romain.perier@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds and enable the operating points that have been tested and are
currently supported by the SoC. This also adds clocks for ARMCLKL and
ARMCLKB.

Signed-off-by: Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---

Changes in v2:
- Switched to binding v2 for operating-points
- Improved commit message
- Rebased onto linux-next

 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 75 +++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index b6f234f10585..7f42a9111062 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -113,7 +113,8 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
-
+			clocks = <&cru ARMCLKL>;
+			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>; /* min followed by max */
 		};
 
@@ -122,6 +123,8 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			clocks = <&cru ARMCLKL>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu_l2: cpu@2 {
@@ -129,6 +132,8 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			clocks = <&cru ARMCLKL>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu_l3: cpu@3 {
@@ -136,6 +141,8 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			clocks = <&cru ARMCLKL>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu_b0: cpu@100 {
@@ -143,7 +150,8 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
-
+			clocks = <&cru ARMCLKB>;
+			operating-points-v2 = <&cluster1_opp>;
 			#cooling-cells = <2>; /* min followed by max */
 		};
 
@@ -152,6 +160,8 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			clocks = <&cru ARMCLKB>;
+			operating-points-v2 = <&cluster1_opp>;
 		};
 
 		cpu_b2: cpu@102 {
@@ -159,6 +169,8 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			clocks = <&cru ARMCLKB>;
+			operating-points-v2 = <&cluster1_opp>;
 		};
 
 		cpu_b3: cpu@103 {
@@ -166,9 +178,68 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			clocks = <&cru ARMCLKB>;
+			operating-points-v2 = <&cluster1_opp>;
 		};
 	};
 
+	cluster0_opp: opp-table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp00 {
+			opp-hz = /bits/ 64 <312000000>;
+			opp-microvolt = <950000>;
+			clock-latency-ns = <40000>;
+		};
+		opp01 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <950000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <950000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <1025000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <1125000>;
+		};
+	};
+
+	cluster1_opp: opp-table1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp00 {
+			opp-hz = /bits/ 64 <312000000>;
+			opp-microvolt = <950000>;
+			clock-latency-ns = <40000>;
+		};
+		opp01 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <950000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <950000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <975000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <1050000>;
+		};
+	};
+
+
+
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
