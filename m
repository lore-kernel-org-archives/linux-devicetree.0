From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 3/3] ARM: dts: lpc32xx: add GPIO interrupts
Date: Wed, 10 Apr 2019 12:39:26 +0200
Message-ID: <20190410103926.8781-4-alexandre.belloni@bootlin.com>
References: <20190410103926.8781-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190410103926.8781-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Add the interrupts for the GPIO controller.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 arch/arm/boot/dts/lpc32xx.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index 20b38f4ade37..9c61b1856291 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -392,6 +392,31 @@
 				reg = <0x40028000 0x1000>;
 				gpio-controller;
 				#gpio-cells = <3>; /* bank, pin, flags */
+				interrupts-extended = <&sic2 8 IRQ_TYPE_NONE>,
+						<&sic2 22 IRQ_TYPE_NONE>,
+						<&sic2 23 IRQ_TYPE_NONE>,
+						<&sic2 24 IRQ_TYPE_NONE>,
+						<&sic2 25 IRQ_TYPE_NONE>,
+						<&sic2 26 IRQ_TYPE_NONE>,
+						<&sic2 27 IRQ_TYPE_NONE>,
+						<&sic2 28 IRQ_TYPE_NONE>,
+						<&sic2 15 IRQ_TYPE_NONE>,
+						<&sic2 9 IRQ_TYPE_NONE>,
+						<&sic2 10 IRQ_TYPE_NONE>,
+						<&sic1 4 IRQ_TYPE_NONE>,
+						<&sic2 0 IRQ_TYPE_NONE>,
+						<&sic2 1 IRQ_TYPE_NONE>,
+						<&sic2 2 IRQ_TYPE_NONE>,
+						<&sic2 3 IRQ_TYPE_NONE>,
+						<&sic2 4 IRQ_TYPE_NONE>,
+						<&sic2 5 IRQ_TYPE_NONE>;
+				interrupt-names = "p01",
+						"gpi00", "gpi01", "gpi02",
+						"gpi03", "gpi04", "gpi05",
+						"gpi06", "gpi07", "gpi08",
+						"gpi09", "gpi19", "gpi28",
+						"gpio00", "gpio01", "gpio02",
+						"gpio03", "gpio04", "gpio05";
 			};
 
 			timer4: timer@4002c000 {
-- 
2.20.1
