From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 3/3] video: of: display_timing: Add support for syncclk-active property
Date: Thu, 22 Sep 2016 13:35:26 +0300
Message-ID: <20160922103526.24925-4-peter.ujfalusi@ti.com>
References: <20160922103526.24925-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160922103526.24925-1-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Configure the DISPLAY_FLAGS_SYNC_POSEDGE/NEGEDGE flags according to the
binding document.
If the syncclk-active is present in DT, configure the flags accordingly, if
it is omitted it means that the SYNC edge is following the pixdata
configuration.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
CC: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
CC: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/video/of_display_timing.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/video/of_display_timing.c b/drivers/video/of_display_timing.c
index 8a1076beecd3..db992c684f09 100644
--- a/drivers/video/of_display_timing.c
+++ b/drivers/video/of_display_timing.c
@@ -88,6 +88,15 @@ static int of_parse_display_timing(const struct device_node *np,
 		dt->flags |= val ? DISPLAY_FLAGS_PIXDATA_POSEDGE :
 				DISPLAY_FLAGS_PIXDATA_NEGEDGE;
 
+	if (!of_property_read_u32(np, "syncclk-active", &val))
+		dt->flags |= val ? DISPLAY_FLAGS_SYNC_POSEDGE :
+				DISPLAY_FLAGS_SYNC_NEGEDGE;
+	else if (dt->flags & (DISPLAY_FLAGS_PIXDATA_POSEDGE |
+			      DISPLAY_FLAGS_PIXDATA_NEGEDGE))
+		dt->flags |= dt->flags & DISPLAY_FLAGS_PIXDATA_POSEDGE ?
+				DISPLAY_FLAGS_SYNC_POSEDGE :
+				DISPLAY_FLAGS_SYNC_NEGEDGE;
+
 	if (of_property_read_bool(np, "interlaced"))
 		dt->flags |= DISPLAY_FLAGS_INTERLACED;
 	if (of_property_read_bool(np, "doublescan"))
-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
