From: Kevin Tsai <ktsai@capellamicro.com>
Subject: [PATCH 3/6] iio: light: Updated Vishay Capella cm32181 ambient light sensor driver.
Date: Thu, 21 May 2015 21:19:37 -0700
Message-ID: <1432268380-7302-3-git-send-email-ktsai@capellamicro.com>
References: <1432268380-7302-1-git-send-email-ktsai@capellamicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432268380-7302-1-git-send-email-ktsai@capellamicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Tsai <ktsai@capellamicro.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>, Jingoo Han <jingoohan1@gmail.com>, Daniel Baluta <daniel.baluta@intel.com>, Roberta Dobrescu <roberta.dobrescu@gmail.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

- Added Power Management support.
- Added driver remove routine.

Signed-off-by: Kevin Tsai <ktsai@capellamicro.com>
---
 drivers/iio/light/cm32181.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
index 6b11145..9bc3e1f 100644
--- a/drivers/iio/light/cm32181.c
+++ b/drivers/iio/light/cm32181.c
@@ -370,11 +370,51 @@ static int cm32181_probe(struct i2c_client *client,
 	return 0;
 }
 
+static int cm32181_remove(struct i2c_client *client)
+{
+	i2c_smbus_write_word_data(client, CM32181_REG_ADDR_CMD,
+		CM32181_CMD_ALS_DISABLE);
+
+	return 0;
+}
+
 static const struct i2c_device_id cm32181_id[] = {
 	{ "cm32181", 0 },
 	{ }
 };
 
+#ifdef CONFIG_PM_SLEEP
+static int cm32181_suspend(struct device *dev)
+{
+	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
+	struct cm32181_chip *chip = iio_priv(indio_dev);
+	struct i2c_client *client = chip->client;
+	int ret;
+
+	ret = i2c_smbus_write_word_data(client, CM32181_REG_ADDR_CMD,
+					CM32181_CMD_ALS_DISABLE);
+
+	return ret;
+}
+
+static int cm32181_resume(struct device *dev)
+{
+	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
+	struct cm32181_chip *chip = iio_priv(indio_dev);
+	struct i2c_client *client = chip->client;
+	int ret;
+
+	chip->conf_regs[CM32181_REG_ADDR_CMD] &= ~CM32181_CMD_ALS_DISABLE;
+	ret = i2c_smbus_write_word_data(client, CM32181_REG_ADDR_CMD,
+				chip->conf_regs[CM32181_REG_ADDR_CMD]);
+
+	return ret;
+}
+
+static const struct dev_pm_ops cm32181_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(cm32181_suspend, cm32181_resume)};
+#endif
+
 MODULE_DEVICE_TABLE(i2c, cm32181_id);
 
 static const struct of_device_id cm32181_of_match[] = {
@@ -387,9 +427,13 @@ static struct i2c_driver cm32181_driver = {
 		.name	= "cm32181",
 		.of_match_table = of_match_ptr(cm32181_of_match),
 		.owner	= THIS_MODULE,
+#ifdef CONFIG_PM_SLEEP
+		.pm     = &cm32181_pm_ops,
+#endif
 	},
 	.id_table	= cm32181_id,
 	.probe		= cm32181_probe,
+	.remove		= cm32181_remove,
 };
 
 module_i2c_driver(cm32181_driver);
-- 
1.8.3.1
