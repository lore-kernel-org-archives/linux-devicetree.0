From: Christophe Roullier <christophe.roullier@st.com>
Subject: [PATCH V3 6/6] ARM: dts: stm32: Add Ethernet support on stm32h7 SOC and activate it for eval and disco boards
Date: Tue, 5 Mar 2019 09:29:28 +0100
Message-ID: <1551774568-11732-7-git-send-email-christophe.roullier@st.com>
References: <1551774568-11732-1-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551774568-11732-1-git-send-email-christophe.roullier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, davem@davemloft.net, joabreu@synopsys.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, christophe.roullier@st.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

Synopsys GMAC 4.10 is used. And Phy mode for eval and disco is RMII
with PHY SMSC LAN8742

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi | 15 +++++++++++++++
 arch/arm/boot/dts/stm32h743.dtsi         | 13 +++++++++++++
 arch/arm/boot/dts/stm32h743i-disco.dts   | 17 +++++++++++++++++
 arch/arm/boot/dts/stm32h743i-eval.dts    | 17 +++++++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/arch/arm/boot/dts/stm32h743-pinctrl.dtsi b/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
index 24be8e6..980b276 100644
--- a/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
@@ -173,6 +173,21 @@
 				};
 			};
 
+			ethernet_rmii: rmii@0 {
+				pins {
+					pinmux = <STM32_PINMUX('G', 11, AF11)>,
+						 <STM32_PINMUX('G', 13, AF11)>,
+						 <STM32_PINMUX('G', 12, AF11)>,
+						 <STM32_PINMUX('C', 4, AF11)>,
+						 <STM32_PINMUX('C', 5, AF11)>,
+						 <STM32_PINMUX('A', 7, AF11)>,
+						 <STM32_PINMUX('C', 1, AF11)>,
+						 <STM32_PINMUX('A', 2, AF11)>,
+						 <STM32_PINMUX('A', 1, AF11)>;
+					slew-rate = <2>;
+				};
+			};
+
 			usart1_pins: usart1@0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
index cbdd69c..e103b29 100644
--- a/arch/arm/boot/dts/stm32h743.dtsi
+++ b/arch/arm/boot/dts/stm32h743.dtsi
@@ -511,6 +511,19 @@
 				status = "disabled";
 			};
 		};
+
+		mac: ethernet@40028000 {
+			compatible = "st,stm32-dwmac", "snps,dwmac-4.10a";
+			reg = <0x40028000 0x8000>;
+			reg-names = "stmmaceth";
+			interrupts = <61>;
+			interrupt-names = "macirq";
+			clock-names = "stmmaceth", "mac-clk-tx", "mac-clk-rx";
+			clocks = <&rcc ETH1MAC_CK>, <&rcc ETH1TX_CK>, <&rcc ETH1RX_CK>;
+			st,syscon = <&syscfg 0x4>;
+			snps,pbl = <8>;
+			status = "disabled";
+		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/stm32h743i-disco.dts b/arch/arm/boot/dts/stm32h743i-disco.dts
index 45e088c..83ef63d 100644
--- a/arch/arm/boot/dts/stm32h743i-disco.dts
+++ b/arch/arm/boot/dts/stm32h743i-disco.dts
@@ -66,6 +66,23 @@
 	clock-frequency = <25000000>;
 };
 
+&mac {
+	status = "disabled";
+	pinctrl-0	= <&ethernet_rmii>;
+	pinctrl-names	= "default";
+	phy-mode	= "rmii";
+	phy-handle	= <&phy0>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
 &usart2 {
 	pinctrl-0 = <&usart2_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/stm32h743i-eval.dts b/arch/arm/boot/dts/stm32h743i-eval.dts
index 3f8e0c4..383c5bb 100644
--- a/arch/arm/boot/dts/stm32h743i-eval.dts
+++ b/arch/arm/boot/dts/stm32h743i-eval.dts
@@ -104,6 +104,23 @@
 	status = "okay";
 };
 
+&mac {
+	status = "disabled";
+	pinctrl-0	= <&ethernet_rmii>;
+	pinctrl-names	= "default";
+	phy-mode	= "rmii";
+	phy-handle	= <&phy0>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins>;
 	pinctrl-names = "default";
-- 
2.7.4
