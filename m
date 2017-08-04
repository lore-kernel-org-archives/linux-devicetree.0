From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 2/3] usb: gadget: udc: renesas_usb3: add support for R-Car H3 ES2.0
Date: Fri,  4 Aug 2017 11:16:57 +0900
Message-ID: <1501813018-6116-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1501813018-6116-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501813018-6116-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for R-Car H3 ES2.0. Since this SoC revision
doesn't need workaround for vbus detection and number of ramif is
increased. So, this driver uses soc_device_match() to detect it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 3415d32..aa2b185 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -21,6 +21,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/sys_soc.h>
 #include <linux/uaccess.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
@@ -2487,22 +2488,36 @@ static void renesas_usb3_init_ram(struct renesas_usb3 *usb3, struct device *dev,
 	}
 }
 
-static const struct renesas_usb3_priv renesas_usb3_priv_r8a7795 = {
+static const struct renesas_usb3_priv renesas_usb3_priv_r8a7795_es1 = {
 	.ramsize_per_ramif = SZ_16K,
 	.num_ramif = 2,
 	.ramsize_per_pipe = SZ_4K,
 	.workaround_for_vbus = true,
 };
 
+static const struct renesas_usb3_priv renesas_usb3_priv_gen3 = {
+	.ramsize_per_ramif = SZ_16K,
+	.num_ramif = 4,
+	.ramsize_per_pipe = SZ_4K,
+};
+
 static const struct of_device_id usb3_of_match[] = {
 	{
 		.compatible = "renesas,r8a7795-usb3-peri",
-		.data = &renesas_usb3_priv_r8a7795,
+		.data = &renesas_usb3_priv_gen3,
 	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, usb3_of_match);
 
+static const struct soc_device_attribute renesas_usb3_quirks_match[] = {
+	{
+		.soc_id = "r8a7795", .revision = "ES1.*",
+		.data = &renesas_usb3_priv_r8a7795_es1,
+	},
+	{ /* sentinel */ },
+};
+
 static const unsigned int renesas_usb3_cable[] = {
 	EXTCON_USB,
 	EXTCON_USB_HOST,
@@ -2516,11 +2531,17 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	const struct of_device_id *match;
 	int irq, ret;
 	const struct renesas_usb3_priv *priv;
+	const struct soc_device_attribute *attr;
 
 	match = of_match_node(usb3_of_match, pdev->dev.of_node);
 	if (!match)
 		return -ENODEV;
-	priv = match->data;
+
+	attr = soc_device_match(renesas_usb3_quirks_match);
+	if (attr)
+		priv = attr->data;
+	else
+		priv = match->data;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
