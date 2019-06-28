From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: mtd: sunxi-nand: Drop 'maxItems' from child
 'reg' property
Date: Fri, 28 Jun 2019 13:35:25 -0600
Message-ID: <20190628193525.7785-1-robh@kernel.org>
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
To: devicetree@vger.kernel.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Mixing 'maxItems' and scalar properties doesn't make much sense, so drop
'maxItems' as a single item is implied.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
I'll take this in the DT tree if that's okay.

Rob

 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index fbd4da3684fc..e5a411518be1 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -57,7 +57,6 @@ patternProperties:
   "^nand@[a-f0-9]+$":
     properties:
       reg:
-        maxItems: 1
         minimum: 0
         maximum: 7
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
