From: Yogesh Gaur <yogeshnarayan.gaur-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 2/2] mtd: fsl-quadspi: Update hwcap based on mode provided in dtsi file
Date: Thu, 25 Jan 2018 12:51:57 +0530
Message-ID: <1516864917-31969-3-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1516864917-31969-1-git-send-email-yogeshnarayan.gaur@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516864917-31969-1-git-send-email-yogeshnarayan.gaur-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, han.xu-3arQi8VN3Tc@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org, suresh.gupta-3arQi8VN3Tc@public.gmane.org, Yogesh Gaur <yogeshnarayan.gaur-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

FSL QuadSPI controller supports Single, dual, quad modes of operation.
Mode information is available via "spi-tx-bus-width" and
"spi-rx-bus-width" nodes of device tree.

Update read hwcap capability by reading "spi-rx-bus-width".
Update write hwcap capability by reading "spi-tx-bus-width".

If value not provided in device tree file, then fallback to default
mode i.e. SNOR_HWCAPS_READ_1_1_4 and SNOR_HWCAPS_PP.

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur-3arQi8VN3Tc@public.gmane.org>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 46 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 11389d8..ff98e5a 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -979,8 +979,8 @@ static void fsl_qspi_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
 
 static int fsl_qspi_probe(struct platform_device *pdev)
 {
-	const struct spi_nor_hwcaps hwcaps = {
-		.mask = SNOR_HWCAPS_READ_1_1_4 |
+	struct spi_nor_hwcaps hwcaps = {
+		.mask = SNOR_HWCAPS_READ_FAST |
 			SNOR_HWCAPS_PP,
 	};
 	struct device_node *np = pdev->dev.of_node;
@@ -989,7 +989,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct spi_nor *nor;
 	struct mtd_info *mtd;
-	int ret, i = 0;
+	int ret, i = 0, value;
 
 	q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
 	if (!q)
@@ -1037,6 +1037,46 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		goto clk_failed;
 	}
 
+	if (!of_property_read_u32(np, "spi-rx-bus-width", &value)) {
+		switch (value) {
+		case 1:
+			hwcaps.mask |= SNOR_HWCAPS_READ |
+				       SNOR_HWCAPS_READ_FAST;
+			break;
+		case 2:
+			hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2 |
+				       SNOR_HWCAPS_READ_1_2_2;
+			break;
+		case 4:
+			hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4 |
+				       SNOR_HWCAPS_READ_1_4_4;
+			break;
+		default:
+			dev_err(dev,
+				"spi-rx-bus-width %d not supported\n",
+				value);
+			break;
+		}
+	} else
+		hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
+
+	if (!of_property_read_u32(np, "spi-tx-bus-width", &value)) {
+		switch (value) {
+		case 1:
+			hwcaps.mask |= SNOR_HWCAPS_PP;
+			break;
+		case 4:
+			hwcaps.mask |= SNOR_HWCAPS_PP_1_1_4 |
+				       SNOR_HWCAPS_PP_1_4_4;
+			break;
+		default:
+			dev_err(dev,
+				"spi-tx-bus-width %d not supported\n",
+				value);
+			break;
+		}
+	}
+
 	/* find the irq */
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0) {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
