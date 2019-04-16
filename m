From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v1 2/4] arm: dts: mt7623: add display subsystem related device nodes
Date: Tue, 16 Apr 2019 16:58:46 +0200
Message-ID: <20190416145848.11932-3-frank-w@public-files.de>
References: <20190416145848.11932-1-frank-w@public-files.de>
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416145848.11932-1-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, chunhui dai <chunhui.dai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Frank Wunderlich <frank-w@public-files.de>
List-Id: devicetree@vger.kernel.org

From: Ryder Lee <ryder.lee@mediatek.com>

Add display subsystem related device nodes for MT7623.

Cc: CK Hu <ck.hu@mediatek.com>
Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

additional fixes:

[hdmi,dts] fixed dts-warnings
author: Bibby Hsieh <bibby.hsieh@mediatek.com>

[dtsi] fix dpi0-node
author: Ryder Lee <ryder.lee@mediatek.com>

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
=2D--
 arch/arm/boot/dts/mt7623.dtsi                 | 177 ++++++++++++++++++
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  85 +++++++++
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |  85 +++++++++
 3 files changed, 347 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 59e69f3dffa2..f1880ff04193 100644
=2D-- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -23,6 +23,11 @@
 	#address-cells =3D <2>;
 	#size-cells =3D <2>;

+	aliases {
+		rdma0 =3D &rdma0;
+		rdma1 =3D &rdma1;
+	};
+
 	cpu_opp_table: opp-table {
 		compatible =3D "operating-points-v2";
 		opp-shared;
@@ -320,6 +325,25 @@
 		clock-names =3D "spi", "wrap";
 	};

+	mipi_tx0: mipi-dphy@10010000 {
+		compatible =3D "mediatek,mt7623-mipi-tx",
+			     "mediatek,mt2701-mipi-tx";
+		reg =3D <0 0x10010000 0 0x90>;
+		clocks =3D <&clk26m>;
+		clock-output-names =3D "mipi_tx0_pll";
+		#clock-cells =3D <0>;
+		#phy-cells =3D <0>;
+	};
+
+	cec: cec@10012000 {
+		compatible =3D "mediatek,mt7623-cec",
+			     "mediatek,mt8173-cec";
+		reg =3D <0 0x10012000 0 0xbc>;
+		interrupts =3D <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
+		clocks =3D <&infracfg CLK_INFRA_CEC>;
+		status =3D "disabled";
+	};
+
 	cir: cir@10013000 {
 		compatible =3D "mediatek,mt7623-cir";
 		reg =3D <0 0x10013000 0 0x1000>;
@@ -368,6 +392,18 @@
 		#clock-cells =3D <1>;
 	};

+	hdmi_phy: phy@10209100 {
+		compatible =3D "mediatek,mt7623-hdmi-phy",
+			     "mediatek,mt2701-hdmi-phy";
+		reg =3D <0 0x10209100 0 0x24>;
+		clocks =3D <&apmixedsys CLK_APMIXED_HDMI_REF>;
+		clock-names =3D "pll_ref";
+		clock-output-names =3D "hdmitx_dig_cts";
+		#clock-cells =3D <0>;
+		#phy-cells =3D <0>;
+		status =3D "disabled";
+	};
+
 	rng: rng@1020f000 {
 		compatible =3D "mediatek,mt7623-rng";
 		reg =3D <0 0x1020f000 0 0x1000>;
@@ -567,6 +603,16 @@
 		status =3D "disabled";
 	};

+	hdmiddc0: i2c@11013000 {
+		compatible =3D "mediatek,mt7623-hdmi-ddc",
+			     "mediatek,mt8173-hdmi-ddc";
+		interrupts =3D <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
+		reg =3D <0 0x11013000 0 0x1C>;
+		clocks =3D <&pericfg CLK_PERI_I2C3>;
+		clock-names =3D "ddc-i2c";
+		status =3D "disabled";
+	};
+
 	nor_flash: spi@11014000 {
 		compatible =3D "mediatek,mt7623-nor",
 			     "mediatek,mt8173-nor";
@@ -741,6 +787,84 @@
 		#clock-cells =3D <1>;
 	};

