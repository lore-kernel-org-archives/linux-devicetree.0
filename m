From: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
Subject: [PATCH 3/6] iio: light: Updated Vishay Capella cm32181 ambient light sensor driver. - Added Power Management support. - Added driver remove routine.
Date: Thu, 21 May 2015 17:30:42 -0700
Message-ID: <1432254645-5349-3-git-send-email-ktsai@capellamicro.com>
References: <1432254645-5349-1-git-send-email-ktsai@capellamicro.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432254645-5349-1-git-send-email-ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Roberta Dobrescu <roberta.dobrescu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
---
Added Power Management support.
Added remove routine.

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
