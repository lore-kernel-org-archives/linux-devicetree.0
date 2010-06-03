From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH] of/usb: fsl_qe_udc.c: fix build breakage
Date: Thu,  3 Jun 2010 02:59:55 +0200
Message-ID: <1275526795-849-1-git-send-email-agust@denx.de>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fixes build error caused by the OF device_node
pointer being moved into struct device

Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
---
 drivers/usb/gadget/fsl_qe_udc.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/fsl_qe_udc.c b/drivers/usb/gadget/fsl_qe_udc.c
index 2928523..82506ca 100644
--- a/drivers/usb/gadget/fsl_qe_udc.c
+++ b/drivers/usb/gadget/fsl_qe_udc.c
@@ -2400,7 +2400,7 @@ EXPORT_SYMBOL(usb_gadget_unregister_driver);
 static struct qe_udc __devinit *qe_udc_config(struct of_device *ofdev)
 {
 	struct qe_udc *udc;
-	struct device_node *np = ofdev->node;
+	struct device_node *np = ofdev->dev.of_node;
 	unsigned int tmp_addr = 0;
 	struct usb_device_para __iomem *usbpram;
 	unsigned int i;
@@ -2525,7 +2525,7 @@ static void qe_udc_release(struct device *dev)
 static int __devinit qe_udc_probe(struct of_device *ofdev,
 			const struct of_device_id *match)
 {
-	struct device_node *np = ofdev->node;
+	struct device_node *np = ofdev->dev.of_node;
 	struct qe_ep *ep;
 	unsigned int ret = 0;
 	unsigned int i;
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
