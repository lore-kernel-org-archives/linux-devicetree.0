From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/4] arm: dts: rskrza1: Add Ethernet pin group
Date: Thu, 20 Jul 2017 13:20:17 -0500
Message-ID: <20170720182019.85075-3-chris.brandt@renesas.com>
References: <20170720182019.85075-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170720182019.85075-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Add pin configuration for Ethernet.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index 5fac0f82d742..cedf887e809a 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -55,6 +55,29 @@
 		pinmux = <RZA1_PINMUX(3, 0, 6)>,	/* TxD2 */
 			 <RZA1_PINMUX(3, 2, 4)>;	/* RxD2 */
 	};
+
+	/* Ethernet */
+	ether_pins: ether {
+		/* Ethernet on Ports 1,2,3,5 */
+		pinmux = <RZA1_PINMUX(1, 14, 4)>,	/* ET_COL   */
+			 <RZA1_PINMUX(5, 9, 2)>,	/* ET_MDC   */
+			 <RZA1_PINMUX(3, 3, 2)>,	/* ET_MDIO  */
+			 <RZA1_PINMUX(3, 4, 2)>,	/* ET_RXCLK */
+			 <RZA1_PINMUX(3, 5, 2)>,	/* ET_RXER  */
+			 <RZA1_PINMUX(3, 6, 2)>,	/* ET_RXDV  */
+			 <RZA1_PINMUX(2, 0, 2)>,	/* ET_TXCLK */
+			 <RZA1_PINMUX(2, 1, 2)>,	/* ET_TXER  */
+			 <RZA1_PINMUX(2, 2, 2)>,	/* ET_TXEN  */
+			 <RZA1_PINMUX(2, 3, 2)>,	/* ET_CRS   */
+			 <RZA1_PINMUX(2, 4, 2)>,	/* ET_TXD0  */
+			 <RZA1_PINMUX(2, 5, 2)>,	/* ET_TXD1  */
+			 <RZA1_PINMUX(2, 6, 2)>,	/* ET_TXD2  */
+			 <RZA1_PINMUX(2, 7, 2)>,	/* ET_TXD3  */
+			 <RZA1_PINMUX(2, 8, 2)>,	/* ET_RXD0  */
+			 <RZA1_PINMUX(2, 9, 2)>,	/* ET_RXD1  */
+			 <RZA1_PINMUX(2, 10, 2)>,	/* ET_RXD2  */
+			 <RZA1_PINMUX(2, 11, 2)>;	/* ET_RXD3  */
+	};
 };
 
 &mtu2 {
@@ -62,6 +85,8 @@
 };
 
 &ether {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ether_pins>;
 	status = "okay";
 	renesas,no-ether-link;
 	phy-handle = <&phy0>;
-- 
2.13.0
