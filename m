From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 14/14] ARM: dts: at91: at91sam9x5ek: use DMA for USART0
Date: Tue, 10 Oct 2017 13:09:49 +0300
Message-ID: <1507630189-15504-15-git-send-email-claudiu.beznea@microchip.com>
References: <1507630189-15504-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507630189-15504-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: devicetree@vger.kernel.org

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Use DMA for USART0 (which is used as ttyS1) as we have enough channels and to
show how to specify DMA use with serial nodes.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/at91sam9x5ek.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/at91sam9x5ek.dtsi b/arch/arm/boot/dts/at91sam9x5ek.dtsi
index 9d2bbc41a7b0..a85eb51e6aa8 100644
--- a/arch/arm/boot/dts/at91sam9x5ek.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5ek.dtsi
@@ -50,6 +50,8 @@
 			};
 
 			usart0: serial@f801c000 {
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
 				status = "okay";
 			};
 
-- 
2.7.4
