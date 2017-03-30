From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 09/37] mtd: nand: denali_dt: remove dma-mask DT property
Date: Thu, 30 Mar 2017 15:45:55 +0900
Message-ID: <1490856383-31560-10-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Graham Moore <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

The driver sets appropriate DMA mask.  Delete the "dma-mask" DT
property.  See [1] for negative comments for this binding.

[1] https://lkml.org/lkml/2016/2/8/57

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/mtd/denali-nand.txt | 2 --
 drivers/mtd/nand/denali_dt.c                          | 9 ---------
 2 files changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index 6f4ab4c..e593bbe 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -6,7 +6,6 @@ Required properties:
   - reg : should contain registers location and length for data and reg.
   - reg-names: Should contain the reg names "nand_data" and "denali_reg"
   - interrupts : The interrupt number.
-  - dm-mask : DMA bit mask
 
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
@@ -20,5 +19,4 @@ nand: nand@ff900000 {
 	reg = <0xff900000 0x100000>, <0xffb80000 0x10000>;
 	reg-names = "nand_data", "denali_reg";
 	interrupts = <0 144 4>;
-	dma-mask = <0xffffffff>;
 };
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 9577bfd..b8a8284 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -46,8 +46,6 @@ static const struct of_device_id denali_nand_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
 
-static u64 denali_dma_mask;
-
 static int denali_dt_probe(struct platform_device *ofdev)
 {
 	struct resource *denali_reg, *nand_data;
@@ -83,13 +81,6 @@ static int denali_dt_probe(struct platform_device *ofdev)
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
