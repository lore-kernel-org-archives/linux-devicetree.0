From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4 4/8] media: i2c: ov2659: fix s_stream return value
Date: Fri, 27 Sep 2019 13:47:18 -0500
Message-ID: <20190927184722.31989-5-bparrot@ti.com>
References: <20190927184722.31989-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927184722.31989-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

In ov2659_s_stream() return value for invoked function should be checked
and propagated.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/i2c/ov2659.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index f77320e8a60d..cd4625432264 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1187,10 +1187,13 @@ static int ov2659_s_stream(struct v4l2_subdev *sd, int on)
 		goto unlock;
 	}
 
-	ov2659_set_pixel_clock(ov2659);
-	ov2659_set_frame_size(ov2659);
-	ov2659_set_format(ov2659);
-	ov2659_set_streaming(ov2659, 1);
+	ret = ov2659_set_pixel_clock(ov2659);
+	if (!ret)
+		ret = ov2659_set_frame_size(ov2659);
+	if (!ret)
+		ret = ov2659_set_format(ov2659);
+	if (!ret)
+		ov2659_set_streaming(ov2659, 1);
 	ov2659->streaming = on;
 
 unlock:
-- 
2.17.1
