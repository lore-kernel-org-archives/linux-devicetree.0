From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v5 15/18] thermal: sun8i: allow to use custom temperature calculation function
Date: Sat, 10 Aug 2019 05:28:26 +0000
Message-ID: <20190810052829.6032-16-tiny.windzz@gmail.com>
References: <20190810052829.6032-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190810052829.6032-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, mchehab+samsung@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, nicolas.ferre@microchip.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

From: Icenowy Zheng <icenowy@aosc.io>

The H5 temperature calculation function is strange. Firstly, it's
segmented. Secondly, the formula of two sensors are different in the
second segment.

Allow to use a custom temperature calculation function, in case of
the function is complex.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/thermal/sun8i_thermal.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 3259081da841..a761e2afda08 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -76,6 +76,7 @@ struct ths_thermal_chip {
 				     u16 *caldata, int callen);
 	int		(*init)(struct ths_device *tmdev);
 	int             (*irq_ack)(struct ths_device *tmdev);
+	int		(*calc_temp)(int id, int reg);
 };
 
 struct ths_device {
@@ -90,9 +91,12 @@ struct ths_device {
 
 /* Temp Unit: millidegree Celsius */
 static int sun8i_ths_reg2temp(struct ths_device *tmdev,
-			      int reg)
+			      int id, int reg)
 {
-	return (reg + tmdev->chip->offset) * tmdev->chip->scale;
+	if (tmdev->chip->calc_temp)
+		return tmdev->chip->calc_temp(id, reg);
+	else
+		return (reg + tmdev->chip->offset) * tmdev->chip->scale;
 }
 
 static int sun8i_ths_get_temp(void *data, int *temp)
@@ -108,7 +112,7 @@ static int sun8i_ths_get_temp(void *data, int *temp)
 	if (!val)
 		return -EAGAIN;
 
-	*temp = sun8i_ths_reg2temp(tmdev, val);
+	*temp = sun8i_ths_reg2temp(tmdev, s->id, val);
 	/*
 	 * XX - According to the original sdk, there are some platforms(rarely)
 	 * that add a fixed offset value after calculating the temperature
@@ -232,7 +236,7 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
 
 	for (i = 0; i < tmdev->chip->sensor_num; i++) {
 		int reg = (int)caldata[i + 1];
-		int sensor_temp = sun8i_ths_reg2temp(tmdev, reg);
+		int sensor_temp = sun8i_ths_reg2temp(tmdev, i, reg);
 		int delta, cdata, offset;
 
 		/*
-- 
2.17.1
