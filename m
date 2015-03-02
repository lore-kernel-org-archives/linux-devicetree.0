From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 07/10] usb: Make sure that DWC2 initializes after the power channel mailbox driver.
Date: Mon,  2 Mar 2015 12:54:41 -0800
Message-ID: <1425329684-23968-8-git-send-email-eric@anholt.net>
References: <1425329684-23968-1-git-send-email-eric@anholt.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425329684-23968-1-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This gets USB working on the Raspberry Pi without relying on U-Boot to
send the power message for us.  Without it, you would get warnings
about fifo sizes and "dwc2_core_reset() HANG! Soft Reset
GRSTCTL=80000001" leading to a failed probe.

Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 drivers/mailbox/bcm2835-mailbox-power.c |  5 +++++
 drivers/usb/dwc2/platform.c             | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/mailbox/bcm2835-mailbox-power.c b/drivers/mailbox/bcm2835-mailbox-power.c
index f09c855..d0faca2 100644
--- a/drivers/mailbox/bcm2835-mailbox-power.c
+++ b/drivers/mailbox/bcm2835-mailbox-power.c
@@ -31,6 +31,9 @@ struct bcm_mbox_power {
 	uint32_t response;
 };
 
+bool bcm2835_mbox_power_initialized;
+EXPORT_SYMBOL_GPL(bcm2835_mbox_power_initialized);
+
 struct bcm_mbox_power *mbox_power;
 
 static void response_callback(struct mbox_client *cl, void *mssg)
@@ -92,6 +95,7 @@ static int bcm2835_mbox_power_probe(struct platform_device *pdev)
 		bcm_mbox_set_power(BCM_POWER_USB);
 		bcm2835_mbox_power_initialized = true;
 	}
+	bcm2835_mbox_power_initialized = true;
 
 	return ret;
 }
@@ -99,6 +103,7 @@ static int bcm2835_mbox_power_probe(struct platform_device *pdev)
 static int bcm2835_mbox_power_remove(struct platform_device *pdev)
 {
 	bcm_mbox_set_power(0);
+	bcm2835_mbox_power_initialized = false;
 
 	mbox_free_channel(mbox_power->chan);
 
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index ae095f0..2a4a3a6 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -136,6 +136,20 @@ static const struct of_device_id dwc2_of_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, dwc2_of_match_table);
 
+extern bool bcm2835_mbox_power_initialized;
+
+bool bcm2835_usb_power_enabled(void)
+{
+#ifdef CONFIG_BCM2835_MBOX
+	return bcm2835_mbox_power_initialized;
+#else
+	/* Assume that somebody else has enabled the power for us
+	 * (like U-Boot).
+	 */
+	return true;
+#endif
+}
+
 /**
  * dwc2_driver_probe() - Called when the DWC_otg core is bound to the DWC_otg
  * driver
@@ -175,6 +189,12 @@ static int dwc2_driver_probe(struct platform_device *dev)
 		defparams.dma_desc_enable = 0;
 	}
 
+	/* Make sure the platform driver for enabling the power has
+	 * initialized before we do.
+	 */
+	if (params == &params_bcm2835 && !bcm2835_usb_power_enabled())
+		return -EPROBE_DEFER;
+
 	hsotg = devm_kzalloc(&dev->dev, sizeof(*hsotg), GFP_KERNEL);
 	if (!hsotg)
 		return -ENOMEM;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
