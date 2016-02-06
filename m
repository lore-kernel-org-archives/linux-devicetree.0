From: Jon Mason <jonmason@broadcom.com>
Subject: [PATCH v2 4/5] ARM: dts: NSP: Add SP804 Support to DT
Date: Sat,  6 Feb 2016 12:53:39 -0500
Message-ID: <1454781219-2640-1-git-send-email-jonmason@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Add support for the ARM SP804 timer to the Northstar Plus device tree.

Signed-off-by: Jon Mason <jonmason@broadcom.com>
---
 arch/arm/boot/dts/bcm-nsp.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index ee03bee..63a0a53 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -194,6 +194,24 @@
 			brcm,nand-has-wp;
 		};
 
+		ccbtimer0: timer@34000 {
+			compatible = "arm,sp804";
+			reg = <0x34000 0x1000>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&iprocslow>;
+			clock-names = "apb_pclk";
+		};
+
+		ccbtimer1: timer@35000 {
+			compatible = "arm,sp804";
+			reg = <0x35000 0x1000>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&iprocslow>;
+			clock-names = "apb_pclk";
+		};
+
 		i2c0: i2c@38000 {
 			compatible = "brcm,iproc-i2c";
 			reg = <0x38000 0x50>;
-- 
1.9.1
