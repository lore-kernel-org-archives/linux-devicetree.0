From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v3 1/5] ARM: dts: at91: sama5d2: add QSPI nodes
Date: Thu, 6 Jul 2017 11:35:25 +0300
Message-ID: <1499330129-29319-2-git-send-email-claudiu.beznea@microchip.com>
References: <1499330129-29319-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499330129-29319-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, sza@esh.hu
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cristian.birsan@microchip.com, ludovic.desroches@microchip.com, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: devicetree@vger.kernel.org

From: Cyrille Pitchen <cyrille.pitchen@atmel.com>

This patch adds DT nodes for sama5d2 QSPI controllers.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
[claudiu.beznea@microchip.com: change subject to match the desired prefix]
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/sama5d2.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index cc06da3..71e9d83 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -954,6 +954,28 @@
 				};
 			};
 
+			qspi0: spi@f0020000 {
+				compatible = "atmel,sama5d2-qspi";
+				reg = <0xf0020000 0x100>, <0xd0000000 0x08000000>;
+				reg-names = "qspi_base", "qspi_mmap";
+				interrupts = <52 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&qspi0_clk>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			qspi1: spi@f0024000 {
+				compatible = "atmel,sama5d2-qspi";
+				reg = <0xf0024000 0x100>, <0xd8000000 0x08000000>;
+				reg-names = "qspi_base", "qspi_mmap";
+				interrupts = <53 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&qspi1_clk>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			sha@f0028000 {
 				compatible = "atmel,at91sam9g46-sha";
 				reg = <0xf0028000 0x100>;
-- 
2.7.4
