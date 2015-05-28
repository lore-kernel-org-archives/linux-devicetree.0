From: Irina Tirdea <irina.tirdea@intel.com>
Subject: [PATCH 4/9] input: goodix: add ACPI IDs for GT911 and GT9271
Date: Thu, 28 May 2015 15:47:40 +0300
Message-ID: <1432817265-23891-5-git-send-email-irina.tirdea@intel.com>
References: <1432817265-23891-1-git-send-email-irina.tirdea@intel.com>
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1432817265-23891-1-git-send-email-irina.tirdea@intel.com>
Sender: linux-input-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Irina Tirdea <irina.tirdea@intel.com>
List-Id: devicetree@vger.kernel.org

Add ACPI IDs to support Goodix GT911 and GT9271
touchscreens.

Signed-off-by: Irina Tirdea <irina.tirdea@intel.com>
---
 drivers/input/touchscreen/goodix.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 9561396..9e7d215 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -392,6 +392,8 @@ static const struct i2c_device_id goodix_ts_id[] = {
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id goodix_acpi_match[] = {
 	{ "GDIX1001", 0 },
+	{ "GDIX0911", 0 },
+	{ "GDIX9271", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, goodix_acpi_match);
-- 
1.9.1

