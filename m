From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 4/5] gnss: sirf: add a separate supply for a lna
Date: Sun,  9 Dec 2018 20:51:49 +0100
Message-ID: <20181209195150.5192-5-andreas@kemnade.info>
References: <20181209195150.5192-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181209195150.5192-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

Devices might have a separate lna between antenna output of the gps
chip and the antenna which might have a separate supply.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v2:
 - handle lna also if there is no on-off gpio
 - rebase on changed 2/5

 drivers/gnss/sirf.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
index c64369494afb..d339e8ef2508 100644
--- a/drivers/gnss/sirf.c
+++ b/drivers/gnss/sirf.c
@@ -36,6 +36,7 @@ struct sirf_data {
 	struct serdev_device *serdev;
 	speed_t	speed;
 	struct regulator *vcc;
+	struct regulator *lna;
 	struct gpio_desc *on_off;
 	struct gpio_desc *wakeup;
 	int irq;
@@ -282,21 +283,32 @@ static int sirf_set_active(struct sirf_data *data, bool active)
 static int sirf_runtime_suspend(struct device *dev)
 {
 	struct sirf_data *data = dev_get_drvdata(dev);
+	int ret = 0;
 
 	if (!data->on_off)
-		return regulator_disable(data->vcc);
+		ret = regulator_disable(data->vcc);
+	else
+		ret = sirf_set_active(data, false);
 
-	return sirf_set_active(data, false);
+	if (ret)
+		return ret;
+
+	return regulator_disable(data->lna);
 }
 
 static int sirf_runtime_resume(struct device *dev)
 {
 	struct sirf_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regulator_enable(data->lna);
+	if (ret)
+		return ret;
 
 	if (!data->on_off)
 		return regulator_enable(data->vcc);
-
-	return sirf_set_active(data, true);
+	else
+		return sirf_set_active(data, true);
 }
 
 static int __maybe_unused sirf_suspend(struct device *dev)
@@ -384,6 +396,12 @@ static int sirf_probe(struct serdev_device *serdev)
 		goto err_put_device;
 	}
 
+	data->lna = devm_regulator_get(dev, "lna");
+	if (IS_ERR(data->lna)) {
+		ret = PTR_ERR(data->lna);
+		goto err_put_device;
+	}
+
 	data->on_off = devm_gpiod_get_optional(dev, "sirf,onoff",
 			GPIOD_OUT_LOW);
 	if (IS_ERR(data->on_off))
-- 
2.11.0
