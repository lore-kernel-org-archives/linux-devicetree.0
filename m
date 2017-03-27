From: Jan Glauber <jglauber-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 1/2] dt-bindings: mtd: Add Cavium SOCs NAND bindings
Date: Mon, 27 Mar 2017 18:05:23 +0200
Message-ID: <20170327160524.29019-2-jglauber@cavium.com>
References: <20170327160524.29019-1-jglauber@cavium.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170327160524.29019-1-jglauber-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jan Glauber <jglauber-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add device tree binding description for Cavium SOC nand flash controller.

CC: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
CC: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Signed-off-by: Jan Glauber <jglauber-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/mtd/cavium_nand.txt        | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cavium_nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/cavium_nand.txt b/Documentation/devicetree/bindings/mtd/cavium_nand.txt
new file mode 100644
index 0000000..4698d1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cavium_nand.txt
@@ -0,0 +1,32 @@
+* Cavium NAND controller
+
+Required properties:
+
+- compatible:		should be "cavium,cn8xxx-nand"
+- reg:			PCI devfn
+- clocks:		must contain system clock
+- #address-cells:	<1>
+- #size-cells:		<0>
+
+The nand flash controller may contain up to 8 subnodes representing
+NAND flash chips. Their properties are as follows.
+
+Required properties:
+- compatible:		should be "cavium,nandcs"
+- reg:			a single integer representing the chip-select number
+- nand-ecc-mode:	see nand.txt
+
+Example:
+
+nfc: nand@b,0 {
+	compatible = "cavium,cn8xxx-nand";
+	reg = <0x5800 0 0 0 0>;
+	clocks = <&sclk>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	nand@1 {
+		compatible = "cavium,nandcs";
+		reg = <1>;
+		nand-ecc-mode = "on-die";
+};
-- 
2.9.0.rc0.21.g7777322

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
