From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 16/37] mtd: nand: denali_dt: add compatible strings for UniPhier SoC variants
Date: Thu, 30 Mar 2017 15:46:02 +0900
Message-ID: <1490856383-31560-17-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Graham Moore <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add two compatible strings for UniPhier SoCs.

"socionext,uniphier-denali-nand-v5a" is used on UniPhier sLD3, LD4,
Pro4, sLD8 SoCs.

"socionext,uniphier-denali-nand-v5b" is used on UniPhier Pro5, PXs2,
LD6b, LD11, LD20 SoCs.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2:
  - Change the compatible strings
  - Fix the ecc_strength_capability
  - Override revision number for the newer one

 .../devicetree/bindings/mtd/denali-nand.txt        |  6 ++++++
 drivers/mtd/nand/denali_dt.c                       | 23 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index 647618e..0b08ea5 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -3,6 +3,8 @@
 Required properties:
   - compatible : should be one of the following:
       "altr,socfpga-denali-nand"            - for Altera SOCFPGA
+      "socionext,uniphier-denali-nand-v5a"  - for Socionext UniPhier (v5a)
+      "socionext,uniphier-denali-nand-v5b"  - for Socionext UniPhier (v5b)
   - reg : should contain registers location and length for data and reg.
   - reg-names: Should contain the reg names "nand_data" and "denali_reg"
   - interrupts : The interrupt number.
@@ -10,9 +12,13 @@ Required properties:
 Optional properties:
   - nand-ecc-step-size: must be 512 or 1024.  If not specified, default to:
       512   for "altr,socfpga-denali-nand"
+      1024  for "socionext,uniphier-denali-nand-v5a"
+      1024  for "socionext,uniphier-denali-nand-v5b"
     see nand.txt for details.
   - nand-ecc-strength: see nand.txt for details.  Available values are:
       8, 15      for "altr,socfpga-denali-nand"
+      8, 16, 24  for "socionext,uniphier-denali-nand-v5a"
+      8, 16      for "socionext,uniphier-denali-nand-v5b"
   - nand-ecc-maximize: see nand.txt for details
 
 Note:
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index c3bc333..1f2f68a 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -41,11 +41,34 @@ static const struct denali_dt_data denali_socfpga_data = {
 		DENALI_CAP_ECC_SIZE_512,
 };
 
+static const struct denali_dt_data denali_uniphier_v5a_data = {
+	.ecc_strength_avail = BIT(24) | BIT(16) | BIT(8),
+	.caps = DENALI_CAP_HW_ECC_FIXUP |
+		DENALI_CAP_DMA_64BIT |
+		DENALI_CAP_ECC_SIZE_1024,
+};
+
+static const struct denali_dt_data denali_uniphier_v5b_data = {
+	.revision = 0x0501,
+	.ecc_strength_avail = BIT(16) | BIT(8),
+	.caps = DENALI_CAP_HW_ECC_FIXUP |
+		DENALI_CAP_DMA_64BIT |
+		DENALI_CAP_ECC_SIZE_1024,
+};
+
 static const struct of_device_id denali_nand_dt_ids[] = {
 	{
 		.compatible = "altr,socfpga-denali-nand",
 		.data = &denali_socfpga_data,
 	},
+	{
+		.compatible = "socionext,uniphier-denali-nand-v5a",
+		.data = &denali_uniphier_v5a_data,
+	},
+	{
+		.compatible = "socionext,uniphier-denali-nand-v5b",
+		.data = &denali_uniphier_v5b_data,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
-- 
2.7.4
