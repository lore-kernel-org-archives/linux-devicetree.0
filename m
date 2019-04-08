From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 1/4] dt-bindings: mtd: sunxi: Add new compatible
Date: Mon,  8 Apr 2019 09:41:44 +0200
Message-ID: <20190408074147.26797-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

The A33 NAND controller is slightly different than the A10+ ones,
eg. DMA handling is a bit different and a few register offsets
changed.

Introduce a new compatible to represent this version of the IP.

Also append '-controller' to the new compatible (which is required for
new compatibles) as this is describing a NAND controller and not a
NAND chip.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes in v2:
* Removed the statement introduced with the new compatible.

 Documentation/devicetree/bindings/mtd/sunxi-nand.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
index dcd5a5d80dc0..3f8d81b8d63d 100644
--- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
@@ -1,7 +1,9 @@
 Allwinner NAND Flash Controller (NFC)
 
 Required properties:
-- compatible : "allwinner,sun4i-a10-nand".
+- compatible : Must be one of:
+	       - "allwinner,sun4i-a10-nand"
+	       - "allwinner,sun8i-a33-nand-controller"
 - reg : shall contain registers location and length for data and reg.
 - interrupts : shall define the nand controller interrupt.
 - #address-cells: shall be set to 1. Encode the nand CS.
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
