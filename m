From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v4 08/11] thermal: sun8i: support ahb clocks
Date: Sun, 23 Jun 2019 12:42:03 -0400
Message-ID: <20190623164206.7467-9-tiny.windzz@gmail.com>
References: <20190623164206.7467-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623164206.7467-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, davem@davemloft.net, gregkh@linuxfoundation.org, mchehab+samsung@kernel.org, linus.walleij@linaro.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com
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
index ed1c19bb27cf..04f53ffb6a14 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -54,6 +54,7 @@ struct tsensor {
 };
 
 struct ths_thermal_chip {
+	bool            has_ahb_clk;
 	int		sensor_num;
 	int		offset;
 	int		scale;
@@ -69,6 +70,7 @@ struct ths_device {
 	struct regmap				*regmap;
 	struct reset_control			*reset;
 	struct clk				*bus_clk;
+	struct clk                              *ahb_clk;
 	struct tsensor				sensor[MAX_SENSOR_NUM];
 };
 
@@ -280,6 +282,12 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 	if (IS_ERR(tmdev->bus_clk))
 		return PTR_ERR(tmdev->bus_clk);
 
+	if (tmdev->chip->has_ahb_clk) {
+		tmdev->ahb_clk = devm_clk_get(&pdev->dev, "ahb");
+		if (IS_ERR(tmdev->ahb_clk))
+			return PTR_ERR(tmdev->ahb_clk);
+	}
+
 	ret = reset_control_deassert(tmdev->reset);
 	if (ret)
 		return ret;
@@ -288,12 +296,18 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 	if (ret)
 		goto assert_reset;
 
-	ret = sun50i_ths_calibrate(tmdev);
+	ret = clk_prepare_enable(tmdev->ahb_clk);
 	if (ret)
 		goto bus_disable;
 
+	ret = sun50i_ths_calibrate(tmdev);
+	if (ret)
+		goto ahb_disable;
+
 	return 0;
 
+ahb_disable:
+	clk_disable_unprepare(tmdev->ahb_clk);
 bus_disable:
 	clk_disable_unprepare(tmdev->bus_clk);
 assert_reset:
@@ -401,6 +415,7 @@ static int sun8i_ths_remove(struct platform_device *pdev)
 {
 	struct ths_device *tmdev = platform_get_drvdata(pdev);
 
+	clk_disable_unprepare(tmdev->ahb_clk);
 	clk_disable_unprepare(tmdev->bus_clk);
 	reset_control_assert(tmdev->reset);
 
-- 
2.17.1
