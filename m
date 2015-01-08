From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 3/8] ARM: mvebu: Add a number of pinctrl functions
Date: Thu,  8 Jan 2015 11:51:40 +0100
Message-ID: <1420714305-7496-4-git-send-email-gregory.clement@free-electrons.com>
References: <1420714305-7496-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420714305-7496-1-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Some pinctrl functions can be shared with all DTS out there, since they are
generic, SoC-wide muxing options. Add a number of these to the DTSI to avoid
duplication.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-38x.dtsi | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
index 40200084c6c8..98885c58be29 100644
--- a/arch/arm/boot/dts/armada-38x.dtsi
+++ b/arch/arm/boot/dts/armada-38x.dtsi
@@ -195,6 +195,45 @@
 
 			pinctrl@18000 {
 				reg = <0x18000 0x20>;
+
+				ge0_rgmii_pins: ge-rgmii-pins-0 {
+					marvell,pins = "mpp6", "mpp7", "mpp8",
+						       "mpp9", "mpp10", "mpp11",
+						       "mpp12", "mpp13", "mpp14",
+						       "mpp15", "mpp16", "mpp17";
+					marvell,function = "ge0";
+				};
+
+				i2c0_pins: i2c-pins-0 {
+					marvell,pins = "mpp2", "mpp3";
+					marvell,function = "i2c0";
+				};
+
+				mdio_pins: mdio-pins {
+					marvell,pins = "mpp4", "mpp5";
+					marvell,function = "ge";
+				};
+
+				ref_clk0_pins: ref-clk-pins-0 {
+					marvell,pins = "mpp45";
+					marvell,function = "ref";
+				};
+
+				spi1_pins: spi-pins-1 {
+					marvell,pins = "mpp56", "mpp57", "mpp58",
+						       "mpp59";
+					marvell,function = "spi1";
+				};
+
+				uart0_pins: uart-pins-0 {
+					marvell,pins = "mpp0", "mpp1";
+					marvell,function = "ua0";
+				};
+
+				uart1_pins: uart-pins-1 {
+					marvell,pins = "mpp19", "mpp20";
+					marvell,function = "ua1";
+				};
 			};
 
 			gpio0: gpio@18100 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
