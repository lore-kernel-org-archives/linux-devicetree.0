From: Bruno Herrera <bruherrera@gmail.com>
Subject: [v2 2/3] ARM: dts: STM32 Add USB FS host mode support
Date: Mon, 16 Jan 2017 00:09:55 -0200
Message-ID: <20170116020958.62767-2-bruherrera@gmail.com>
References: <20170116020958.62767-1-bruherrera@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170116020958.62767-1-bruherrera@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the USB pins and nodes for USB HS/FS cores working at FS speed,
using embedded PHY.

Signed-off-by: Bruno Herrera <bruherrera@gmail.com>
---
 arch/arm/boot/dts/stm32f429-disco.dts | 30 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32f429.dtsi      | 35 ++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/stm32f469-disco.dts | 30 ++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 7d0415e..374c5ed 100644
--- a/arch/arm/boot/dts/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/stm32f429-disco.dts
@@ -88,6 +88,16 @@
 			gpios = <&gpioa 0 0>;
 		};
 	};
+
+	/* This turns on vbus for otg for host mode (dwc2) */
+	vcc5v_otg: vcc5v-otg-regulator {
+		compatible = "regulator-fixed";
+		gpio = <&gpioc 4 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbotg_pwren_h>;
+		regulator-name = "vcc5_host1";
+		regulator-always-on;
+	};
 };
 
 &clk_hse {
@@ -99,3 +109,23 @@
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usbotg_hs {
+	compatible = "st,stm32-fsotg", "snps,dwc2";
+	dr_mode = "host";
+	pinctrl-0 = <&usbotg_fs_pins_b>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pinctrl {
+	usb-host {
+		usbotg_pwren_h: usbotg-pwren-h {
+			pins {
+				pinmux = <STM32F429_PC4_FUNC_GPIO>;
+				bias-disable;
+				drive-push-pull;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index e4dae0e..bc07aa8 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -206,7 +206,7 @@
 			reg = <0x40007000 0x400>;
 		};
 
-		pin-controller {
+		pinctrl: pin-controller {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "st,stm32f429-pinctrl";
@@ -316,6 +316,30 @@
 				};
 			};
 
+			usbotg_fs_pins_a: usbotg_fs@0 {
+				pins {
+					pinmux = <STM32F429_PA10_FUNC_OTG_FS_ID>,
+						 <STM32F429_PA11_FUNC_OTG_FS_DM>,
+						 <STM32F429_PA12_FUNC_OTG_FS_DP>;
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <2>;
+				};
+			};
+
+			usbotg_fs_pins_b: usbotg_fs@1 {
+				pins {
+					pinmux = <STM32F429_PB12_FUNC_OTG_HS_ID>,
+						 <STM32F429_PB14_FUNC_OTG_HS_DM>,
+						 <STM32F429_PB15_FUNC_OTG_HS_DP>;
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <2>;
+				};
+			};
+
+
+
 			usbotg_hs_pins_a: usbotg_hs@0 {
 				pins {
 					pinmux = <STM32F429_PH4_FUNC_OTG_HS_ULPI_NXT>,
@@ -420,6 +444,15 @@
 			status = "disabled";
 		};
 
+		usbotg_fs: usb@50000000 {
+			compatible = "st,stm32f4xx-fsotg", "snps,dwc2";
+			reg = <0x50000000 0x40000>;
+			interrupts = <67>;
+			clocks = <&rcc 0 39>;
+			clock-names = "otg";
+			status = "disabled";
+		};
+
 		rng: rng@50060800 {
 			compatible = "st,stm32-rng";
 			reg = <0x50060800 0x400>;
diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 8877c00..8ae6763 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -68,6 +68,17 @@
 	soc {
 		dma-ranges = <0xc0000000 0x0 0x10000000>;
 	};
+
+	/* This turns on vbus for otg for host mode (dwc2) */
+	vcc5v_otg: vcc5v-otg-regulator {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpiob 2 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbotg_pwren_h>;
+		regulator-name = "vcc5_host1";
+		regulator-always-on;
+	};
 };
 
 &rcc {
@@ -81,3 +92,22 @@
 &usart3 {
 	status = "okay";
 };
+
+&usbotg_fs {
+	dr_mode = "host";
+	pinctrl-0 = <&usbotg_fs_pins_a>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pinctrl {
+	usb-host {
+		usbotg_pwren_h: usbotg-pwren-h {
+			pins {
+				pinmux = <STM32F429_PB2_FUNC_GPIO>;
+				bias-disable;
+				drive-push-pull;
+			};
+		};
+	};
+};
-- 
2.10.1 (Apple Git-78)
