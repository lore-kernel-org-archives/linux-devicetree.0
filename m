From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH 2/2] ARM: dts: at91: sama5d3_xplained: not all ADC channels are available
Date: Mon, 10 Apr 2017 10:25:17 +0200
Message-ID: <20170410082517.19628-2-ludovic.desroches@microchip.com>
References: <20170410082517.19628-1-ludovic.desroches@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170410082517.19628-1-ludovic.desroches@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, Eugen.Hristev@microchip.com, Ludovic Desroches <ludovic.desroches@microchip.com>, "# 3 . 16+" <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Remove ADC channels that are not available by default on the sama5d3_xplained
board (resistor not populated) in order to not create confusion.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: <stable@vger.kernel.org> # 3.16+
---
 arch/arm/boot/dts/at91-sama5d3_xplained.dts | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/at91-sama5d3_xplained.dts b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
index 7a0fa1a..5a53fcf 100644
--- a/arch/arm/boot/dts/at91-sama5d3_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
@@ -163,9 +163,9 @@
 
 			adc0: adc@f8018000 {
 				atmel,adc-vref = <3300>;
+				atmel,adc-channels-used = <0xfe>;
 				pinctrl-0 = <
 					&pinctrl_adc0_adtrg
-					&pinctrl_adc0_ad0
 					&pinctrl_adc0_ad1
 					&pinctrl_adc0_ad2
 					&pinctrl_adc0_ad3
@@ -173,8 +173,6 @@
 					&pinctrl_adc0_ad5
 					&pinctrl_adc0_ad6
 					&pinctrl_adc0_ad7
-					&pinctrl_adc0_ad8
-					&pinctrl_adc0_ad9
 					>;
 				status = "okay";
 			};
-- 
2.9.0
