From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] extcon: palmas: enable ID_GND and ID_FLOAT detection
 always
Date: Tue, 9 Jul 2013 18:34:22 +0530
Message-ID: <1373375064-12012-3-git-send-email-ldewangan@nvidia.com>
References: <1373375064-12012-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373375064-12012-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
List-Id: devicetree@vger.kernel.org

When integrating driver with Tegra platform, it is found that
the ID pins get detected only once after booting system and
further removal and re-insert does not detect the ID pin.

Fixing this issue with enabling interrupt on ID_GND and ID_FLOAT
always  and clearing the status on LATCH register which actually
occurred.

Also if interrupt occurs with line status as zero then based on
previous status, set the cable state.

Add debug prints to display the cable state when any cable
insertion/removal happen.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/extcon/extcon-palmas.c |   24 +++++++++++-------------
 1 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
index b752a0a..587034b 100644
--- a/drivers/extcon/extcon-palmas.c
+++ b/drivers/extcon/extcon-palmas.c
@@ -57,6 +57,7 @@ static irqreturn_t palmas_vbus_irq_handler(int irq, void *_palmas_usb)
 		if (palmas_usb->linkstat != PALMAS_USB_STATE_VBUS) {
 			palmas_usb->linkstat = PALMAS_USB_STATE_VBUS;
 			extcon_set_cable_state(&palmas_usb->edev, "USB", true);
+			dev_info(palmas_usb->dev, "USB cable state: TRUE\n");
 		} else {
 			dev_dbg(palmas_usb->dev,
 				"Spurious connect event detected\n");
@@ -65,6 +66,7 @@ static irqreturn_t palmas_vbus_irq_handler(int irq, void *_palmas_usb)
 		if (palmas_usb->linkstat == PALMAS_USB_STATE_VBUS) {
 			palmas_usb->linkstat = PALMAS_USB_STATE_DISCONNECT;
 			extcon_set_cable_state(&palmas_usb->edev, "USB", false);
+			dev_info(palmas_usb->dev, "USB cable state: FALSE\n");
 		} else {
 			dev_dbg(palmas_usb->dev,
 				"Spurious disconnect event detected\n");
@@ -84,28 +86,23 @@ static irqreturn_t palmas_id_irq_handler(int irq, void *_palmas_usb)
 
 	if (set & PALMAS_USB_ID_INT_SRC_ID_GND) {
 		palmas_write(palmas_usb->palmas, PALMAS_USB_OTG_BASE,
-			PALMAS_USB_ID_INT_EN_HI_SET,
-			PALMAS_USB_ID_INT_EN_HI_SET_ID_FLOAT);
-		palmas_write(palmas_usb->palmas, PALMAS_USB_OTG_BASE,
-			PALMAS_USB_ID_INT_EN_HI_CLR,
-			PALMAS_USB_ID_INT_EN_HI_CLR_ID_GND);
-		palmas_write(palmas_usb->palmas, PALMAS_USB_OTG_BASE,
 			PALMAS_USB_ID_INT_LATCH_CLR,
 			PALMAS_USB_ID_INT_EN_HI_CLR_ID_GND);
 		palmas_usb->linkstat = PALMAS_USB_STATE_ID;
 		extcon_set_cable_state(&palmas_usb->edev, "USB-HOST", true);
+		dev_info(palmas_usb->dev, "HOST cable state: TRUE\n");
 	} else if (set & PALMAS_USB_ID_INT_SRC_ID_FLOAT) {
 		palmas_write(palmas_usb->palmas, PALMAS_USB_OTG_BASE,
-			PALMAS_USB_ID_INT_EN_HI_SET,
-			PALMAS_USB_ID_INT_EN_HI_SET_ID_GND);
-		palmas_write(palmas_usb->palmas, PALMAS_USB_OTG_BASE,
-			PALMAS_USB_ID_INT_EN_HI_CLR,
-			PALMAS_USB_ID_INT_EN_HI_CLR_ID_FLOAT);
-		palmas_write(palmas_usb->palmas, PALMAS_USB_OTG_BASE,
 			PALMAS_USB_ID_INT_LATCH_CLR,
 			PALMAS_USB_ID_INT_EN_HI_CLR_ID_FLOAT);
 		palmas_usb->linkstat = PALMAS_USB_STATE_DISCONNECT;
 		extcon_set_cable_state(&palmas_usb->edev, "USB-HOST", false);
+		dev_info(palmas_usb->dev, "HOST cable state: FALSE\n");
+	} else if ((palmas_usb->linkstat == PALMAS_USB_STATE_ID) &&
+				(!(set & PALMAS_USB_ID_INT_SRC_ID_GND))) {
+		palmas_usb->linkstat = PALMAS_USB_STATE_DISCONNECT;
+		extcon_set_cable_state(&palmas_usb->edev, "USB-HOST", false);
+		dev_info(palmas_usb->dev, "HOST cable state: FALSE\n");
 	}
 
 	return IRQ_HANDLED;
@@ -122,7 +119,8 @@ static void palmas_enable_irq(struct palmas_usb *palmas_usb)
 
 	palmas_write(palmas_usb->palmas, PALMAS_USB_OTG_BASE,
 		PALMAS_USB_ID_INT_EN_HI_SET,
-		PALMAS_USB_ID_INT_EN_HI_SET_ID_GND);
+		PALMAS_USB_ID_INT_EN_HI_SET_ID_GND |
+		PALMAS_USB_ID_INT_EN_HI_SET_ID_FLOAT);
 
 	palmas_vbus_irq_handler(palmas_usb->vbus_irq, palmas_usb);
 
-- 
1.7.1.1
