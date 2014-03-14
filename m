From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] spi: dw-mmio: add oftree support
Date: Fri, 14 Mar 2014 09:55:26 +0100
Message-ID: <1394787326-14520-1-git-send-email-s.trumtrar@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allow probing the dw-mmio from devicetree.

Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
This was tested on Socfpga and v3.14-rc6

 .../devicetree/bindings/spi/spi-dw-mmio.txt        | 25 ++++++++++++++++++++++
 drivers/spi/spi-dw-mmio.c                          | 19 +++++++++++++++-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-dw-mmio.txt

diff --git a/Documentation/devicetree/bindings/spi/spi-dw-mmio.txt b/Documentation/devicetree/bindings/spi/spi-dw-mmio.txt
new file mode 100644
index 0000000..2b9bb90
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-dw-mmio.txt
@@ -0,0 +1,25 @@
+Synopsys DesignWare SPI master controller.
+
+Required properties:
+- compatible : "snps,dw-spi-mmio"
+- reg : The register base for the controller.
+- interrupts : One interrupt, used by the controller.
+- #address-cells : <1>, as required by generic SPI binding.
+- #size-cells : <0>, also as required by generic SPI binding.
+
+Optional properties:
+- num-chipselects : The number of chipselects.
+
+Child nodes as per the generic SPI binding.
+
+Example:
+
+	spi@fff00000 {
+		compatible = "snps,dw-spi-mmio";
+		reg = <0xfff00000 0x1000>;
+		interrupts = <0 154 4>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-chipselects = <4>;
+	};
+
diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
index 9af56cd..71345e4 100644
--- a/drivers/spi/spi-dw-mmio.c
+++ b/drivers/spi/spi-dw-mmio.c
@@ -16,6 +16,8 @@
 #include <linux/spi/spi.h>
 #include <linux/scatterlist.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
 
 #include "spi-dw.h"
 
@@ -32,6 +34,7 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
 	struct dw_spi *dws;
 	struct resource *mem;
 	int ret;
+	int val;
 
 	dwsmmio = devm_kzalloc(&pdev->dev, sizeof(struct dw_spi_mmio),
 			GFP_KERNEL);
@@ -66,8 +69,15 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	dws->bus_num = 0;
+	dws->bus_num = pdev->id;
 	dws->num_cs = 4;
+
+	if (pdev->dev.of_node) {
+		if (of_property_read_u32(pdev->dev.of_node, "num-chipselects",
+					 &val))
+			dws->num_cs = val;
+	}
+
 	dws->max_freq = clk_get_rate(dwsmmio->clk);
 
 	ret = dw_spi_add_host(&pdev->dev, dws);
@@ -92,12 +102,19 @@ static int dw_spi_mmio_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id dw_spi_mmio_of_match[] = {
+	{ .compatible = "snps,dw-spi-mmio", },
+	{ /* end of table */}
+};
+MODULE_DEVICE_TABLE(of, dw_spi_mmio_of_match);
+
 static struct platform_driver dw_spi_mmio_driver = {
 	.probe		= dw_spi_mmio_probe,
 	.remove		= dw_spi_mmio_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.owner	= THIS_MODULE,
+		.of_match_table = dw_spi_mmio_of_match,
 	},
 };
 module_platform_driver(dw_spi_mmio_driver);
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
