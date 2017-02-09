From: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Subject: [PATCH 1/3 v2] usb: host: fotg2: add device tree probing
Date: Thu, 9 Feb 2017 15:20:49 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1702091513580.6226@T420s>
References: <20170208200010.21522-1-ulli.kroll@googlemail.com> <20170208200010.21522-2-ulli.kroll@googlemail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170208200010.21522-2-ulli.kroll@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org


Add device tree probe for fotg2 driver

v2:
fix in wrong MODULE_DEVICE_TABLE

Signed-off-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>
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
+MODULE_DEVICE_TABLE(of, fotg210_ehci_match);
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
