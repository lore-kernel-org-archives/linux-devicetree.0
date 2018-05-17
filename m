From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 2/3] ARM: dts: stm32: add SPI1 support on stm32mp157c-ev1
Date: Thu, 17 May 2018 16:21:43 +0200
Message-ID: <1526566904-24514-3-git-send-email-amelie.delaunay@st.com>
References: <1526566904-24514-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526566904-24514-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds SPI1 support on stm32mp157c-ev1 board.
SPI1 is available on GPIO expansion connector but kept disabled
so these pins can be used as GPIOs by default.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 16 +++++++++++++++-
 arch/arm/boot/dts/stm32mp157c-ev1.dts     |  6 ++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 88e9133..b35f151 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -277,7 +277,6 @@
 			compatible = "st,stm32mp157-z-pinctrl";
 			ranges = <0 0x54004000 0x400>;
 			pins-are-numbered;
-			status = "disabled";
 
 			gpioz: gpio@54004000 {
 				gpio-controller;
@@ -301,6 +300,21 @@
 					slew-rate = <0>;
 				};
 			};
+
+			spi1_pins_a: spi1-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('Z', 0, AF5)>, /* SPI1_SCK */
+						 <STM32_PINMUX('Z', 2, AF5)>; /* SPI1_MOSI */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <1>;
+				};
+
+				pins2 {
+					pinmux = <STM32_PINMUX('Z', 1, AF5)>; /* SPI1_MISO */
+					bias-disable;
+				};
+			};
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 9382d80..7584e1f 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -67,6 +67,12 @@
 	};
 };
 
+&spi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_pins_a>;
+	status = "disabled";
+};
+
 &timers2 {
 	status = "disabled";
 	pwm {
-- 
2.7.4
