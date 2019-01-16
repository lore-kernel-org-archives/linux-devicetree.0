From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 5/6] gnss: sirf: add a separate supply for a lna
Date: Wed, 16 Jan 2019 22:18:11 +0100
Message-ID: <20190116211812.6337-6-andreas@kemnade.info>
References: <20190116211812.6337-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116211812.6337-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: letux-kernel@openphoenux.org, johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

Devices might have a separate lna between antenna input of the gps
chip and the antenna which might have a separate supply.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v3:
 - improved error checking
 - style cleanup

Changes in v2:
 - handle lna also if there is no on-off gpio
 - rebase on changed 2/5

 drivers/gnss/sirf.c | 50 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
index 943a2ec9b708..7de98edf198a 100644
--- a/drivers/gnss/sirf.c
+++ b/drivers/gnss/sirf.c
@@ -41,6 +41,7 @@ struct sirf_data {
 	struct serdev_device *serdev;
 	speed_t	speed;
 	struct regulator *vcc;
+	struct regulator *lna;
 	struct gpio_desc *on_off;
 	struct gpio_desc *wakeup;
 	int irq;
@@ -293,21 +294,52 @@ static int sirf_set_active(struct sirf_data *data, bool active)
 static int sirf_runtime_suspend(struct device *dev)
 {
 	struct sirf_data *data = dev_get_drvdata(dev);
+	int ret;
 
-	if (!data->on_off)
-		return regulator_disable(data->vcc);
+	if (data->on_off)
+		ret = sirf_set_active(data, false);
+	else
+		ret = regulator_disable(data->vcc);
+
+	if (ret)
+		return ret;
 
-	return sirf_set_active(data, false);
+	ret = regulator_disable(data->lna);
+	if (ret) {
+		int reenable_ret;
+
+		if (data->on_off)
+			reenable_ret = sirf_set_active(data, true);
+		else
+			reenable_ret = regulator_enable(data->vcc);
+
+		if (reenable_ret)
+			dev_err(dev,
+				"failed to reenable power on failed suspend: %d\n",
+				reenable_ret);
+	}
+
+	return ret;
 }
 
 static int sirf_runtime_resume(struct device *dev)
 {
 	struct sirf_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regulator_enable(data->lna);
+	if (ret)
+		return ret;
 
-	if (!data->on_off)
-		return regulator_enable(data->vcc);
+	if (data->on_off)
+		ret = sirf_set_active(data, true);
+	else
+		ret = regulator_enable(data->vcc);
 
-	return sirf_set_active(data, true);
+	if (ret)
+		regulator_disable(data->lna);
+
+	return ret;
 }
 
 static int __maybe_unused sirf_suspend(struct device *dev)
@@ -395,6 +427,12 @@ static int sirf_probe(struct serdev_device *serdev)
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
