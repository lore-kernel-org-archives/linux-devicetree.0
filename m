From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: [PATCH] ARM: dts: imx: ventana: add ADV1780 analog video decoder
Date: Mon, 19 Jun 2017 08:00:10 -0700
Message-ID: <1497884410-7198-1-git-send-email-tharvey@gateworks.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enables the ADV7180 analog video decoder sensor connected to the
IMX6 IPU on various Gateworks Ventana boards.

Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6dl-gw52xx.dts   | 59 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6dl-gw53xx.dts   | 59 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6dl-gw54xx.dts   | 59 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6q-gw52xx.dts    | 58 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6q-gw53xx.dts    | 59 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6q-gw54xx.dts    | 59 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-gw51xx.dtsi | 54 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-gw553x.dtsi | 54 ++++++++++++++++++++++++++++++++
 8 files changed, 461 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-gw52xx.dts b/arch/arm/boot/dts/imx6dl-gw52xx.dts
index a2e0b73..f334410 100644
--- a/arch/arm/boot/dts/imx6dl-gw52xx.dts
+++ b/arch/arm/boot/dts/imx6dl-gw52xx.dts
@@ -17,3 +17,62 @@
 	model = "Gateworks Ventana i.MX6 DualLite/Solo GW52XX";
 	compatible = "gw,imx6dl-gw52xx", "gw,ventana", "fsl,imx6dl";
 };
+
+&i2c3 {
+	adv7180: camera@20 {
+		compatible = "adi,adv7180";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_adv7180>;
+		reg = <0x20>;
+		powerdown-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
+
+		port {
+			adv7180_to_ipu1_csi1_mux: endpoint {
+				remote-endpoint = <&ipu1_csi1_mux_from_parallel_sensor>;
+				bus-width = <8>;
+			};
+		};
+	};
+};
+
+&ipu1_csi1_from_ipu1_csi1_mux {
+	bus-width = <8>;
+};
+
+&ipu1_csi1_mux_from_parallel_sensor {
+	remote-endpoint = <&adv7180_to_ipu1_csi1_mux>;
+	bus-width = <8>;
+};
+
+&ipu1_csi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ipu1_csi1>;
+};
+
+&iomuxc {
+	pinctrl_adv7180: adv7180grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D30__GPIO3_IO30          0x0001b0b0
+			MX6QDL_PAD_EIM_D31__GPIO3_IO31          0x4001b0b0
+		>;
+	};
+
+	pinctrl_ipu1_csi1: ipu1_csi1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_EB2__IPU1_CSI1_DATA19    0x1b0b0
+			MX6QDL_PAD_EIM_D16__IPU1_CSI1_DATA18    0x1b0b0
+			MX6QDL_PAD_EIM_D18__IPU1_CSI1_DATA17    0x1b0b0
+			MX6QDL_PAD_EIM_D19__IPU1_CSI1_DATA16    0x1b0b0
+			MX6QDL_PAD_EIM_D20__IPU1_CSI1_DATA15    0x1b0b0
+			MX6QDL_PAD_EIM_D26__IPU1_CSI1_DATA14    0x1b0b0
+			MX6QDL_PAD_EIM_D27__IPU1_CSI1_DATA13    0x1b0b0
+			MX6QDL_PAD_EIM_A17__IPU1_CSI1_DATA12    0x1b0b0
+			MX6QDL_PAD_EIM_D29__IPU1_CSI1_VSYNC     0x1b0b0
+			MX6QDL_PAD_EIM_EB3__IPU1_CSI1_HSYNC     0x1b0b0
+			MX6QDL_PAD_EIM_A16__IPU1_CSI1_PIXCLK    0x1b0b0
+		>;
+	};
+};
+
diff --git a/arch/arm/boot/dts/imx6dl-gw53xx.dts b/arch/arm/boot/dts/imx6dl-gw53xx.dts
index 6844b70..75eb358 100644
--- a/arch/arm/boot/dts/imx6dl-gw53xx.dts
+++ b/arch/arm/boot/dts/imx6dl-gw53xx.dts
@@ -17,3 +17,62 @@
 	model = "Gateworks Ventana i.MX6 DualLite/Solo GW53XX";
 	compatible = "gw,imx6dl-gw53xx", "gw,ventana", "fsl,imx6dl";
 };
