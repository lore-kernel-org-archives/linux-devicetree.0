Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: role: rcar-usb3-role-switch: add support for R-Car SoCs
Date: Tue, 10 Apr 2018 21:03:46 +0900
Message-Id: <1523361826-8772-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
 .../bindings/usb/renesas,rcar-usb3-role-sw.txt     |  23 +++
 drivers/usb/roles/Kconfig                          |  12 ++
 drivers/usb/roles/Makefile                         |   1 +
 drivers/usb/roles/rcar-usb3-role-switch.c          | 200 +++++++++++++++++++++
 4 files changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt
 create mode 100644 drivers/usb/roles/rcar-usb3-role-switch.c

diff --git a/Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt b/Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt
new file mode 100644
index 0000000..752bc16
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt
@@ -0,0 +1,23 @@
+Renesas Electronics R-Car USB 3.0 role switch driver
+
+A renesas_usb3's node can contain this node.
+
+Required properties:
+ - compatible: Must contain "renesas,rcar-usb3-role-switch".
+ - renesas,host: phandle of the usb3.0 host.
+
+Example of R-Car H3 ES2.0:
+	usb3_peri0: usb@ee020000 {
+		compatible = "renesas,r8a7795-usb3-peri",
+			     "renesas,rcar-gen3-usb3-peri";
+		reg = <0 0xee020000 0 0x400>;
+		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD 328>;
+		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+		resets = <&cpg 328>;
+
+		usb3-role-sw {
+			compatible = "renesas,rcar-usb3-role-switch";
+			renesas,host = <&xhci0>;
+		};
+	};
diff --git a/drivers/usb/roles/Kconfig b/drivers/usb/roles/Kconfig
index f5a5e6f..8218035 100644
--- a/drivers/usb/roles/Kconfig
+++ b/drivers/usb/roles/Kconfig
@@ -11,4 +11,16 @@ config USB_ROLES_INTEL_XHCI
 	  To compile the driver as a module, choose M here: the module will
 	  be called intel-xhci-usb-role-switch.
 
+config USB_ROLES_RCAR_USB3
+	tristate "Renesas R-Car USB3.0 Role Switch"
+	depends on ARCH_RENESAS
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
index 0000000..90648a1
--- /dev/null
+++ b/drivers/usb/roles/rcar-usb3-role-switch.c
@@ -0,0 +1,200 @@
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
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <linux/usb/role.h>
+
+#define USB3_DRD_CON		0x218
+#define DRD_CON_PERI_CON	BIT(24)
+
+struct rcar_usb3_role_switch {
+	struct usb_role_switch *role_sw;
+	struct usb_role_switch_desc *desc;
+	void __iomem *reg;
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
+	enum usb_role cur_role;
+
+	pm_runtime_get_sync(dev->parent);
+
+	cur_role = rcar_usb3_role_switch_get_mode(rcar_sw);
+	if (cur_role == USB_ROLE_HOST && role == USB_ROLE_DEVICE) {
+		device_release_driver(rcar_sw->desc->usb3_port);
+		rcar_usb3_role_switch_set_mode(rcar_sw, false);
+	} else if (cur_role == USB_ROLE_DEVICE && role == USB_ROLE_HOST) {
+		/* Must set the mode before device_attach of the host */
+		rcar_usb3_role_switch_set_mode(rcar_sw, true);
+		if (device_attach(rcar_sw->desc->usb3_port) < 0)
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
+	{ },
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
+	struct device_node *host_node;
+	struct platform_device *pdev_host;
+
+	rcar_sw = devm_kzalloc(&pdev->dev, sizeof(*rcar_sw), GFP_KERNEL);
+	if (!rcar_sw)
+		return -ENOMEM;
+
+	res = platform_get_resource(to_platform_device(pdev->dev.parent),
+				    IORESOURCE_MEM, 0);
+	/* Avoid devm_request_mem_region() calling by devm_ioremap_resource() */
+	rcar_sw->reg = devm_ioremap_nocache(&pdev->dev, res->start,
+					    resource_size(res));
+	if (IS_ERR(rcar_sw->reg))
+		return PTR_ERR(rcar_sw->reg);
+
+	platform_set_drvdata(pdev, rcar_sw);
+
+	host_node = of_parse_phandle(pdev->dev.of_node, "renesas,host", 0);
+	if (!host_node)
+		return -ENODEV;
+
+	pdev_host = of_find_device_by_node(host_node);
+	if (!pdev_host)
+		return -ENODEV;
+
+	of_node_put(host_node);
+
+	rcar_usb3_role_switch_desc.usb3_port = &pdev_host->dev;
+
+	pm_runtime_enable(pdev->dev.parent);
+
+	rcar_usb3_role_switch_desc.allow_userspace_control = true;
+	rcar_sw->desc = &rcar_usb3_role_switch_desc;
+	rcar_sw->role_sw = usb_role_switch_register(&pdev->dev,
+						&rcar_usb3_role_switch_desc);
+	if (IS_ERR(rcar_sw->role_sw)) {
+		pm_runtime_disable(pdev->dev.parent);
+		return PTR_ERR(rcar_sw->role_sw);
+	}
+
+	dev_info(&pdev->dev, "probed\n");
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int rcar_usb3_role_switch_suspend(struct device *dev)
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
+static int rcar_usb3_role_switch_resume(struct device *dev)
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
+#endif
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
+		.of_match_table = of_match_ptr(rcar_usb3_role_switch_of_match),
+	},
+};
+module_platform_driver(rcar_usb3_role_switch_driver);
+
+MODULE_DESCRIPTION("Renesas USB3.0 role switch driver");
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>");
+MODULE_ALIAS("platform:rcar_usb3_role_switch");
-- 
1.9.1
