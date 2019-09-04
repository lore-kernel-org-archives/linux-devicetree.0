From: Biwen Li <biwen.li@nxp.com>
Subject: arm64: ls1028a-qds: correct bus of rtc
Date: Wed,  4 Sep 2019 16:51:04 +0800
Message-ID: <20190904085104.44709-1-biwen.li@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
List-Id: devicetree@vger.kernel.org

The rtc is on i2c2 bus(hardware), not on i2c1 channel 3,
so correct it

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
index de6ef39f3118..6c0540ad9c59 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
@@ -133,11 +133,6 @@
 				vcc-supply = <&sb_3v3>;
 			};
 
-			rtc@51 {
-				compatible = "nxp,pcf2129";
-				reg = <0x51>;
-			};
-
 			eeprom@56 {
 				compatible = "atmel,24c512";
 				reg = <0x56>;
@@ -166,6 +161,14 @@
 	};
 };
 
+&i2c1 {
+	status = "okay";
+	rtc@51 {
+		compatible = "nxp,pcf2129";
+		reg = <0x51>;
+	};
+};
+
 &sai1 {
 	status = "okay";
 };
-- 
2.17.1
