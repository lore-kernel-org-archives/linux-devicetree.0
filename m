From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/3] dt-bindings: mtd: sunxi: Add new compatible
Date: Thu,  4 Apr 2019 18:21:09 +0200
Message-ID: <20190404162111.22618-2-miquel.raynal@bootlin.com>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190404162111.22618-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
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
 Documentation/devicetree/bindings/mtd/sunxi-nand.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
index dcd5a5d80dc0..6128d41d8c59 100644
--- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
@@ -1,7 +1,12 @@
 Allwinner NAND Flash Controller (NFC)
 
 Required properties:
-- compatible : "allwinner,sun4i-a10-nand".
+- compatible : Must be one of:
+	       - "allwinner,sun4i-a10-nand"
+	       - "allwinner,sun8i-a33-nand-controller"
+	       The former may be used by all IPs, however sun8i family
+	       will need the second one in order to make use of the
+	       internal DMA capabilities.
 - reg : shall contain registers location and length for data and reg.
 - interrupts : shall define the nand controller interrupt.
 - #address-cells: shall be set to 1. Encode the nand CS.
-- 
2.19.1
