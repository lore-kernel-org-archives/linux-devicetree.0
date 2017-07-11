From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH 3/3] ARM: dts: at91: sama5d2: use sama5d2 compatible string for SMC
Date: Tue, 11 Jul 2017 09:40:15 +0200
Message-ID: <20170711074015.30440-4-ludovic.desroches@microchip.com>
References: <20170711074015.30440-1-ludovic.desroches@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170711074015.30440-1-ludovic.desroches@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, lee.jones@linaro.org, nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, boris.brezillon@free-electrons.com, computersforpeace@gmail.com, Ludovic Desroches <ludovic.desroches@microchip.com>
List-Id: devicetree@vger.kernel.org

A new compatible string has been introduced for sama5d2 SMC to allow to
manage the registers mapping change.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 arch/arm/boot/dts/sama5d2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index 4fcd5bb219e3..60e69aeacbdb 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -1048,7 +1048,7 @@
 			};
 
 			hsmc: hsmc@f8014000 {
-				compatible = "atmel,sama5d3-smc", "syscon", "simple-mfd";
+				compatible = "atmel,sama5d2-smc", "syscon", "simple-mfd";
 				reg = <0xf8014000 0x1000>;
 				interrupts = <17 IRQ_TYPE_LEVEL_HIGH 6>;
 				clocks = <&hsmc_clk>;
-- 
2.12.2
