From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 2/3] media: ov5640: Fix 1920x1080 mode to remove extra enable/disable
Date: Fri, 4 Oct 2019 12:24:17 -0500
Message-ID: <20191004172418.2339-3-bparrot@ti.com>
References: <20191004172418.2339-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004172418.2339-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo@jmondi.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

In the 1920x1080 register array an extra pair of reset ctrl disable
re-enable was causing unwanted init delays.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index a3946ca6a13d..5cebad151546 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -490,7 +490,6 @@ static const struct reg_value ov5640_setting_720P_1280_720[] = {
 };
 
 static const struct reg_value ov5640_setting_1080P_1920_1080[] = {
-	{0x3008, 0x42, 0, 0},
 	{0x3c07, 0x08, 0, 0},
 	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
 	{0x3814, 0x11, 0, 0},
@@ -518,7 +517,7 @@ static const struct reg_value ov5640_setting_1080P_1920_1080[] = {
 	{0x3a0e, 0x03, 0, 0}, {0x3a0d, 0x04, 0, 0}, {0x3a14, 0x04, 0, 0},
 	{0x3a15, 0x60, 0, 0}, {0x4407, 0x04, 0, 0},
 	{0x460b, 0x37, 0, 0}, {0x460c, 0x20, 0, 0}, {0x3824, 0x04, 0, 0},
-	{0x4005, 0x1a, 0, 0}, {0x3008, 0x02, 0, 0},
+	{0x4005, 0x1a, 0, 0},
 };
 
 static const struct reg_value ov5640_setting_QSXGA_2592_1944[] = {
-- 
2.17.1
