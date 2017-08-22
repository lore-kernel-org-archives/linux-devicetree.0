From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v4 1/3] omap3isp: Drop redundant isp->subdevs field and ISP_MAX_SUBDEVS
Date: Tue, 22 Aug 2017 15:30:21 +0300
Message-ID: <20170822123023.6149-2-sakari.ailus@linux.intel.com>
References: <20170822123023.6149-1-sakari.ailus@linux.intel.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170822123023.6149-1-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: niklas.soderlund@ragnatech.se, robh@kernel.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

struct omap3isp.subdevs field and ISP_MAX_SUBDEVS macro are both unused.
Remove them.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/omap3isp/isp.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/omap3isp/isp.h b/drivers/media/platform/omap3isp/isp.h
index e528df6efc09..848cd96b67ca 100644
--- a/drivers/media/platform/omap3isp/isp.h
+++ b/drivers/media/platform/omap3isp/isp.h
@@ -220,9 +220,6 @@ struct isp_device {
 
 	unsigned int sbl_resources;
 	unsigned int subclk_resources;
-
-#define ISP_MAX_SUBDEVS		8
-	struct v4l2_subdev *subdevs[ISP_MAX_SUBDEVS];
 };
 
 struct isp_async_subdev {
-- 
2.11.0
