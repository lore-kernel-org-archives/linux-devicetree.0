From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [RESEND PATCH v2 2/2] mfd: tps6105x: Add OF device ID table
Date: Wed, 15 Mar 2017 07:49:57 -0300
Message-ID: <20170315104958.24919-2-javier@osg.samsung.com>
References: <20170315104958.24919-1-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170315104958.24919-1-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

The driver doesn't have a struct of_device_id table but supported devices
are registered via Device Trees. This is working on the assumption that a
I2C device registered via OF will always match a legacy I2C device ID and
that the MODALIAS reported will always be of the form i2c:<device>.

But this could change in the future so the correct approach is to have a
OF device ID table if the devices are registered via OF.

The compatible strings don't have a vendor prefix because that's how it's
used currently, and changing this will be a Device Tree ABI break.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---
Resending with DT folks on cc.

Changes in v2:
- Don't use of_match_ptr() to avoid build warning when CONFIG_OF is disabled.

 drivers/mfd/tps6105x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mfd/tps6105x.c b/drivers/mfd/tps6105x.c
index baa12ea666fb..f8b0505a15e0 100644
--- a/drivers/mfd/tps6105x.c
+++ b/drivers/mfd/tps6105x.c
@@ -173,9 +173,17 @@ static const struct i2c_device_id tps6105x_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, tps6105x_id);
 
+static const struct of_device_id tps6105x_of_match[] = {
+	{ .compatible = "tps61050" },
+	{ .compatible = "tps61052" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tps6105x_of_match);
+
 static struct i2c_driver tps6105x_driver = {
 	.driver = {
 		.name	= "tps6105x",
+		.of_match_table = tps6105x_of_match,
 	},
 	.probe		= tps6105x_probe,
 	.remove		= tps6105x_remove,
-- 
2.9.3
