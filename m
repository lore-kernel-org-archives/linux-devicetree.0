From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v4 3/8] mfd: retu: Add OF device ID table
Date: Tue,  4 Apr 2017 11:30:31 -0400
Message-ID: <20170404153036.6651-4-javier@osg.samsung.com>
References: <20170404153036.6651-1-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170404153036.6651-1-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: devicetree@vger.kernel.org

The driver doesn't have a struct of_device_id table but supported devices
are registered via Device Trees. This is working on the assumption that a
I2C device registered via OF will always match a legacy I2C device ID and
that the MODALIAS reported will always be of the form i2c:<device>.

But this could change in the future so the correct approach is to have a
OF device ID table if the devices are registered via OF.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes in v4:
- Drop -mfd suffix in compatible string (Lee Jones).

Changes in v3:
- Add a vendor prefix to the compatible string (Rob Herring).

Changes in v2:
- Don't use of_match_ptr() to avoid build warning when CONFIG_OF is disabled.

 drivers/mfd/retu-mfd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mfd/retu-mfd.c b/drivers/mfd/retu-mfd.c
index 53e1d386d2c0..e7d27b7861c1 100644
--- a/drivers/mfd/retu-mfd.c
+++ b/drivers/mfd/retu-mfd.c
@@ -308,9 +308,17 @@ static const struct i2c_device_id retu_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, retu_id);
 
+static const struct of_device_id retu_of_match[] = {
+	{ .compatible = "nokia,retu" },
+	{ .compatible = "nokia,tahvo" },
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
