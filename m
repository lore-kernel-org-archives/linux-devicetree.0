From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH v2 1/4] si470x-i2c: Add device tree support
Date: Fri,  7 Dec 2018 14:58:09 +0100
Message-ID: <20181207135812.12842-2-pawel.mikolaj.chmiel@gmail.com>
References: <20181207135812.12842-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207135812.12842-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: hverkuil@xs4all.nl, fischerdouglasc@gmail.com, keescook@chromium.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: devicetree@vger.kernel.org

This commit enables device tree support adding simple of_match table.

Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 drivers/media/radio/si470x/radio-si470x-i2c.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
index 9751ea1d80be..250828ddb5fa 100644
--- a/drivers/media/radio/si470x/radio-si470x-i2c.c
+++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
@@ -527,6 +527,13 @@ static int si470x_i2c_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(si470x_i2c_pm, si470x_i2c_suspend, si470x_i2c_resume);
 #endif
 
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id si470x_of_match[] = {
+	{ .compatible = "silabs,si470x" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, si470x_of_match);
+#endif
 
 /*
  * si470x_i2c_driver - i2c driver interface
@@ -534,6 +541,7 @@ static SIMPLE_DEV_PM_OPS(si470x_i2c_pm, si470x_i2c_suspend, si470x_i2c_resume);
 static struct i2c_driver si470x_i2c_driver = {
 	.driver = {
 		.name		= "si470x",
+		.of_match_table = of_match_ptr(si470x_of_match),
 #ifdef CONFIG_PM_SLEEP
 		.pm		= &si470x_i2c_pm,
 #endif
-- 
2.17.1
