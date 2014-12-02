From: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3] ARM: zynq: DT: Add USB to device tree
Date: Tue,  2 Dec 2014 08:07:11 -0800
Message-ID: <1417536431-27759-1-git-send-email-soren.brinkmann@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add USB nodes to zc702, zc706 and zed device trees.

Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
v3:
 - rename phy nodes: usb_phy -> phy0
 - rebased onto zynq/dt
v2:
 - remove '@0' from phy node name
 - don't add bogus space
---
 arch/arm/boot/dts/zynq-7000.dtsi | 20 ++++++++++++++++++++
 arch/arm/boot/dts/zynq-zc702.dts | 11 +++++++++++
 arch/arm/boot/dts/zynq-zc706.dts | 10 ++++++++++
 arch/arm/boot/dts/zynq-zed.dts   | 10 ++++++++++
 4 files changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index f8e4a28adfc0..21aae01a3fe9 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -314,5 +314,25 @@
 			reg = <0xf8f00600 0x20>;
 			clocks = <&clkc 4>;
 		};
+
+		usb0: usb@e0002000 {
+			compatible = "xlnx,zynq-usb-2.20a", "chipidea,usb2";
+			status = "disabled";
+			clocks = <&clkc 28>;
+			interrupt-parent = <&intc>;
+			interrupts = <0 21 4>;
+			reg = <0xe0002000 0x1000>;
+			phy_type = "ulpi";
+		};
+
+		usb1: usb@e0003000 {
+			compatible = "xlnx,zynq-usb-2.20a", "chipidea,usb2";
+			status = "disabled";
+			clocks = <&clkc 29>;
+			interrupt-parent = <&intc>;
+			interrupts = <0 44 4>;
+			reg = <0xe0003000 0x1000>;
+			phy_type = "ulpi";
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
index 280f02dd4ddc..399fed4d9c19 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -36,6 +36,11 @@
 			linux,default-trigger = "heartbeat";
 		};
 	};
+
+	usb_phy0: phy0 {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+	};
 };
 
 &can0 {
@@ -139,3 +144,9 @@
 &uart1 {
 	status = "okay";
 };
+
+&usb0 {
+	status = "okay";
+	dr_mode = "host";
+	usb-phy = <&usb_phy0>;
+};
diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-zc706.dts
index 34f7812d2ee8..89cc9adc569d 100644
--- a/arch/arm/boot/dts/zynq-zc706.dts
+++ b/arch/arm/boot/dts/zynq-zc706.dts
@@ -27,6 +27,10 @@
 		bootargs = "console=ttyPS0,115200 earlyprintk";
 	};
 
+	usb_phy0: phy0 {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+	};
 };
 
 &clkc {
@@ -118,3 +122,9 @@
 &uart1 {
 	status = "okay";
 };
+
+&usb0 {
+	status = "okay";
+	dr_mode = "host";
+	usb-phy = <&usb_phy0>;
+};
diff --git a/arch/arm/boot/dts/zynq-zed.dts b/arch/arm/boot/dts/zynq-zed.dts
index 1c7cc990b47a..e20956e5e720 100644
--- a/arch/arm/boot/dts/zynq-zed.dts
+++ b/arch/arm/boot/dts/zynq-zed.dts
@@ -27,6 +27,10 @@
 		bootargs = "console=ttyPS0,115200 earlyprintk";
 	};
 
+	usb_phy0: phy0 {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+	};
 };
 
 &clkc {
@@ -50,3 +54,9 @@
 &uart1 {
 	status = "okay";
 };
+
+&usb0 {
+	status = "okay";
+	dr_mode = "host";
+	usb-phy = <&usb_phy0>;
+};
-- 
2.2.0.1.g9ee0458

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
