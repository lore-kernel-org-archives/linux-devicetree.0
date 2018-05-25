Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5] usb: gadget: udc: renesas_usb3: Add register of usb role switch
Date: Fri, 25 May 2018 16:12:56 +0900
Message-Id: <1527232376-5613-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds role switch support for R-Car SoCs into the USB 3.0
peripheral driver. Some R-Car SoCs (e.g. R-Car H3) have USB 3.0
dual-role device controller which has the USB 3.0 xHCI host and
Renesas USB 3.0 peripheral.

Unfortunately, the mode change register (DRD_CON) contains
the USB 3.0 peripheral controller side only. So, this renesas_usb3
driver manages the DRD_CON now. However, in peripheral mode, the host
should stop. Also the host hardware needs to reinitialize its own
registers when the mode changes from peripheral to host mode.
Otherwise, the host cannot work correctly (e.g. detect a device
as high-speed).

To achieve this reinitialization by a driver, this driver also
registers a role switch driver to manage the DRD_CON and get
a device pointer of usb 3.0 host from "companion" property of OF.
Then, when the usb role is changed, renesas_usb3_role_switch_set()
will attach/release the xhci-plat driver to reinitialize the host
hardware.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
This patch set is based on Felipe's usb.git / testing/next branch
(commit id = 47265c067c0d129f3a0e94bc221293a780af9d78).

I remove RFC on this v5 patch because it's simple and acceptable
for upstream, I think :)

Changes from RFC v4:
 - Use "companion" device tree property simply instead of device_connection
   APIs with OF graph.
 - Merge patch 2 and 3 to one.
 - Revise the commit log (I should had revised this on RFC v4 though).

Changes from RFC v3:
 - Rebase latest usb.git / testing/next branch.
 - Add graph parse into device_connection_find_match().
 - Use workqueue to call _usb3_set_mode() in patch 3.
   (I realized renesas_usb3_role_switch_set() cannot run on atomic because
    device_attach() might sleep.)

Changes from RFC v2:
 - Add registering usb role switch into drivers/usb/gadget/udc/renesas_usb3
   because hardware resource (a register) is shared and remove individual
   usb role switch driver/dt-bindings for R-Car.
 - Remove "usb_role_switch_get_by_graph" API because the renesas_usb3 driver
   doesn't need such API now.

Changes from RFC:
 - Remove "device-connection-id" and "usb role switch driver" dt-bingings.
 - Remove drivers/of code.
 - Add a new API for find the connection by using graph on devcon.c and roles.c.
 - Use each new API on the rcar usb role switch and renesas_usb3 drivers.
 - Update the dtsi file for r8a7795.

 drivers/usb/gadget/udc/Kconfig        |  1 +
 drivers/usb/gadget/udc/renesas_usb3.c | 84 ++++++++++++++++++++++++++++++++++-
 2 files changed, 84 insertions(+), 1 deletion(-)

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
index 5caf78b..c1a1824 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -23,6 +23,8 @@
 #include <linux/uaccess.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
+#include <linux/usb/of.h>
+#include <linux/usb/role.h>
 
 /* register definitions */
 #define USB3_AXI_INT_STA	0x008
@@ -335,6 +337,11 @@ struct renesas_usb3 {
 	struct phy *phy;
 	struct dentry *dentry;
 
+	struct usb_role_switch *role_sw;
+	struct device *host_dev;
+	struct work_struct role_work;
+	enum usb_role role;
+
 	struct renesas_usb3_ep *usb3_ep;
 	int num_usb3_eps;
 
@@ -651,7 +658,15 @@ static void usb3_check_vbus(struct renesas_usb3 *usb3)
 	}
 }
 
-static void usb3_set_mode(struct renesas_usb3 *usb3, bool host)
+static void renesas_usb3_role_work(struct work_struct *work)
+{
+	struct renesas_usb3 *usb3 = container_of(work, struct renesas_usb3,
+						 role_work);
+
+	usb_role_switch_set_role(usb3->role_sw, usb3->role);
+}
+
+static void _usb3_set_mode(struct renesas_usb3 *usb3, bool host)
 {
 	if (host)
 		usb3_clear_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
@@ -659,6 +674,16 @@ static void usb3_set_mode(struct renesas_usb3 *usb3, bool host)
 		usb3_set_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
 }
 
+static void usb3_set_mode(struct renesas_usb3 *usb3, bool host)
+{
+	if (usb3->role_sw) {
+		usb3->role = host ? USB_ROLE_HOST : USB_ROLE_DEVICE;
+		schedule_work(&usb3->role_work);
+	} else {
+		_usb3_set_mode(usb3, host);
+	}
+}
+
 static void usb3_vbus_out(struct renesas_usb3 *usb3, bool enable)
 {
 	if (enable)
@@ -2302,6 +2327,41 @@ static int renesas_usb3_set_selfpowered(struct usb_gadget *gadget, int is_self)
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
+		_usb3_set_mode(usb3, false);
+	} else if (cur_role == USB_ROLE_DEVICE && role == USB_ROLE_HOST) {
+		/* Must set the mode before device_attach of the host */
+		_usb3_set_mode(usb3, true);
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
@@ -2417,6 +2477,8 @@ static int renesas_usb3_remove(struct platform_device *pdev)
 	debugfs_remove_recursive(usb3->dentry);
 	device_remove_file(&pdev->dev, &dev_attr_role);
 
+	usb_role_switch_unregister(usb3->role_sw);
+
 	usb_del_gadget_udc(&usb3->gadget);
 	renesas_usb3_dma_free_prd(usb3, &pdev->dev);
 
@@ -2573,6 +2635,12 @@ static void renesas_usb3_init_ram(struct renesas_usb3 *usb3, struct device *dev,
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
@@ -2658,6 +2726,20 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_dev_create;
 
+	INIT_WORK(&usb3->role_work, renesas_usb3_role_work);
+	usb3->role_sw = usb_role_switch_register(&pdev->dev,
+					&renesas_usb3_role_switch_desc);
+	if (!IS_ERR(usb3->role_sw)) {
+		usb3->host_dev = usb_of_get_companion_dev(&pdev->dev);
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
