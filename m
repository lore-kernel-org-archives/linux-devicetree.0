From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 4/4] arm: dts: mt7623: add PCIe related nodes
Date: Sun, 20 Aug 2017 17:46:02 +0800
Message-ID: <9b2acd69904b0e372cb02cbbc3b69ad4a1c23262.1503222289.git.ryder.lee@mediatek.com>
References: <9c4a8be621ac76594fad303d5d49ed32bd530605.1503222289.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9c4a8be621ac76594fad303d5d49ed32bd530605.1503222289.git.ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds devices nodes and updates pinmux setting for the PICe
function block. Just note that PCIe port2 PHY is shared with U3 port.

Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/mt7623.dtsi                 | 108 ++++++++++++++++++++++++++
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  30 +++++++
 2 files changed, 138 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index e11e5e7..7d78471 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -872,6 +872,114 @@
 		#reset-cells = <1>;
 	};
 
+	pcie: pcie-controller@1a140000 {
+		compatible = "mediatek,mt7623-pcie";
+		device_type = "pci";
+		reg = <0 0x1a140000 0 0x1000>, /* PCIe shared registers */
+		      <0 0x1a142000 0 0x1000>, /* Port0 registers */
+		      <0 0x1a143000 0 0x1000>, /* Port1 registers */
+		      <0 0x1a144000 0 0x1000>; /* Port2 registers */
+		reg-names = "subsys", "port0", "port1", "port2";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0xf800 0 0 0>;
+		interrupt-map = <0x0000 0 0 0 &sysirq GIC_SPI 193 IRQ_TYPE_LEVEL_LOW>,
+				<0x0800 0 0 0 &sysirq GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>,
+				<0x1000 0 0 0 &sysirq GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&topckgen CLK_TOP_ETHIF_SEL>,
+			 <&hifsys CLK_HIFSYS_PCIE0>,
+			 <&hifsys CLK_HIFSYS_PCIE1>,
+			 <&hifsys CLK_HIFSYS_PCIE2>;
+		clock-names = "free_ck", "sys_ck0", "sys_ck1", "sys_ck2";
+		resets = <&hifsys MT2701_HIFSYS_PCIE0_RST>,
+			 <&hifsys MT2701_HIFSYS_PCIE1_RST>,
+			 <&hifsys MT2701_HIFSYS_PCIE2_RST>;
+		reset-names = "pcie-rst0", "pcie-rst1", "pcie-rst2";
+		phys = <&pcie0_port PHY_TYPE_PCIE>,
+		       <&pcie1_port PHY_TYPE_PCIE>,
+		       <&u3port1 PHY_TYPE_PCIE>;
+		phy-names = "pcie-phy0", "pcie-phy1", "pcie-phy2";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_HIF>;
+		bus-range = <0x00 0xff>;
+		status = "disabled";
+		ranges = <0x81000000 0 0x1a160000 0 0x1a160000 0 0x00010000
+			  0x83000000 0 0x60000000 0 0x60000000 0 0x10000000>;
+
+		pcie@0,0 {
+			device_type = "pci";
+			reg = <0x0000 0 0 0 0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &sysirq GIC_SPI 193 IRQ_TYPE_LEVEL_LOW>;
+			ranges;
+			num-lanes = <1>;
+			status = "disabled";
+		};
+
+		pcie@1,0 {
+			device_type = "pci";
+			reg = <0x0800 0 0 0 0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &sysirq GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+			ranges;
+			num-lanes = <1>;
+			status = "disabled";
+		};
+
+		pcie@2,0 {
+			device_type = "pci";
+			reg = <0x1000 0 0 0 0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &sysirq GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
+			ranges;
+			num-lanes = <1>;
+			status = "disabled";
+		};
+	};
+
+	pcie0_phy: pcie-phy@1a149000 {
+		compatible = "mediatek,generic-tphy-v1";
+		reg = <0 0x1a149000 0 0x0700>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+
+		pcie0_port: pcie-phy@1a149900 {
+			reg = <0 0x1a149900 0 0x0700>;
+			clocks = <&clk26m>;
+			clock-names = "ref";
+			#phy-cells = <1>;
+			status = "okay";
+		};
+	};
+
+	pcie1_phy: pcie-phy@1a14a000 {
+		compatible = "mediatek,generic-tphy-v1";
+		reg = <0 0x1a14a000 0 0x0700>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+
+		pcie1_port: pcie-phy@1a14a900 {
+			reg = <0 0x1a14a900 0 0x0700>;
+			clocks = <&clk26m>;
+			clock-names = "ref";
+			#phy-cells = <1>;
+			status = "okay";
+		};
+	};
+
 	usb1: usb@1a1c0000 {
 		compatible = "mediatek,mt7623-xhci",
 			     "mediatek,mt8173-xhci";
diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 336814a..80676b7 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -226,6 +226,28 @@
 	vqmmc-supply = <&mt6323_vio18_reg>;
 };
 
+&pcie {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_default>;
+	status = "okay";
+
+	pcie@0,0 {
+		status = "okay";
+	};
+
+	pcie@1,0 {
+		status = "okay";
+	};
+};
+
+&pcie0_phy {
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+};
+
 &pio {
 	cir_pins_a:cir@0 {
 		pins_cir {
@@ -408,6 +430,14 @@
 		};
 	};
 
+	pcie_default: pcie_pin_default {
+		pins_cmd_dat {
+			pinmux = <MT7623_PIN_208_AUD_EXT_CK1_FUNC_PCIE0_PERST_N>,
+				 <MT7623_PIN_209_AUD_EXT_CK2_FUNC_PCIE1_PERST_N>;
+			bias-disable;
+		};
+	};
+
 	pwm_bls_gpio: pwm_bls_gpio {
 		pins_cmd_dat {
 			pinmux = <MT7623_PIN_203_PWM0_FUNC_DISP_PWM>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
