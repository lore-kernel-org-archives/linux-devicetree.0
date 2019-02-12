From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH v6 2/2] mtd: spi-nor: cadence-quadspi: Add support for Octal SPI controller
Date: Tue, 12 Feb 2019 14:08:09 +0530
Message-ID: <20190212083809.6534-3-vigneshr@ti.com>
References: <20190212083809.6534-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212083809.6534-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <bbrezillon@kernel.org>, Tudor.Ambarus@microchip.com
Cc: Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

Cadence OSPI controller IP supports Octal IO (x8 IO lines),
It also has an integrated PHY. IP register layout is very
similar to existing QSPI IP except for additional bits to support Octal
and Octal DDR mode. Therefore, extend current driver to support Octal
mode. Only Octal SDR read (1-1-8)mode is supported for now.

Tested with mt35xu512aba Octal flash on TI's AM654 EVM.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
v6: Return error when driver data is not found

 drivers/mtd/spi-nor/cadence-quadspi.c | 59 +++++++++++++++++++++------
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 04cedd3a2bf6..c8b81e0a76cc 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -44,6 +44,12 @@
 /* Quirks */
 #define CQSPI_NEEDS_WR_DELAY		BIT(0)
 
+/* Capabilities mask */
+#define CQSPI_BASE_HWCAPS_MASK					\
+	(SNOR_HWCAPS_READ | SNOR_HWCAPS_READ_FAST |		\
+	SNOR_HWCAPS_READ_1_1_2 | SNOR_HWCAPS_READ_1_1_4 |	\
+	SNOR_HWCAPS_PP)
+
 struct cqspi_st;
 
 struct cqspi_flash_pdata {
@@ -93,6 +99,11 @@ struct cqspi_st {
 	struct cqspi_flash_pdata f_pdata[CQSPI_MAX_CHIPSELECT];
 };
 
+struct cqspi_driver_platdata {
+	u32 hwcaps_mask;
+	u8 quirks;
+};
+
 /* Operation timeout value */
 #define CQSPI_TIMEOUT_MS			500
 #define CQSPI_READ_TIMEOUT_MS			10
@@ -101,6 +112,7 @@ struct cqspi_st {
 #define CQSPI_INST_TYPE_SINGLE			0
 #define CQSPI_INST_TYPE_DUAL			1
 #define CQSPI_INST_TYPE_QUAD			2
+#define CQSPI_INST_TYPE_OCTAL			3
 
 #define CQSPI_DUMMY_CLKS_PER_BYTE		8
 #define CQSPI_DUMMY_BYTES_MAX			4
@@ -911,6 +923,9 @@ static int cqspi_set_protocol(struct spi_nor *nor, const int read)
 		case SNOR_PROTO_1_1_4:
 			f_pdata->data_width = CQSPI_INST_TYPE_QUAD;
 			break;
+		case SNOR_PROTO_1_1_8:
+			f_pdata->data_width = CQSPI_INST_TYPE_OCTAL;
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -1213,21 +1228,23 @@ static void cqspi_request_mmap_dma(struct cqspi_st *cqspi)
 
 static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
 {
-	const struct spi_nor_hwcaps hwcaps = {
-		.mask = SNOR_HWCAPS_READ |
-			SNOR_HWCAPS_READ_FAST |
-			SNOR_HWCAPS_READ_1_1_2 |
-			SNOR_HWCAPS_READ_1_1_4 |
-			SNOR_HWCAPS_PP,
-	};
 	struct platform_device *pdev = cqspi->pdev;
 	struct device *dev = &pdev->dev;
+	const struct cqspi_driver_platdata *ddata;
+	struct spi_nor_hwcaps hwcaps;
 	struct cqspi_flash_pdata *f_pdata;
 	struct spi_nor *nor;
 	struct mtd_info *mtd;
 	unsigned int cs;
 	int i, ret;
 
+	ddata = of_device_get_match_data(dev);
+	if (!ddata) {
+		dev_err(dev, "Couldnt't find driver data\n");
+		return -EINVAL;
+	}
+	hwcaps.mask = ddata->hwcaps_mask;
+
 	/* Get flash device data */
 	for_each_available_child_of_node(dev->of_node, np) {
 		ret = of_property_read_u32(np, "reg", &cs);
@@ -1310,7 +1327,7 @@ static int cqspi_probe(struct platform_device *pdev)
 	struct cqspi_st *cqspi;
 	struct resource *res;
 	struct resource *res_ahb;
-	unsigned long data;
+	const struct cqspi_driver_platdata *ddata;
 	int ret;
 	int irq;
 
@@ -1377,8 +1394,8 @@ static int cqspi_probe(struct platform_device *pdev)
 	}
 
 	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
-	data  = (unsigned long)of_device_get_match_data(dev);
-	if (data & CQSPI_NEEDS_WR_DELAY)
+	ddata  = of_device_get_match_data(dev);
+	if (ddata && (ddata->quirks & CQSPI_NEEDS_WR_DELAY))
 		cqspi->wr_delay = 5 * DIV_ROUND_UP(NSEC_PER_SEC,
 						   cqspi->master_ref_clk_hz);
 
@@ -1460,14 +1477,32 @@ static const struct dev_pm_ops cqspi__dev_pm_ops = {
 #define CQSPI_DEV_PM_OPS	NULL
 #endif
 
+static const struct cqspi_driver_platdata cdns_qspi = {
+	.hwcaps_mask = CQSPI_BASE_HWCAPS_MASK,
+};
+
+static const struct cqspi_driver_platdata k2g_qspi = {
+	.hwcaps_mask = CQSPI_BASE_HWCAPS_MASK,
+	.quirks = CQSPI_NEEDS_WR_DELAY,
+};
+
+static const struct cqspi_driver_platdata am654_ospi = {
+	.hwcaps_mask = CQSPI_BASE_HWCAPS_MASK | SNOR_HWCAPS_READ_1_1_8,
+	.quirks = CQSPI_NEEDS_WR_DELAY,
+};
+
 static const struct of_device_id cqspi_dt_ids[] = {
 	{
 		.compatible = "cdns,qspi-nor",
-		.data = (void *)0,
+		.data = &cdns_qspi,
 	},
 	{
 		.compatible = "ti,k2g-qspi",
-		.data = (void *)CQSPI_NEEDS_WR_DELAY,
+		.data = &k2g_qspi,
+	},
+	{
+		.compatible = "ti,am654-ospi",
+		.data = &am654_ospi,
 	},
 	{ /* end of table */ }
 };
-- 
2.20.1
