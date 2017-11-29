From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 03/11] ARM: dts: imx6: Add unit address and reg for the anatop nodes
Date: Wed, 29 Nov 2017 16:54:36 -0200
Message-ID: <1511981684-13433-3-git-send-email-festevam@gmail.com>
References: <1511981684-13433-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511981684-13433-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Add unit address and reg for the anatop nodes in order to fix the
following build warnings with W=1:

arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (simple_bus_reg): Node /soc/aips-bus@2000000/anatop@20c8000/regulator-1p1 missing or empty reg/ranges property
arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (simple_bus_reg): Node /soc/aips-bus@2000000/anatop@20c8000/regulator-3p0 missing or empty reg/ranges property
arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (simple_bus_reg): Node /soc/aips-bus@2000000/anatop@20c8000/regulator-2p5 missing or empty reg/ranges property
arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (simple_bus_reg): Node /soc/aips-bus@2000000/anatop@20c8000/regulator-vddcore missing or empty reg/ranges property
arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (simple_bus_reg): Node /soc/aips-bus@2000000/anatop@20c8000/regulator-vddpu missing or empty reg/ranges property
arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (simple_bus_reg): Node /soc/aips-bus@2000000/anatop@20c8000/regulator-vddsoc missing or empty reg/ranges property

Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
Changes since v1:
- None

 arch/arm/boot/dts/imx6qdl.dtsi | 20 ++++++++++++++------
 arch/arm/boot/dts/imx6sl.dtsi  | 20 ++++++++++++++------
 arch/arm/boot/dts/imx6sx.dtsi  | 20 ++++++++++++++------
 arch/arm/boot/dts/imx6ul.dtsi  | 11 ++++++++---
 4 files changed, 50 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index a0f6712..7edd209 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -695,8 +695,11 @@
 				interrupts = <0 49 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 54 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 127 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-				regulator-1p1 {
+				regulator-1p1@20c8110 {
+					reg = <0x20c8110>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vdd1p1";
 					regulator-min-microvolt = <1000000>;
@@ -711,7 +714,8 @@
 					anatop-enable-bit = <0>;
 				};
 
-				regulator-3p0 {
+				regulator-3p0@20c8120 {
+					reg = <0x20c8120>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vdd3p0";
 					regulator-min-microvolt = <2800000>;
@@ -726,7 +730,8 @@
 					anatop-enable-bit = <0>;
 				};
 
-				regulator-2p5 {
+				regulator-2p5@20c8130 {
+					reg = <0x20c8130>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vdd2p5";
 					regulator-min-microvolt = <2250000>;
@@ -741,7 +746,8 @@
 					anatop-enable-bit = <0>;
 				};
 
-				reg_arm: regulator-vddcore {
+				reg_arm: regulator-vddcore@20c8140 {
+					reg = <0x20c8140>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vddarm";
 					regulator-min-microvolt = <725000>;
@@ -758,7 +764,8 @@
 					anatop-max-voltage = <1450000>;
 				};
 
-				reg_pu: regulator-vddpu {
+				reg_pu: regulator-vddpu@20c8140 {
+					reg = <0x20c8140>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vddpu";
 					regulator-min-microvolt = <725000>;
@@ -775,7 +782,8 @@
 					anatop-max-voltage = <1450000>;
 				};
 
-				reg_soc: regulator-vddsoc {
+				reg_soc: regulator-vddsoc@20c8140 {
+					reg = <0x20c8140>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vddsoc";
 					regulator-min-microvolt = <725000>;
diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index 3365182..ae8df3c 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -527,8 +527,11 @@
 				interrupts = <0 49 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 54 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 127 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-				regulator-1p1 {
+				regulator-1p1@20c8110 {
+					reg = <0x20c8110>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vdd1p1";
 					regulator-min-microvolt = <800000>;
@@ -543,7 +546,8 @@
 					anatop-enable-bit = <0>;
 				};
 
-				regulator-3p0 {
+				regulator-3p0@20c8120 {
+					reg = <0x20c8120>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vdd3p0";
 					regulator-min-microvolt = <2800000>;
@@ -558,7 +562,8 @@
 					anatop-enable-bit = <0>;
 				};
 
-				regulator-2p5 {
+				regulator-2p5@20c8130 {
+					reg = <0x20c8130>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vdd2p5";
 					regulator-min-microvolt = <2100000>;
@@ -573,7 +578,8 @@
 					anatop-enable-bit = <0>;
 				};
 
-				reg_arm: regulator-vddcore {
+				reg_arm: regulator-vddcore@20c8140 {
+					reg = <0x20c8140>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vddarm";
 					regulator-min-microvolt = <725000>;
@@ -590,7 +596,8 @@
 					anatop-max-voltage = <1450000>;
 				};
 
-				reg_pu: regulator-vddpu {
+				reg_pu: regulator-vddpu@20c8140 {
+					reg = <0x20c8140>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vddpu";
 					regulator-min-microvolt = <725000>;
@@ -607,7 +614,8 @@
 					anatop-max-voltage = <1450000>;
 				};
 
-				reg_soc: regulator-vddsoc {
+				reg_soc: regulator-vddsoc@20c8140 {
+					reg = <0x20c8140>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vddsoc";
 					regulator-min-microvolt = <725000>;
diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 4500380..07ba518 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -585,8 +585,11 @@
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-				regulator-1p1 {
+				regulator-1p1@20c8110 {
+					reg = <0x20c8110>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vdd1p1";
 					regulator-min-microvolt = <800000>;
@@ -601,7 +604,8 @@
 					anatop-enable-bit = <0>;
 				};
 
-				regulator-3p0 {
+				regulator-3p0@20c8120 {
+					reg = <0x20c8120>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vdd3p0";
 					regulator-min-microvolt = <2800000>;
@@ -616,7 +620,8 @@
 					anatop-enable-bit = <0>;
 				};
 
-				regulator-2p5 {
+				regulator-2p5@20c8130 {
+					reg = <0x20c8130>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vdd2p5";
 					regulator-min-microvolt = <2100000>;
@@ -631,7 +636,8 @@
 					anatop-enable-bit = <0>;
 				};
 
-				reg_arm: regulator-vddcore {
+				reg_arm: regulator-vddcore@20c8140 {
+					reg = <0x20c8140>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vddarm";
 					regulator-min-microvolt = <725000>;
@@ -648,7 +654,8 @@
 					anatop-max-voltage = <1450000>;
 				};
 
-				reg_pcie: regulator-vddpcie {
+				reg_pcie: regulator-vddpcie@20c8140 {
+					reg = <0x20c8140>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vddpcie";
 					regulator-min-microvolt = <725000>;
@@ -664,7 +671,8 @@
 					anatop-max-voltage = <1450000>;
 				};
 
-				reg_soc: regulator-vddsoc {
+				reg_soc: regulator-vddsoc@20c8140 {
+					reg = <0x20c8140>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vddsoc";
 					regulator-min-microvolt = <725000>;
diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 0e931fd..3233f01 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -542,8 +542,11 @@
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-				reg_3p0: regulator-3p0 {
+				reg_3p0: regulator-3p0@20c8110 {
+					reg = <0x20c8110>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vdd3p0";
 					regulator-min-microvolt = <2625000>;
@@ -557,7 +560,8 @@
 					anatop-enable-bit = <0>;
 				};
 
-				reg_arm: regulator-vddcore {
+				reg_arm: regulator-vddcore@20c8140 {
+					reg = <0x20c8140>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "cpu";
 					regulator-min-microvolt = <725000>;
@@ -574,7 +578,8 @@
 					anatop-max-voltage = <1450000>;
 				};
 
-				reg_soc: regulator-vddsoc {
+				reg_soc: regulator-vddsoc@20c8140 {
+					reg = <0x20c8140>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vddsoc";
 					regulator-min-microvolt = <725000>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
