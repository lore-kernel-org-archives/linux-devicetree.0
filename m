From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [RESEND PATCH v2 1/2] mfd: retu: Add OF device ID table
Date: Wed, 15 Mar 2017 07:49:56 -0300
Message-ID: <20170315104958.24919-1-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
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

 drivers/mfd/retu-mfd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mfd/retu-mfd.c b/drivers/mfd/retu-mfd.c
index d4c114abeb75..f692d0280137 100644
--- a/drivers/mfd/retu-mfd.c
+++ b/drivers/mfd/retu-mfd.c
@@ -308,9 +308,17 @@ static const struct i2c_device_id retu_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, retu_id);
 
+static const struct of_device_id retu_of_match[] = {
+	{ .compatible = "retu-mfd" },
+	{ .compatible = "tahvo-mfd" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, retu_of_match);
+
 static struct i2c_driver retu_driver = {
 	.driver		= {
 		.name = "retu-mfd",
+		.of_match_table = retu_of_match,
 	},
 	.probe		= retu_probe,
 	.remove		= retu_remove,
-- 
2.9.3
