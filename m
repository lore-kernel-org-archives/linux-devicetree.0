Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC v2 4/6] usb: role: rcar-usb3-role-switch: add support for R-Car SoCs
Date: Thu, 26 Apr 2018 20:26:44 +0900
Message-Id: <1524742006-17984-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1524742006-17984-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524742006-17984-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds role switch support for R-Car SoCs. Some R-Car SoCs
(e.g. R-Car H3) have USB 3.0 dual-role device controller which has
the USB 3.0 xHCI host and Renesas USB 3.0 peripheral.

Unfortunately, the mode change register contains the USB 3.0 peripheral
controller side only. So, the USB 3.0 peripheral driver (renesas_usb3)
manages this register. However, in peripheral mode, the host should
stop. Also the host hardware needs to reinitialize its own registers
when the mode changes from peripheral to host mode. Otherwise,
the host cannot work correctly (e.g. detect a device as high-speed).

To achieve this by a driver, this role switch driver manages
the mode change register and attach/release the xhci-plat driver.
The renesas_usb3 udc driver should call devm_of_platform_populate()
to probe this driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/roles/Kconfig                 |  13 ++
 drivers/usb/roles/Makefile                |   1 +
 drivers/usb/roles/rcar-usb3-role-switch.c | 190 ++++++++++++++++++++++++++++++
 3 files changed, 204 insertions(+)
 create mode 100644 drivers/usb/roles/rcar-usb3-role-switch.c

diff --git a/drivers/usb/roles/Kconfig b/drivers/usb/roles/Kconfig
index f5a5e6f..a44cbc7 100644
--- a/drivers/usb/roles/Kconfig
+++ b/drivers/usb/roles/Kconfig
@@ -11,4 +11,17 @@ config USB_ROLES_INTEL_XHCI
 	  To compile the driver as a module, choose M here: the module will
 	  be called intel-xhci-usb-role-switch.
 
+config USB_ROLES_RCAR_USB3
+	tristate "Renesas R-Car USB3.0 Role Switch"
+	depends on OF
+	depends on ARCH_RENESAS || COMPILE_TEST
+	help
+	  Driver for the internal USB role switch for switching the USB data
+	  lines between the xHCI host controller and the Renesas gadget
+	  controller (by using renesas_usb3 driver) found on various Renesas
+	  R-Car SoCs.
+
+	  To compile the driver as a module, choose M here: the module will
+	  be called rcar-usb3-role-switch.
+
 endif # USB_ROLE_SWITCH
