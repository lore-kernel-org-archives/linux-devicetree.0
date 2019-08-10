From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v5 08/18] thermal: sun8i: support mod clocks
Date: Sat, 10 Aug 2019 05:28:19 +0000
Message-ID: <20190810052829.6032-9-tiny.windzz@gmail.com>
References: <20190810052829.6032-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190810052829.6032-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, mchehab+samsung@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, nicolas.ferre@microchip.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

H3 has extra clock, so introduce something in ths_thermal_chip/ths_device
and adds the process of the clock.

This is pre-work for supprt it.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index b934bc81eba7..6f4294c2aba7 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -54,6 +54,7 @@ struct tsensor {
 };
 
 struct ths_thermal_chip {
+	bool            has_mod_clk;
 	int		sensor_num;
 	int		offset;
 	int		scale;
@@ -69,6 +70,7 @@ struct ths_device {
 	struct regmap				*regmap;
 	struct reset_control			*reset;
 	struct clk				*bus_clk;
+	struct clk                              *mod_clk;
 	struct tsensor				sensor[MAX_SENSOR_NUM];
 };
 
@@ -274,6 +276,12 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 	if (IS_ERR(tmdev->bus_clk))
 		return PTR_ERR(tmdev->bus_clk);
 
+	if (tmdev->chip->has_mod_clk) {
+		tmdev->mod_clk = devm_clk_get(&pdev->dev, "mod");
+		if (IS_ERR(tmdev->mod_clk))
+			return PTR_ERR(tmdev->mod_clk);
+	}
+
 	ret = reset_control_deassert(tmdev->reset);
 	if (ret)
 		return ret;
@@ -282,12 +290,18 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 	if (ret)
 		goto assert_reset;
 
-	ret = sun50i_ths_calibrate(tmdev);
+	ret = clk_prepare_enable(tmdev->mod_clk);
 	if (ret)
 		goto bus_disable;
 
+	ret = sun50i_ths_calibrate(tmdev);
+	if (ret)
+		goto mod_disable;
+
 	return 0;
 
+mod_disable:
+	clk_disable_unprepare(tmdev->mod_clk);
 bus_disable:
 	clk_disable_unprepare(tmdev->bus_clk);
 assert_reset:
@@ -395,6 +409,7 @@ static int sun8i_ths_remove(struct platform_device *pdev)
 {
 	struct ths_device *tmdev = platform_get_drvdata(pdev);
 
+	clk_disable_unprepare(tmdev->mod_clk);
 	clk_disable_unprepare(tmdev->bus_clk);
 	reset_control_assert(tmdev->reset);
 
-- 
2.17.1
