From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 2/2] backlight: lm3630a: add backlight driver match_table
Date: Sat, 24 Nov 2018 09:17:03 -0500
Message-ID: <20181124141703.29232-2-masneyb@onstation.org>
References: <20181124141703.29232-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181124141703.29232-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan@marek.ca, ctatlor97@gmail.com
List-Id: devicetree@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add device tree support to the lm3630a driver.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
[masneyb@onstation.org: checkpatch fixes; add 'a' to compatible string]
Signed-off-by: Brian Masney <masneyb@onstation.org>
---
This is part of upstreaming various components of the LG Nexus 5
(hammerhead) phone.

 drivers/video/backlight/lm3630a_bl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index 2030a6b77a09..159d4013d9c2 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -470,11 +470,18 @@ static const struct i2c_device_id lm3630a_id[] = {
 	{}
 };
 
+static const struct of_device_id lm3630a_match_table[] = {
+	{ .compatible = "ti,lm3630a", },
+	{ },
+};
+
+
 MODULE_DEVICE_TABLE(i2c, lm3630a_id);
 
 static struct i2c_driver lm3630a_i2c_driver = {
 	.driver = {
 		   .name = LM3630A_NAME,
+		   .of_match_table = lm3630a_match_table,
 		   },
 	.probe = lm3630a_probe,
 	.remove = lm3630a_remove,
-- 
2.17.2
