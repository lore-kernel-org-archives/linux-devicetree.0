From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3] mtd: dataflash: add device tree probe support
Date: Fri, 15 Jul 2011 16:38:56 +0800
Message-ID: <1310719136-21565-1-git-send-email-shawn.guo@linaro.org>
References: <1310283313-32087-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1310283313-32087-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Artem Bityutskiy <Artem.Bityutskiy-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Mike Frysinger <vapier.adi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

It adds device tree probe support for mtd_dataflash driver.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
---
Changes since v2:
 * Change compatible string to "at45" from "at45xxx"
 * Add "#ifdef CONFIG_OF" for dataflash_dt_ids

Changes since v1:
 * Add "atmel,at45xxx" into the match table
 * Add binding document

 .../devicetree/bindings/mtd/atmel-dataflash.txt    |   14 ++++++++++++++
 drivers/mtd/devices/mtd_dataflash.c                |   18 ++++++++++++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/atmel-dataflash.txt

diff --git a/Documentation/devicetree/bindings/mtd/atmel-dataflash.txt b/Documentation/devicetree/bindings/mtd/atmel-dataflash.txt
new file mode 100644
index 0000000..ef66ddd
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/atmel-dataflash.txt
@@ -0,0 +1,14 @@
+* Atmel Data Flash
+
+Required properties:
+- compatible : "atmel,<model>", "atmel,<series>", "atmel,dataflash".
+
+Example:
+
+flash@1 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "atmel,at45db321d", "atmel,at45", "atmel,dataflash";
+	spi-max-frequency = <25000000>;
+	reg = <1>;
+};
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 8f6b02c..c86fa57 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -17,6 +17,8 @@
 #include <linux/mutex.h>
 #include <linux/err.h>
 #include <linux/math64.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 
 #include <linux/spi/spi.h>
 #include <linux/spi/flash.h>
@@ -24,7 +26,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 
-
 /*
  * DataFlash is a kind of SPI flash.  Most AT45 chips have two buffers in
  * each chip, which may be used for double buffered I/O; but this driver
@@ -98,6 +99,16 @@ struct dataflash {
 	struct mtd_info		mtd;
 };
 
+#ifdef CONFIG_OF
+static const struct of_device_id dataflash_dt_ids[] = {
+	{ .compatible = "atmel,at45", },
+	{ .compatible = "atmel,dataflash", },
+	{ /* sentinel */ }
+};
+#else
+#define dataflash_dt_ids NULL
+#endif
+
 /* ......................................................................... */
 
 /*
@@ -634,6 +645,7 @@ add_dataflash_otp(struct spi_device *spi, char *name,
 {
 	struct dataflash		*priv;
 	struct mtd_info			*device;
+	struct mtd_part_parser_data	ppdata;
 	struct flash_platform_data	*pdata = spi->dev.platform_data;
 	char				*otp_tag = "";
 	int				err = 0;
@@ -675,7 +687,8 @@ add_dataflash_otp(struct spi_device *spi, char *name,
 			pagesize, otp_tag);
 	dev_set_drvdata(&spi->dev, priv);
 
-	err = mtd_device_parse_register(device, NULL, 0,
+	ppdata.of_node = spi->dev.of_node;
+	err = mtd_device_parse_register(device, NULL, &ppdata,
 			pdata ? pdata->parts : NULL,
 			pdata ? pdata->nr_parts : 0);
 
@@ -926,6 +939,7 @@ static struct spi_driver dataflash_driver = {
 		.name		= "mtd_dataflash",
 		.bus		= &spi_bus_type,
 		.owner		= THIS_MODULE,
+		.of_match_table = dataflash_dt_ids,
 	},
 
 	.probe		= dataflash_probe,
-- 
1.7.4.1
