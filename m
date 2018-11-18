From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH RFC 4/5] gnss: sirf: add a separate supply for a lna
Date: Sun, 18 Nov 2018 22:58:00 +0100
Message-ID: <20181118215801.12280-5-andreas@kemnade.info>
References: <20181118215801.12280-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181118215801.12280-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

Devices might have a separate lna between antenna output of the gps
chip and the antenna which might have a separate supply

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/gnss/sirf.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
index 6a0e5c0a2d62..f7573ca2dacd 100644
--- a/drivers/gnss/sirf.c
+++ b/drivers/gnss/sirf.c
@@ -30,6 +30,7 @@ struct sirf_data {
 	struct serdev_device *serdev;
 	speed_t	speed;
 	struct regulator *vcc;
+	struct regulator *lna;
 	struct gpio_desc *on_off;
 	struct gpio_desc *wakeup;
 	int irq;
@@ -217,6 +218,7 @@ static int sirf_runtime_suspend(struct device *dev)
 
 	if (!data->on_off)
 		return regulator_disable(data->vcc);
+	regulator_disable(data->lna);
 	ret = sirf_set_active(data, false);
 
 	if (ret)
@@ -245,13 +247,20 @@ static int sirf_runtime_resume(struct device *dev)
 		if (ret)
 			goto err_close_serdev;
 	}
+
+	ret = regulator_enable(data->lna);
+	if (ret)
+		goto err_disable_vcc;
+
 	ret = sirf_set_active(data, true);
 
 	if (!ret)
 		return 0;
 
+err_disable_vcc:
 	if (!data->on_off)
 		regulator_disable(data->vcc);
+
 err_close_serdev:
 	serdev_device_close(data->serdev);
 	return ret;
@@ -340,6 +349,12 @@ static int sirf_probe(struct serdev_device *serdev)
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
