From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 3/3] media: ov5640: Make 2592x1944 mode only available at 15 fps
Date: Wed, 2 Oct 2019 08:51:34 -0500
Message-ID: <20191002135134.12273-4-bparrot@ti.com>
References: <20191002135134.12273-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002135134.12273-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

The sensor data sheet clearly state that 2592x1944 only works at 15 fps
make sure we don't try to miss configure the pll out of acceptable
range.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/i2c/ov5640.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 103a4e8f88e1..d5b0be2c7a0a 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1613,6 +1613,11 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
 	    !(mode->hact == 640 && mode->vact == 480))
 		return NULL;
 
+	/* 2592x1944 only works at 15fps */
+	if (fr != OV5640_15_FPS &&
+	    (mode->hact == 2592 && mode->vact == 1944))
+		return NULL;
+
 	return mode;
 }
 
-- 
2.17.1
