From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v4 4/5] gnss: sirf: add a separate supply for a lna
Date: Thu, 24 Jan 2019 07:34:38 +0100
Message-ID: <20190124063439.29897-5-andreas@kemnade.info>
References: <20190124063439.29897-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124063439.29897-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: letux-kernel@openphoenux.org, johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

Devices might have a separate lna between antenna input of the gps
chip and the antenna which might have a separate supply.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v4:
 - cleaned up error checking
 - was 5/6 earlier

Changes in v3:
 - improved error checking
 - style cleanup

Changes in v2:
 - handle lna also if there is no on-off gpio
 - rebase on changed 2/5

 drivers/gnss/sirf.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
index b42a383e26e0..bd6bd9a94c55 100644
--- a/drivers/gnss/sirf.c
+++ b/drivers/gnss/sirf.c
@@ -40,6 +40,7 @@ struct sirf_data {
 	struct serdev_device *serdev;
 	speed_t	speed;
 	struct regulator *vcc;
+	struct regulator *lna;
 	struct gpio_desc *on_off;
 	struct gpio_desc *wakeup;
 	int irq;
@@ -300,21 +301,60 @@ static int sirf_set_active(struct sirf_data *data, bool active)
 static int sirf_runtime_suspend(struct device *dev)
 {
 	struct sirf_data *data = dev_get_drvdata(dev);
+	int ret2;
+	int ret;
+
+	if (data->on_off)
+		ret = sirf_set_active(data, false);
+	else
+		ret = regulator_disable(data->vcc);
+
+	if (ret)
+		return ret;
+
+	ret = regulator_disable(data->lna);
+	if (ret)
+		goto err_reenable;
+
+	return 0;
+
+err_reenable:
+	if (data->on_off)
+		ret2 = sirf_set_active(data, true);
+	else
+		ret2 = regulator_enable(data->vcc);
 
-	if (!data->on_off)
-		return regulator_disable(data->vcc);
+	if (ret2)
+		dev_err(dev,
+			"failed to reenable power on failed suspend: %d\n",
+			ret2);
 
-	return sirf_set_active(data, false);
+	return ret;
 }
 
 static int sirf_runtime_resume(struct device *dev)
 {
 	struct sirf_data *data = dev_get_drvdata(dev);
+	int ret;
 
-	if (!data->on_off)
-		return regulator_enable(data->vcc);
+	ret = regulator_enable(data->lna);
+	if (ret)
+		return ret;
+
+	if (data->on_off)
+		ret = sirf_set_active(data, true);
+	else
+		ret = regulator_enable(data->vcc);
+
+	if (ret)
+		goto err_disable_lna;
 
-	return sirf_set_active(data, true);
+	return 0;
+
+err_disable_lna:
+	regulator_disable(data->lna);
+
+	return ret;
 }
 
 static int __maybe_unused sirf_suspend(struct device *dev)
@@ -402,6 +442,12 @@ static int sirf_probe(struct serdev_device *serdev)
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
