Return-Path: <SRS0=WWNl=FN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:49933 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932178AbeBSWgG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 19 Feb 2018 17:36:06 -0500
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 4/6] dt-bindings: mtd: remove pxa3xx NAND controller documentation
Date: Mon, 19 Feb 2018 23:35:55 +0100
Message-Id: <20180219223557.2458-5-miquel.raynal@bootlin.com>
In-Reply-To: <20180219223557.2458-1-miquel.raynal@bootlin.com>
References: <20180219223557.2458-1-miquel.raynal@bootlin.com>
Sender: devicetree-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, devicetree@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

The deprecated pxa3xx_nand.c driver does not exist anymore, it has been
replaced by marvell_nand.c which has its own up-to-date documentation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Robert Jarzmik <robert.jarzmik@free.fr>
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
2.14.1

