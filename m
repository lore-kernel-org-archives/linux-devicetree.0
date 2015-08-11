From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: [PATCH 4/5] ARM: at91/dt: sama5d2: add pio controller node
Date: Tue, 11 Aug 2015 10:28:04 +0200
Message-ID: <1439281685-3020-5-git-send-email-ludovic.desroches@atmel.com>
References: <1439281685-3020-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439281685-3020-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: s.hauer@pengutronix.de, linus.walleij@linaro.org, nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com, Ludovic Desroches <ludovic.desroches@atmel.com>
List-Id: devicetree@vger.kernel.org

Add pio4 controller node to enable pinmux and gpio.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 arch/arm/boot/dts/sama5d2.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index f39258f..55df0ae 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -920,6 +920,20 @@
 				clocks = <&twi1_clk>;
 				status = "disabled";
 			};
+
+			pioA: pinctrl@fc038000 {
+				compatible = "atmel,sama5d2-pinctrl";
+				reg = <0xfc038000 0x600>;
+				interrupts = <18 IRQ_TYPE_LEVEL_HIGH 7>,
+					     <68 IRQ_TYPE_LEVEL_HIGH 7>,
+					     <69 IRQ_TYPE_LEVEL_HIGH 7>,
+					     <70 IRQ_TYPE_LEVEL_HIGH 7>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&pioA_clk>;
+			};
 		};
 	};
 };
-- 
2.5.0
