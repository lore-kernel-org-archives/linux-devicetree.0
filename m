From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 03/26] video: of: display_timing: Add support for syncclk-active property
Date: Thu, 1 Sep 2016 14:22:57 +0300
Message-ID: <20160901112320.15246-4-peter.ujfalusi@ti.com>
References: <20160901112320.15246-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160901112320.15246-1-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, tomi.valkeinen@ti.com
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Configure the DISPLAY_FLAGS_SYNC_POSEDGE/NEGEDGE flags according to the
binding document.
If the syncclk-active is present in DT, configure the flags accordingly, if
it is omitted it means that the SYNC edge is following the pixdata
configuration.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: devicetree@vger.kernel.org
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
2.9.3
