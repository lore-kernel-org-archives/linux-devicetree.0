From: "David R. Piegdon" <lkml@p23q.org>
Subject: [RFC PATCH 1/2] usb core: dts: allow suggesting usb bus number for
 platform busses
Date: Tue, 27 Nov 2018 16:57:34 +0000
Message-ID: <20181127165734.GB13460@lagavulin.indurad.x>
References: <cover.1543332368.git.lkml@p23q.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1543332368.git.lkml@p23q.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Alan Stern <stern@rowland.harvard.edu>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, Kay Sievers <kay@vrfy.org>, Mark Rutland <mark.rutland@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@ti.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, systemd-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: "David R. Piegdon" <lkml@p23q.org>

systemd allows use of predictable netdev names. these currently do
not work for netdevs connected to USB platform busses, as the id
of the platform bus is not necessarily consistent across kernel
versions. this patch allows setting a suggested bus id for platform
busses. in combination with a suggested systemd-patch, see
https://github.com/systemd/systemd/pull/7273 , this allows persistent
netdev names for such devices.

NOTE: this patch might change ordering of busses on devices that use
platform-busses, if aliases for these busses have already been defined!
---
 drivers/usb/core/hcd.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 487025d31d44..901173d33f6e 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -998,6 +998,7 @@ static void usb_bus_init (struct usb_bus *bus)
 /**
  * usb_register_bus - registers the USB host controller with the usb core
  * @bus: pointer to the bus to register
+ * @suggested_busnum: suggested bus number to use for this bus (e.g. 1 for usb1)
  * Context: !in_interrupt()
  *
  * Assigns a bus number, and links the controller into usbcore data
@@ -1005,24 +1006,33 @@ static void usb_bus_init (struct usb_bus *bus)
  *
  * Return: 0 if successful. A negative error code otherwise.
  */
-static int usb_register_bus(struct usb_bus *bus)
+static int usb_register_bus(struct usb_bus *bus, int suggested_busnum)
 {
 	int result = -E2BIG;
+	int wantnum = suggested_busnum;
 	int busnum;
 
+	if ((wantnum < 1) || (wantnum >= USB_MAXBUS))
+		wantnum = 1;
+
 	mutex_lock(&usb_bus_idr_lock);
-	busnum = idr_alloc(&usb_bus_idr, bus, 1, USB_MAXBUS, GFP_KERNEL);
+	busnum = idr_alloc(&usb_bus_idr, bus, wantnum, USB_MAXBUS, GFP_KERNEL);
 	if (busnum < 0) {
 		pr_err("%s: failed to get bus number\n", usbcore_name);
 		goto error_find_busnum;
 	}
+	if ((suggested_busnum == wantnum) && (busnum != wantnum))
+		dev_warn(bus->controller,
+			"suggested USB bus number %d was already taken\n",
+			suggested_busnum);
 	bus->busnum = busnum;
 	mutex_unlock(&usb_bus_idr_lock);
 
 	usb_notify_add_bus(bus);
 
-	dev_info (bus->controller, "new USB bus registered, assigned bus "
-		  "number %d\n", bus->busnum);
+	dev_info(bus->controller,
+		"new USB bus registered, assigned bus number %d\n",
+		bus->busnum);
 	return 0;
 
 error_find_busnum:
@@ -1040,7 +1050,7 @@ static int usb_register_bus(struct usb_bus *bus)
  */
 static void usb_deregister_bus (struct usb_bus *bus)
 {
-	dev_info (bus->controller, "USB bus %d deregistered\n", bus->busnum);
+	dev_info(bus->controller, "USB bus %d deregistered\n", bus->busnum);
 
 	/*
 	 * NOTE: make sure that all the devices are removed by the
@@ -2728,6 +2738,7 @@ int usb_add_hcd(struct usb_hcd *hcd,
 {
 	int retval;
 	struct usb_device *rhdev;
+	int bus_id = -1;
 
 	if (!hcd->skip_phy_initialization && usb_hcd_is_primary_hcd(hcd)) {
 		hcd->phy_roothub = usb_phy_roothub_alloc(hcd->self.sysdev);
@@ -2772,7 +2783,14 @@ int usb_add_hcd(struct usb_hcd *hcd,
 		goto err_create_buf;
 	}
 
-	retval = usb_register_bus(&hcd->self);
+	if (hcd->self.controller->of_node)
+		bus_id = of_alias_get_id(hcd->self.controller->of_node, "usb");
+
+	if (bus_id > 0)
+		dev_info(hcd->self.controller, "suggested busnum: usb%d\n",
+							bus_id);
+
+	retval = usb_register_bus(&hcd->self, bus_id);
 	if (retval < 0)
 		goto err_register_bus;
 
-- 
2.11.0
