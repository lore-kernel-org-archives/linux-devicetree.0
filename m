From: Olivier Moysan <olivier.moysan@st.com>
Subject: [PATCH] ARM: dts: stm32: add audio codec support on stm32mp157a-dk1 board
Date: Fri, 5 Jul 2019 13:53:00 +0200
Message-ID: <1562327580-19647-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@st.com, robh@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, olivier.moysan@st.com
List-Id: devicetree@vger.kernel.org

Add support of Cirrus cs42l51 audio codec on stm32mp157a-dk1 board.
Configuration overview:
- SAI2A is the CPU interface used for the codec audio playback
- SAI2B is the CPU interface used for the codec audio record
- SAI2A is configured as a clock provider for the audio codec
- SAI2A&B are configured as slave of the audio codec
- SAI2A&B share the same interface of the audio codec

Note:
In master mode, cs42l51 audio codec provides a bitclock
at 64 x FS, regardless of data width. This means that
slot width is always 32 bits.
Set slot width to 32 bits and slot number to 2
in SAI2A&B endpoint nodes, to match this constraint.
dai-tdm-slot-num and dai-tdm-slot-width properties are used here,
assuming that i2s is a special case of tdm, where slot number is 2.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 arch/arm/boot/dts/stm32mp157a-dk1.dts | 89 +++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index f3f0e37aad4d..0f5b3c77153d 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -48,6 +48,17 @@
 			default-state = "off";
 		};
 	};
+
+	sound {
+		compatible = "audio-graph-card";
+		label = "STM32MP1-DK";
+		routing =
+			"Playback" , "MCLK",
+			"Capture" , "MCLK",
+			"MICL" , "Mic Bias";
+		dais = <&sai2a_port &sai2b_port>;
+		status = "okay";
+	};
 };
 
 &cec {
@@ -116,6 +127,39 @@
 			};
 		};
 	};
+
+	cs42l51: cs42l51@4a {
+		compatible = "cirrus,cs42l51";
+		reg = <0x4a>;
+		#sound-dai-cells = <0>;
+		VL-supply = <&v3v3>;
+		VD-supply = <&v1v8_audio>;
+		VA-supply = <&v1v8_audio>;
+		VAHP-supply = <&v1v8_audio>;
+		reset-gpios = <&gpiog 9 GPIO_ACTIVE_LOW>;
+		clocks = <&sai2a>;
+		clock-names = "MCLK";
+		status = "okay";
+
+		cs42l51_port: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cs42l51_tx_endpoint: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&sai2a_endpoint>;
+				frame-master;
+				bitclock-master;
+			};
+
+			cs42l51_rx_endpoint: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&sai2b_endpoint>;
+				frame-master;
+				bitclock-master;
+			};
+		};
+	};
 };
 
 &i2c4 {
@@ -297,6 +341,51 @@
 	status = "okay";
 };
 
+&sai2 {
+	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
+	clock-names = "pclk", "x8k", "x11k";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sai2a_pins_a>, <&sai2b_pins_b>;
+	pinctrl-1 = <&sai2a_sleep_pins_a>, <&sai2b_sleep_pins_b>;
+	status = "okay";
+
+	sai2a: audio-controller@4400b004 {
+		#clock-cells = <0>;
+		dma-names = "tx";
+		clocks = <&rcc SAI2_K>;
+		clock-names = "sai_ck";
+		status = "okay";
+
+		sai2a_port: port {
+			sai2a_endpoint: endpoint {
+				remote-endpoint = <&cs42l51_tx_endpoint>;
+				format = "i2s";
+				mclk-fs = <256>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+			};
+		};
+	};
+
+	sai2b: audio-controller@4400b024 {
+		dma-names = "rx";
+		st,sync = <&sai2a 2>;
+		clocks = <&rcc SAI2_K>, <&sai2a>;
+		clock-names = "sai_ck", "MCLK";
+		status = "okay";
+
+		sai2b_port: port {
+			sai2b_endpoint: endpoint {
+				remote-endpoint = <&cs42l51_rx_endpoint>;
+				format = "i2s";
+				mclk-fs = <256>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+			};
+		};
+	};
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
-- 
2.7.4
