From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH V2 RFC 1/6] usb: dwc2: core: Avoid nonsense error in gadget mode
Date: Tue, 26 Jul 2016 18:53:28 +0000
Message-ID: <1469559213-16160-2-git-send-email-stefan.wahren@i2se.com>
References: <1469559213-16160-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469559213-16160-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In gadget mode On bcm2835 platform the host tx fifo size could be zero.
So add zero to range and avoid such nonsense errors:

dwc2 20980000.usb: 0 invalid for host_nperio_tx_fifo_size.
dwc2 20980000.usb: Setting host_nperio_tx_fifo_size to 0
dwc2 20980000.usb: 0 invalid for host_perio_tx_fifo_size.
dwc2 20980000.usb: Setting host_perio_tx_fifo_size to 0

Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
---
 drivers/usb/dwc2/core.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index 4135a5f..5645528 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -819,7 +819,10 @@ void dwc2_set_param_host_nperio_tx_fifo_size(struct dwc2_hsotg *hsotg, int val)
 {
 	int valid = 1;
 
-	if (val < 16 || val > hsotg->hw_params.host_nperio_tx_fifo_size)
+	if (val && (val < 16))
+		valid = 0;
+
+	if (val > hsotg->hw_params.host_nperio_tx_fifo_size)
 		valid = 0;
 
 	if (!valid) {
@@ -839,7 +842,10 @@ void dwc2_set_param_host_perio_tx_fifo_size(struct dwc2_hsotg *hsotg, int val)
 {
 	int valid = 1;
 
-	if (val < 16 || val > hsotg->hw_params.host_perio_tx_fifo_size)
+	if (val && (val < 16))
+		valid = 0;
+
+	if (val > hsotg->hw_params.host_perio_tx_fifo_size)
 		valid = 0;
 
 	if (!valid) {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
