From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH] arm64: dts: mt8183: add usb node
Date: Tue, 16 Apr 2019 13:44:04 +0800
Message-ID: <47a4d808c5f90f229b8bd132493138023c02ee01.1555392560.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Jumin Li <jumin.li@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jumin Li <jumin.li@mediatek.com>

Add USB DTS node to the mt8183 and mt8183-evb.

Signed-off-by: Jumin Li <jumin.li@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
this patch is based on v5.1-rc1 and these patches:
https://patchwork.kernel.org/patch/10856987/
https://patchwork.kernel.org/patch/10839021/
https://patchwork.kernel.org/patch/10879015/
https://patchwork.kernel.org/patch/10878999/
https://patchwork.kernel.org/patch/10858941/
https://patchwork.kernel.org/patch/10846685/
https://patchwork.kernel.org/patch/10893519/
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 21 +++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi    | 52 +++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index 465cdabafd7c..8f88fd7457a1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -6,6 +6,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
 #include "mt8183.dtsi"
 #include "mt6358.dtsi"
 
@@ -25,6 +26,16 @@
 	chosen {
 		stdout-path = "serial0:921600n8";
 	};
+
+	usb_p0_vbus: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pio 42 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &mmc0 {
@@ -175,6 +186,16 @@
 	};
 };
 
+&ssusb {
+	vusb33-supply = <&mt6358_vusb_reg>;
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb_host {
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index b36e37fcdfe3..c6970e688869 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8183-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/power/mt8183-power.h>
 #include "mt8183-pinfunc.h"
 / {
@@ -323,6 +324,33 @@
 			status = "disabled";
 		};
 
+		ssusb: usb@11201000 {
+			compatible ="mediatek,mt8183-mtu3", "mediatek,mtu3";
+			reg = <0 0x11201000 0 0x2e00>,
+			      <0 0x11203e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_LOW>;
+			phys = <&u2port0 PHY_TYPE_USB2>;
+			clocks = <&infracfg CLK_INFRA_UNIPRO_SCK>,
+				 <&infracfg CLK_INFRA_USB>;
+			clock-names = "sys_ck", "ref_ck";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			usb_host: xhci@11200000 {
+				compatible = "mediatek,mtk-xhci";
+				reg = <0 0x11200000 0 0x1000>;
+				reg-names = "mac";
+				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_LOW>;
+				clocks = <&infracfg CLK_INFRA_UNIPRO_SCK>,
+					 <&infracfg CLK_INFRA_USB>;
+				clock-names = "sys_ck", "ref_ck";
+				status = "disabled";
+			};
+		};
+
 		audiosys: syscon@11220000 {
 			compatible = "mediatek,mt8183-audiosys", "syscon";
 			reg = <0 0x11220000 0 0x1000>;
@@ -353,6 +381,30 @@
 			status = "disabled";
 		};
 
+		u3phy: usb-phy@11f40000 {
+			compatible = "mediatek,generic-tphy-v2";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "okay";
+
+			u2port0: usb-phy@11f40000 {
+				reg = <0 0x11f40000 0 0x700>;
+				clocks = <&clk26m>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+				status = "okay";
+			};
+
+			u3port0: usb-phy@11f40700 {
+				reg = <0 0x11f40700 0 0x900>;
+				clocks = <&clk26m>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+				status = "okay";
+			};
+		};
+
 		mfgcfg: syscon@13000000 {
 			compatible = "mediatek,mt8183-mfgcfg", "syscon";
 			reg = <0 0x13000000 0 0x1000>;
-- 
2.21.0
