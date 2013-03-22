From: Ian Lartey <ian@slimlogic.co.uk>
Subject: [PATCH v9 06/11] gpio: palmas: Enable DT support for palmas gpio.
Date: Fri, 22 Mar 2013 13:36:08 +0000
Message-ID: <1363959373-10671-7-git-send-email-ian@slimlogic.co.uk>
References: <1363959373-10671-1-git-send-email-ian@slimlogic.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363959373-10671-1-git-send-email-ian@slimlogic.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, swarren@wwwdotorg.org, grant.likely@secretlab.ca, broonie@opensource.wolfsonmicro.com, rob.herring@calxeda.com, rob@landley.net, mturquette@linaro.org, linus.walleij@linaro.org, cooloney@gmail.com, sfr@canb.auug.org.au, rpurdie@rpsys.net, akpm@linux-foundation.org, sameo@linux.intel.com, wim@iguana.be, lgirdwood@gmail.com, gg@slimlogic.co.uk, j-keerthy@ti.com, ldewangan@nvidia.com, t-kristo@ti.com
List-Id: devicetree@vger.kernel.org

From: J Keerthy <j-keerthy@ti.com>

Enable DT support for palmas gpio.

Signed-off-by: J Keerthy <j-keerthy@ti.com>
Signed-off-by: Ian Lartey <ian@slimlogic.co.uk>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-palmas.c |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index 636648c..04da57a 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -208,9 +208,22 @@ static int palmas_gpio_remove(struct platform_device *pdev)
 	return gpiochip_remove(&palmas_gpio->gpio_chip);
 }
 
+static struct of_device_id of_palmas_match_tbl[] = {
+	{ .compatible = "ti,palmas-gpio", },
+	{ .compatible = "ti,palmas-charger-gpio", },
+	{ .compatible = "ti,twl6035-gpio", },
+	{ .compatible = "ti,twl6036-gpio", },
+	{ .compatible = "ti,twl6037-gpio", },
+	{ .compatible = "ti,tps65913-gpio", },
+	{ .compatible = "ti,tps65914-gpio", },
+	{ .compatible = "ti,tps80036-gpio", },
+	{ /* end */ }
+};
+
 static struct platform_driver palmas_gpio_driver = {
 	.driver.name	= "palmas-gpio",
 	.driver.owner	= THIS_MODULE,
+	.driver.of_match_table = of_palmas_match_tbl,
 	.probe		= palmas_gpio_probe,
 	.remove		= palmas_gpio_remove,
 };
-- 
1.7.0.4
