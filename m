From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4 1/8] media: i2c: ov2659: Fix for image wrap-around in lower resolution
Date: Fri, 27 Sep 2019 13:47:15 -0500
Message-ID: <20190927184722.31989-2-bparrot@ti.com>
References: <20190927184722.31989-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927184722.31989-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>, Jyri Sarha <jsarha@ti.com>
List-Id: devicetree@vger.kernel.org

Based on recently found sensor configuration examples, it was
discovered that when scaling and binning are used for the lower
resolutions (i.e. 640x480, 320x240) the read offset has to be
increased otherwise the image appears to be wrapped around.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/media/i2c/ov2659.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index f4ded0669ff9..17573257097d 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -661,7 +661,7 @@ static struct sensor_register ov2659_vga[] = {
 	{ REG_TIMING_HORIZ_FORMAT, 0x01 },
 	{ 0x370a, 0x52 },
 	{ REG_VFIFO_READ_START_H, 0x00 },
-	{ REG_VFIFO_READ_START_L, 0x80 },
+	{ REG_VFIFO_READ_START_L, 0xa0 },
 	{ REG_ISP_CTRL02, 0x10 },
 	{ REG_NULL, 0x00 },
 };
@@ -709,7 +709,7 @@ static  struct sensor_register ov2659_qvga[] = {
 	{ REG_TIMING_HORIZ_FORMAT, 0x01 },
 	{ 0x370a, 0x52 },
 	{ REG_VFIFO_READ_START_H, 0x00 },
-	{ REG_VFIFO_READ_START_L, 0x80 },
+	{ REG_VFIFO_READ_START_L, 0xa0 },
 	{ REG_ISP_CTRL02, 0x10 },
 	{ REG_NULL, 0x00 },
 };
-- 
2.17.1
