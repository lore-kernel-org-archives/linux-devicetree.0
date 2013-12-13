From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/4] lis3lv02d: DT: add wakeup unit 2 and wakeup threshold
Date: Fri, 13 Dec 2013 21:54:53 +0100
Message-ID: <1386968094-24554-4-git-send-email-sre@debian.org>
References: <1386968094-24554-1-git-send-email-sre@debian.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386968094-24554-1-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Eric Piel <eric.piel-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds support for the the wakeup threshold and
support for the second wakeup unit to the DT based
setup.

Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 drivers/misc/lis3lv02d/lis3lv02d.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/misc/lis3lv02d/lis3lv02d.c b/drivers/misc/lis3lv02d/lis3lv02d.c
index dc4f5c7..aa61627 100644
--- a/drivers/misc/lis3lv02d/lis3lv02d.c
+++ b/drivers/misc/lis3lv02d/lis3lv02d.c
@@ -1033,6 +1033,23 @@ int lis3lv02d_init_dt(struct lis3lv02d *lis3)
 		pdata->wakeup_flags |= LIS3_WAKEUP_Z_LO;
 	if (of_get_property(np, "st,wakeup-z-hi", NULL))
 		pdata->wakeup_flags |= LIS3_WAKEUP_Z_HI;
+	if (of_get_property(np, "st,wakeup-threshold", &val))
+		pdata->wakeup_thresh = val;
+
+	if (of_get_property(np, "st,wakeup2-x-lo", NULL))
+		pdata->wakeup_flags2 |= LIS3_WAKEUP_X_LO;
+	if (of_get_property(np, "st,wakeup2-x-hi", NULL))
+		pdata->wakeup_flags2 |= LIS3_WAKEUP_X_HI;
+	if (of_get_property(np, "st,wakeup2-y-lo", NULL))
+		pdata->wakeup_flags2 |= LIS3_WAKEUP_Y_LO;
+	if (of_get_property(np, "st,wakeup2-y-hi", NULL))
+		pdata->wakeup_flags2 |= LIS3_WAKEUP_Y_HI;
+	if (of_get_property(np, "st,wakeup2-z-lo", NULL))
+		pdata->wakeup_flags2 |= LIS3_WAKEUP_Z_LO;
+	if (of_get_property(np, "st,wakeup2-z-hi", NULL))
+		pdata->wakeup_flags2 |= LIS3_WAKEUP_Z_HI;
+	if (of_get_property(np, "st,wakeup2-threshold", &val))
+		pdata->wakeup_thresh2 = val;
 
 	if (!of_property_read_u32(np, "st,highpass-cutoff-hz", &val)) {
 		switch (val) {
-- 
1.8.5.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
