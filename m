From: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 6/7] dt-bindings: mtd: remove pxa3xx NAND controller documentation
Date: Tue,  9 Jan 2018 11:36:36 +0100
Message-ID: <20180109103637.23798-7-miquel.raynal@free-electrons.com>
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180109103637.23798-1-miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ofer Heifetz <oferh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The deprecated pxa3xx_nand.c driver does not exist anymore, it has been
replaced by marvell_nand.c which has its own up-to-date documentation.

Signed-off-by: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/mtd/pxa3xx-nand.txt        | 50 ----------------------
 1 file changed, 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
deleted file mode 100644
index d4ee4da58463..000000000000
--- a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-PXA3xx NAND DT bindings
-
-Required properties:
-
- - compatible:		Should be set to one of the following:
-			marvell,pxa3xx-nand
-			marvell,armada370-nand
-			marvell,armada-8k-nand
- - reg: 		The register base for the controller
- - interrupts:		The interrupt to map
- - #address-cells:	Set to <1> if the node includes partitions
- - marvell,system-controller: Set to retrieve the syscon node that handles
-			NAND controller related registers (only required
-			with marvell,armada-8k-nand compatible).
-
-Optional properties:
-
- - dmas:			dma data channel, see dma.txt binding doc
- - marvell,nand-enable-arbiter:	Set to enable the bus arbiter
- - marvell,nand-keep-config:	Set to keep the NAND controller config as set
-				by the bootloader
- - num-cs:			Number of chipselect lines to use
- - nand-on-flash-bbt: 		boolean to enable on flash bbt option if
-				not present false
- - nand-ecc-strength:           number of bits to correct per ECC step
- - nand-ecc-step-size:          number of data bytes covered by a single ECC step
-
-The following ECC strength and step size are currently supported:
-
- - nand-ecc-strength = <1>, nand-ecc-step-size = <512>
- - nand-ecc-strength = <4>, nand-ecc-step-size = <512>
- - nand-ecc-strength = <8>, nand-ecc-step-size = <512>
-
-Example:
-
-	nand0: nand@43100000 {
-		compatible = "marvell,pxa3xx-nand";
-		reg = <0x43100000 90>;
-		interrupts = <45>;
-		dmas = <&pdma 97 0>;
-		dma-names = "data";
-		#address-cells = <1>;
-
-		marvell,nand-enable-arbiter;
-		marvell,nand-keep-config;
-		num-cs = <1>;
-
-		/* partitions (optional) */
-	};
-
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
