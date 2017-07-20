From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/4] arm: dts: rskrza1: Add SDHI1 pin group
Date: Thu, 20 Jul 2017 13:20:18 -0500
Message-ID: <20170720182019.85075-4-chris.brandt@renesas.com>
References: <20170720182019.85075-1-chris.brandt@renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170720182019.85075-1-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add pin configuration for SDHI ch1.

Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index cedf887e809a..f8285b951140 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -78,6 +78,18 @@
 			 <RZA1_PINMUX(2, 10, 2)>,	/* ET_RXD2  */
 			 <RZA1_PINMUX(2, 11, 2)>;	/* ET_RXD3  */
 	};
+
+	/* SDHI ch1 on CN1 */
+	sdhi1_pins: sdhi1 {
+		pinmux = <RZA1_PINMUX(3, 8, 7)>,	/* SD_CD_1 */
+			 <RZA1_PINMUX(3, 9, 7)>,	/* SD_WP_1 */
+			 <RZA1_PINMUX(3, 10, 7)>,	/* SD_D1_1 */
+			 <RZA1_PINMUX(3, 11, 7)>,	/* SD_D0_1 */
+			 <RZA1_PINMUX(3, 12, 7)>,	/* SD_CLK_1 */
+			 <RZA1_PINMUX(3, 13, 7)>,	/* SD_CMD_1 */
+			 <RZA1_PINMUX(3, 14, 7)>,	/* SD_D3_1 */
+			 <RZA1_PINMUX(3, 15, 7)>;	/* SD_D2_1 */
+	};
 };
 
 &mtu2 {
@@ -96,6 +108,8 @@
 };
 
 &sdhi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdhi1_pins>;
 	bus-width = <4>;
 	status = "okay";
 };
-- 
2.13.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
