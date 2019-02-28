From: Hugues Fruchet <hugues.fruchet@st.com>
Subject: [PATCH 4/4] ARM: dts: stm32: enable OV5640 camera on stm32mp157c-ev1 board
Date: Thu, 28 Feb 2019 15:25:45 +0100
Message-ID: <1551363945-19497-5-git-send-email-hugues.fruchet@st.com>
References: <1551363945-19497-1-git-send-email-hugues.fruchet@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551363945-19497-1-git-send-email-hugues.fruchet@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Enable OV5640 camera sensor driver of MB1379A extension
board connected on CN7 connector of stm32mp157c-ev1 board:
bus-width is set to 8, data-shift is set to 2 (lines 9:2 are used),
hsync-active is set to 0 for horizontal synchro line active low,
vsync-active is set to 0 for vertical synchro line active low and
pclk-sample is set to 1 for pixel clock polarity sampling data
on rising edge of the pixel clock signal.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 56 +++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 009f9d6..8fb1688 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -65,6 +65,14 @@
 		default-on;
 		status = "okay";
 	};
+
+	clocks {
+		clk_ext_camera: clk-ext-camera {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+		};
+	};
 };
 
 &cec {
@@ -73,6 +81,23 @@
 	status = "okay";
 };
 
+&dcmi {
+	status = "okay";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&dcmi_pins_a>;
+	pinctrl-1 = <&dcmi_sleep_pins_a>;
+
+	port {
+		dcmi_0: endpoint {
+			remote-endpoint = <&ov5640_0>;
+			bus-width = <8>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			pclk-sample = <1>;
+		};
+	};
+};
+
 &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -138,6 +163,31 @@
 	i2c-scl-falling-time-ns = <20>;
 	status = "okay";
 
+	ov5640: camera@3c {
+		compatible = "ovti,ov5640";
+		pinctrl-names = "default";
+		pinctrl-0 = <&ov5640_pins>;
+		reg = <0x3c>;
+		clocks = <&clk_ext_camera>;
+		clock-names = "xclk";
+		DOVDD-supply = <&v2v8>;
+		powerdown-gpios = <&stmfx_pinctrl 18 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&stmfx_pinctrl 19 GPIO_ACTIVE_LOW>;
+		rotation = <180>;
+		status = "okay";
+
+		port {
+			ov5640_0: endpoint {
+				remote-endpoint = <&dcmi_0>;
+				bus-width = <8>;
+				data-shift = <2>; /* lines 9:2 are used */
+				hsync-active = <0>;
+				vsync-active = <0>;
+				pclk-sample = <1>;
+			};
+		};
+	};
+
 	stmfx: stmfx@42 {
 		compatible = "st,stmfx-0300";
 		reg = <0x42>;
@@ -157,6 +207,12 @@
 				drive-push-pull;
 				bias-pull-down;
 			};
+
+			ov5640_pins: camera {
+				pins = "agpio2", "agpio3"; /* stmfx pins 18 & 19 */
+				drive-push-pull;
+				output-low;
+			};
 		};
 	};
 };
-- 
2.7.4