+	display_components: dispsys@14000000 {
+		compatible =3D "mediatek,mt7623-mmsys",
+			     "mediatek,mt2701-mmsys";
+		reg =3D <0 0x14000000 0 0x1000>;
+		power-domains =3D <&scpsys MT2701_POWER_DOMAIN_DISP>;
+	};
+
+	ovl@14007000 {
+		compatible =3D "mediatek,mt7623-disp-ovl",
+			     "mediatek,mt2701-disp-ovl";
+		reg =3D <0 0x14007000 0 0x1000>;
+		interrupts =3D <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
+		clocks =3D <&mmsys CLK_MM_DISP_OVL>;
+		iommus =3D <&iommu MT2701_M4U_PORT_DISP_OVL_0>;
+		mediatek,larb =3D <&larb0>;
+	};
+
+	rdma0: rdma@14008000 {
+		compatible =3D "mediatek,mt7623-disp-rdma",
+			     "mediatek,mt2701-disp-rdma";
+		reg =3D <0 0x14008000 0 0x1000>;
+		interrupts =3D <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW>;
+		clocks =3D <&mmsys CLK_MM_DISP_RDMA>;
+		iommus =3D <&iommu MT2701_M4U_PORT_DISP_RDMA>;
+		mediatek,larb =3D <&larb0>;
+	};
+
+	wdma@14009000 {
+		compatible =3D "mediatek,mt7623-disp-wdma",
+			     "mediatek,mt2701-disp-wdma";
+		reg =3D <0 0x14009000 0 0x1000>;
+		interrupts =3D <GIC_SPI 154 IRQ_TYPE_LEVEL_LOW>;
+		clocks =3D <&mmsys CLK_MM_DISP_WDMA>;
+		iommus =3D <&iommu MT2701_M4U_PORT_DISP_WDMA>;
+		mediatek,larb =3D <&larb0>;
+	};
+
+	bls: pwm@1400a000 {
+		compatible =3D "mediatek,mt7623-disp-pwm",
+			     "mediatek,mt2701-disp-pwm";
+		reg =3D <0 0x1400a000 0 0x1000>;
+		#pwm-cells =3D <2>;
+		clocks =3D <&mmsys CLK_MM_MDP_BLS_26M>,
+			 <&mmsys CLK_MM_DISP_BLS>;
+		clock-names =3D "main", "mm";
+		status =3D "disabled";
+	};
+
+	color@1400b000 {
+		compatible =3D "mediatek,mt7623-disp-color",
+			     "mediatek,mt2701-disp-color";
+		reg =3D <0 0x1400b000 0 0x1000>;
+		interrupts =3D <GIC_SPI 156 IRQ_TYPE_LEVEL_LOW>;
+		clocks =3D <&mmsys CLK_MM_DISP_COLOR>;
+	};
+
+	dsi: dsi@1400c000 {
+		compatible =3D "mediatek,mt7623-dsi",
+			     "mediatek,mt2701-dsi";
+		reg =3D <0 0x1400c000 0 0x1000>;
+		interrupts =3D <GIC_SPI 157 IRQ_TYPE_LEVEL_LOW>;
+		clocks =3D <&mmsys CLK_MM_DSI_ENGINE>,
+			 <&mmsys CLK_MM_DSI_DIG>,
+			 <&mipi_tx0>;
+		clock-names =3D "engine", "digital", "hs";
+		phys =3D <&mipi_tx0>;
+		phy-names =3D "dphy";
+		status =3D "disabled";
+	};
+
+	mutex: mutex@1400e000 {
+		compatible =3D "mediatek,mt7623-disp-mutex",
+			     "mediatek,mt2701-disp-mutex";
+		reg =3D <0 0x1400e000 0 0x1000>;
+		interrupts =3D <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
+		clocks =3D <&mmsys CLK_MM_MUTEX_32K>;
+	};
+
 	larb0: larb@14010000 {
 		compatible =3D "mediatek,mt7623-smi-larb",
 			     "mediatek,mt2701-smi-larb";
@@ -753,6 +877,44 @@
 		power-domains =3D <&scpsys MT2701_POWER_DOMAIN_DISP>;
 	};

