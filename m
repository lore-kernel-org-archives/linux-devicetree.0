From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 07/10 v2] usb: Make sure that DWC2 initializes after the power channel mailbox driver.
Date: Tue,  3 Mar 2015 12:32:58 -0800
Message-ID: <1425414778-30820-1-git-send-email-eric@anholt.net>
References: <20150303083250.GG6976@x1>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150303083250.GG6976@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This gets USB working on the Raspberry Pi without relying on U-Boot to
send the power message for us.  Without it, you would get warnings
about fifo sizes and "dwc2_core_reset() HANG! Soft Reset
GRSTCTL=80000001" leading to a failed probe.

v2: Make the export of the has-the-mailbox-driver-loaded bool be
    through a function call defined in include/linux/platform/

Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---

This would be the first include file in include/linux/platform/.  Is
that the right place?  I see a few
arch/arm/mach-*/include/mach/platform.h files -- would that or
arch/arm/mach-bcm/include/mach/bcm2835-platform.h possibly be the right
place instead?

Also, Lee, since you mostly typed the contents of that header, should
your SoB go on this?

drivers/mailbox/bcm2835-mailbox-power.c | 11 +++++++++++
 drivers/usb/dwc2/platform.c             |  8 ++++++++
 include/linux/platform/bcm2835.h        | 18 ++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 include/linux/platform/bcm2835.h

diff --git a/drivers/mailbox/bcm2835-mailbox-power.c b/drivers/mailbox/bcm2835-mailbox-power.c
index f09c855..a3ed773 100644
--- a/drivers/mailbox/bcm2835-mailbox-power.c
+++ b/drivers/mailbox/bcm2835-mailbox-power.c
@@ -19,6 +19,7 @@
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/platform/bcm2835.h>
 
 #define BCM_POWER_USB (1 << 3)
 #define BCM_MBOX_DATA_SHIFT 4
@@ -31,6 +32,14 @@ struct bcm_mbox_power {
 	uint32_t response;
 };
 
+static bool bcm2835_mbox_power_initialized;
+
+bool bcm2835_mbox_is_usb_powered(void)
+{
+	return bcm2835_mbox_power_initialized;
+}
+EXPORT_SYMBOL_GPL(bcm2835_mbox_is_usb_powered);
+
 struct bcm_mbox_power *mbox_power;
 
 static void response_callback(struct mbox_client *cl, void *mssg)
@@ -92,6 +101,7 @@ static int bcm2835_mbox_power_probe(struct platform_device *pdev)
 		bcm_mbox_set_power(BCM_POWER_USB);
 		bcm2835_mbox_power_initialized = true;
 	}
+	bcm2835_mbox_power_initialized = true;
 
 	return ret;
 }
@@ -99,6 +109,7 @@ static int bcm2835_mbox_power_probe(struct platform_device *pdev)
 static int bcm2835_mbox_power_remove(struct platform_device *pdev)
 {
 	bcm_mbox_set_power(0);
+	bcm2835_mbox_power_initialized = false;
 
 	mbox_free_channel(mbox_power->chan);
 
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index ae095f0..caca216 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -42,6 +42,7 @@
 #include <linux/of_device.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/platform/bcm2835.h>
 
 #include <linux/usb/of.h>
 
@@ -175,6 +176,13 @@ static int dwc2_driver_probe(struct platform_device *dev)
 		defparams.dma_desc_enable = 0;
 	}
 
+	/*
+	 * Make sure the platform driver for enabling the power has
+	 * initialized before we do.
+	 */
+	if (params == &params_bcm2835 && !bcm2835_is_usb_powered())
+		return -EPROBE_DEFER;
+
 	hsotg = devm_kzalloc(&dev->dev, sizeof(*hsotg), GFP_KERNEL);
 	if (!hsotg)
 		return -ENOMEM;
diff --git a/include/linux/platform/bcm2835.h b/include/linux/platform/bcm2835.h
new file mode 100644
index 0000000..a97d938
--- /dev/null
+++ b/include/linux/platform/bcm2835.h
@@ -0,0 +1,18 @@
+#ifdef CONFIG_BCM2835_MBOX
+bool bcm2835_mbox_is_usb_powered(void);
+
+static inline bool bcm2835_is_usb_powered(void)
+{
+	return bcm2835_mbox_is_usb_powered();
+}
+#else
+static inline bool bcm2835_is_usb_powered(void)
+{
+	/*
+	 * If BCM2835 isn't using its Mailbox driver, the bootloader
+	 * is charged with powering up USB.
+	 */
+	return true;
+}
+#endif
+
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