+
+&i2c3 {
+	adv7180: camera@20 {
+		compatible = "adi,adv7180";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_adv7180>;
+		reg = <0x20>;
+		powerdown-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
+
+		port {
+			adv7180_to_ipu1_csi1_mux: endpoint {
+				remote-endpoint = <&ipu1_csi1_mux_from_parallel_sensor>;
+				bus-width = <8>;
+			};
+		};
+	};
+};
+
+&ipu1_csi1_from_ipu1_csi1_mux {
+	bus-width = <8>;
+};
+
+&ipu1_csi1_mux_from_parallel_sensor {
+	remote-endpoint = <&adv7180_to_ipu1_csi1_mux>;
+	bus-width = <8>;
+};
+
+&ipu1_csi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ipu1_csi1>;
+};
+
+&iomuxc {
+	pinctrl_adv7180: adv7180grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D30__GPIO3_IO30          0x0001b0b0
+			MX6QDL_PAD_EIM_D31__GPIO3_IO31          0x4001b0b0
+		>;
+	};
+
+	pinctrl_ipu1_csi1: ipu1_csi1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_EB2__IPU1_CSI1_DATA19    0x1b0b0
+			MX6QDL_PAD_EIM_D16__IPU1_CSI1_DATA18    0x1b0b0
+			MX6QDL_PAD_EIM_D18__IPU1_CSI1_DATA17    0x1b0b0
+			MX6QDL_PAD_EIM_D19__IPU1_CSI1_DATA16    0x1b0b0
+			MX6QDL_PAD_EIM_D20__IPU1_CSI1_DATA15    0x1b0b0
+			MX6QDL_PAD_EIM_D26__IPU1_CSI1_DATA14    0x1b0b0
+			MX6QDL_PAD_EIM_D27__IPU1_CSI1_DATA13    0x1b0b0
+			MX6QDL_PAD_EIM_A17__IPU1_CSI1_DATA12    0x1b0b0
+			MX6QDL_PAD_EIM_D29__IPU1_CSI1_VSYNC     0x1b0b0
+			MX6QDL_PAD_EIM_EB3__IPU1_CSI1_HSYNC     0x1b0b0
+			MX6QDL_PAD_EIM_A16__IPU1_CSI1_PIXCLK    0x1b0b0
+		>;
+	};
+};
+
diff --git a/arch/arm/boot/dts/imx6dl-gw54xx.dts b/arch/arm/boot/dts/imx6dl-gw54xx.dts
index be91541..8ecbaa0 100644
--- a/arch/arm/boot/dts/imx6dl-gw54xx.dts
+++ b/arch/arm/boot/dts/imx6dl-gw54xx.dts
@@ -17,3 +17,62 @@
 	model = "Gateworks Ventana i.MX6 DualLite/Solo GW54XX";
 	compatible = "gw,imx6dl-gw54xx", "gw,ventana", "fsl,imx6dl";
 };
