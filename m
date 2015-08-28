From: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: [RFC 4/4] usb: musb: use of_dev_get_platdata()
Date: Fri, 28 Aug 2015 18:12:08 +0900
Message-ID: <1440753128-3288-5-git-send-email-milo.kim@ti.com>
References: <1440753128-3288-1-git-send-email-milo.kim@ti.com>
 <1440753128-3288-2-git-send-email-milo.kim@ti.com>
 <1440753128-3288-3-git-send-email-milo.kim@ti.com>
 <1440753128-3288-4-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440753128-3288-4-git-send-email-milo.kim-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

'of_dev_get_platdata()' makes if-statements simple.

Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
---
 drivers/usb/musb/ux500.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/musb/ux500.c b/drivers/usb/musb/ux500.c
index 39168fe..851cf4a 100644
--- a/drivers/usb/musb/ux500.c
+++ b/drivers/usb/musb/ux500.c
@@ -25,6 +25,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/usb/musb-ux500.h>
 
@@ -200,21 +201,16 @@ static const struct musb_platform_ops ux500_ops = {
 	.set_vbus	= ux500_musb_set_vbus,
 };
 
-static struct musb_hdrc_platform_data *
-ux500_of_probe(struct platform_device *pdev, struct device_node *np)
+static int ux500_of_probe(struct device *dev, void *data, void *priv)
 {
-	struct musb_hdrc_platform_data *pdata;
+	struct musb_hdrc_platform_data *pdata = data;
 	const char *mode;
 	int strlen;
 
-	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return NULL;
-
-	mode = of_get_property(np, "dr_mode", &strlen);
+	mode = of_get_property(dev->of_node, "dr_mode", &strlen);
 	if (!mode) {
-		dev_err(&pdev->dev, "No 'dr_mode' property found\n");
-		return NULL;
+		dev_err(dev, "No 'dr_mode' property found\n");
+		return -EINVAL;
 	}
 
 	if (strlen > 0) {
@@ -226,31 +222,27 @@ ux500_of_probe(struct platform_device *pdev, struct device_node *np)
 			pdata->mode = MUSB_PERIPHERAL;
 	}
 
-	return pdata;
+	return 0;
 }
 
 static int ux500_probe(struct platform_device *pdev)
 {
 	struct resource musb_resources[2];
-	struct musb_hdrc_platform_data	*pdata = dev_get_platdata(&pdev->dev);
-	struct device_node		*np = pdev->dev.of_node;
+	struct musb_hdrc_platform_data	*pdata;
 	struct platform_device		*musb;
 	struct ux500_glue		*glue;
 	struct clk			*clk;
 	int				ret = -ENOMEM;
 
-	if (!pdata) {
-		if (np) {
-			pdata = ux500_of_probe(pdev, np);
-			if (!pdata)
-				goto err0;
+	pdata = of_dev_get_platdata(&pdev->dev, sizeof(*pdata),
+				    ux500_of_probe, NULL);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
 
-			pdev->dev.platform_data = pdata;
-		} else {
-			dev_err(&pdev->dev, "no pdata or device tree found\n");
-			goto err0;
-		}
-	}
+	if (!pdata)
+		goto err0;
+
+	pdev->dev.platform_data = pdata;
 
 	glue = devm_kzalloc(&pdev->dev, sizeof(*glue), GFP_KERNEL);
 	if (!glue)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
