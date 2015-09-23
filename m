From: <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH 1/2] ARM: socfpga: dts: add clock fields for I2C, UART and USB on Arria10
Date: Wed, 23 Sep 2015 17:11:14 -0500
Message-ID: <1443046275-26421-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Add the required clock fields for all the I2C nodes. Also add missing clock
fields for UART0 and USB1.

Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 2340fcb..cce9e50 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -519,6 +519,7 @@
 			compatible = "snps,designware-i2c";
 			reg = <0xffc02200 0x100>;
 			interrupts = <0 105 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&l4_sp_clk>;
 			status = "disabled";
 		};
 
@@ -528,6 +529,7 @@
 			compatible = "snps,designware-i2c";
 			reg = <0xffc02300 0x100>;
 			interrupts = <0 106 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&l4_sp_clk>;
 			status = "disabled";
 		};
 
@@ -537,6 +539,7 @@
 			compatible = "snps,designware-i2c";
 			reg = <0xffc02400 0x100>;
 			interrupts = <0 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&l4_sp_clk>;
 			status = "disabled";
 		};
 
@@ -546,6 +549,7 @@
 			compatible = "snps,designware-i2c";
 			reg = <0xffc02500 0x100>;
 			interrupts = <0 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&l4_sp_clk>;
 			status = "disabled";
 		};
 
@@ -555,6 +559,7 @@
 			compatible = "snps,designware-i2c";
 			reg = <0xffc02600 0x100>;
 			interrupts = <0 109 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&l4_sp_clk>;
 			status = "disabled";
 		};
 
@@ -658,6 +663,7 @@
 			interrupts = <0 110 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			clocks = <&l4_sp_clk>;
 			status = "disabled";
 		};
 
@@ -692,6 +698,8 @@
 			compatible = "snps,dwc2";
 			reg = <0xffb40000 0xffff>;
 			interrupts = <0 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&usb_clk>;
+			clock-names = "otg";
 			phys = <&usbphy0>;
 			phy-names = "usb2-phy";
 			status = "disabled";
-- 
2.4.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