+
+&i2c3 {
+	adv7180: camera@20 {
+		compatible = "adi,adv7180";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_adv7180>;
+		reg = <0x20>;
+		powerdown-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
+
+		port {
+			adv7180_to_ipu1_csi1_mux: endpoint {
+				remote-endpoint = <&ipu1_csi1_mux_from_parallel_sensor>;
+				bus-width = <8>;
+			};
+		};
+	};
+};
+
+&ipu1_csi1_from_ipu1_csi1_mux {
+	bus-width = <8>;
+};
+
+&ipu1_csi1_mux_from_parallel_sensor {
+	remote-endpoint = <&adv7180_to_ipu1_csi1_mux>;
+	bus-width = <8>;
+};
+
+&ipu1_csi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ipu1_csi1>;
+};
+
+&iomuxc {
+	pinctrl_adv7180: adv7180grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D30__GPIO3_IO30          0x0001b0b0
+			MX6QDL_PAD_EIM_D31__GPIO3_IO31          0x4001b0b0
+		>;
+	};
+
+	pinctrl_ipu1_csi1: ipu1_csi1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_EB2__IPU1_CSI1_DATA19    0x1b0b0
+			MX6QDL_PAD_EIM_D16__IPU1_CSI1_DATA18    0x1b0b0
+			MX6QDL_PAD_EIM_D18__IPU1_CSI1_DATA17    0x1b0b0
+			MX6QDL_PAD_EIM_D19__IPU1_CSI1_DATA16    0x1b0b0
+			MX6QDL_PAD_EIM_D20__IPU1_CSI1_DATA15    0x1b0b0
+			MX6QDL_PAD_EIM_D26__IPU1_CSI1_DATA14    0x1b0b0
+			MX6QDL_PAD_EIM_D27__IPU1_CSI1_DATA13    0x1b0b0
+			MX6QDL_PAD_EIM_A17__IPU1_CSI1_DATA12    0x1b0b0
+			MX6QDL_PAD_EIM_D29__IPU1_CSI1_VSYNC     0x1b0b0
+			MX6QDL_PAD_EIM_EB3__IPU1_CSI1_HSYNC     0x1b0b0
+			MX6QDL_PAD_EIM_A16__IPU1_CSI1_PIXCLK    0x1b0b0
+		>;
+	};
+};
+
diff --git a/arch/arm/boot/dts/imx6q-gw52xx.dts b/arch/arm/boot/dts/imx6q-gw52xx.dts
index a12c47e..0b8ae00 100644
--- a/arch/arm/boot/dts/imx6q-gw52xx.dts
+++ b/arch/arm/boot/dts/imx6q-gw52xx.dts
@@ -18,6 +18,64 @@
 	compatible = "gw,imx6q-gw52xx", "gw,ventana", "fsl,imx6q";
 };
 
+&i2c3 {
+	adv7180: camera@20 {
+		compatible = "adi,adv7180";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_adv7180>;
+		reg = <0x20>;
+		powerdown-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
+
+		port {
+			adv7180_to_ipu2_csi1_mux: endpoint {
+				remote-endpoint = <&ipu2_csi1_mux_from_parallel_sensor>;
+				bus-width = <8>;
+			};
+		};
+	};
+};
+
+&ipu2_csi1_from_ipu2_csi1_mux {
+	bus-width = <8>;
+};
+
+&ipu2_csi1_mux_from_parallel_sensor {
+	remote-endpoint = <&adv7180_to_ipu2_csi1_mux>;
+	bus-width = <8>;
+};
+
+&ipu2_csi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ipu2_csi1>;
+};
+
+&iomuxc {
+	pinctrl_adv7180: adv7180grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D30__GPIO3_IO30          0x0001b0b0
+			MX6QDL_PAD_EIM_D31__GPIO3_IO31          0x4001b0b0
+		>;
+	};
+
+	pinctrl_ipu2_csi1: ipu2_csi1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_EB2__IPU2_CSI1_DATA19    0x1b0b0
+			MX6QDL_PAD_EIM_D16__IPU2_CSI1_DATA18    0x1b0b0
+			MX6QDL_PAD_EIM_D18__IPU2_CSI1_DATA17    0x1b0b0
+			MX6QDL_PAD_EIM_D19__IPU2_CSI1_DATA16    0x1b0b0
+			MX6QDL_PAD_EIM_D20__IPU2_CSI1_DATA15    0x1b0b0
+			MX6QDL_PAD_EIM_D26__IPU2_CSI1_DATA14    0x1b0b0
+			MX6QDL_PAD_EIM_D27__IPU2_CSI1_DATA13    0x1b0b0
+			MX6QDL_PAD_EIM_A17__IPU2_CSI1_DATA12    0x1b0b0
+			MX6QDL_PAD_EIM_D29__IPU2_CSI1_VSYNC     0x1b0b0
+			MX6QDL_PAD_EIM_EB3__IPU2_CSI1_HSYNC     0x1b0b0
+			MX6QDL_PAD_EIM_A16__IPU2_CSI1_PIXCLK    0x1b0b0
+		>;
+	};
+};
+
 &sata {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/imx6q-gw53xx.dts b/arch/arm/boot/dts/imx6q-gw53xx.dts
index d76aaa8..53a4910 100644
--- a/arch/arm/boot/dts/imx6q-gw53xx.dts
+++ b/arch/arm/boot/dts/imx6q-gw53xx.dts
@@ -18,6 +18,65 @@
 	compatible = "gw,imx6q-gw53xx", "gw,ventana", "fsl,imx6q";
 };
 
