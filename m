From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v2] arm64: dts: ulcb-kf: enable USB2 PHY of channel 0
Date: Wed,  8 Nov 2017 15:21:38 +0300
Message-ID: <1510143698-17306-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

This supports USB2 PHY channel #0 on ULCB Kingfisher board

The dedicated USB0_PWEN pin is used to control CN13 VBUS source from U43
power supply.
MAX3355 can also provide VBUS, hence it should be disabled via OTG_OFFVBUSn
node coming from gpio expander TCA9539.
Set MAX3355 enabled using OTG_EXTLPn node to be able to read OTG ID of CN13.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
Changes in version 2:
- added gpio hogs for MAX3355 VBUS and SHDN

 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 657ad10..48a2e8f 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -67,6 +67,20 @@
 			output-high;
 			line-name = "HUB rst";
 		};
+
+		otg_offvbusn {
+			gpio-hog;
+			gpios = <8 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "OTG OFFVBUSn";
+		};
+
+		otg_extlpn {
+			gpio-hog;
+			gpios = <9 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "OTG EXTLPn";
+		};
 	};
 
 	gpio_exp_75: gpio@75 {
@@ -154,6 +168,11 @@
 		groups = "scif1_data_b", "scif1_ctrl";
 		function = "scif1";
 	};
+
+	usb0_pins: usb0 {
+		groups = "usb0";
+		function = "usb0";
+	};
 };
 
 &scif1 {
@@ -164,6 +183,13 @@
 	status = "okay";
 };
 
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &xhci0 {
 	status = "okay";
 };
-- 
1.9.1
