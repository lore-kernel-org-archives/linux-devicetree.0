From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 22/39] mtd: nand: denali_dt: remove dma-mask DT property
Date: Sun, 27 Nov 2016 03:06:08 +0900
Message-ID: <1480183585-592-23-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

The driver sets appropriate DMA mask.  Delete the "dma-mask" DT
property.  Refer to the Link tag for negative opinions for this
binding.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Link: https://lkml.org/lkml/2016/2/8/57
---

 Documentation/devicetree/bindings/mtd/denali-nand.txt | 2 --
 drivers/mtd/nand/denali_dt.c                          | 9 ---------
 2 files changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index b04d03a..603110b 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -5,7 +5,6 @@ Required properties:
   - reg : should contain registers location and length for data and reg.
   - reg-names: Should contain the reg names "nand_data" and "denali_reg"
   - interrupts : The interrupt number.
-  - dm-mask : DMA bit mask
 
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
@@ -19,5 +18,4 @@ nand: nand@ff900000 {
 	reg = <0xff900000 0x100000>, <0xffb80000 0x10000>;
 	reg-names = "nand_data", "denali_reg";
 	interrupts = <0 144 4>;
-	dma-mask = <0xffffffff>;
 };
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 9dcd203..6a486a7 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -40,8 +40,6 @@ static const struct of_device_id denali_nand_dt_ids[] = {
 
 MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
 
-static u64 denali_dma_mask;
-
 static int denali_dt_probe(struct platform_device *ofdev)
 {
 	struct resource *denali_reg, *nand_data;
@@ -79,13 +77,6 @@ static int denali_dt_probe(struct platform_device *ofdev)
 	if (IS_ERR(denali->flash_mem))
 		return PTR_ERR(denali->flash_mem);
 
-	if (!of_property_read_u32(ofdev->dev.of_node,
-		"dma-mask", (u32 *)&denali_dma_mask)) {
-		denali->dev->dma_mask = &denali_dma_mask;
-	} else {
-		denali->dev->dma_mask = NULL;
-	}
-
 	dt->clk = devm_clk_get(&ofdev->dev, NULL);
 	if (IS_ERR(dt->clk)) {
 		dev_err(&ofdev->dev, "no clk available\n");
-- 
2.7.4
