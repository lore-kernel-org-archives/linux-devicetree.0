Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 09/11] usb: gadget: udc: renesas_usb3: add support for a usb role switch
Date: Wed, 18 Apr 2018 17:10:03 +0900
Message-Id: <1524039005-30618-10-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, p.zabel@pengutronix.de, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds support for a usb role switch driver. And then,
this driver uses the usb role switch APIs instead of hardware
access to initialize usb host side at specific timings.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/Kconfig        |  1 +
 drivers/usb/gadget/udc/renesas_usb3.c | 34 ++++++++++++++++++++++++++++------
 2 files changed, 29 insertions(+), 6 deletions(-)

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
index 409cde4..38dd759 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -23,6 +23,7 @@
 #include <linux/uaccess.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
+#include <linux/usb/role.h>
 
 /* register definitions */
 #define USB3_AXI_INT_STA	0x008
@@ -330,6 +331,7 @@ struct renesas_usb3 {
 
 	struct usb_gadget gadget;
 	struct usb_gadget_driver *driver;
+	struct usb_role_switch *role_sw;	/* Optional */
 	struct extcon_dev *extcon;
 	struct work_struct extcon_work;
 	struct phy *phy;
@@ -454,7 +456,11 @@ static void usb3_disable_pipe_irq(struct renesas_usb3 *usb3, int num)
 
 static bool usb3_is_host(struct renesas_usb3 *usb3)
 {
-	return !(usb3_read(usb3, USB3_DRD_CON) & DRD_CON_PERI_CON);
+	if (usb3->role_sw)
+		return usb_role_switch_get_role(usb3->role_sw) ==
+						USB_ROLE_HOST ? true : false;
+	else
+		return !(usb3_read(usb3, USB3_DRD_CON) & DRD_CON_PERI_CON);
 }
 
 static void usb3_init_axi_bridge(struct renesas_usb3 *usb3)
@@ -645,10 +651,16 @@ static void usb3_check_vbus(struct renesas_usb3 *usb3)
 
 static void usb3_set_mode(struct renesas_usb3 *usb3, bool host)
 {
-	if (host)
-		usb3_clear_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
-	else
-		usb3_set_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
+	if (usb3->role_sw) {
+		enum usb_role role = host ? USB_ROLE_HOST : USB_ROLE_DEVICE;
+
+		usb_role_switch_set_role(usb3->role_sw, role);
+	} else {
+		if (host)
+			usb3_clear_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
+		else
+			usb3_set_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
+	}
 }
 
 static void usb3_vbus_out(struct renesas_usb3 *usb3, bool enable)
@@ -663,8 +675,8 @@ static void usb3_mode_config(struct renesas_usb3 *usb3, bool host, bool a_dev)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&usb3->lock, flags);
 	usb3_set_mode(usb3, host);
+	spin_lock_irqsave(&usb3->lock, flags);
 	usb3_vbus_out(usb3, a_dev);
 	/* for A-Peripheral or forced B-device mode */
 	if ((!host && a_dev) ||
@@ -2238,6 +2250,10 @@ static int renesas_usb3_start(struct usb_gadget *gadget,
 	/* hook up the driver */
 	usb3->driver = driver;
 
+	usb3->role_sw = usb_role_switch_get(usb3_to_dev(usb3));
+	if (IS_ERR_OR_NULL(usb3->role_sw))
+		usb3->role_sw = NULL;
+
 	if (usb3->phy)
 		phy_init(usb3->phy);
 
@@ -2260,6 +2276,8 @@ static int renesas_usb3_stop(struct usb_gadget *gadget)
 	if (usb3->phy)
 		phy_exit(usb3->phy);
 
+	usb_role_switch_put(usb3->role_sw);
+
 	pm_runtime_put(usb3_to_dev(usb3));
 
 	return 0;
@@ -2632,6 +2650,10 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_add_udc;
 
+	ret = devm_of_platform_populate(&pdev->dev);
+	if (ret < 0)
+		goto err_dev_create;
+
 	ret = device_create_file(&pdev->dev, &dev_attr_role);
 	if (ret < 0)
 		goto err_dev_create;
-- 
1.9.1