+&i2c3 {
+	adv7180: camera@20 {
+		compatible = "adi,adv7180";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_adv7180>;
+		reg = <0x20>;
+		powerdown-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
+
+		port {
+			adv7180_to_ipu2_csi1_mux: endpoint {
+				remote-endpoint = <&ipu2_csi1_mux_from_parallel_sensor>;
+				bus-width = <8>;
+			};
+		};
+	};
+};
+
+&ipu2_csi1_from_ipu2_csi1_mux {
+	bus-width = <8>;
+};
+
+&ipu2_csi1_mux_from_parallel_sensor {
+	remote-endpoint = <&adv7180_to_ipu2_csi1_mux>;
+	bus-width = <8>;
+};
+
+&ipu2_csi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ipu2_csi1>;
+};
+
 &sata {
 	status = "okay";
 };
+
+&iomuxc {
+	pinctrl_adv7180: adv7180grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D30__GPIO3_IO30          0x0001b0b0
+			MX6QDL_PAD_EIM_D31__GPIO3_IO31          0x4001b0b0
+		>;
+	};
+
+	pinctrl_ipu2_csi1: ipu2_csi1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_EB2__IPU2_CSI1_DATA19    0x1b0b0
+			MX6QDL_PAD_EIM_D16__IPU2_CSI1_DATA18    0x1b0b0
+			MX6QDL_PAD_EIM_D18__IPU2_CSI1_DATA17    0x1b0b0
+			MX6QDL_PAD_EIM_D19__IPU2_CSI1_DATA16    0x1b0b0
+			MX6QDL_PAD_EIM_D20__IPU2_CSI1_DATA15    0x1b0b0
+			MX6QDL_PAD_EIM_D26__IPU2_CSI1_DATA14    0x1b0b0
+			MX6QDL_PAD_EIM_D27__IPU2_CSI1_DATA13    0x1b0b0
+			MX6QDL_PAD_EIM_A17__IPU2_CSI1_DATA12    0x1b0b0
+			MX6QDL_PAD_EIM_D29__IPU2_CSI1_VSYNC     0x1b0b0
+			MX6QDL_PAD_EIM_EB3__IPU2_CSI1_HSYNC     0x1b0b0
+			MX6QDL_PAD_EIM_A16__IPU2_CSI1_PIXCLK    0x1b0b0
+		>;
+	};
+};
+
diff --git a/arch/arm/boot/dts/imx6q-gw54xx.dts b/arch/arm/boot/dts/imx6q-gw54xx.dts
index 6e8f53e..928b14c 100644
--- a/arch/arm/boot/dts/imx6q-gw54xx.dts
+++ b/arch/arm/boot/dts/imx6q-gw54xx.dts
@@ -18,6 +18,65 @@
 	compatible = "gw,imx6q-gw54xx", "gw,ventana", "fsl,imx6q";
 };
 