diff --git a/drivers/usb/roles/Makefile b/drivers/usb/roles/Makefile
index e44b179..7ce3be3 100644
--- a/drivers/usb/roles/Makefile
+++ b/drivers/usb/roles/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_USB_ROLES_INTEL_XHCI) += intel-xhci-usb-role-switch.o
+obj-$(CONFIG_USB_ROLES_RCAR_USB3) += rcar-usb3-role-switch.o
diff --git a/drivers/usb/roles/rcar-usb3-role-switch.c b/drivers/usb/roles/rcar-usb3-role-switch.c
new file mode 100644
index 0000000..2bcab60
--- /dev/null
+++ b/drivers/usb/roles/rcar-usb3-role-switch.c
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas R-Car USB 3.0 role switch driver
+ *
+ * Copyright (C) 2018  Renesas Electronics Corporation
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/usb/role.h>
+
+#define USB3_DRD_CON		0x218
+#define DRD_CON_PERI_CON	BIT(24)
+
+struct rcar_usb3_role_switch {
+	struct usb_role_switch *role_sw;
+	void __iomem *reg;
+	struct device *host_dev;
+	enum usb_role save_role;	/* for suspend/resume */
+};
+
+static enum usb_role
+rcar_usb3_role_switch_get_mode(struct rcar_usb3_role_switch *rcar_sw)
+{
+	u32 val = readl(rcar_sw->reg + USB3_DRD_CON);
+
+	if (val & DRD_CON_PERI_CON)
+		return USB_ROLE_DEVICE;
+
+	return USB_ROLE_HOST;
+}
+
+static void
+rcar_usb3_role_switch_set_mode(struct rcar_usb3_role_switch *rcar_sw,
+			       bool host)
+{
+	void __iomem *drd_con = rcar_sw->reg + USB3_DRD_CON;
+
+	if (host)
+		writel(readl(drd_con) & ~DRD_CON_PERI_CON, drd_con);
+	else
+		writel(readl(drd_con) | DRD_CON_PERI_CON, drd_con);
+}
+
+static int rcar_usb3_role_switch_set_role(struct device *dev,
+					  enum usb_role role)
+{
+	struct rcar_usb3_role_switch *rcar_sw = dev_get_drvdata(dev);
+	struct device *host = rcar_sw->host_dev;
+	enum usb_role cur_role;
+
+	pm_runtime_get_sync(dev->parent);
+
+	cur_role = rcar_usb3_role_switch_get_mode(rcar_sw);
+	if (cur_role == USB_ROLE_HOST && role == USB_ROLE_DEVICE) {
+		device_release_driver(host);
+		rcar_usb3_role_switch_set_mode(rcar_sw, false);
+	} else if (cur_role == USB_ROLE_DEVICE && role == USB_ROLE_HOST) {
+		/* Must set the mode before device_attach of the host */
+		rcar_usb3_role_switch_set_mode(rcar_sw, true);
+		if (device_attach(host) < 0)
+			dev_err(dev, "device_attach(usb3_port) failed\n");
+	}
+
+	pm_runtime_put(dev->parent);
+
+	return 0;
+}
+
+static enum usb_role rcar_usb3_role_switch_get_role(struct device *dev)
+{
+	struct rcar_usb3_role_switch *rcar_sw = dev_get_drvdata(dev);
+	enum usb_role cur_role;
+
+	pm_runtime_get(dev->parent);
+	cur_role = rcar_usb3_role_switch_get_mode(rcar_sw);
+	pm_runtime_put(dev->parent);
+
+	return cur_role;
+}
+
+static struct usb_role_switch_desc rcar_usb3_role_switch_desc = {
+	.set = rcar_usb3_role_switch_set_role,
+	.get = rcar_usb3_role_switch_get_role,
+};
+
+static const struct of_device_id rcar_usb3_role_switch_of_match[] = {
+	{ .compatible = "renesas,rcar-usb3-role-switch" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rcar_usb3_role_switch_of_match);
+
+static int rcar_usb3_role_switch_remove(struct platform_device *pdev)
+{
+	struct rcar_usb3_role_switch *rcar_sw = platform_get_drvdata(pdev);
+
+	usb_role_switch_unregister(rcar_sw->role_sw);
+	pm_runtime_disable(pdev->dev.parent);
+
+	return 0;
+}
+
+static int rcar_usb3_role_switch_probe(struct platform_device *pdev)
+{
+	struct rcar_usb3_role_switch *rcar_sw;
+	struct resource *res;
+
+	rcar_sw = devm_kzalloc(&pdev->dev, sizeof(*rcar_sw), GFP_KERNEL);
+	if (!rcar_sw)
+		return -ENOMEM;
+
+	res = platform_get_resource(to_platform_device(pdev->dev.parent),
+				    IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	rcar_sw->reg = devm_ioremap_nocache(&pdev->dev, res->start,
+					    resource_size(res));
+	if (IS_ERR(rcar_sw->reg))
+		return PTR_ERR(rcar_sw->reg);
+
+	platform_set_drvdata(pdev, rcar_sw);
+	pm_runtime_enable(pdev->dev.parent);
+
+	rcar_usb3_role_switch_desc.allow_userspace_control = true;
+	rcar_sw->role_sw = usb_role_switch_register(&pdev->dev,
+						&rcar_usb3_role_switch_desc);
+	if (IS_ERR(rcar_sw->role_sw)) {
+		pm_runtime_disable(pdev->dev.parent);
+		return PTR_ERR(rcar_sw->role_sw);
+	}
+
+	rcar_sw->host_dev = device_connection_find_by_graph(&pdev->dev, 0, 0);
+	if (!IS_ERR_OR_NULL(rcar_sw->host_dev)) {
+		dev_info(&pdev->dev, "%s: host_dev = %p (%s)\n", __func__,
+			 rcar_sw->host_dev, dev_name(rcar_sw->host_dev));
+	} else {
+		usb_role_switch_unregister(rcar_sw->role_sw);
+		pm_runtime_disable(pdev->dev.parent);
+		return PTR_ERR(rcar_sw->host_dev);
+	}
+
+	return 0;
+}
+
+static int __maybe_unused rcar_usb3_role_switch_suspend(struct device *dev)
+{
+	struct rcar_usb3_role_switch *rcar_sw = dev_get_drvdata(dev);
+
+	pm_runtime_get_sync(dev->parent);
+	rcar_sw->save_role = rcar_usb3_role_switch_get_mode(rcar_sw);
+	pm_runtime_put(dev->parent);
+
+	return 0;
+}
+
+static int __maybe_unused rcar_usb3_role_switch_resume(struct device *dev)
+{
+	struct rcar_usb3_role_switch *rcar_sw = dev_get_drvdata(dev);
+	bool host = rcar_sw->save_role == USB_ROLE_HOST ? true : false;
+
+	pm_runtime_get_sync(dev->parent);
+	rcar_usb3_role_switch_set_mode(rcar_sw, host);
+	pm_runtime_put(dev->parent);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(rcar_usb3_role_switch_pm_ops,
+			 rcar_usb3_role_switch_suspend,
+			 rcar_usb3_role_switch_resume);
+
+static struct platform_driver rcar_usb3_role_switch_driver = {
+	.probe		= rcar_usb3_role_switch_probe,
+	.remove		= rcar_usb3_role_switch_remove,
+	.driver		= {
+		.name =	"rcar_usb3_role_switch",
+		.pm		= &rcar_usb3_role_switch_pm_ops,
+		.of_match_table = rcar_usb3_role_switch_of_match,
+	},
+};
+module_platform_driver(rcar_usb3_role_switch_driver);
+
+MODULE_DESCRIPTION("Renesas USB3.0 role switch driver");
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>");
-- 
1.9.1
