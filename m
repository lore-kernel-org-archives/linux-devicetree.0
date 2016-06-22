From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 5/6] pwm-regulator: Support for enable GPIO
Date: Wed, 22 Jun 2016 17:25:57 +0900
Message-ID: <20160622082558.20935-6-acourbot@nvidia.com>
References: <20160622082558.20935-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160622082558.20935-1-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

Enable the pwm-regulator driver to make use of an enable GPIO.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/regulator/pwm-regulator.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index ab3cc0235843..8e5e4e744c51 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -273,6 +273,11 @@ static int pwm_regulator_probe(struct platform_device *pdev)
 	if (!init_data)
 		return -ENOMEM;
 
+	ret = of_get_regulator_gpio_config(&pdev->dev, np, "enable-gpio",
+					   &config);
+	if (ret)
+		return ret;
+
 	config.of_node = np;
 	config.dev = &pdev->dev;
 	config.driver_data = drvdata;
-- 
2.8.3
