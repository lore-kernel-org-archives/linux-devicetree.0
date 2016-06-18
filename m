From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5] phy-sun4i-usb: Fix irq free conditions to match request conditions
Date: Sat, 18 Jun 2016 11:31:33 +0200
Message-ID: <1466242293-22393-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

commit 5cf700ac9d50("phy: phy-sun4i-usb: Fix optional gpios failing probe")
changed the condition under which irqs are requested, but omitted matching
changes to sun4i_usb_phy_remove(). This commit fixes this.

Fixes: commit 5cf700ac9d50("phy: phy-sun4i-usb: Fix optional gpios failing probe")
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/phy/phy-sun4i-usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
index 8c2570d..8c7eb33 100644
--- a/drivers/phy/phy-sun4i-usb.c
+++ b/drivers/phy/phy-sun4i-usb.c
@@ -548,9 +548,9 @@ static int sun4i_usb_phy_remove(struct platform_device *pdev)
 
 	if (data->vbus_power_nb_registered)
 		power_supply_unreg_notifier(&data->vbus_power_nb);
-	if (data->id_det_irq >= 0)
+	if (data->id_det_irq > 0)
 		devm_free_irq(dev, data->id_det_irq, data);
-	if (data->vbus_det_irq >= 0)
+	if (data->vbus_det_irq > 0)
 		devm_free_irq(dev, data->vbus_det_irq, data);
 
 	cancel_delayed_work_sync(&data->detect);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
