From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH] ARM: dts: imx6: correct anatop regulators range
Date: Fri, 29 Jun 2018 15:54:21 +0800
Message-ID: <1530258861-11666-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Correct some i.MX6 SoCs anatop regulators range
according to reference manual.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 12 ++++++------
 arch/arm/boot/dts/imx6sl.dtsi  |  4 ++--
 arch/arm/boot/dts/imx6sx.dtsi  |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 911141e..d9f98dd 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -689,8 +689,8 @@
 				regulator-1p1 {
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vdd1p1";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1200000>;
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1375000>;
 					regulator-always-on;
 					anatop-reg-offset = <0x110>;
 					anatop-vol-bit-shift = <8>;
@@ -704,8 +704,8 @@
 				regulator-3p0 {
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vdd3p0";
-					regulator-min-microvolt = <2800000>;
-					regulator-max-microvolt = <3150000>;
+					regulator-min-microvolt = <2625000>;
+					regulator-max-microvolt = <3400000>;
 					regulator-always-on;
 					anatop-reg-offset = <0x120>;
 					anatop-vol-bit-shift = <8>;
@@ -719,8 +719,8 @@
 				regulator-2p5 {
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vdd2p5";
-					regulator-min-microvolt = <2250000>;
-					regulator-max-microvolt = <2750000>;
+					regulator-min-microvolt = <2100000>;
+					regulator-max-microvolt = <2875000>;
 					regulator-always-on;
 					anatop-reg-offset = <0x130>;
 					anatop-vol-bit-shift = <8>;
diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index 81f48116..3d7931b 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -539,8 +539,8 @@
 				regulator-3p0 {
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vdd3p0";
-					regulator-min-microvolt = <2800000>;
-					regulator-max-microvolt = <3150000>;
+					regulator-min-microvolt = <2625000>;
+					regulator-max-microvolt = <3400000>;
 					regulator-always-on;
 					anatop-reg-offset = <0x120>;
 					anatop-vol-bit-shift = <8>;
diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 7130ab8..f26f611 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -607,8 +607,8 @@
 				regulator-3p0 {
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vdd3p0";
-					regulator-min-microvolt = <2800000>;
-					regulator-max-microvolt = <3150000>;
+					regulator-min-microvolt = <2625000>;
+					regulator-max-microvolt = <3400000>;
 					regulator-always-on;
 					anatop-reg-offset = <0x120>;
 					anatop-vol-bit-shift = <8>;
-- 
2.7.4
