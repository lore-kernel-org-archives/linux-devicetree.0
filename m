From: <min.guo@mediatek.com>
Subject: [PATCH v5 2/6] arm: dts: mt2701: Add usb2 device nodes
Date: Tue, 19 Feb 2019 15:36:31 +0800
Message-ID: <1550561795-31132-3-git-send-email-min.guo@mediatek.com>
References: <1550561795-31132-1-git-send-email-min.guo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550561795-31132-1-git-send-email-min.guo@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, tony@atomide.com, hdegoede@redhat.com, Min Guo <min.guo@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Min Guo <min.guo@mediatek.com>

Add musb nodes and usb2 phy nodes for MT2701

Signed-off-by: Min Guo <min.guo@mediatek.com>
---
changes in v5:
1. Add usb connector child node

changes in v4:
1. no changes

changes in v3:
1. no changes

changes in v2:
1. Remove phy-names
---
 arch/arm/boot/dts/mt2701-evb.dts | 26 ++++++++++++++++++++++++++
 arch/arm/boot/dts/mt2701.dtsi    | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701-evb.dts b/arch/arm/boot/dts/mt2701-evb.dts
index be0edb3..95458ea 100644
--- a/arch/arm/boot/dts/mt2701-evb.dts
+++ b/arch/arm/boot/dts/mt2701-evb.dts
@@ -6,6 +6,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
 #include "mt2701.dtsi"
 
 / {
@@ -60,6 +61,20 @@
 		>;
 		default-brightness-level = <9>;
 	};
+
+	extcon_usb: extcon_iddig {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpio = <&pio 44 GPIO_ACTIVE_HIGH>;
+	};
+
+	usb_vbus: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pio 45 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &auxadc {
@@ -229,3 +244,14 @@
 &uart0 {
 	status = "okay";
 };
+
+&usb2 {
+	status = "okay";
+	usb_con: connector{
+		compatible = "usb-b-connector";
+		label = "micro-USB";
+		type = "micro";
+		extcon = <&extcon_usb>;
+		vbus-supply = <&usb_vbus>;
+	};
+};
diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 180377e..a6b1434 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -670,6 +670,39 @@
 		};
 	};
 
+	usb2: usb@11200000 {
+		compatible = "mediatek,mt2701-musb",
+			     "mediatek,mtk-musb";
+		reg = <0 0x11200000 0 0x1000>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "mc";
+		phys = <&u2port2 PHY_TYPE_USB2>;
+		dr_mode = "otg";
+		clocks = <&pericfg CLK_PERI_USB0>,
+			 <&pericfg CLK_PERI_USB0_MCU>,
+			 <&pericfg CLK_PERI_USB_SLV>;
+		clock-names = "main","mcu","univpll";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
+		status = "disabled";
+	};
+
+	u2phy0: usb-phy@11210000 {
+		compatible = "mediatek,generic-tphy-v1";
+		reg = <0 0x11210000 0 0x0800>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "okay";
+
+		u2port2: usb-phy@1a1c4800 {
+			reg = <0 0x11210800 0 0x0100>;
+			clocks = <&topckgen CLK_TOP_USB_PHY48M>;
+			clock-names = "ref";
+			#phy-cells = <1>;
+			status = "okay";
+		};
+	};
+
 	ethsys: syscon@1b000000 {
 		compatible = "mediatek,mt2701-ethsys", "syscon";
 		reg = <0 0x1b000000 0 0x1000>;
-- 
1.9.1
