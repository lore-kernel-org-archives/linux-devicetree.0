From: Cory Tusar <cory.tusar@pid1solutions.com>
Subject: [PATCH v4 3/5] misc: eeprom_93xx46: Implement eeprom_93xx46 DT bindings.
Date: Wed,  9 Dec 2015 23:00:53 -0500
Message-ID: <1449720055-25965-4-git-send-email-cory.tusar@pid1solutions.com>
References: <1449720055-25965-1-git-send-email-cory.tusar@pid1solutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449720055-25965-1-git-send-email-cory.tusar@pid1solutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, gregkh@linuxfoundation.org
Cc: jic23@kernel.org, vz@mleia.com, broonie@kernel.org, afd@ti.com, andrew@lunn.ch, Chris.Healy@zii.aero, Keith.Vennel@zii.aero, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Cory Tusar <cory.tusar@pid1solutions.com>
List-Id: devicetree@vger.kernel.org

This commit implements bindings in the eeprom_93xx46 driver allowing
device word size and read-only attributes to be specified via
devicetree.

Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>
Tested-by: Chris Healy <chris.healy@zii.aero>
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
