From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/4] lis3lv02d: DT: use s32 to support negative values
Date: Fri, 13 Dec 2013 21:54:52 +0100
Message-ID: <1386968094-24554-3-git-send-email-sre@debian.org>
References: <1386968094-24554-1-git-send-email-sre@debian.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386968094-24554-1-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Eric Piel <eric.piel-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

st,axis-{x,y,z} can be negative to imply inverted
axis.

Apart from that the minimal and maximal threshold
may be negative.

Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 drivers/misc/lis3lv02d/lis3lv02d.c | 39 +++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/misc/lis3lv02d/lis3lv02d.c b/drivers/misc/lis3lv02d/lis3lv02d.c
index 036effe..dc4f5c7 100644
--- a/drivers/misc/lis3lv02d/lis3lv02d.c
+++ b/drivers/misc/lis3lv02d/lis3lv02d.c
@@ -951,6 +951,7 @@ int lis3lv02d_init_dt(struct lis3lv02d *lis3)
 	struct lis3lv02d_platform_data *pdata;
 	struct device_node *np = lis3->of_node;
 	u32 val;
+	s32 sval;
 
 	if (!lis3->of_node)
 		return 0;
@@ -1055,29 +1056,29 @@ int lis3lv02d_init_dt(struct lis3lv02d *lis3)
 	if (of_get_property(np, "st,hipass2-disable", NULL))
 		pdata->hipass_ctrl |= LIS3_HIPASS2_DISABLE;
 
-	if (of_get_property(np, "st,axis-x", &val))
-		pdata->axis_x = val;
-	if (of_get_property(np, "st,axis-y", &val))
-		pdata->axis_y = val;
-	if (of_get_property(np, "st,axis-z", &val))
-		pdata->axis_z = val;
+	if (of_property_read_s32(np, "st,axis-x", &sval) == 0)
+		pdata->axis_x = sval;
+	if (of_property_read_s32(np, "st,axis-y", &sval) == 0)
+		pdata->axis_y = sval;
+	if (of_property_read_s32(np, "st,axis-z", &sval) == 0)
+		pdata->axis_z = sval;
 
 	if (of_get_property(np, "st,default-rate", NULL))
 		pdata->default_rate = val;
 
-	if (of_get_property(np, "st,min-limit-x", &val))
-		pdata->st_min_limits[0] = val;
-	if (of_get_property(np, "st,min-limit-y", &val))
-		pdata->st_min_limits[1] = val;
-	if (of_get_property(np, "st,min-limit-z", &val))
-		pdata->st_min_limits[2] = val;
-
-	if (of_get_property(np, "st,max-limit-x", &val))
-		pdata->st_max_limits[0] = val;
-	if (of_get_property(np, "st,max-limit-y", &val))
-		pdata->st_max_limits[1] = val;
-	if (of_get_property(np, "st,max-limit-z", &val))
-		pdata->st_max_limits[2] = val;
+	if (of_property_read_s32(np, "st,min-limit-x", &sval) == 0)
+		pdata->st_min_limits[0] = sval;
+	if (of_property_read_s32(np, "st,min-limit-y", &sval) == 0)
+		pdata->st_min_limits[1] = sval;
+	if (of_property_read_s32(np, "st,min-limit-z", &sval) == 0)
+		pdata->st_min_limits[2] = sval;
+
+	if (of_property_read_s32(np, "st,max-limit-x", &sval) == 0)
+		pdata->st_max_limits[0] = sval;
+	if (of_property_read_s32(np, "st,max-limit-y", &sval) == 0)
+		pdata->st_max_limits[1] = sval;
+	if (of_property_read_s32(np, "st,max-limit-z", &sval) == 0)
+		pdata->st_max_limits[2] = sval;
 
 
 	lis3->pdata = pdata;
-- 
1.8.5.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
