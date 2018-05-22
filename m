Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC v4 3/4] usb: gadget: udc: renesas_usb3: use usb role switch API
Date: Tue, 22 May 2018 21:01:08 +0900
Message-Id: <1526990469-20739-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1526990469-20739-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526990469-20739-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch uses usb role switch APIs if the register suceeeded.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 9667a5e..d6c11c9 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -338,6 +338,8 @@ struct renesas_usb3 {
 
 	struct usb_role_switch *role_sw;
 	struct device *host_dev;
+	struct work_struct role_work;
+	enum usb_role role;
 
 	struct renesas_usb3_ep *usb3_ep;
 	int num_usb3_eps;
@@ -655,7 +657,15 @@ static void usb3_check_vbus(struct renesas_usb3 *usb3)
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
@@ -663,6 +673,16 @@ static void usb3_set_mode(struct renesas_usb3 *usb3, bool host)
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
@@ -2328,10 +2348,10 @@ static int renesas_usb3_role_switch_set(struct device *dev,
 	pm_runtime_get_sync(dev);
 	if (cur_role == USB_ROLE_HOST && role == USB_ROLE_DEVICE) {
 		device_release_driver(host);
-		usb3_set_mode(usb3, false);
+		_usb3_set_mode(usb3, false);
 	} else if (cur_role == USB_ROLE_DEVICE && role == USB_ROLE_HOST) {
 		/* Must set the mode before device_attach of the host */
-		usb3_set_mode(usb3, true);
+		_usb3_set_mode(usb3, true);
 		/* This device_attach() might sleep */
 		if (device_attach(host) < 0)
 			dev_err(dev, "device_attach(usb3_port) failed\n");
@@ -2726,6 +2746,7 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_dev_create;
 
+	INIT_WORK(&usb3->role_work, renesas_usb3_role_work);
 	usb3->role_sw = usb_role_switch_register(&pdev->dev,
 					&renesas_usb3_role_switch_desc);
 	if (!IS_ERR(usb3->role_sw)) {
-- 
1.9.1
