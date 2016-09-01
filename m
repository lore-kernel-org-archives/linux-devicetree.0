From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 02/26] video: display_timing: Add flags to select the edge when the sync is driven
Date: Thu, 1 Sep 2016 14:22:56 +0300
Message-ID: <20160901112320.15246-3-peter.ujfalusi@ti.com>
References: <20160901112320.15246-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160901112320.15246-1-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, tomi.valkeinen@ti.com
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The sync can be - and for some panels it must be - driven on different edge
then the data.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: devicetree@vger.kernel.org
---
 include/video/display_timing.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/video/display_timing.h b/include/video/display_timing.h
index 28d9d0d566ca..3d289e990aca 100644
--- a/include/video/display_timing.h
+++ b/include/video/display_timing.h
@@ -28,6 +28,10 @@ enum display_flags {
 	DISPLAY_FLAGS_INTERLACED	= BIT(8),
 	DISPLAY_FLAGS_DOUBLESCAN	= BIT(9),
 	DISPLAY_FLAGS_DOUBLECLK		= BIT(10),
+	/* drive sync on pos. edge */
+	DISPLAY_FLAGS_SYNC_POSEDGE	= BIT(11),
+	/* drive sync on neg. edge */
+	DISPLAY_FLAGS_SYNC_NEGEDGE	= BIT(12),
 };
 
 /*
-- 
2.9.3
