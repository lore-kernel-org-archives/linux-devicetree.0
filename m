From: Loys Ollivier <lollivier@baylibre.com>
Subject: [PATCH 4/4] gnss: add driver for globaltop receivers
Date: Fri, 28 Dec 2018 11:50:35 +0100
Message-ID: <1545994235-8309-5-git-send-email-lollivier@baylibre.com>
References: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc: Loys Ollivier <lollivier@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add driver for serial-connected GlobalTop GNSS receivers.

These devices typically boot transmitting vendor specific NMEA output
sequences. The serial port bit rate is read from the device tree
"current-speed".

Note that the driver uses the generic GNSS serial implementation and
therefore essentially only manages power abstracted into three power
states: ACTIVE, STANDBY, and OFF.

For globaltop receivers with a main supply and no enable-gpios, this simply
means that the main supply is disabled in STANDBY and OFF (the optional
backup supply is kept enabled while the driver is bound).

Note that the timepulse-support is left unimplemented.

Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
---
 drivers/gnss/Kconfig  |  13 +++++
 drivers/gnss/Makefile |   3 +
 drivers/gnss/core.c   |   1 +
 drivers/gnss/gtop.c   | 152 ++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 169 insertions(+)
 create mode 100644 drivers/gnss/gtop.c

diff --git a/drivers/gnss/Kconfig b/drivers/gnss/Kconfig
index 6abc88514512..c93ad134656b 100644
--- a/drivers/gnss/Kconfig
+++ b/drivers/gnss/Kconfig
@@ -40,4 +40,17 @@ config GNSS_UBX_SERIAL
 
 	  If unsure, say N.
 
+config GNSS_GTOP_SERIAL
+	tristate "GlobalTop GNSS receiver support"
+	depends on SERIAL_DEV_BUS
+	select GNSS_SERIAL
+	help
+	  Say Y here if you have a GlobalTop GNSS receiver which uses a serial
+	  interface.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gnss-gtop.
+
+	  If unsure, say N.
+
 endif # GNSS
diff --git a/drivers/gnss/Makefile b/drivers/gnss/Makefile
index 5cf0ebe0330a..becc45f24b8b 100644
--- a/drivers/gnss/Makefile
+++ b/drivers/gnss/Makefile
@@ -14,3 +14,6 @@ gnss-sirf-y := sirf.o
 
 obj-$(CONFIG_GNSS_UBX_SERIAL)		+= gnss-ubx.o
 gnss-ubx-y := ubx.o
+
+obj-$(CONFIG_GNSS_GTOP_SERIAL)		+= gnss-gtop.o
+gnss-gtop-y := gtop.o
diff --git a/drivers/gnss/core.c b/drivers/gnss/core.c
index 4291a0dd22aa..0b5cd82b1fb7 100644
--- a/drivers/gnss/core.c
+++ b/drivers/gnss/core.c
@@ -334,6 +334,7 @@ static const char * const gnss_type_names[GNSS_TYPE_COUNT] = {
 	[GNSS_TYPE_NMEA]	= "NMEA",
 	[GNSS_TYPE_SIRF]	= "SiRF",
 	[GNSS_TYPE_UBX]		= "UBX",
+	[GNSS_TYPE_GTOP]	= "GTOP",
 };
 
 static const char *gnss_type_name(struct gnss_device *gdev)
diff --git a/drivers/gnss/gtop.c b/drivers/gnss/gtop.c
new file mode 100644
index 000000000000..6fa7b425d711
--- /dev/null
+++ b/drivers/gnss/gtop.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * GlobalTop GNSS receiver driver
+ *
+ * Copyright (C) 2018 Loys Ollivier <loys.ollivier@gmail.com>
+ */
+
+#include <linux/errno.h>
+#include <linux/gnss.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+#include <linux/serdev.h>
+
+#include "serial.h"
+
+struct gtop_data {
+	struct regulator *v_bckp;
+	struct regulator *vcc;
+};
+
+static int gtop_set_active(struct gnss_serial *gserial)
+{
+	struct gtop_data *data = gnss_serial_get_drvdata(gserial);
+	int ret;
+
+	ret = regulator_enable(data->vcc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int gtop_set_standby(struct gnss_serial *gserial)
+{
+	struct gtop_data *data = gnss_serial_get_drvdata(gserial);
+	int ret;
+
+	ret = regulator_disable(data->vcc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int gtop_set_power(struct gnss_serial *gserial,
+				enum gnss_serial_pm_state state)
+{
+	switch (state) {
+	case GNSS_SERIAL_ACTIVE:
+		return gtop_set_active(gserial);
+	case GNSS_SERIAL_OFF:
+	case GNSS_SERIAL_STANDBY:
+		return gtop_set_standby(gserial);
+	}
+
+	return -EINVAL;
+}
+
+static const struct gnss_serial_ops gtop_gserial_ops = {
+	.set_power = gtop_set_power,
+};
+
+static int gtop_probe(struct serdev_device *serdev)
+{
+	struct gnss_serial *gserial;
+	struct gtop_data *data;
+	int ret;
+
+	gserial = gnss_serial_allocate(serdev, sizeof(*data));
+	if (IS_ERR(gserial)) {
+		ret = PTR_ERR(gserial);
+		return ret;
+	}
+
+	gserial->ops = &gtop_gserial_ops;
+
+	gserial->gdev->type = GNSS_TYPE_GTOP;
+
+	data = gnss_serial_get_drvdata(gserial);
+
+	data->vcc = devm_regulator_get(&serdev->dev, "vcc");
+	if (IS_ERR(data->vcc)) {
+		ret = PTR_ERR(data->vcc);
+		goto err_free_gserial;
+	}
+
+	data->v_bckp = devm_regulator_get_optional(&serdev->dev, "v-bckp");
+	if (IS_ERR(data->v_bckp)) {
+		ret = PTR_ERR(data->v_bckp);
+		if (ret == -ENODEV)
+			data->v_bckp = NULL;
+		else
+			goto err_free_gserial;
+	}
+
+	if (data->v_bckp) {
+		ret = regulator_enable(data->v_bckp);
+		if (ret)
+			goto err_free_gserial;
+	}
+
+	ret = gnss_serial_register(gserial);
+	if (ret)
+		goto err_disable_v_bckp;
+
+	return 0;
+
+err_disable_v_bckp:
+	if (data->v_bckp)
+		regulator_disable(data->v_bckp);
+err_free_gserial:
+	gnss_serial_free(gserial);
+
+	return ret;
+}
+
+static void gtop_remove(struct serdev_device *serdev)
+{
+	struct gnss_serial *gserial = serdev_device_get_drvdata(serdev);
+	struct gtop_data *data = gnss_serial_get_drvdata(gserial);
+
+	gnss_serial_deregister(gserial);
+	if (data->v_bckp)
+		regulator_disable(data->v_bckp);
+	gnss_serial_free(gserial);
+};
+
+#ifdef CONFIG_OF
+static const struct of_device_id gtop_of_match[] = {
+	{ .compatible = "globaltop,pa6h" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, gtop_of_match);
+#endif
+
+static struct serdev_device_driver gtop_driver = {
+	.driver	= {
+		.name		= "gnss-gtop",
+		.of_match_table	= of_match_ptr(gtop_of_match),
+		.pm		= &gnss_serial_pm_ops,
+	},
+	.probe	= gtop_probe,
+	.remove	= gtop_remove,
+};
+module_serdev_device_driver(gtop_driver);
+
+MODULE_AUTHOR("Loys Ollivier <loys.ollivier@gmail.com>");
+MODULE_DESCRIPTION("GlobalTop GNSS receiver driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4
