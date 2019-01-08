From: "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>
Subject: [PATCH 2/2] EDAC: add ARM Cortex A15 L2 internal asynchronous error
 detection driver
Date: Tue, 8 Jan 2019 08:10:45 +0000
Message-ID: <AM6PR0702MB379953E130CC1E1DEE18B79BFA8A0@AM6PR0702MB3799.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "arnd@arndb.de" <arnd@arndb.de>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "bp@alien8.de" <bp@alien8.de>, "mchehab@kernel.org" <mchehab@kernel.org>"akpm@linux-foundation.org" <akpm@linux-foundation.org>"nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>"arnd@arndb.de" <arnd@arndb.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This driver adds support for L2 internal asynchronous error detection
caused by L2 RAM double-bit ECC error or illegal writes to the
Interrupt Controller memory-map region on the Cortex A15.

Signed-off-by: Wladislav Wiebe <wladislav.wiebe@nokia.com>
---
 MAINTAINERS                             |   1 +
 drivers/edac/Kconfig                    |  11 +++
 drivers/edac/Makefile                   |   1 +
 drivers/edac/cortex_a15_l2_async_edac.c | 134 ++++++++++++++++++++++++++++=
++++
 4 files changed, 147 insertions(+)
 create mode 100644 drivers/edac/cortex_a15_l2_async_edac.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0796ad6e6490..84dc501b2582 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1100,6 +1100,7 @@ L:	linux-edac@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/edac/cortex_a15_l2_async_edac.txt
+F:	drivers/edac/cortex_a15_l2_async_edac.c
=20
 ARM INTEGRATOR, VERSATILE AND REALVIEW SUPPORT
 M:	Linus Walleij <linus.walleij@linaro.org>
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 41c9ccdd20d6..8722203948e0 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -475,4 +475,15 @@ config EDAC_QCOM
 	  For debugging issues having to do with stability and overall system
 	  health, you should probably say 'Y' here.
=20
+config EDAC_CORTEX_A15_L2_ASYNC
+	tristate "Cortex A15 ASYNC L2 & illegal GIC write error detection"
+	depends on ARM
+	help
+	  Support for L2 internal asynchronous error detection caused by L2 RAM
+	  double-bit ECC error or illegal writes to the Interrupt Controller
+	  memory-map region on the Cortex A15.
+
+	  This driver works in interrupt mode triggered by the nINTERRIRQ and
+	  reports only uncorrectable errors.
+
 endif # EDAC
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index 716096d08ea0..12d15cf5ff4e 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -78,3 +78,4 @@ obj-$(CONFIG_EDAC_SYNOPSYS)		+=3D synopsys_edac.o
 obj-$(CONFIG_EDAC_XGENE)		+=3D xgene_edac.o
 obj-$(CONFIG_EDAC_TI)			+=3D ti_edac.o
 obj-$(CONFIG_EDAC_QCOM)			+=3D qcom_edac.o
+obj-$(CONFIG_EDAC_CORTEX_A15_L2_ASYNC)	+=3D cortex_a15_l2_async_edac.o
diff --git a/drivers/edac/cortex_a15_l2_async_edac.c b/drivers/edac/cortex_=
a15_l2_async_edac.c
new file mode 100644
index 000000000000..26252568e961
--- /dev/null
+++ b/drivers/edac/cortex_a15_l2_async_edac.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Nokia Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License f=
or
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along=
 with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+
