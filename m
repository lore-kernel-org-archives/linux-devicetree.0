From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v5 05/23] mtd: nand: denali_dt: add compatible strings for UniPhier SoC variants
Date: Wed,  7 Jun 2017 20:52:14 +0900
Message-ID: <1496836352-8016-6-git-send-email-yamada.masahiro@socionext.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add two compatible strings for UniPhier SoC family.

"socionext,uniphier-denali-nand-v5a" is used on UniPhier sLD3, LD4,
Pro4, sLD8.

"socionext,uniphier-denali-nand-v5b" is used on UniPhier Pro5, PXs2,
LD6b, LD11, LD20.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v5:
  - Adjust to the update of generic helpers

Changes in v4:
  - Adjusted to generic helpers for ECC engine caps

Changes in v3: None
Changes in v2:
  - Change the compatible strings
  - Fix the ecc_strength_capability
  - Override revision number for the newer one

 .../devicetree/bindings/mtd/denali-nand.txt        |  6 ++++++
 drivers/mtd/nand/denali_dt.c                       | 25 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index b7742a7363ea..504291d2e5c2 100644
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
@@ -10,8 +12,12 @@ Required properties:
 Optional properties:
   - nand-ecc-step-size: see nand.txt for details.  If present, the value must be
       512        for "altr,socfpga-denali-nand"
+      1024       for "socionext,uniphier-denali-nand-v5a"
+      1024       for "socionext,uniphier-denali-nand-v5b"
   - nand-ecc-strength: see nand.txt for details.  Valid values are:
       8, 15      for "altr,socfpga-denali-nand"
+      8, 16, 24  for "socionext,uniphier-denali-nand-v5a"
+      8, 16      for "socionext,uniphier-denali-nand-v5b"
   - nand-ecc-maximize: see nand.txt for details
 
 The device tree may optionally contain sub-nodes describing partitions of the
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index bd1aa4cf4457..be598230c108 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -42,11 +42,36 @@ static const struct denali_dt_data denali_socfpga_data = {
 	.ecc_caps = &denali_socfpga_ecc_caps,
 };
 
+NAND_ECC_CAPS_SINGLE(denali_uniphier_v5a_ecc_caps, denali_calc_ecc_bytes,
+		     1024, 8, 16, 24);
+static const struct denali_dt_data denali_uniphier_v5a_data = {
+	.caps = DENALI_CAP_HW_ECC_FIXUP |
+		DENALI_CAP_DMA_64BIT,
+	.ecc_caps = &denali_uniphier_v5a_ecc_caps,
+};
+
+NAND_ECC_CAPS_SINGLE(denali_uniphier_v5b_ecc_caps, denali_calc_ecc_bytes,
+		     1024, 8, 16);
+static const struct denali_dt_data denali_uniphier_v5b_data = {
+	.revision = 0x0501,
+	.caps = DENALI_CAP_HW_ECC_FIXUP |
+		DENALI_CAP_DMA_64BIT,
+	.ecc_caps = &denali_uniphier_v5b_ecc_caps,
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