+	rdma1: rdma@14012000 {
+		compatible =3D "mediatek,mt7623-disp-rdma",
+			     "mediatek,mt2701-disp-rdma";
+		reg =3D <0 0x14012000 0 0x1000>;
+		interrupts =3D <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
+		clocks =3D <&mmsys CLK_MM_DISP_RDMA1>;
+		iommus =3D <&iommu MT2701_M4U_PORT_DISP_RDMA1>;
+		mediatek,larb =3D <&larb0>;
+	};
+
+	dpi0: dpi@14014000 {
+		compatible =3D "mediatek,mt7623-dpi",
+			     "mediatek,mt2701-dpi";
+		reg =3D <0 0x14014000 0 0x1000>;
+		interrupts =3D <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+		clocks =3D <&mmsys CLK_MM_DPI1_DIGL>,
+			 <&mmsys CLK_MM_DPI1_ENGINE>,
+			 <&apmixedsys CLK_APMIXED_TVDPLL>;
+		clock-names =3D "pixel", "engine", "pll";
+		status =3D "disabled";
+	};
+
+	hdmi0: hdmi@14015000 {
+		compatible =3D "mediatek,mt7623-hdmi",
+			     "mediatek,mt8173-hdmi";
+		reg =3D <0 0x14015000 0 0x400>;
+		clocks =3D <&mmsys CLK_MM_HDMI_PIXEL>,
+			 <&mmsys CLK_MM_HDMI_PLL>,
+			 <&mmsys CLK_MM_HDMI_AUDIO>,
+			 <&mmsys CLK_MM_HDMI_SPDIF>;
+		clock-names =3D "pixel", "pll", "bclk", "spdif";
+		phys =3D <&hdmi_phy>;
+		phy-names =3D "hdmi";
+		mediatek,syscon-hdmi =3D <&mmsys 0x900>;
+		cec =3D <&cec>;
+		status =3D "disabled";
+	};
+
 	imgsys: syscon@15000000 {
 		compatible =3D "mediatek,mt7623-imgsys",
 			     "mediatek,mt2701-imgsys",
@@ -1077,6 +1239,21 @@
 		};
 	};

+	hdmi_pins_a: hdmi-default {
+		pins-hdmi {
+			pinmux =3D <MT7623_PIN_123_HTPLG_FUNC_HTPLG>;
+			input-enable;
+			bias-pull-down;
+		};
+	};
+
+	hdmi_ddc_pins_a: hdmi_ddc-default {
+		pins-hdmi-ddc {
+			pinmux =3D <MT7623_PIN_124_GPIO124_FUNC_HDMISCK>,
+				 <MT7623_PIN_125_GPIO125_FUNC_HDMISD>;
+		};
+	};
+
 	i2c0_pins_a: i2c0-default {
 		pins-i2c0 {
 			pinmux =3D <MT7623_PIN_75_SDA0_FUNC_SDA0>,
diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot=
/dts/mt7623n-bananapi-bpi-r2.dts
index 2b760f90f38c..7a1763472018 100644
=2D-- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -21,6 +21,19 @@
 		stdout-path =3D "serial2:115200n8";
 	};

+	connector {
+		compatible =3D "hdmi-connector";
+		label =3D "hdmi";
+		type =3D "d";
+		ddc-i2c-bus =3D <&hdmiddc0>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint =3D <&hdmi0_out>;
+			};
+		};
+	};
+
 	cpus {
 		cpu@0 {
 			proc-supply =3D <&mt6323_vproc_reg>;
@@ -114,10 +127,24 @@
 	};
 };

