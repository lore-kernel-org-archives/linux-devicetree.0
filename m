From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v6 02/13] dt-bindings: mtd: ingenic: Change 'BCH' to 'ECC' in
 documentation
Date: Tue, 19 Mar 2019 15:53:52 +0100
Message-ID: <20190319145403.31627-3-paul@crapouillou.net>
References: <20190319145403.31627-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190319145403.31627-1-paul@crapouillou.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The JZ4740 ECC hardware is not BCH but Reed-Solomon, so it makes more
sense to use the more generic ECC term.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Notes:
    v3: New patch
    
    v4: No change
    
    v5: No change
    
    v6: No change

 .../devicetree/bindings/mtd/ingenic,jz4780-nand.txt    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
index a5b940f18bf6..5a45cc54f46d 100644
--- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
@@ -1,4 +1,4 @@
-* Ingenic JZ4780 NAND/BCH
+* Ingenic JZ4780 NAND/ECC
 
 This file documents the device tree bindings for NAND flash devices on the
 JZ4780. NAND devices are connected to the NEMC controller (described in
@@ -14,10 +14,10 @@ Required NAND controller device properties:
   an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
 
 Optional NAND controller device properties:
-- ingenic,bch-controller: To make use of the hardware BCH controller, this
-  property must contain a phandle for the BCH controller node. The required
+- ingenic,bch-controller: To make use of the hardware ECC controller, this
+  property must contain a phandle for the ECC controller node. The required
   properties for this node are described below. If this is not specified,
-  software BCH will be used instead.
+  software ECC will be used instead.
 
 Optional children nodes:
 - Individual NAND chips are children of the NAND controller node.
@@ -70,17 +70,17 @@ nemc: nemc@13410000 {
 	};
 };
 
-The BCH controller is a separate SoC component used for error correction on
+The ECC controller is a separate SoC component used for error correction on
 NAND devices. The following is a description of the device properties for a
-BCH controller.
+ECC controller.
 
-Required BCH properties:
+Required ECC properties:
 - compatible: Should be one of:
   * ingenic,jz4740-ecc
   * ingenic,jz4725b-bch
   * ingenic,jz4780-bch
-- reg: Should specify the BCH controller registers location and length.
-- clocks: Clock for the BCH controller.
+- reg: Should specify the ECC controller registers location and length.
+- clocks: Clock for the ECC controller.
 
 Example:
 
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
