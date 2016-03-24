From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] mtd: nand: denali: allow to override max_banks from DT
 property
Date: Thu, 24 Mar 2016 21:24:37 +0900
Message-ID: <1458822277-31428-1-git-send-email-yamada.masahiro@socionext.com>
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
To: linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Graham Moore <grmoore@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

Commit 271707b1d817 ("mtd: nand: denali: max_banks calculation
changed in revision 5.1") supported the new encoding of the "n_banks"
bits of the "features" register, but there is an unfortunate case
that is not covered by that commit.

Panasonic (its System LSI division is now Socionext) bought several
versions of this IP.  The IP released for Panasonic around Feb. 2012
is revision 5 and uses the old encoding for n_banks (2 << n_banks).
While the one released around Nov. 2012 is also revision 5, but it
uses the new encoding (1 << n_banks).

The revision register cannot distinguish these two incompatible
hardware.  I guess this IP series is not well-organized.  I could not
find any alternative but giving max_banks from DT property.

This commit works around the problem by allowing DT to set the
max_banks forcibly.  Of course, this DT property can be optional if
the auto detection based on the hardware registers works well.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/devicetree/bindings/mtd/denali-nand.txt | 4 ++++
 drivers/mtd/nand/denali.c                             | 3 ++-
 drivers/mtd/nand/denali_dt.c                          | 3 +++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index 785b825..78c250d 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -7,6 +7,10 @@ Required properties:
   - interrupts : The interrupt number.
   - dma-mask : DMA bit mask
 
+Optional properties:
+  - max-banks : Maximum number of banks supported by hardware.  If not
+    specified, it is determined based on the "features" register of hardware.
+
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
 
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 30bf5f6..e18b569 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1353,7 +1353,8 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	 */
 	denali->bbtskipbytes = ioread32(denali->flash_reg +
 						SPARE_AREA_SKIP_BYTES);
-	detect_max_banks(denali);
+	if (!denali->max_banks)
+		detect_max_banks(denali);
 	denali_nand_reset(denali);
 	iowrite32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
 	iowrite32(CHIP_EN_DONT_CARE__FLAG,
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 0cb1e8d..be55db8 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -85,6 +85,9 @@ static int denali_dt_probe(struct platform_device *ofdev)
 		denali->dev->dma_mask = NULL;
 	}
 
+	of_property_read_u32(ofdev->dev.of_node, "max-banks",
+			     &denali->max_banks);
+
 	dt->clk = devm_clk_get(&ofdev->dev, NULL);
 	if (IS_ERR(dt->clk)) {
 		dev_err(&ofdev->dev, "no clk available\n");
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
