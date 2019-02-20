From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 5/9] iio: accel: bma180: convert to devm
Date: Wed, 20 Feb 2019 15:00:52 +0100
Message-ID: <900f59b94ef2e1b5559b363c0d1af4fefccd0366.1550671256.git.hns@goldelico.com>
References: <cover.1550671256.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550671256.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>
Cc: letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This simplifies the code a little.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/iio/accel/bma180.c | 56 ++++++++++++++------------------------
 1 file changed, 21 insertions(+), 35 deletions(-)

diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
index 248be67e4f41..3f5ee2d495d3 100644
--- a/drivers/iio/accel/bma180.c
+++ b/drivers/iio/accel/bma180.c
@@ -738,7 +738,7 @@ static int bma180_probe(struct i2c_client *client,
 
 	ret = data->part_info->chip_config(data);
 	if (ret < 0)
-		goto err_chip_disable;
+		goto err;
 
 	mutex_init(&data->mutex);
 	indio_dev->dev.parent = &client->dev;
@@ -748,12 +748,25 @@ static int bma180_probe(struct i2c_client *client,
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->info = &bma180_info;
 
+	ret = devm_iio_triggered_buffer_setup(&client->dev, indio_dev, NULL,
+			bma180_trigger_handler, NULL);
+	if (ret < 0) {
+		dev_err(&client->dev, "unable to setup iio triggered buffer\n");
+		goto err;
+	}
+
+	ret = devm_iio_device_register(&client->dev, indio_dev);
+	if (ret < 0) {
+		dev_err(&client->dev, "unable to register iio device\n");
+		goto err;
+	}
+
 	if (client->irq > 0) {
-		data->trig = iio_trigger_alloc("%s-dev%d", indio_dev->name,
-			indio_dev->id);
+		data->trig = devm_iio_trigger_alloc(&client->dev, "%s-dev%d",
+			indio_dev->name, indio_dev->id);
 		if (!data->trig) {
 			ret = -ENOMEM;
-			goto err_chip_disable;
+			goto err;
 		}
 
 		ret = devm_request_irq(&client->dev, client->irq,
@@ -761,7 +774,7 @@ static int bma180_probe(struct i2c_client *client,
 			"bma180_event", data->trig);
 		if (ret) {
 			dev_err(&client->dev, "unable to request IRQ\n");
-			goto err_trigger_free;
+			goto err;
 		}
 
 		data->trig->dev.parent = &client->dev;
@@ -769,34 +782,14 @@ static int bma180_probe(struct i2c_client *client,
 		iio_trigger_set_drvdata(data->trig, indio_dev);
 		indio_dev->trig = iio_trigger_get(data->trig);
 
-		ret = iio_trigger_register(data->trig);
+		ret = devm_iio_trigger_register(&client->dev, data->trig);
 		if (ret)
-			goto err_trigger_free;
-	}
-
-	ret = iio_triggered_buffer_setup(indio_dev, NULL,
-			bma180_trigger_handler, NULL);
-	if (ret < 0) {
-		dev_err(&client->dev, "unable to setup iio triggered buffer\n");
-		goto err_trigger_unregister;
-	}
-
-	ret = iio_device_register(indio_dev);
-	if (ret < 0) {
-		dev_err(&client->dev, "unable to register iio device\n");
-		goto err_buffer_cleanup;
+			goto err;
 	}
 
 	return 0;
 
-err_buffer_cleanup:
-	iio_triggered_buffer_cleanup(indio_dev);
-err_trigger_unregister:
-	if (data->trig)
-		iio_trigger_unregister(data->trig);
-err_trigger_free:
-	iio_trigger_free(data->trig);
-err_chip_disable:
+err:
 	data->part_info->chip_disable(data);
 
 	return ret;
@@ -807,13 +800,6 @@ static int bma180_remove(struct i2c_client *client)
 	struct iio_dev *indio_dev = i2c_get_clientdata(client);
 	struct bma180_data *data = iio_priv(indio_dev);
 
-	iio_device_unregister(indio_dev);
-	iio_triggered_buffer_cleanup(indio_dev);
-	if (data->trig) {
-		iio_trigger_unregister(data->trig);
-		iio_trigger_free(data->trig);
-	}
-
 	mutex_lock(&data->mutex);
 	data->part_info->chip_disable(data);
 	mutex_unlock(&data->mutex);
-- 
2.19.1
