From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 1/9] usb: chipidea: pci: mark platformdata as static and __devinitdata
Date: Wed, 14 Nov 2012 17:19:02 +0100
Message-ID: <1352909950-32555-2-git-send-email-m.grzeschik@pengutronix.de>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352909950-32555-1-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/usb/chipidea/ci13xxx_pci.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/ci13xxx_pci.c b/drivers/usb/chipidea/ci13xxx_pci.c
index 918e149..97d25c8 100644
--- a/drivers/usb/chipidea/ci13xxx_pci.c
+++ b/drivers/usb/chipidea/ci13xxx_pci.c
@@ -23,17 +23,17 @@
 /******************************************************************************
  * PCI block
  *****************************************************************************/
-struct ci13xxx_platform_data pci_platdata = {
+static struct ci13xxx_platform_data pci_platdata __devinitdata = {
 	.name		= UDC_DRIVER_NAME,
 	.capoffset	= DEF_CAPOFFSET,
 };
 
-struct ci13xxx_platform_data langwell_pci_platdata = {
+static struct ci13xxx_platform_data langwell_pci_platdata __devinitdata = {
 	.name		= UDC_DRIVER_NAME,
 	.capoffset	= 0,
 };
 
-struct ci13xxx_platform_data penwell_pci_platdata = {
+static struct ci13xxx_platform_data penwell_pci_platdata __devinitdata = {
 	.name		= UDC_DRIVER_NAME,
 	.capoffset	= 0,
 	.power_budget	= 200,
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
