Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC v4 2/4] usb: gadget: udc: renesas_usb3: Add register of usb role switch
Date: Tue, 22 May 2018 21:01:07 +0900
Message-Id: <1526990469-20739-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1526990469-20739-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526990469-20739-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds role switch support for R-Car SoCs into the USB 3.0
peripheral driver. Some R-Car SoCs (e.g. R-Car H3) have USB 3.0
dual-role device controller which has the USB 3.0 xHCI host and
Renesas USB 3.0 peripheral.

Unfortunately, the mode change register contains the USB 3.0 peripheral
controller side only. So, the USB 3.0 peripheral driver (renesas_usb3)
manages this register now. However, in peripheral mode, the host
should stop. Also the host hardware needs to reinitialize its own
registers when the mode changes from peripheral to host mode.
Otherwise, the host cannot work correctly (e.g. detect a device as
high-speed).

To achieve this by a driver, this role switch driver manages
the mode change register and attach/release the xhci-plat driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../devicetree/bindings/usb/renesas_usb3.txt       | 15 ++++
 drivers/usb/gadget/udc/Kconfig                     |  1 +
 drivers/usb/gadget/udc/renesas_usb3.c              | 82 ++++++++++++++++++++++
 3 files changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
index 2c071bb5..f6105aa 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
@@ -19,6 +19,9 @@ Required properties:
 Optional properties:
   - phys: phandle + phy specifier pair
   - phy-names: must be "usb"
+  - The connection to a usb3.0 host node needs by using OF graph bindings for
+    usb role switch.
+   - port@0 = USB3.0 host port.
 
 Example of R-Car H3 ES1.x:
 	usb3_peri0: usb@ee020000 {
@@ -27,6 +30,12 @@ Example of R-Car H3 ES1.x:
 		reg = <0 0xee020000 0 0x400>;
 		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cpg CPG_MOD 328>;
+
+		port {
+			usb3_peri0_ep: endpoint {
+				remote-endpoint = <&usb3_host0_ep>;
+			};
+		};
 	};
 
 	usb3_peri1: usb@ee060000 {
@@ -35,4 +44,10 @@ Example of R-Car H3 ES1.x:
 		reg = <0 0xee060000 0 0x400>;
 		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cpg CPG_MOD 327>;
+
+		port {
+			usb3_peri1_ep: endpoint {
+				remote-endpoint = <&usb3_host1_ep>;
+			};
+		};
 	};
diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index b838cae..78823cd 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -193,6 +193,7 @@ config USB_RENESAS_USB3
 	tristate 'Renesas USB3.0 Peripheral controller'
 	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on EXTCON && HAS_DMA
+	select USB_ROLE_SWITCH
 	help
 	   Renesas USB3.0 Peripheral controller is a USB peripheral controller
 	   that supports super, high, and full speed USB 3.0 data transfers.
diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 5caf78b..9667a5e 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -23,6 +23,7 @@
 #include <linux/uaccess.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
+#include <linux/usb/role.h>
 
 /* register definitions */
 #define USB3_AXI_INT_STA	0x008
@@ -335,6 +336,9 @@ struct renesas_usb3 {
 	struct phy *phy;
 	struct dentry *dentry;
 
+	struct usb_role_switch *role_sw;
+	struct device *host_dev;
+
 	struct renesas_usb3_ep *usb3_ep;
 	int num_usb3_eps;
 
@@ -2302,6 +2306,41 @@ static int renesas_usb3_set_selfpowered(struct usb_gadget *gadget, int is_self)
 	.set_selfpowered	= renesas_usb3_set_selfpowered,
 };
 
+static enum usb_role renesas_usb3_role_switch_get(struct device *dev)
+{
+	struct renesas_usb3 *usb3 = dev_get_drvdata(dev);
+	enum usb_role cur_role;
+
+	pm_runtime_get_sync(dev);
+	cur_role = usb3_is_host(usb3) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
+	pm_runtime_put(dev);
+
+	return cur_role;
+}
+
+static int renesas_usb3_role_switch_set(struct device *dev,
+					enum usb_role role)
+{
+	struct renesas_usb3 *usb3 = dev_get_drvdata(dev);
+	struct device *host = usb3->host_dev;
+	enum usb_role cur_role = renesas_usb3_role_switch_get(dev);
+
+	pm_runtime_get_sync(dev);
+	if (cur_role == USB_ROLE_HOST && role == USB_ROLE_DEVICE) {
+		device_release_driver(host);
+		usb3_set_mode(usb3, false);
+	} else if (cur_role == USB_ROLE_DEVICE && role == USB_ROLE_HOST) {
+		/* Must set the mode before device_attach of the host */
+		usb3_set_mode(usb3, true);
+		/* This device_attach() might sleep */
+		if (device_attach(host) < 0)
+			dev_err(dev, "device_attach(usb3_port) failed\n");
+	}
+	pm_runtime_put(dev);
+
+	return 0;
+}
+
 static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 			  const char *buf, size_t count)
 {
@@ -2417,6 +2456,8 @@ static int renesas_usb3_remove(struct platform_device *pdev)
 	debugfs_remove_recursive(usb3->dentry);
 	device_remove_file(&pdev->dev, &dev_attr_role);
 
+	usb_role_switch_unregister(usb3->role_sw);
+
 	usb_del_gadget_udc(&usb3->gadget);
 	renesas_usb3_dma_free_prd(usb3, &pdev->dev);
 
@@ -2573,6 +2614,33 @@ static void renesas_usb3_init_ram(struct renesas_usb3 *usb3, struct device *dev,
 	EXTCON_NONE,
 };
 
+static int usb3_bus_match(struct device *dev, void *fwnode)
+{
+	if (dev->fwnode != fwnode)
+		return 0;
+
+	return of_device_is_compatible(dev->of_node, "renesas,rcar-gen3-xhci");
+}
+
+static void *usb3_usb_role_match(struct device_connection *con, int ep,
+				 void *data)
+{
+	struct device *dev;
+
+	dev = bus_find_device(&platform_bus_type, NULL, con->fwnode,
+			      usb3_bus_match);
+	if (dev)
+		return dev;
+
+	return ERR_PTR(-EPROBE_DEFER);
+}
+
+static struct usb_role_switch_desc renesas_usb3_role_switch_desc = {
+	.set = renesas_usb3_role_switch_set,
+	.get = renesas_usb3_role_switch_get,
+	.allow_userspace_control = true,
+};
+
 static int renesas_usb3_probe(struct platform_device *pdev)
 {
 	struct renesas_usb3 *usb3;
@@ -2658,6 +2726,20 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_dev_create;
 
+	usb3->role_sw = usb_role_switch_register(&pdev->dev,
+					&renesas_usb3_role_switch_desc);
+	if (!IS_ERR(usb3->role_sw)) {
+		usb3->host_dev = device_connection_find_match(&pdev->dev,
+					NULL, NULL, usb3_usb_role_match);
+		if (IS_ERR_OR_NULL(usb3->host_dev)) {
+			/* If not found, this driver will not use a role sw */
+			usb_role_switch_unregister(usb3->role_sw);
+			usb3->role_sw = NULL;
+		}
+	} else {
+		usb3->role_sw = NULL;
+	}
+
 	usb3->workaround_for_vbus = priv->workaround_for_vbus;
 
 	renesas_usb3_debugfs_init(usb3, &pdev->dev);
-- 
1.9.1
