From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH 4/4] ARM: dts: iwg22d-sodimm: sort dt nodes
Date: Fri, 13 Oct 2017 14:03:16 +0100
Message-ID: <1507899796-7941-5-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1507899796-7941-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507899796-7941-1-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Improve the layout of r8a7745-iwg22d-sodimm.dts by sorting the
nodes alphabetically.

Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Signed-off-by: Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 62 ++++++++++++++---------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
index 5d5bb2f..5003a8f 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
@@ -16,9 +16,9 @@
 	compatible = "iwave,g22d", "iwave,g22m", "renesas,r8a7745";
 
 	aliases {
+		ethernet0 = &avb;
 		serial3 = &scif4;
 		serial5 = &hscif1;
-		ethernet0 = &avb;
 	};
 
 	chosen {
@@ -40,6 +40,25 @@
 	};
 };
 
+&avb {
+	pinctrl-0 = <&avb_pins>;
+	pinctrl-names = "default";
+
+	phy-handle = <&phy3>;
+	phy-mode = "gmii";
+	renesas,no-ether-link;
+	status = "okay";
+
+	phy3: ethernet-phy@3 {
+	/*
+	 * On some older versions of the platform (before R4.0) the phy address
+	 * may be 1 or 3. The address is fixed to 3 for R4.0 onwards.
+	 */
+		reg = <3>;
+		micrel,led-mode = <1>;
+	};
+};
+
 &hscif1 {
 	pinctrl-0 = <&hscif1_pins>;
 	pinctrl-names = "default";
@@ -48,7 +67,18 @@
 	status = "okay";
 };
 
+&pci1 {
+	status = "okay";
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+};
+
 &pfc {
+	avb_pins: avb {
+		groups = "avb_mdio", "avb_gmii";
+		function = "avb";
+	};
+
 	hscif1_pins: hscif1 {
 		groups = "hscif1_data", "hscif1_ctrl";
 		function = "hscif1";
@@ -59,11 +89,6 @@
 		function = "scif4";
 	};
 
-	avb_pins: avb {
-		groups = "avb_mdio", "avb_gmii";
-		function = "avb";
-	};
-
 	sdhi0_pins: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
@@ -83,25 +108,6 @@
 	status = "okay";
 };
 
-&avb {
-	pinctrl-0 = <&avb_pins>;
-	pinctrl-names = "default";
-
-	phy-handle = <&phy3>;
-	phy-mode = "gmii";
-	renesas,no-ether-link;
-	status = "okay";
-
-	phy3: ethernet-phy@3 {
-	/*
-	 * On some older versions of the platform (before R4.0) the phy address
-	 * may be 1 or 3. The address is fixed to 3 for R4.0 onwards.
-	 */
-		reg = <3>;
-		micrel,led-mode = <1>;
-	};
-};
-
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_pins>;
 	pinctrl-names = "default";
@@ -112,12 +118,6 @@
 	status = "okay";
 };
 
-&pci1 {
-	status = "okay";
-	pinctrl-0 = <&usb1_pins>;
-	pinctrl-names = "default";
-};
-
 &usbphy {
 	status = "okay";
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
