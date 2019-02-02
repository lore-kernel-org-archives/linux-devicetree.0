From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 2/9] dt-bindings: mtd: ingenic: Add compatible strings for the JZ4740
Date: Sat,  2 Feb 2019 20:19:19 -0300
Message-ID: <20190202231926.2444-3-paul@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190202231926.2444-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: Mathieu Malaterre <malat@debian.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Add compatible strings to probe the jz4780-nand and jz4780-bch drivers
from devicetree on the JZ4725B and JZ4740 SoCs from Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Changes:

v2: - Change 'ingenic,jz4725b-nand' compatible string to
      'ingenic,jz4740-nand' to reflect driver change
    - Add 'ingenic,jz4740-bch' compatible string
    - Document 'ingenic,oob-layout' property

 .../devicetree/bindings/mtd/ingenic,jz4780-nand.txt | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
index 29ea5853ca91..294b56a2098a 100644
--- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
@@ -6,7 +6,9 @@ memory-controllers/ingenic,jz4780-nemc.txt), and thus NAND device nodes must
 be children of the NEMC node.
 
 Required NAND controller device properties:
-- compatible: Should be set to "ingenic,jz4780-nand".
+- compatible: Should be one of:
+  * ingenic,jz4740-nand
+  * ingenic,jz4780-nand
 - reg: For each bank with a NAND chip attached, should specify a bank number,
   an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
 
@@ -15,6 +17,10 @@ Optional NAND controller device properties:
   property must contain a phandle for the BCH controller node. The required
   properties for this node are described below. If this is not specified,
   software BCH will be used instead.
+- ingenic,oob-layout: Specify the OOB layout to replace the default one.
+  Valid values are:
+  * ingenic,jz4725b
+  * qi,lb60
 
 Optional children nodes:
 - Individual NAND chips are children of the NAND controller node.
@@ -72,7 +78,10 @@ NAND devices. The following is a description of the device properties for a
 BCH controller.
 
 Required BCH properties:
-- compatible: Should be set to "ingenic,jz4780-bch".
+- compatible: Should be one of:
+  * ingenic,jz4740-bch
+  * ingenic,jz4725b-bch
+  * ingenic,jz4780-bch
 - reg: Should specify the BCH controller registers location and length.
 - clocks: Clock for the BCH controller.
 
-- 
2.20.1
