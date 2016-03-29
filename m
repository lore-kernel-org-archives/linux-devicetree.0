From: <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH 2/2] ARM: socfpga: dts: add reset control for USB
Date: Tue, 29 Mar 2016 00:31:23 -0500
Message-ID: <1459229483-26167-2-git-send-email-dinguyen@opensource.altera.com>
References: <1459229483-26167-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459229483-26167-1-git-send-email-dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Add the resets property for the 2 USB controllers.

Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
 arch/arm/boot/dts/socfpga.dtsi         |    4 ++++
 arch/arm/boot/dts/socfpga_arria10.dtsi |    4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index b89cbde3b..9f48141 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -831,6 +831,8 @@
 			interrupts = <0 125 4>;
 			clocks = <&usb_mp_clk>;
 			clock-names = "otg";
+			resets = <&rst USB0_RESET>;
+			reset-names = "dwc2";
 			phys = <&usbphy0>;
 			phy-names = "usb2-phy";
 			status = "disabled";
@@ -842,6 +844,8 @@
 			interrupts = <0 128 4>;
 			clocks = <&usb_mp_clk>;
 			clock-names = "otg";
+			resets = <&rst USB1_RESET>;
+			reset-names = "dwc2";
 			phys = <&usbphy0>;
 			phy-names = "usb2-phy";
 			status = "disabled";
diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 1c5e139..b065651 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -689,6 +689,8 @@
 			interrupts = <0 95 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&usb_clk>;
 			clock-names = "otg";
+			resets = <&rst USB0_RESET>;
+			reset-names = "dwc2";
 			phys = <&usbphy0>;
 			phy-names = "usb2-phy";
 			status = "disabled";
@@ -700,6 +702,8 @@
 			interrupts = <0 96 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&usb_clk>;
 			clock-names = "otg";
+			resets = <&rst USB1_RESET>;
+			reset-names = "dwc2";
 			phys = <&usbphy0>;
 			phy-names = "usb2-phy";
 			status = "disabled";
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
