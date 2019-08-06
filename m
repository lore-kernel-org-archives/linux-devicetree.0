From: Yuantian Tang <andy.tang@nxp.com>
Subject: [PATCH v3] arm64: dts: ls1028a: Add temperature sensor node
Date: Tue,  6 Aug 2019 13:30:04 +0800
Message-ID: <20190806053004.36956-1-andy.tang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yuantian Tang <andy.tang@nxp.com>
List-Id: devicetree@vger.kernel.org

Add nxp sa56004 chip node for temperature monitor.

Signed-off-by: Yuantian Tang <andy.tang@nxp.com>
---
v3:
	- sort the node in i2c address
v2:
	- change the node name and add vcc-supply
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts |   15 +++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts |   15 +++++++++++++++
 2 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
index b359068..960daf2 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
@@ -47,6 +47,15 @@
 		regulator-always-on;
 	};
 
+	sb_3v3: regulator-sb3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3_vbus";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
@@ -117,6 +126,12 @@
 			#size-cells = <0>;
 			reg = <0x3>;
 
+			temperature-sensor@4c {
+				compatible = "nxp,sa56004";
+				reg = <0x4c>;
+				vcc-supply = <&sb_3v3>;
+			};
+
 			rtc@51 {
 				compatible = "nxp,pcf2129";
 				reg = <0x51>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
index f9c272f..6a22423 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
@@ -43,6 +43,15 @@
 		regulator-always-on;
 	};
 
+	sb_3v3: regulator-sb3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3_vbus";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
@@ -115,6 +124,12 @@
 			#size-cells = <0>;
 			reg = <0x3>;
 
+			temperature-sensor@4c {
+				compatible = "nxp,sa56004";
+				reg = <0x4c>;
+				vcc-supply = <&sb_3v3>;
+			};
+
 			rtc@51 {
 				compatible = "nxp,pcf2129";
 				reg = <0x51>;
-- 
1.7.1
