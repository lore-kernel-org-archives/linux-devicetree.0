From: Dongjin Kim <tobetter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] usb: misc: usb3503: Adding device tree entry 'disabled-ports'
Date: Wed, 22 May 2013 05:20:09 +0900
Message-ID: <1369167613-27282-2-git-send-email-tobetter@gmail.com>
References: <1369167613-27282-1-git-send-email-tobetter@gmail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1369167613-27282-1-git-send-email-tobetter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Dongjin Kim <tobetter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch is to add a property 'disabled-ports' representing the unused port
of USB3503. USB3503 can support up to 3 USB host port and each ports can be
controlled to be enabled or disabled. Do not describe this property if all
ports must be enabled.

You can represent the ports to disable in the device tree.

	usb3503@08{
		...
		disabled-ports = <2 3>;
		...
	};

Signed-off-by: Dongjin Kim <tobetter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb3503.txt |    5 +++++
 drivers/usb/misc/usb3503.c                        |   14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb3503.txt b/Documentation/devicetree/bindings/usb/usb3503.txt
index 6813a71..8c5be48 100644
--- a/Documentation/devicetree/bindings/usb/usb3503.txt
+++ b/Documentation/devicetree/bindings/usb/usb3503.txt
@@ -4,6 +4,10 @@ Required properties:
 - compatible: Should be "smsc,usb3503".
 - reg: Specifies the i2c slave address, it should be 0x08.
 - connect-gpios: Should specify GPIO for connect.
+- disabled-ports: Should specify the ports unused.
+	'1' or '2' or '3' are availe for this property to describe the port
+	number. 1~3 property values are possible to be desribed.
+	Do not describe this property if all ports have to be enabled.
 - intn-gpios: Should specify GPIO for interrupt.
 - reset-gpios: Should specify GPIO for reset.
 - initial-mode: Should specify initial mode.
@@ -14,6 +18,7 @@ Examples:
 		compatible = "smsc,usb3503";
 		reg = <0x08>;
 		connect-gpios = <&gpx3 0 1>;
+		disabled-ports = <2 3>;
 		intn-gpios = <&gpx3 4 1>;
 		reset-gpios = <&gpx3 5 1>;
 		initial-mode = <1>;
diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
index ab24bb3..1908ec6 100644
--- a/drivers/usb/misc/usb3503.c
+++ b/drivers/usb/misc/usb3503.c
@@ -186,6 +186,8 @@ static int usb3503_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	struct usb3503 *hub;
 	int err = -ENOMEM;
 	u32 mode = USB3503_MODE_UNKNOWN;
+	const u32 *property;
+	int len;
 
 	hub = kzalloc(sizeof(struct usb3503), GFP_KERNEL);
 	if (!hub) {
@@ -203,6 +205,18 @@ static int usb3503_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 		hub->gpio_reset		= pdata->gpio_reset;
 		hub->mode		= pdata->initial_mode;
 	} else if (np) {
+		hub->port_off_mask = 0;
+
+		property = of_get_property(np, "disabled-ports", &len);
+		if (property && (len / sizeof(u32)) > 0) {
+			int i;
+			for (i = 0; i < len / sizeof(u32); i++) {
+				u32 port = be32_to_cpu(property[i]);
+				if ((1 <= port) && (port <= 3))
+					hub->port_off_mask |= (1 << port);
+			}
+		}
+
 		hub->gpio_intn	= of_get_named_gpio(np, "connect-gpios", 0);
 		if (hub->gpio_intn == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
