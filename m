From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 6/6] misc: q8-hardwaremgr: Add quirk handling
Date: Fri, 14 Oct 2016 09:53:37 +0200
Message-ID: <20161014075337.10452-7-hdegoede@redhat.com>
References: <20161014075337.10452-1-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161014075337.10452-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some models require some special handling, e.g. one q8 tablet I've needs
esp,crystal-26M-en = <1> in the sdio_wifi dt node for the wifi to work
properly.

Add a q8_hardwaremgr_apply_quirks() helper function which identifies the
tablet based on the detected soc, touchscreen, accelerometer combo and
applies model specific quirks where necessary.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/misc/q8-hardwaremgr.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/misc/q8-hardwaremgr.c b/drivers/misc/q8-hardwaremgr.c
index 95cdaf2..cbf4f61 100644
--- a/drivers/misc/q8-hardwaremgr.c
+++ b/drivers/misc/q8-hardwaremgr.c
@@ -715,6 +715,28 @@ static void q8_hardwaremgr_apply_accelerometer(struct q8_hardwaremgr_data *data)
 	of_node_put(np);
 }
 
+static void q8_hardwaremgr_apply_quirks(struct q8_hardwaremgr_data *data)
+{
+	struct device_node *np;
+	struct of_changeset cset;
+
+	/* This A33 tzx-723q4 PCB tablet with esp8089 needs crystal_26M_en=1 */
+	if (data->soc == a33 && data->touchscreen.model == gsl1680_b482 &&
+	    data->accelerometer.model == dmard09 && !data->has_rda599x) {
+		dev_info(data->dev, "Applying crystal_26M_en=1 sdio_wifi quirk\n");
+		np = of_find_node_by_name(of_root, "sdio_wifi");
+		if (!np) {
+			dev_warn(data->dev, "Could not find sdio_wifi dt node\n");
+			return;
+		}
+		of_changeset_init(&cset);
+		of_changeset_add_property_u32(&cset, np,
+					      "esp,crystal-26M-en", 1);
+		of_changeset_apply(&cset);
+		of_node_put(np);
+	}
+}
+
 static int q8_hardwaremgr_do_probe(struct q8_hardwaremgr_data *data,
 				   struct q8_hardwaremgr_device *dev,
 				   const char *prefix, bus_probe_func func)
@@ -846,6 +868,7 @@ static int q8_hardwaremgr_probe(struct platform_device *pdev)
 
 	q8_hardwaremgr_apply_touchscreen(data);
 	q8_hardwaremgr_apply_accelerometer(data);
+	q8_hardwaremgr_apply_quirks(data);
 
 error:
 	kfree(data);
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
