From: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Subject: [PATCH v5 3/5] misc: eeprom_93xx46: Implement eeprom_93xx46 DT bindings.
Date: Wed,  6 Jan 2016 22:55:02 -0500
Message-ID: <1452138904-24820-4-git-send-email-cory.tusar@pid1solutions.com>
References: <1452138904-24820-1-git-send-email-cory.tusar@pid1solutions.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452138904-24820-1-git-send-email-cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, afd-l0cyMroinI0@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Chris.Healy-c8ZVq/bFV1I@public.gmane.org, Keith.Vennel-c8ZVq/bFV1I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit implements bindings in the eeprom_93xx46 driver allowing
device word size and read-only attributes to be specified via
devicetree.

Signed-off-by: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Tested-by: Chris Healy <chris.healy-c8ZVq/bFV1I@public.gmane.org>
Reviewed-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
 drivers/misc/eeprom/eeprom_93xx46.c | 49 +++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/misc/eeprom/eeprom_93xx46.c b/drivers/misc/eeprom/eeprom_93xx46.c
index e1bf0a5..cc27e11 100644
--- a/drivers/misc/eeprom/eeprom_93xx46.c
+++ b/drivers/misc/eeprom/eeprom_93xx46.c
@@ -13,6 +13,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
 #include <linux/sysfs.h>
@@ -294,12 +296,58 @@ static ssize_t eeprom_93xx46_store_erase(struct device *dev,
 }
 static DEVICE_ATTR(erase, S_IWUSR, NULL, eeprom_93xx46_store_erase);
 
+static const struct of_device_id eeprom_93xx46_of_table[] = {
+	{ .compatible = "eeprom-93xx46", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, eeprom_93xx46_of_table);
+
+static int eeprom_93xx46_probe_dt(struct spi_device *spi)
+{
+	struct device_node *np = spi->dev.of_node;
+	struct eeprom_93xx46_platform_data *pd;
+	u32 tmp;
+	int ret;
+
+	pd = devm_kzalloc(&spi->dev, sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(np, "data-size", &tmp);
+	if (ret < 0) {
+		dev_err(&spi->dev, "data-size property not found\n");
+		return ret;
+	}
+
+	if (tmp == 8) {
+		pd->flags |= EE_ADDR8;
+	} else if (tmp == 16) {
+		pd->flags |= EE_ADDR16;
+	} else {
+		dev_err(&spi->dev, "invalid data-size (%d)\n", tmp);
+		return -EINVAL;
+	}
+
+	if (of_property_read_bool(np, "read-only"))
+		pd->flags |= EE_READONLY;
+
+	spi->dev.platform_data = pd;
+
+	return 0;
+}
+
 static int eeprom_93xx46_probe(struct spi_device *spi)
 {
 	struct eeprom_93xx46_platform_data *pd;
 	struct eeprom_93xx46_dev *edev;
 	int err;
 
+	if (spi->dev.of_node) {
+		err = eeprom_93xx46_probe_dt(spi);
+		if (err < 0)
+			return err;
+	}
+
 	pd = spi->dev.platform_data;
 	if (!pd) {
 		dev_err(&spi->dev, "missing platform data\n");
@@ -370,6 +418,7 @@ static int eeprom_93xx46_remove(struct spi_device *spi)
 static struct spi_driver eeprom_93xx46_driver = {
 	.driver = {
 		.name	= "93xx46",
+		.of_match_table = of_match_ptr(eeprom_93xx46_of_table),
 	},
 	.probe		= eeprom_93xx46_probe,
 	.remove		= eeprom_93xx46_remove,
-- 
2.4.10

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
