From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] usb: renesas_usbhs: add a compatible string for r8a7796
Date: Wed, 24 Aug 2016 16:39:53 +0900
Message-ID: <1472024393-20956-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for r8a7796 (R-Car M3-W).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 1 +
 drivers/usb/renesas_usbhs/common.c                      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index b604056..9e18e00 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -9,6 +9,7 @@ Required properties:
 	- "renesas,usbhs-r8a7793" for r8a7793 (R-Car M2-N) compatible device
 	- "renesas,usbhs-r8a7794" for r8a7794 (R-Car E2) compatible device
 	- "renesas,usbhs-r8a7795" for r8a7795 (R-Car H3) compatible device
+	- "renesas,usbhs-r8a7796" for r8a7796 (R-Car M3-W) compatible device
 	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 compatible device
 	- "renesas,rcar-gen3-usbhs" for R-Car Gen3 compatible device
 
diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index ac67bab..012a37a 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -482,6 +482,10 @@ static const struct of_device_id usbhs_of_match[] = {
 		.data = (void *)USBHS_TYPE_RCAR_GEN3,
 	},
 	{
+		.compatible = "renesas,usbhs-r8a7796",
+		.data = (void *)USBHS_TYPE_RCAR_GEN3,
+	},
+	{
 		.compatible = "renesas,rcar-gen2-usbhs",
 		.data = (void *)USBHS_TYPE_RCAR_GEN2,
 	},
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
