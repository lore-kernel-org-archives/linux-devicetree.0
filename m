From: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Subject: [PATCH 1/3 v3] usb: host: fotg2: add device tree probing
Date: Fri, 17 Feb 2017 12:06:29 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1702171202140.12334@T420s>
References: <20170208200010.21522-1-ulli.kroll@googlemail.com> <20170208200010.21522-2-ulli.kroll@googlemail.com> <alpine.LNX.2.00.1702091513580.6226@T420s>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1702091513580.6226@T420s>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org


Add device tree probing for fotg2-hcd driver
This device in a dual role hcd/otg device and it's used on Gemini Soc.

Currently all Gemini Soc based devices uses only the hcd part.

v2:
fix wrong name in MODULE_DEVICE_TABLE()

v3:
better commit message
remove dma_coerce_mask_and_coherent() suggested by Arnd

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>
---
 drivers/usb/host/fotg210-hcd.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/host/fotg210-hcd.c 
b/drivers/usb/host/fotg210-hcd.c
index 9d0b0518290a..ff6e4275fcf6 100644
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
@@ -5676,9 +5677,18 @@ static int fotg210_hcd_remove(struct 
platform_device *pdev)
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
