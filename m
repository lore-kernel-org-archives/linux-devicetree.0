From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 11/11] misc: implement a dummy early platform driver
Date: Tue, 24 Apr 2018 19:30:51 +0200
Message-ID: <20180424173051.15099-12-brgl@bgdev.pl>
References: <20180424173051.15099-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424173051.15099-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Frank Rowand <frowand.list@gmail.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arend van Spriel <aspriel@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Michal Suchanek <msuchanek@suse.de>, Jan Kiszka <jan.kiszka@siemens.com>, And
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Implement a very simple early platform driver. Its purpose is to show
how such drivers can be registered and to emit a message when probed.

It can be then added to the device tree or machine code to verify that
the early platform devices work as expected.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/misc/Kconfig       |  8 ++++++++
 drivers/misc/Makefile      |  1 +
 drivers/misc/dummy-early.c | 40 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 drivers/misc/dummy-early.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 5d713008749b..bf9b9b355f81 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -91,6 +91,14 @@ config DUMMY_IRQ
 	  The sole purpose of this module is to help with debugging of systems on
 	  which spurious IRQs would happen on disabled IRQ vector.
 
+config DUMMY_EARLY
+	bool "Dummy early platform driver"
+	select EARLY_PLATFORM_DEVICES
+	default n
+	help
+	  This module's only function is to register itself with the early
+	  platform device framework and be probed early in the boot process.
+
 config IBM_ASM
 	tristate "Device driver for IBM RSA service processor"
 	depends on X86 && PCI && INPUT
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 20be70c3f118..84ad0225eb14 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_INTEL_MID_PTI)	+= pti.o
 obj-$(CONFIG_ATMEL_SSC)		+= atmel-ssc.o
 obj-$(CONFIG_ATMEL_TCLIB)	+= atmel_tclib.o
 obj-$(CONFIG_DUMMY_IRQ)		+= dummy-irq.o
+obj-$(CONFIG_DUMMY_EARLY)	+= dummy-early.o
 obj-$(CONFIG_ICS932S401)	+= ics932s401.o
 obj-$(CONFIG_LKDTM)		+= lkdtm/
 obj-$(CONFIG_TIFM_CORE)       	+= tifm_core.o
diff --git a/drivers/misc/dummy-early.c b/drivers/misc/dummy-early.c
new file mode 100644
index 000000000000..b1d555d72ffb
--- /dev/null
+++ b/drivers/misc/dummy-early.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Texas Instruments
+ *
+ * Author:
+ *   Bartosz Golaszewski <bgolaszewski@baylibre.com>
+ *
+ * Dummy testing driver whose only purpose is to be registered and probed
+ * using the early platform device mechanism.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+static int dummy_early_probe(struct platform_device *pdev)
+{
+	dev_notice(&pdev->dev, "dummy-early driver probed!\n");
+
+	return 0;
+}
+
+static const struct of_device_id dummy_early_of_match[] = {
+	{ .compatible = "none,dummy-early", },
+	{ },
+};
+
+static struct platform_driver dummy_early_driver = {
+	.probe = dummy_early_probe,
+	.driver = {
+		.name = "dummy-early",
+		.of_match_table = dummy_early_of_match,
+	},
+};
+early_platform_driver(dummy_early_driver);
+
+MODULE_AUTHOR("Bartosz Golaszewski <bgolaszewski@baylibre.com>");
+MODULE_DESCRIPTION("Dummy early platform device driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.0
