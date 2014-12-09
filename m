From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: [REVIEW PATCH v3 05/12] smiapp: Don't give the source sub-device a temporary name
Date: Tue,  9 Dec 2014 02:04:13 +0200
Message-ID: <1418083460-28556-6-git-send-email-sakari.ailus@iki.fi>
References: <1418083460-28556-1-git-send-email-sakari.ailus@iki.fi>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1418083460-28556-1-git-send-email-sakari.ailus@iki.fi>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

The source sub-device's name will be overwritten shortly. Don't give it a
name in the meantime.

Signed-off-by: Sakari Ailus <sakari.ailus@iki.fi>
---
 drivers/media/i2c/smiapp/smiapp-core.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index ab917a6..92a7840 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -2458,8 +2458,6 @@ static int smiapp_identify_module(struct v4l2_subdev *subdev)
 		minfo->name, minfo->manufacturer_id, minfo->model_id,
 		minfo->revision_number_major);
 
-	strlcpy(subdev->name, sensor->minfo.name, sizeof(subdev->name));
-
 	return 0;
 }
 
-- 
1.7.10.4
