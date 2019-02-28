From: Mans Rullgard <mans@mansr.com>
Subject: [PATCH 2/2] usb: hub: use non-removable-ports DT property
Date: Thu, 28 Feb 2019 18:45:40 +0000
Message-ID: <20190228184540.24570-2-mans@mansr.com>
References: <20190228184540.24570-1-mans@mansr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228184540.24570-1-mans@mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Mark any ports listed in the non-removable-ports DT property as
hardwired. This is useful for boards with built-in USB devices
that cannot be (or have not been) marked as fixed in hardware.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 drivers/usb/core/hub.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3adff4da2ee1..44ac49a30be1 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1328,6 +1328,9 @@ static int hub_configure(struct usb_hub *hub,
 	unsigned unit_load;
 	unsigned full_load;
 	unsigned maxchild;
+	struct property *prop;
+	const __be32 *cur;
+	u32 val;
 
 	hub->buffer = kmalloc(sizeof(*hub->buffer), GFP_KERNEL);
 	if (!hub->buffer) {
@@ -1629,6 +1632,17 @@ static int hub_configure(struct usb_hub *hub,
 		}
 	}
 
+	of_property_for_each_u32(hub_dev->of_node, "non-removable-ports",
+				 prop, cur, val) {
+		if (val < 1 || val > hdev->maxchild) {
+			dev_warn(hub_dev, "port number %u out of range\n", val);
+			continue;
+		}
+
+		hub->ports[val - 1]->connect_type =
+			USB_PORT_CONNECT_TYPE_HARD_WIRED;
+	}
+
 	usb_hub_adjust_deviceremovable(hdev, hub->descriptor);
 
 	hub_activate(hub, HUB_INIT);
-- 
2.20.1
