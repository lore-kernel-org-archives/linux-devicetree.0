From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 13/16] arm64: dts: mt7622: add usb device nodes
Date: Tue, 6 Feb 2018 17:53:02 +0800
Message-ID: <da3734bfd71d041ccb9dce2d99303421ddc1653e.1517910489.git.sean.wang@mediatek.com>
References: <cover.1517910489.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1517910489.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

add xhci node and usb3 phy nodes

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Tested-by: Jumin Li <jumin.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 28 +++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi     | 51 ++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 87b6080..5746cb3 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -52,6 +52,24 @@
 	memory {
 		reg = <0 0x40000000 0 0x3F000000>;
 	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &pcie {
@@ -343,6 +361,16 @@
 	status = "okay";
 };
 
+&ssusb {
+	vusb33-supply = <&reg_3p3v>;
+	vbus-supply = <&reg_5v>;
+	status = "okay";
+};
+
+&u3phy {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index d5ca0a8..e6dd4f6 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -462,6 +462,57 @@
 		#reset-cells = <1>;
 	};
 
+	ssusb: usb@1a0c0000 {
+		compatible = "mediatek,mt7622-xhci",
+			     "mediatek,mtk-xhci";
+		reg = <0 0x1a0c0000 0 0x01000>,
+		      <0 0x1a0c4700 0 0x0100>;
+		reg-names = "mac", "ippc";
+		interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
+		power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF1>;
+		clocks = <&ssusbsys CLK_SSUSB_SYS_EN>,
+			 <&ssusbsys CLK_SSUSB_REF_EN>,
+			 <&ssusbsys CLK_SSUSB_MCU_EN>,
+			 <&ssusbsys CLK_SSUSB_DMA_EN>;
+		clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck";
+		phys = <&u2port0 PHY_TYPE_USB2>,
+		       <&u3port0 PHY_TYPE_USB3>,
+		       <&u2port1 PHY_TYPE_USB2>;
+
+		status = "disabled";
+	};
+
+	u3phy: usb-phy@1a0c4000 {
+		compatible = "mediatek,mt7622-u3phy",
+			     "mediatek,generic-tphy-v1";
+		reg = <0 0x1a0c4000 0 0x700>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+
+		u2port0: usb-phy@1a0c4800 {
+			reg = <0 0x1a0c4800 0 0x0100>;
+			#phy-cells = <1>;
+			clocks = <&ssusbsys CLK_SSUSB_U2_PHY_EN>;
+			clock-names = "ref";
+		};
+
+		u3port0: usb-phy@1a0c4900 {
+			reg = <0 0x1a0c4900 0 0x0700>;
+			#phy-cells = <1>;
+			clocks = <&clk25m>;
+			clock-names = "ref";
+		};
+
+		u2port1: usb-phy@1a0c5000 {
+			reg = <0 0x1a0c5000 0 0x0100>;
+			#phy-cells = <1>;
+			clocks = <&ssusbsys CLK_SSUSB_U2_PHY_1P_EN>;
+			clock-names = "ref";
+		};
+	};
+
 	pciesys: pciesys@1a100800 {
 		compatible = "mediatek,mt7622-pciesys",
 			     "syscon";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
