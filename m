From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 2/3] ARM: dts: at91rm9200: pullup rx on uart0
Date: Wed, 21 Mar 2018 16:35:51 +0100
Message-ID: <20180321153552.29213-3-peda@axentia.se>
References: <20180321153552.29213-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180321153552.29213-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

For consistency with all other serial pins, add this pullup. It also
prevents the signal from floating and so consuming a useless extra amount
of power in crowbarred state if nothing is connected to RX.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 arch/arm/boot/dts/at91rm9200.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/at91rm9200.dtsi b/arch/arm/boot/dts/at91rm9200.dtsi
index 3f3149c156a8..2ad69a7fbc00 100644
--- a/arch/arm/boot/dts/at91rm9200.dtsi
+++ b/arch/arm/boot/dts/at91rm9200.dtsi
@@ -493,8 +493,8 @@
 				uart0 {
 					pinctrl_uart0: uart0-0 {
 						atmel,pins =
-							<AT91_PIOA 17 AT91_PERIPH_A AT91_PINCTRL_NONE	/* PA17 periph A */
-							 AT91_PIOA 18 AT91_PERIPH_A AT91_PINCTRL_NONE>;	/* PA18 periph A */
+							<AT91_PIOA 17 AT91_PERIPH_A AT91_PINCTRL_NONE
+							 AT91_PIOA 18 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>;
 					};
 
 					pinctrl_uart0_cts: uart0_cts-0 {
-- 
2.11.0