+&bls {
+	status =3D "okay";
+
+	port {
+		bls_out: endpoint {
+			remote-endpoint =3D <&dpi0_in>;
+		};
+	};
+};
+
 &btif {
 	status =3D "okay";
 };

+&cec {
+	status =3D "okay";
+};
+
 &cir {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&cir_pins_a>;
@@ -128,6 +155,28 @@
 	status =3D "okay";
 };

+&dpi0 {
+	status =3D "okay";
+
+	ports {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		port@0 {
+			reg =3D <0>;
+			dpi0_out: endpoint {
+				remote-endpoint =3D <&hdmi0_in>;
+			};
+		};
+
+		port@1 {
+			reg =3D <1>;
+			dpi0_in: endpoint {
+				remote-endpoint =3D <&bls_out>;
+			};
+		};
+	};
+};
+
 &eth {
 	status =3D "okay";

@@ -199,6 +248,42 @@
 	};
 };

+&hdmi0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&hdmi_pins_a>;
+	status =3D "okay";
+
+	ports {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		port@0 {
+			reg =3D <0>;
+			hdmi0_in: endpoint {
+				remote-endpoint =3D <&dpi0_out>;
+			};
+		};
+
+		port@1 {
+			reg =3D <1>;
+			hdmi0_out: endpoint {
+				remote-endpoint =3D <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+&hdmiddc0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&hdmi_ddc_pins_a>;
+	status =3D "okay";
+};
+
+&hdmi_phy {
+	mediatek,ibias =3D <0xa>;
+	mediatek,ibias_up =3D <0x1c>;
+	status =3D "okay";
+};
+
 &i2c0 {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&i2c0_pins_a>;
diff --git a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts b/arch/arm/boot/dts/mt=
7623n-rfb-emmc.dts
index b7606130ade9..3e5911d8d6bc 100644
=2D-- a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
@@ -24,6 +24,19 @@
 		stdout-path =3D "serial2:115200n8";
 	};

+	connector {
+		compatible =3D "hdmi-connector";
+		label =3D "hdmi";
+		type =3D "d";
+		ddc-i2c-bus =3D <&hdmiddc0>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint =3D <&hdmi0_out>;
+			};
+		};
+	};
+
 	cpus {
 		cpu@0 {
 			proc-supply =3D <&mt6323_vproc_reg>;
@@ -106,10 +119,24 @@
 	};
 };

+&bls {
+	status =3D "okay";
+
+	port {
+		bls_out: endpoint {
+			remote-endpoint =3D <&dpi0_in>;
+		};
+	};
+};
+
 &btif {
 	status =3D "okay";
 };

+&cec {
+	status =3D "okay";
+};
+
 &cir {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&cir_pins_a>;
@@ -120,6 +147,28 @@
 	status =3D "okay";
 };

+&dpi0 {
+	status =3D "okay";
+
+	ports {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		port@0 {
+			reg =3D <0>;
+			dpi0_out: endpoint {
+				remote-endpoint =3D <&hdmi0_in>;
+			};
+		};
+
+		port@1 {
+			reg =3D <1>;
+			dpi0_in: endpoint {
+				remote-endpoint =3D <&bls_out>;
+			};
+		};
+	};
+};
+
 &eth {
 	status =3D "okay";

@@ -202,6 +251,42 @@
 	};
 };

+&hdmi0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&hdmi_pins_a>;
+	status =3D "okay";
+
+	ports {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		port@0 {
+			reg =3D <0>;
+			hdmi0_in: endpoint {
+				remote-endpoint =3D <&dpi0_out>;
+			};
+		};
+
+		port@1 {
+			reg =3D <1>;
+			hdmi0_out: endpoint {
+				remote-endpoint =3D <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+&hdmiddc0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&hdmi_ddc_pins_a>;
+	status =3D "okay";
+};
+
+&hdmi_phy {
+	mediatek,ibias =3D <0xa>;
+	mediatek,ibias_up =3D <0x1c>;
+	status =3D "okay";
+};
+
 &i2c0 {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&i2c0_pins_a>;
=2D-
2.17.1