+&i2c3 {
+	adv7180: camera@20 {
+		compatible = "adi,adv7180";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_adv7180>;
+		reg = <0x20>;
+		powerdown-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
+
+		port {
+			adv7180_to_ipu2_csi1_mux: endpoint {
+				remote-endpoint = <&ipu2_csi1_mux_from_parallel_sensor>;
+				bus-width = <8>;
+			};
+		};
+	};
+};
+
+&ipu2_csi1_from_ipu2_csi1_mux {
+	bus-width = <8>;
+};
+
+&ipu2_csi1_mux_from_parallel_sensor {
+	remote-endpoint = <&adv7180_to_ipu2_csi1_mux>;
+	bus-width = <8>;
+};
+
+&ipu2_csi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ipu2_csi1>;
+};
+
 &sata {
 	status = "okay";
 };
+
+&iomuxc {
+	pinctrl_adv7180: adv7180grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D30__GPIO3_IO30          0x0001b0b0
+			MX6QDL_PAD_EIM_D31__GPIO3_IO31          0x4001b0b0
+		>;
+	};
+
+	pinctrl_ipu2_csi1: ipu2_csi1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_EB2__IPU2_CSI1_DATA19    0x1b0b0
+			MX6QDL_PAD_EIM_D16__IPU2_CSI1_DATA18    0x1b0b0
+			MX6QDL_PAD_EIM_D18__IPU2_CSI1_DATA17    0x1b0b0
+			MX6QDL_PAD_EIM_D19__IPU2_CSI1_DATA16    0x1b0b0
+			MX6QDL_PAD_EIM_D20__IPU2_CSI1_DATA15    0x1b0b0
+			MX6QDL_PAD_EIM_D26__IPU2_CSI1_DATA14    0x1b0b0
+			MX6QDL_PAD_EIM_D27__IPU2_CSI1_DATA13    0x1b0b0
+			MX6QDL_PAD_EIM_A17__IPU2_CSI1_DATA12    0x1b0b0
+			MX6QDL_PAD_EIM_D29__IPU2_CSI1_VSYNC     0x1b0b0
+			MX6QDL_PAD_EIM_EB3__IPU2_CSI1_HSYNC     0x1b0b0
+			MX6QDL_PAD_EIM_A16__IPU2_CSI1_PIXCLK    0x1b0b0
+		>;
+	};
+};
+
diff --git a/arch/arm/boot/dts/imx6qdl-gw51xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw51xx.dtsi
index e8c1edc..8855562 100644
--- a/arch/arm/boot/dts/imx6qdl-gw51xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw51xx.dtsi
@@ -231,6 +231,37 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
+
+	adv7180: camera@20 {
+		compatible = "adi,adv7180";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_adv7180>;
+		reg = <0x20>;
+		powerdown-gpios = <&gpio5 20 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
+
+		port {
+			adv7180_to_ipu1_csi0_mux: endpoint {
+				remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
+				bus-width = <8>;
+			};
+		};
+	};
+};
+
+&ipu1_csi0_from_ipu1_csi0_mux {
+	bus-width = <8>;
+};
+
+&ipu1_csi0_mux_from_parallel_sensor {
+	remote-endpoint = <&adv7180_to_ipu1_csi0_mux>;
+	bus-width = <8>;
+};
+
+&ipu1_csi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ipu1_csi0>;
 };
 
 &pcie {
@@ -302,6 +333,13 @@
 
 &iomuxc {
 	imx6qdl-gw51xx {
+		pinctrl_adv7180: adv7180grp {
+			fsl,pins = <
+				MX6QDL_PAD_CSI0_DAT5__GPIO5_IO23        0x0001b0b0
+				MX6QDL_PAD_CSI0_DATA_EN__GPIO5_IO20     0x4001b0b0
+			>;
+		};
+
 		pinctrl_enet: enetgrp {
 			fsl,pins = <
 				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
@@ -372,6 +410,22 @@
 			>;
 		};
 
+		pinctrl_ipu1_csi0: ipu1csi0grp {
+			fsl,pins = <
+				MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12    0x1b0b0
+				MX6QDL_PAD_CSI0_DAT13__IPU1_CSI0_DATA13    0x1b0b0
+				MX6QDL_PAD_CSI0_DAT14__IPU1_CSI0_DATA14    0x1b0b0
+				MX6QDL_PAD_CSI0_DAT15__IPU1_CSI0_DATA15    0x1b0b0
+				MX6QDL_PAD_CSI0_DAT16__IPU1_CSI0_DATA16    0x1b0b0
+				MX6QDL_PAD_CSI0_DAT17__IPU1_CSI0_DATA17    0x1b0b0
+				MX6QDL_PAD_CSI0_DAT18__IPU1_CSI0_DATA18    0x1b0b0
+				MX6QDL_PAD_CSI0_DAT19__IPU1_CSI0_DATA19    0x1b0b0
+				MX6QDL_PAD_CSI0_MCLK__IPU1_CSI0_HSYNC      0x1b0b0
+				MX6QDL_PAD_CSI0_VSYNC__IPU1_CSI0_VSYNC     0x1b0b0
+				MX6QDL_PAD_CSI0_PIXCLK__IPU1_CSI0_PIXCLK   0x1b0b0
+			>;
+		};
+
 		pinctrl_pcie: pciegrp {
 			fsl,pins = <
 				MX6QDL_PAD_GPIO_0__GPIO1_IO00		0x1b0b0
diff --git a/arch/arm/boot/dts/imx6qdl-gw553x.dtsi b/arch/arm/boot/dts/imx6qdl-gw553x.dtsi
index 57374dd..1a0faa1 100644
--- a/arch/arm/boot/dts/imx6qdl-gw553x.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw553x.dtsi
@@ -261,6 +261,37 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
+
+	adv7180: camera@20 {
+		compatible = "adi,adv7180";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_adv7180>;
+		reg = <0x20>;
+		powerdown-gpios = <&gpio5 20 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
+
+		port {
+			adv7180_to_ipu1_csi0_mux: endpoint {
+				remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
+				bus-width = <8>;
+			};
+		};
+	};
+};
+
+&ipu1_csi0_from_ipu1_csi0_mux {
+	bus-width = <8>;
+};
+
+&ipu1_csi0_mux_from_parallel_sensor {
+	remote-endpoint = <&adv7180_to_ipu1_csi0_mux>;
+	bus-width = <8>;
+};
+
+&ipu1_csi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ipu1_csi0>;
 };
 
 &pcie {
@@ -340,6 +371,13 @@
 };
 
 &iomuxc {
+	pinctrl_adv7180: adv7180grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT5__GPIO5_IO23        0x0001b0b0
+			MX6QDL_PAD_CSI0_DATA_EN__GPIO5_IO20     0x4001b0b0
+		>;
+	};
+
 	pinctrl_gpmi_nand: gpminandgrp {
 		fsl,pins = <
 			MX6QDL_PAD_NANDF_CLE__NAND_CLE		0xb0b1
@@ -387,6 +425,22 @@
 		>;
 	};
 
+	pinctrl_ipu1_csi0: ipu1csi0grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT13__IPU1_CSI0_DATA13    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT14__IPU1_CSI0_DATA14    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT15__IPU1_CSI0_DATA15    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT16__IPU1_CSI0_DATA16    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT17__IPU1_CSI0_DATA17    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT18__IPU1_CSI0_DATA18    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT19__IPU1_CSI0_DATA19    0x1b0b0
+			MX6QDL_PAD_CSI0_MCLK__IPU1_CSI0_HSYNC      0x1b0b0
+			MX6QDL_PAD_CSI0_VSYNC__IPU1_CSI0_VSYNC     0x1b0b0
+			MX6QDL_PAD_CSI0_PIXCLK__IPU1_CSI0_PIXCLK   0x1b0b0
+		>;
+	};
+
 	pinctrl_gpio_leds: gpioledsgrp {
 		fsl,pins = <
 			MX6QDL_PAD_KEY_COL2__GPIO4_IO10		0x1b0b0
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
