From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH] ARM: dts: stm32: remove useless pinctrl entries in stm32mp157-pinctrl
Date: Wed, 31 Jul 2019 17:26:09 +0200
Message-ID: <20190731152609.32197-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch removes "ngpios" and "gpio-ranges" information from
stm32mp157-pinctrl.dtsi file as it is now filled in stm32mp157 pinctrl
package files.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index df6470133574..3f6008aa28a4 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -24,8 +24,6 @@
 				reg = <0x0 0x400>;
 				clocks = <&rcc GPIOA>;
 				st,bank-name = "GPIOA";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 0 16>;
 				status = "disabled";
 			};
 
@@ -37,8 +35,6 @@
 				reg = <0x1000 0x400>;
 				clocks = <&rcc GPIOB>;
 				st,bank-name = "GPIOB";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 16 16>;
 				status = "disabled";
 			};
 
@@ -50,8 +46,6 @@
 				reg = <0x2000 0x400>;
 				clocks = <&rcc GPIOC>;
 				st,bank-name = "GPIOC";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 32 16>;
 				status = "disabled";
 			};
 
@@ -63,8 +57,6 @@
 				reg = <0x3000 0x400>;
 				clocks = <&rcc GPIOD>;
 				st,bank-name = "GPIOD";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 48 16>;
 				status = "disabled";
 			};
 
@@ -76,8 +68,6 @@
 				reg = <0x4000 0x400>;
 				clocks = <&rcc GPIOE>;
 				st,bank-name = "GPIOE";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 64 16>;
 				status = "disabled";
 			};
 
@@ -89,8 +79,6 @@
 				reg = <0x5000 0x400>;
 				clocks = <&rcc GPIOF>;
 				st,bank-name = "GPIOF";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 80 16>;
 				status = "disabled";
 			};
 
@@ -102,8 +90,6 @@
 				reg = <0x6000 0x400>;
 				clocks = <&rcc GPIOG>;
 				st,bank-name = "GPIOG";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 96 16>;
 				status = "disabled";
 			};
 
@@ -115,8 +101,6 @@
 				reg = <0x7000 0x400>;
 				clocks = <&rcc GPIOH>;
 				st,bank-name = "GPIOH";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 112 16>;
 				status = "disabled";
 			};
 
@@ -128,8 +112,6 @@
 				reg = <0x8000 0x400>;
 				clocks = <&rcc GPIOI>;
 				st,bank-name = "GPIOI";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 128 16>;
 				status = "disabled";
 			};
 
@@ -141,8 +123,6 @@
 				reg = <0x9000 0x400>;
 				clocks = <&rcc GPIOJ>;
 				st,bank-name = "GPIOJ";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 144 16>;
 				status = "disabled";
 			};
 
@@ -154,8 +134,6 @@
 				reg = <0xa000 0x400>;
 				clocks = <&rcc GPIOK>;
 				st,bank-name = "GPIOK";
-				ngpios = <8>;
-				gpio-ranges = <&pinctrl 0 160 8>;
 				status = "disabled";
 			};
 
@@ -849,8 +827,6 @@
 				clocks = <&rcc GPIOZ>;
 				st,bank-name = "GPIOZ";
 				st,bank-ioport = <11>;
-				ngpios = <8>;
-				gpio-ranges = <&pinctrl_z 0 400 8>;
 				status = "disabled";
 			};
 
-- 
2.17.1
