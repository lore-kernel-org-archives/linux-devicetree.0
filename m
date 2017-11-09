From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 7/8] USB: ledtrig-usbport: fix of-node leak
Date: Thu,  9 Nov 2017 18:07:22 +0100
Message-ID: <20171109170723.10960-8-johan@kernel.org>
References: <20171109170723.10960-1-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171109170723.10960-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Alan Stern <stern@rowland.harvard.edu>, Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
List-Id: devicetree@vger.kernel.org

This code looks up a USB device node from a given parent USB device but
never dropped its reference to the returned node.

As only the address of the node is used for a later matching, the
reference can be dropped immediately.

Note that this trigger implementation confuses the description of the
USB device connected to a port with the port itself (which does not have
a device-tree representation).

Fixes: 4f04c210d031 ("usb: core: read USB ports from DT in the usbport LED trigger driver")
Cc: Rafał Miłecki <rafal@milecki.pl>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/core/ledtrig-usbport.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/ledtrig-usbport.c b/drivers/usb/core/ledtrig-usbport.c
index 9dbb429cd471..f1fde5165068 100644
--- a/drivers/usb/core/ledtrig-usbport.c
+++ b/drivers/usb/core/ledtrig-usbport.c
@@ -137,11 +137,17 @@ static bool usbport_trig_port_observed(struct usbport_trig_data *usbport_data,
 	if (!led_np)
 		return false;
 
-	/* Get node of port being added */
+	/*
+	 * Get node of port being added
+	 *
+	 * FIXME: This is really the device node of the connected device
+	 */
 	port_np = usb_of_get_child_node(usb_dev->dev.of_node, port1);
 	if (!port_np)
 		return false;
 
+	of_node_put(port_np);
+
 	/* Amount of trigger sources for this LED */
 	count = of_count_phandle_with_args(led_np, "trigger-sources",
 					   "#trigger-source-cells");
-- 
2.15.0