+#include "edac_module.h"
+
+#define DRIVER_NAME "cortex_a15_l2_async_edac"
+
+#define L2ECTLR_L2_ASYNC_ERR BIT(30)
+
+static irqreturn_t cortex_a15_l2_async_edac_err_handler(int irq, void *dev=
_id)
+{
+	struct edac_device_ctl_info *dci =3D dev_id;
+	u32 status =3D 0;
+
+	/*
+	 * Read and clear L2ECTLR L2 ASYNC error bit caused by INTERRIRQ.
+	 * Reason could be a L2 RAM double-bit ECC error or illegal writes
+	 * to the Interrupt Controller memory-map region.
+	 */
+	asm("mrc p15, 1, %0, c9, c0, 3" : "=3Dr" (status));
+	if (status & L2ECTLR_L2_ASYNC_ERR) {
+		status &=3D ~L2ECTLR_L2_ASYNC_ERR;
+		asm("mcr p15, 1, %0, c9, c0, 3" : : "r" (status));
+		edac_printk(KERN_EMERG, DRIVER_NAME,
+			    "L2 internal asynchronous error occurred!\n");
+		edac_device_handle_ue(dci, 0, 0, dci->ctl_name);
+
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+static int cortex_a15_l2_async_edac_probe(struct platform_device *pdev)
+{
+	struct edac_device_ctl_info *dci;
+	struct device_node *np =3D pdev->dev.of_node;
+	char *ctl_name =3D (char *)np->name;
+	int i =3D 0, ret =3D 0, err_irq =3D 0, irq_count =3D 0;
+
+	/* We can have multiple CPU clusters with one INTERRIRQ per cluster */
+	irq_count =3D platform_irq_count(pdev);
+	if (irq_count < 0) {
+		edac_printk(KERN_ERR, DRIVER_NAME,
+			    "No L2 ASYNC error IRQ found!\n");
+		return -EINVAL;
+	}
+
+	dci =3D edac_device_alloc_ctl_info(0, ctl_name, 1, ctl_name,
+					 irq_count, 0, NULL, 0,
+					 edac_device_alloc_index());
+	if (!dci)
+		return -ENOMEM;
+
+	dci->dev =3D &pdev->dev;
+	dci->mod_name =3D DRIVER_NAME;
+	dci->ctl_name =3D ctl_name;
+	dci->dev_name =3D dev_name(&pdev->dev);
+	platform_set_drvdata(pdev, dci);
+
+	if (edac_device_add_device(dci))
+		goto err;
+
+	for (i =3D 0; i < irq_count; i++) {
+		err_irq =3D platform_get_irq(pdev, i);
+		ret =3D devm_request_irq(&pdev->dev, err_irq,
+				       cortex_a15_l2_async_edac_err_handler, 0,
+				       dev_name(&pdev->dev), dci);
+
+		if (ret < 0) {
+			edac_printk(KERN_ERR, DRIVER_NAME,
+				    "Failed to register L2 ASYNC error IRQ %d\n",
+				     err_irq);
+			goto err2;
+		}
+	}
+
+	return 0;
+err2:
+	edac_device_del_device(&pdev->dev);
+err:
+	edac_device_free_ctl_info(dci);
+
+	return ret;
+}
+
+static int cortex_a15_l2_async_edac_remove(struct platform_device *pdev)
+{
+	struct edac_device_ctl_info *dci =3D platform_get_drvdata(pdev);
+
+	edac_device_del_device(&pdev->dev);
+	edac_device_free_ctl_info(dci);
+
+	return 0;
+}
+
+static const struct of_device_id cortex_a15_l2_async_edac_of_match[] =3D {
+	{ .compatible =3D "arm,cortex-a15-l2-async-edac", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, cortex_a15_l2_async_edac_of_match);
+
+static struct platform_driver cortex_a15_l2_async_edac_driver =3D {
+	.probe =3D cortex_a15_l2_async_edac_probe,
+	.remove =3D cortex_a15_l2_async_edac_remove,
+	.driver =3D {
+		.name =3D DRIVER_NAME,
+		.of_match_table =3D cortex_a15_l2_async_edac_of_match,
+	},
+};
+module_platform_driver(cortex_a15_l2_async_edac_driver);
+
+MODULE_AUTHOR("Wladislav Wiebe <wladislav.wiebe@nokia.com>");
+MODULE_DESCRIPTION("ARM Cortex A15 L2 internal asynchronous error detectio=
n");
+MODULE_LICENSE("GPL v2");
--=20
2.16.1
