Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 05/11] usb: common: roles: add fwnode graph parsing
Date: Wed, 18 Apr 2018 17:09:59 +0900
Message-Id: <1524039005-30618-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, p.zabel@pengutronix.de, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds fwnode graph parsing to set usb[23]_port and udc
into the usb_role_switch structure by usb_role_switch_register().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/common/roles.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/common/roles.c b/drivers/usb/common/roles.c
index 15cc76e..cc1c55a 100644
--- a/drivers/usb/common/roles.c
+++ b/drivers/usb/common/roles.c
@@ -11,6 +11,8 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of_platform.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 static struct class *role_class;
@@ -219,6 +221,42 @@ static void usb_role_switch_release(struct device *dev)
 	.release = usb_role_switch_release,
 };
 
+static void usb_role_parse_fwnode_graph(struct usb_role_switch *sw)
+{
+	struct fwnode_handle *parent = sw->dev.parent->fwnode;
+	struct fwnode_handle *child_ep, *child_port;
+	struct fwnode_handle *remote;
+	/* This order comes from DT bindings */
+	struct device **dev[] = {
+		&sw->usb2_port,
+		&sw->usb3_port,
+		&sw->udc,
+	};
+	u32 port;
+
+	fwnode_graph_for_each_endpoint(parent, child_ep) {
+		child_port = fwnode_get_parent(child_ep);
+		if (!child_port)
+			continue;
+
+		if (fwnode_property_read_u32(child_port, "reg", &port) < 0)
+			continue;
+
+		if (port >= ARRAY_SIZE(dev))
+			break;
+
+		remote = fwnode_graph_get_remote_port_parent(child_ep);
+		if (remote) {
+			struct device_node *remote_np = to_of_node(remote);
+			struct platform_device *pdev;
+
+			pdev = of_find_device_by_node(remote_np);
+			if (pdev)
+				*dev[port] = &pdev->dev;
+		}
+	};
+}
+
 /**
  * usb_role_switch_register - Register USB Role Switch
  * @parent: Parent device for the switch
@@ -267,7 +305,7 @@ struct usb_role_switch *
 		return ERR_PTR(ret);
 	}
 
-	/* TODO: Symlinks for the host port and the device controller. */
+	usb_role_parse_fwnode_graph(sw);
 
 	return sw;
 }
-- 
1.9.1
