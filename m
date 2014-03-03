From: George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 3/3] phy: omap-usb2: Add different compatible for OMAP5
Date: Mon, 3 Mar 2014 15:52:54 +0530
Message-ID: <1393842174-29868-2-git-send-email-george.cherian@ti.com>
References: <1393841424-27656-1-git-send-email-george.cherian@ti.com>
 <1393842174-29868-1-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393842174-29868-1-git-send-email-george.cherian-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, george.cherian-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a new compatible for OMAP5 since it does not use any of the
OTG operations as of now.
HAS_SRP and SET_VBUS functionalities are used only for OMAP4.

Update the Documentation also to add new comaptible.

Signed-off-by: George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb-phy.txt | 3 ++-
 drivers/phy/phy-omap-usb2.c                       | 9 +++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-phy.txt b/Documentation/devicetree/bindings/usb/usb-phy.txt
index 03de61a5..ec199a5 100644
--- a/Documentation/devicetree/bindings/usb/usb-phy.txt
+++ b/Documentation/devicetree/bindings/usb/usb-phy.txt
@@ -4,7 +4,8 @@ OMAP USB2 PHY
 
 Required properties:
  - compatible: Should be either of
-	* "ti,omap-usb2" for OMAP4 and OMAP5
+	* "ti,omap-usb2" for OMAP4
+	* "ti,omap5-usb2" for OMAP5
 	* "ti,dra7x-usb2" for DRA7
 	* "ti,am437x-usb2" for AM437x
  - reg : Address and length of the register set for the device.
diff --git a/drivers/phy/phy-omap-usb2.c b/drivers/phy/phy-omap-usb2.c
index 80ba7f0..4af778f 100644
--- a/drivers/phy/phy-omap-usb2.c
+++ b/drivers/phy/phy-omap-usb2.c
@@ -176,6 +176,11 @@ static const struct usb_phy_data omap_usb2_data = {
 	.flags = OMAP_USB2_HAS_START_SRP | OMAP_USB2_HAS_SET_VBUS,
 };
 
+static const struct usb_phy_data omap5_usb2_data = {
+	.label = "omap5_usb2",
+	.flags = 0,
+};
+
 static const struct usb_phy_data dra7x_usb2_data = {
 	.label = "dra7x_usb2",
 	.flags = OMAP_USB2_CALIBRATE_FALSE_DISCONNECT,
@@ -192,6 +197,10 @@ static const struct of_device_id omap_usb2_id_table[] = {
 		.data = &omap_usb2_data,
 	},
 	{
+		.compatible = "ti,omap5-usb2",
+		.data = &omap5_usb2_data,
+	},
+	{
 		.compatible = "ti,dra7x-usb2",
 		.data = &dra7x_usb2_data,
 	},
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
