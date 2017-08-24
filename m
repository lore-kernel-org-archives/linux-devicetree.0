From: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/4] arm: dts: gr-peach: Add ETHER pin group
Date: Thu, 24 Aug 2017 10:48:42 +0200
Message-ID: <1503564523-31899-4-git-send-email-jacopo+renesas@jmondi.org>
References: <1503564523-31899-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1503564523-31899-1-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org
Cc: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add pin configuration subnode for ETHER pin group.
The interface can be configured and probed, but no traffic can be
transmitted or received.

Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>

---
When in u-boot console I can ping a connected host, after the
system has booted I can configure an ip address on the interface but
cannot exchange any traffic.
I have compared the pin configuration procedure with the u-boot
implemented one and some sketches from mbed operating system libraries,
the configured pins are correct and registers values seems to match.
Not sure if this patch should be sent for inclusion but sending it out
anyway for you to judge this.

Thanks
   j
---
 arch/arm/boot/dts/r7s72100-gr-peach.dts | 35 +++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-gr-peach.dts b/arch/arm/boot/dts/r7s72100-gr-peach.dts
index bcfa644..5ce558f 100644
--- a/arch/arm/boot/dts/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/r7s72100-gr-peach.dts
@@ -58,6 +58,28 @@
 		/* P6_2 as RxD2; P6_3 as TxD2 */
 		pinmux = <RZA1_PINMUX(6, 2, 7)>, <RZA1_PINMUX(6, 3, 7)>;
 	};
+
+	ether_pins: ether {
+		/* Ethernet on Ports 1,3,5,10 */
+		pinmux = <RZA1_PINMUX(1, 14, 4)>, /* P1_14 = ET_COL   */
+			 <RZA1_PINMUX(3, 0, 2)>,  /* P3_0 = ET_TXCLK  */
+			 <RZA1_PINMUX(3, 3, 2)>,  /* P3_3 = ET_MDIO   */
+			 <RZA1_PINMUX(3, 4, 2)>,  /* P3_4 = ET_RXCLK  */
+			 <RZA1_PINMUX(3, 5, 2)>,  /* P3_5 = ET_RXER   */
+			 <RZA1_PINMUX(3, 6, 2)>,  /* P3_6 = ET_RXDV   */
+			 <RZA1_PINMUX(5, 9, 2)>,  /* P5_9 = ET_MDC    */
+			 <RZA1_PINMUX(10, 1, 4)>, /* P10_1 = ET_TXER  */
+			 <RZA1_PINMUX(10, 2, 4)>, /* P10_2 = ET_TXEN  */
+			 <RZA1_PINMUX(10, 3, 4)>, /* P10_3 = ET_CRS   */
+			 <RZA1_PINMUX(10, 4, 4)>, /* P10_4 = ET_TXD0  */
+			 <RZA1_PINMUX(10, 5, 4)>, /* P10_5 = ET_TXD1  */
+			 <RZA1_PINMUX(10, 6, 4)>, /* P10_6 = ET_TXD2  */
+			 <RZA1_PINMUX(10, 7, 4)>, /* P10_7 = ET_TXD3  */
+			 <RZA1_PINMUX(10, 8, 4)>, /* P10_8 = ET_RXD0  */
+			 <RZA1_PINMUX(10, 9, 4)>, /* P10_9 = ET_RXD1  */
+			 <RZA1_PINMUX(10, 10, 4)>,/* P10_10 = ET_RXD2 */
+			 <RZA1_PINMUX(10, 11, 4)>;/* P10_11 = ET_RXD3 */
+	};
 };
 
 &extal_clk {
@@ -74,3 +96,16 @@
 
 	status = "okay";
 };
+
+&ether {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ether_pins>;
+
+	status = "okay";
+
+	renesas,no-ether-link;
+	phy-handle = <&phy0>;
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
