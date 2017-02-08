From: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 1/3] usb: host: fotg2: add devicetree probing
Date: Wed,  8 Feb 2017 21:00:08 +0100
Message-ID: <20170208200010.21522-2-ulli.kroll@googlemail.com>
References: <20170208200010.21522-1-ulli.kroll@googlemail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170208200010.21522-1-ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 drivers/usb/host/fotg210-hcd.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/usb/host/fotg210-hcd.c b/drivers/usb/host/fotg210-hcd.c
index 9d0b0518290a..2acc51b0be5a 100644
--- a/drivers/usb/host/fotg210-hcd.c
+++ b/drivers/usb/host/fotg210-hcd.c
@@ -23,6 +23,7 @@
  * Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/device.h>
 #include <linux/dmapool.h>
 #include <linux/kernel.h>
@@ -5600,6 +5601,15 @@ static int fotg210_hcd_probe(struct platform_device *pdev)
 	if (usb_disabled())
 		return -ENODEV;
 
+	/* Right now device-tree probed devices don't get dma_mask set.
+	 * Since shared usb code relies on it, set it here for now.
+	 * Once we have dma capability bindings this can go away.
+	 */
+
+	retval = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (retval)
+		goto fail_create_hcd;
+
 	pdev->dev.power.power_state = PMSG_ON;
 
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
@@ -5676,9 +5686,18 @@ static int fotg210_hcd_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id fotg210_ehci_match[] = {
+	{ .compatible = "faraday,fotg210-hcd" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, exynos_ehci_match);
+#endif
+
 static struct platform_driver fotg210_hcd_driver = {
 	.driver = {
 		.name   = "fotg210-hcd",
+		.of_match_table = of_match_ptr(fotg210_ehci_match),
 	},
 	.probe  = fotg210_hcd_probe,
 	.remove = fotg210_hcd_remove,
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
