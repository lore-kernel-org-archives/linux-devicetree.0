From: Laurentiu Palcu <laurentiu.palcu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] staging: iio: light: isl29018: add ACPI support
Date: Fri, 29 Aug 2014 17:26:22 +0300
Message-ID: <1409322382-30021-4-git-send-email-laurentiu.palcu@intel.com>
References: <1409322382-30021-1-git-send-email-laurentiu.palcu@intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409322382-30021-1-git-send-email-laurentiu.palcu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Laurentiu Palcu <laurentiu.palcu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Teodora Baluta <teodora.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support for enumerating the device through ACPI.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 drivers/staging/iio/light/isl29018.c | 46 +++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/iio/light/isl29018.c b/drivers/staging/iio/light/isl29018.c
index b50f126..c54c6ae 100644
--- a/drivers/staging/iio/light/isl29018.c
+++ b/drivers/staging/iio/light/isl29018.c
@@ -30,6 +30,7 @@
 #include <linux/slab.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
+#include <linux/acpi.h>
 
 #define CONVERSION_TIME_MS		100
 
@@ -656,12 +657,28 @@ static const struct chip_info chip_info_tbl[] = {
 	},
 };
 
+static char *isl29018_match_acpi_device(struct device *dev, int *data)
+{
+	const struct acpi_device_id *id;
+
+	id = acpi_match_device(dev->driver->acpi_match_table, dev);
+
+	if (!id)
+		return NULL;
+
+	*data = (int) id->driver_data;
+
+	return (char *) dev_name(dev);
+}
+
 static int isl29018_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
 	struct isl29018_chip *chip;
 	struct iio_dev *indio_dev;
 	int err;
+	char *name = NULL;
+	int dev_id = 0;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*chip));
 	if (indio_dev == NULL) {
@@ -673,9 +690,17 @@ static int isl29018_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, indio_dev);
 	chip->dev = &client->dev;
 
+	if (id) {
+		name = (char *) id->name;
+		dev_id = id->driver_data;
+	}
+
+	if (ACPI_HANDLE(&client->dev))
+		name = isl29018_match_acpi_device(&client->dev, &dev_id);
+
 	mutex_init(&chip->lock);
 
-	chip->type = id->driver_data;
+	chip->type = dev_id;
 	chip->lux_scale = 1;
 	chip->lux_uscale = 0;
 	chip->range = 1000;
@@ -683,7 +708,7 @@ static int isl29018_probe(struct i2c_client *client,
 	chip->suspended = false;
 
 	chip->regmap = devm_regmap_init_i2c(client,
-				chip_info_tbl[id->driver_data].regmap_cfg);
+				chip_info_tbl[dev_id].regmap_cfg);
 	if (IS_ERR(chip->regmap)) {
 		err = PTR_ERR(chip->regmap);
 		dev_err(chip->dev, "regmap initialization failed: %d\n", err);
@@ -694,10 +719,10 @@ static int isl29018_probe(struct i2c_client *client,
 	if (err)
 		return err;
 
-	indio_dev->info = chip_info_tbl[id->driver_data].indio_info;
-	indio_dev->channels = chip_info_tbl[id->driver_data].channels;
-	indio_dev->num_channels = chip_info_tbl[id->driver_data].num_channels;
-	indio_dev->name = id->name;
+	indio_dev->info = chip_info_tbl[dev_id].indio_info;
+	indio_dev->channels = chip_info_tbl[dev_id].channels;
+	indio_dev->num_channels = chip_info_tbl[dev_id].num_channels;
+	indio_dev->name = name;
 	indio_dev->dev.parent = &client->dev;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	err = devm_iio_device_register(&client->dev, indio_dev);
@@ -747,6 +772,14 @@ static SIMPLE_DEV_PM_OPS(isl29018_pm_ops, isl29018_suspend, isl29018_resume);
 #define ISL29018_PM_OPS NULL
 #endif
 
+static const struct acpi_device_id isl29018_acpi_match[] = {
+	{"ISL29018", isl29018},
+	{"ISL29023", isl29023},
+	{"ISL29035", isl29035},
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, isl29018_acpi_match);
+
 static const struct i2c_device_id isl29018_id[] = {
 	{"isl29018", isl29018},
 	{"isl29023", isl29023},
@@ -768,6 +801,7 @@ static struct i2c_driver isl29018_driver = {
 	.class	= I2C_CLASS_HWMON,
 	.driver	 = {
 			.name = "isl29018",
+			.acpi_match_table = ACPI_PTR(isl29018_acpi_match),
 			.pm = ISL29018_PM_OPS,
 			.owner = THIS_MODULE,
 			.of_match_table = isl29018_of_match,
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
