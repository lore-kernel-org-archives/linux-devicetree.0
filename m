From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v4 06/11] thermal: sun8i: get ths init func from device compatible
Date: Sun, 23 Jun 2019 12:42:01 -0400
Message-ID: <20190623164206.7467-7-tiny.windzz@gmail.com>
References: <20190623164206.7467-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623164206.7467-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, davem@davemloft.net, gregkh@linuxfoundation.org, mchehab+samsung@kernel.org, linus.walleij@linaro.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

There are some differences in register initialization for
different socs. So we get different initialization functions
from device compatible.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index e473a5651436..59acbbac76e4 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -59,6 +59,7 @@ struct ths_thermal_chip {
 	int		scale;
 	int		ft_deviation;
 	int		temp_data_base;
+	int		(*init)(struct ths_device *tmdev);
 };
 
 struct ths_device {
@@ -362,7 +363,7 @@ static int sun8i_ths_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = sun50i_thermal_init(tmdev);
+	ret = tmdev->chip->init(tmdev);
 	if (ret)
 		return ret;
 
@@ -400,6 +401,7 @@ static const struct ths_thermal_chip sun50i_h6_ths = {
 	.scale = -67,
 	.ft_deviation = SUN50I_H6_FT_DEVIATION,
 	.temp_data_base = SUN50I_H6_THS_TEMP_DATA,
+	.init = sun50i_thermal_init,
 };
 
 static const struct of_device_id of_ths_match[] = {
-- 
2.17.1
