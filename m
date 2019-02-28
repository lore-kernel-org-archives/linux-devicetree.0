From: Robert Yang <decatf@gmail.com>
Subject: [PATCH 3/3] iio: accel: kxcjk1013: Add device tree support
Date: Thu, 28 Feb 2019 15:18:11 -0500
Message-ID: <20190228201811.7582-4-decatf@gmail.com>
References: <20190228201811.7582-1-decatf@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228201811.7582-1-decatf@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Yang <decatf@gmail.com>
List-Id: devicetree@vger.kernel.org

Add device tree support for kxcjk-1013 accelerometer sensors.

Signed-off-by: Robert Yang <decatf@gmail.com>
---
 drivers/iio/accel/kxcjk-1013.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/iio/accel/kxcjk-1013.c b/drivers/iio/accel/kxcjk-1013.c
index 7096e577b23f..e7a00743cdcb 100644
--- a/drivers/iio/accel/kxcjk-1013.c
+++ b/drivers/iio/accel/kxcjk-1013.c
@@ -1510,10 +1510,21 @@ static const struct i2c_device_id kxcjk1013_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, kxcjk1013_id);
 
+static const struct of_device_id kxcjk1013_of_match[] = {
+	{ .compatible = "kionix,kxcjk1013", },
+	{ .compatible = "kionix,kxcj91008", },
+	{ .compatible = "kionix,kxtj21009", },
+	{ .compatible = "kionix,kxtf9", },
+	{ .compatible = "kionix,SMO8500", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, kxcjk1013_of_match);
+
 static struct i2c_driver kxcjk1013_driver = {
 	.driver = {
 		.name	= KXCJK1013_DRV_NAME,
 		.acpi_match_table = ACPI_PTR(kx_acpi_match),
+		.of_match_table = of_match_ptr(kxcjk1013_of_match),
 		.pm	= &kxcjk1013_pm_ops,
 	},
 	.probe		= kxcjk1013_probe,
-- 
2.17.1
