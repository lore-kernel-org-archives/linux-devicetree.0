Return-Path: <SRS0=cWXf=RA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr20051.outbound.protection.outlook.com ([40.107.2.51]:40899
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728217AbfBYH1O (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 25 Feb 2019 02:27:14 -0500
From: Jun Li <jun.li@nxp.com>
Subject: [PATCH 2/2] usb: typec: add typec switch via GPIO control
Date: Mon, 25 Feb 2019 07:27:08 +0000
Message-ID: <1551078369-1654-2-git-send-email-jun.li@nxp.com>
References: <1551078369-1654-1-git-send-email-jun.li@nxp.com>
In-Reply-To: <1551078369-1654-1-git-send-email-jun.li@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds a simple typec switch driver which only needs
a GPIO to switch the super speed active channel according to
typec orientation.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/mux/Kconfig       |   6 +++
 drivers/usb/typec/mux/Makefile      |   1 +
 drivers/usb/typec/mux/gpio-switch.c | 105 ++++++++++++++++++++++++++++++++=
++++
 3 files changed, 112 insertions(+)
 create mode 100644 drivers/usb/typec/mux/gpio-switch.c

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index 01ed0d5..bc7d3c7 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -9,4 +9,10 @@ config TYPEC_MUX_PI3USB30532
 	  Say Y or M if your system has a Pericom PI3USB30532 Type-C cross
 	  switch / mux chip found on some devices with a Type-C port.
=20
+config TYPEC_SWITCH_GPIO
+	tristate "Simple Super Speed Active Switch via GPIO"
+	help
+	  Say Y or M if your system has a typec super speed channel
+	  switch via a simple GPIO control.
+
 endmenu
diff --git a/drivers/usb/typec/mux/Makefile b/drivers/usb/typec/mux/Makefil=
e
index 1332e46..e29377c 100644
--- a/drivers/usb/typec/mux/Makefile
+++ b/drivers/usb/typec/mux/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
=20
 obj-$(CONFIG_TYPEC_MUX_PI3USB30532)	+=3D pi3usb30532.o
+obj-$(CONFIG_TYPEC_SWITCH_GPIO)		+=3D gpio-switch.o
diff --git a/drivers/usb/typec/mux/gpio-switch.c b/drivers/usb/typec/mux/gp=
io-switch.c
new file mode 100644
index 0000000..a51da68
--- /dev/null
+++ b/drivers/usb/typec/mux/gpio-switch.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * gpio-switch.c - typec switch via a simple GPIO control.
+ *
+ * Copyright 2019 NXP
+ * Author: Jun Li <jun.li@nxp.com>
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/usb/typec_mux.h>
+
+struct gpio_typec_switch {
+	struct typec_switch sw;
+	struct mutex lock;
+	struct gpio_desc *ss_sel;
+};
+
+static int switch_gpio_set(struct typec_switch *sw,
+			   enum typec_orientation orientation)
+{
+	struct gpio_typec_switch *gpio_sw =3D container_of(sw,
+				struct gpio_typec_switch, sw);
+
+	mutex_lock(&gpio_sw->lock);
+
+	switch (orientation) {
+	case TYPEC_ORIENTATION_NORMAL:
+		gpiod_set_value_cansleep(gpio_sw->ss_sel, 1);
+		break;
+	case TYPEC_ORIENTATION_REVERSE:
+		gpiod_set_value_cansleep(gpio_sw->ss_sel, 0);
+		break;
+	case TYPEC_ORIENTATION_NONE:
+		break;
+	}
+
+	mutex_unlock(&gpio_sw->lock);
+
+	return 0;
+}
+
+static int typec_switch_gpio_probe(struct platform_device *pdev)
+{
+	struct gpio_typec_switch	*gpio_sw;
+	struct device			*dev =3D &pdev->dev;
+	int				ret;
+
+	gpio_sw =3D devm_kzalloc(dev, sizeof(*gpio_sw), GFP_KERNEL);
+	if (!gpio_sw)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, gpio_sw);
+
+	gpio_sw->sw.dev =3D dev;
+	gpio_sw->sw.set =3D switch_gpio_set;
+	mutex_init(&gpio_sw->lock);
+
+	/* Get the super speed active channel selection GPIO */
+	gpio_sw->ss_sel =3D devm_gpiod_get(dev, NULL, GPIOD_OUT_LOW);
+	if (IS_ERR(gpio_sw->ss_sel))
+		return PTR_ERR(gpio_sw->ss_sel);
+
+	ret =3D typec_switch_register(&gpio_sw->sw);
+	if (ret) {
+		dev_err(dev, "Error registering typec switch: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int typec_switch_gpio_remove(struct platform_device *pdev)
+{
+	struct gpio_typec_switch *gpio_sw =3D platform_get_drvdata(pdev);
+
+	typec_switch_unregister(&gpio_sw->sw);
+
+	return 0;
+}
+
+static const struct of_device_id of_typec_switch_gpio_match[] =3D {
+	{ .compatible =3D "nxp,ptn36043" },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_typec_switch_gpio_match);
+
+static struct platform_driver typec_switch_gpio_driver =3D {
+	.probe		=3D typec_switch_gpio_probe,
+	.remove		=3D typec_switch_gpio_remove,
+	.driver		=3D {
+		.name	=3D "typec-switch-gpio",
+		.of_match_table =3D of_typec_switch_gpio_match,
+	},
+};
+
+module_platform_driver(typec_switch_gpio_driver);
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("TypeC Super Speed Switch GPIO driver");
+MODULE_AUTHOR("Jun Li <jun.li@nxp.com>");
--=20
2.7.4
