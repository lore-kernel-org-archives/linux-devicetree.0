From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [RFC PATCH 2/2] usb: Example for how to use device node at usb device driver
Date: Fri, 8 Jan 2016 13:44:24 +0800
Message-ID: <1452231864-11171-3-git-send-email-peter.chen@freescale.com>
References: <1452231864-11171-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452231864-11171-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In this example, we take HUB driver as an example to show how
to get properties in USB device driver if this device has device
node.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6sx-sdb.dtsi | 9 +++++++++
 drivers/usb/core/hub.c            | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sx-sdb.dtsi b/arch/arm/boot/dts/imx6sx-sdb.dtsi
index 94ac400..fe0fd95 100644
--- a/arch/arm/boot/dts/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/imx6sx-sdb.dtsi
@@ -275,6 +275,15 @@
 	vbus-supply = <&reg_usb_otg2_vbus>;
 	dr_mode = "host";
 	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+	hub: genesys@01 {
+		compatible = "05e3,0608";
+		reg = <0x01>;
+		delay-duration-us = <50>;
+	};
+
 };
 
 &usdhc2 {
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 4c77001..1babfd4 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -27,6 +27,7 @@
 #include <linux/random.h>
 #include <linux/pm_qos.h>
 #include <linux/of_platform.h>
+#include <linux/of.h>
 
 #include <asm/uaccess.h>
 #include <asm/byteorder.h>
@@ -1748,6 +1749,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_device *hdev;
 	struct usb_hub *hub;
 	int ret;
+	u32 duration_us = 0;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -1873,6 +1875,12 @@ descriptor_error:
 		return ret;
 	}
 
+	of_property_read_u32(hdev->dev.of_node, "delay-duration-us", &duration_us);
+	if (duration_us > 0) {
+		usleep_range(duration_us, duration_us + 10);
+		dev_info(&hdev->dev, "The delay is %d us\n", duration_us);
+	}
+
 	if (hub_configure(hub, endpoint) >= 0)
 		return 0;
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
