Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC v3 2/4] usb: gadget: udc: renesas_usb3: Add register of usb role switch
Date: Mon, 14 May 2018 18:15:58 +0900
Message-Id: <1526289360-3997-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1526289360-3997-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526289360-3997-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds role switch support for R-Car SoCs into the USB
3.0 peripheral driver. Some R-Car SoCs (e.g. R-Car H3) have USB
3.0 dual-role device controller which has the USB 3.0 xHCI host
and Renesas USB 3.0 peripheral.

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
 .../devicetree/bindings/usb/renesas_usb3.txt       | 15 +++++
 drivers/usb/gadget/udc/Kconfig                     |  1 +
 drivers/usb/gadget/udc/renesas_usb3.c              | 68 +++++++++++++++++++++-
 3 files changed, 83 insertions(+), 1 deletion(-)

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
index 0875d38..7e4a5dd 100644
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
index 409cde4..c878449 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -23,6 +23,7 @@
 #include <linux/uaccess.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
+#include <linux/usb/role.h>
 
 /* register definitions */
 #define USB3_AXI_INT_STA	0x008
@@ -334,6 +335,9 @@ struct renesas_usb3 {
 	struct work_struct extcon_work;
 	struct phy *phy;
 
+	struct usb_role_switch *role_sw;
+	struct device *host_dev;
+
 	struct renesas_usb3_ep *usb3_ep;
 	int num_usb3_eps;
 
@@ -643,7 +647,7 @@ static void usb3_check_vbus(struct renesas_usb3 *usb3)
 	}
 }
 
-static void usb3_set_mode(struct renesas_usb3 *usb3, bool host)
+static void _usb3_set_mode(struct renesas_usb3 *usb3, bool host)
 {
 	if (host)
 		usb3_clear_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
@@ -651,6 +655,11 @@ static void usb3_set_mode(struct renesas_usb3 *usb3, bool host)
 		usb3_set_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
 }
 
+static void usb3_set_mode(struct renesas_usb3 *usb3, bool host)
+{
+	_usb3_set_mode(usb3, host);
+}
+
 static void usb3_vbus_out(struct renesas_usb3 *usb3, bool enable)
 {
 	if (enable)
@@ -2294,6 +2303,41 @@ static int renesas_usb3_set_selfpowered(struct usb_gadget *gadget, int is_self)
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
+
+	if (cur_role == USB_ROLE_HOST && role == USB_ROLE_DEVICE) {
+		device_release_driver(host);
+		_usb3_set_mode(usb3, false);
+	} else if (cur_role == USB_ROLE_DEVICE && role == USB_ROLE_HOST) {
+		/* Must set the mode before device_attach of the host */
+		_usb3_set_mode(usb3, true);
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
@@ -2404,6 +2448,8 @@ static int renesas_usb3_remove(struct platform_device *pdev)
 
 	device_remove_file(&pdev->dev, &dev_attr_role);
 
+	usb_role_switch_unregister(usb3->role_sw);
+
 	usb_del_gadget_udc(&usb3->gadget);
 	renesas_usb3_dma_free_prd(usb3, &pdev->dev);
 
@@ -2562,6 +2608,12 @@ static void renesas_usb3_init_ram(struct renesas_usb3 *usb3, struct device *dev,
 	EXTCON_NONE,
 };
 
+static struct usb_role_switch_desc renesas_usb3_role_switch_desc = {
+	.set = renesas_usb3_role_switch_set,
+	.get = renesas_usb3_role_switch_get,
+	.allow_userspace_control = true,
+};
+
 static int renesas_usb3_probe(struct platform_device *pdev)
 {
 	struct renesas_usb3 *usb3;
@@ -2644,6 +2696,20 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	if (IS_ERR(usb3->phy))
 		usb3->phy = NULL;
 
+	usb3->role_sw = usb_role_switch_register(&pdev->dev,
+					&renesas_usb3_role_switch_desc);
+	if (!IS_ERR(usb3->role_sw)) {
+		usb3->host_dev = device_connection_find_by_graph(&pdev->dev,
+								 0, 0);
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
