From: Mathieu Olivari <mathieu@codeaurora.org>
Subject: [PATCH 1/2] ARM: dts: qcom: label all gsbi devices
Date: Tue, 24 Feb 2015 16:21:55 -0800
Message-ID: <1424823716-7504-1-git-send-email-mathieu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, mathieu@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mmcclint@codeaurora.org
List-Id: devicetree@vger.kernel.org

All IPQ806x based boards will include this file and will need a way to
identify each GSBI device. So this change is labelling them all to make
reference from board specific file easier.

Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index d01f618..ffa5b5e 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -140,7 +140,7 @@
 			ranges;
 			status = "disabled";
 
-			serial@12490000 {
+			uart2: serial@12490000 {
 				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
 				reg = <0x12490000 0x1000>,
 				      <0x12480000 0x1000>;
@@ -150,7 +150,7 @@
 				status = "disabled";
 			};
 
-			i2c@124a0000 {
+			i2c2: i2c@124a0000 {
 				compatible = "qcom,i2c-qup-v1.1.1";
 				reg = <0x124a0000 0x1000>;
 				interrupts = <0 196 0>;
@@ -175,7 +175,7 @@
 			ranges;
 			status = "disabled";
 
-			serial@16340000 {
+			uart4: serial@16340000 {
 				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
 				reg = <0x16340000 0x1000>,
 				      <0x16300000 0x1000>;
@@ -185,7 +185,7 @@
 				status = "disabled";
 			};
 
-			i2c@16380000 {
+			i2c4: i2c@16380000 {
 				compatible = "qcom,i2c-qup-v1.1.1";
 				reg = <0x16380000 0x1000>;
 				interrupts = <0 153 0>;
@@ -209,7 +209,7 @@
 			ranges;
 			status = "disabled";
 
-			serial@1a240000 {
+			uart5: serial@1a240000 {
 				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
 				reg = <0x1a240000 0x1000>,
 				      <0x1a200000 0x1000>;
@@ -219,7 +219,7 @@
 				status = "disabled";
 			};
 
-			i2c@1a280000 {
+			i2c5: i2c@1a280000 {
 				compatible = "qcom,i2c-qup-v1.1.1";
 				reg = <0x1a280000 0x1000>;
 				interrupts = <0 155 0>;
@@ -232,7 +232,7 @@
 				#size-cells = <0>;
 			};
 
-			spi@1a280000 {
+			spi5: spi@1a280000 {
 				compatible = "qcom,spi-qup-v1.1.1";
 				reg = <0x1a280000 0x1000>;
 				interrupts = <0 155 0>;
-- 
1.9.1
