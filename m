From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 3/5] mtd: onenand/samsung: Add device tree support
Date: Fri, 26 Apr 2019 18:42:22 +0200
Message-ID: <20190426164224.11327-4-pawel.mikolaj.chmiel@gmail.com>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kyungmin.park@samsung.com
Cc: bbrezillon@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Tomasz Figa <tomasz.figa@gmail.com>

This patch adds support for instantation using Device Tree.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 drivers/mtd/nand/onenand/samsung.c | 37 +++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/onenand/samsung.c b/drivers/mtd/nand/onenand/samsung.c
index 9628bf5bc397..0f450604412f 100644
--- a/drivers/mtd/nand/onenand/samsung.c
+++ b/drivers/mtd/nand/onenand/samsung.c
@@ -25,6 +25,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/of.h>
 
 #include "samsung.h"
 
@@ -835,8 +836,36 @@ static void s3c_onenand_setup(struct mtd_info *mtd)
 	this->write_bufferram = onenand_write_bufferram;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id s3c_onenand_of_match[] = {
+	{ .compatible = "samsung,s3c6400-onenand",
+		.data = (void *)TYPE_S3C6400 },
+	{ .compatible = "samsung,s3c6410-onenand",
+		.data = (void *)TYPE_S3C6410 },
+	{ .compatible = "samsung,s5pv210-onenand",
+		.data = (void *)TYPE_S5PC110 },
+	{},
+};
+MODULE_DEVICE_TABLE(of, onenand_s3c_dt_match);
+#endif
+
+static enum soc_type s3c_onenand_get_device_id(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+
+	if (IS_ENABLED(CONFIG_OF) && np) {
+		const struct of_device_id *match;
+
+		match = of_match_node(s3c_onenand_of_match, np);
+		return (enum soc_type)match->data;
+	}
+
+	return platform_get_device_id(pdev)->driver_data;
+}
+
 static int s3c_onenand_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct onenand_platform_data *pdata;
 	struct onenand_chip *this;
 	struct mtd_info *mtd;
@@ -858,9 +887,10 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 
 	this = (struct onenand_chip *) &mtd[1];
 	mtd->priv = this;
+	mtd->dev.of_node = np;
 	mtd->dev.parent = &pdev->dev;
 	onenand->pdev = pdev;
-	onenand->type = platform_get_device_id(pdev)->driver_data;
+	onenand->type = s3c_onenand_get_device_id(pdev);
 
 	s3c_onenand_setup(mtd);
 
@@ -919,6 +949,10 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	}
 
 	onenand->clk_bus = devm_clk_get(&pdev->dev, "bus");
+	if (np && IS_ERR(onenand->clk_bus)) {
+		dev_err(&pdev->dev, "failed to get bus clock\n");
+		return PTR_ERR(onenand->clk_bus);
+	}
 	if (!IS_ERR(onenand->clk_bus))
 		clk_prepare_enable(onenand->clk_bus);
 
@@ -1000,6 +1034,7 @@ static struct platform_driver s3c_onenand_driver = {
 	.driver         = {
 		.name	= "samsung-onenand",
 		.pm	= &s3c_pm_ops,
+		.of_match_table = of_match_ptr(s3c_onenand_of_match),
 	},
 	.id_table	= s3c_onenand_driver_ids,
 	.probe          = s3c_onenand_probe,
-- 
2.20.1
