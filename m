Return-Path: <SRS0=1fni=QL=linaro.org=rui.silva@kernel.org>
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 4/5] iio: gyro: fxas2100x: add spi driver
Date: Mon,  4 Feb 2019 17:00:11 +0000
Message-Id: <20190204170012.13617-5-rui.silva@linaro.org>
In-Reply-To: <20190204170012.13617-1-rui.silva@linaro.org>
References: <20190204170012.13617-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Add driver to talk over spi to a fxas2100x gyroscope device and use the
core as main controller.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/iio/gyro/Kconfig         |  5 +++
 drivers/iio/gyro/Makefile        |  1 +
 drivers/iio/gyro/fxas2100x_spi.c | 70 ++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+)
 create mode 100644 drivers/iio/gyro/fxas2100x_spi.c

diff --git a/drivers/iio/gyro/Kconfig b/drivers/iio/gyro/Kconfig
index 1f9bfc51febb..4f6d6b393ad8 100644
--- a/drivers/iio/gyro/Kconfig
+++ b/drivers/iio/gyro/Kconfig
@@ -78,6 +78,7 @@ config FXAS2100X
 	select IIO_BUFFER
 	select IIO_TRIGGERED_BUFFER
 	select FXAS2100X_I2C if (I2C)
+	select FXAS2100X_SPI if (SPI)
 	depends on (I2C || SPI_MASTER)
 	help
 	  Say yes here to build support for NXP FXAS2100X family Tri-axis Gyro
@@ -90,6 +91,10 @@ config FXAS2100X_I2C
 	tristate
 	select REGMAP_I2C
 
+config FXAS2100X_SPI
+	tristate
+	select REGMAP_SPI
+
 config HID_SENSOR_GYRO_3D
 	depends on HID_SENSOR_HUB
 	select IIO_BUFFER
diff --git a/drivers/iio/gyro/Makefile b/drivers/iio/gyro/Makefile
index 8b1540ddbbce..29915ba124b0 100644
--- a/drivers/iio/gyro/Makefile
+++ b/drivers/iio/gyro/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_BMG160_I2C) += bmg160_i2c.o
 obj-$(CONFIG_BMG160_SPI) += bmg160_spi.o
 obj-$(CONFIG_FXAS2100X) += fxas2100x_core.o
 obj-$(CONFIG_FXAS2100X_I2C) += fxas2100x_i2c.o
+obj-$(CONFIG_FXAS2100X_SPI) += fxas2100x_spi.o
 
 obj-$(CONFIG_HID_SENSOR_GYRO_3D) += hid-sensor-gyro-3d.o
 
diff --git a/drivers/iio/gyro/fxas2100x_spi.c b/drivers/iio/gyro/fxas2100x_spi.c
new file mode 100644
index 000000000000..10f856ba6f47
--- /dev/null
+++ b/drivers/iio/gyro/fxas2100x_spi.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for NXP FXAS2100x Gyroscope - SPI
+ *
+ * Copyright (C) 2018 Linaro Ltd.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/spi/spi.h>
+
+#include "fxas2100x.h"
+
+static const struct regmap_config fxas2100x_regmap_spi_conf = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = FXAS2100X_REG_CTRL3,
+};
+
+static int fxas2100x_spi_probe(struct spi_device *spi)
+{
+	const struct spi_device_id *id = spi_get_device_id(spi);
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init_spi(spi, &fxas2100x_regmap_spi_conf);
+	if (IS_ERR(regmap)) {
+		dev_err(&spi->dev, "Failed to register spi regmap: %ld\n",
+			PTR_ERR(regmap));
+		return PTR_ERR(regmap);
+	}
+
+	return fxas2100x_core_probe(&spi->dev, regmap, spi->irq, id->name);
+}
+
+static int fxas2100x_spi_remove(struct spi_device *spi)
+{
+	fxas2100x_core_remove(&spi->dev);
+
+	return 0;
+}
+
+static const struct spi_device_id fxas2100x_spi_id[] = {
+	{ "fxas2100x", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, fxas2100x_spi_id);
+
+static const struct of_device_id fxas2100x_spi_of_match[] = {
+	{ .compatible = "nxp,fxas2100x", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, fxas2100x_spi_of_match);
+
+static struct spi_driver fxas2100x_spi_driver = {
+	.driver = {
+		.name = "fxas2100x_spi",
+		.pm = &fxas2100x_pm_ops,
+		.of_match_table = of_match_ptr(fxas2100x_spi_of_match),
+	},
+	.probe		= fxas2100x_spi_probe,
+	.remove		= fxas2100x_spi_remove,
+	.id_table	= fxas2100x_spi_id,
+};
+module_spi_driver(fxas2100x_spi_driver);
+
+MODULE_AUTHOR("Rui Miguel Silva <rui.silva@linaro.org>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("FXAS2100X SPI Gyro driver");
-- 
2.20.1
