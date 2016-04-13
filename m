From: Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH 4/4] pinctrl: iproc: Allow PINCONF to be disabled completely
Date: Tue, 12 Apr 2016 17:15:23 -0700
Message-ID: <1460506523-6249-5-git-send-email-ray.jui@broadcom.com>
References: <1460506523-6249-1-git-send-email-ray.jui@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460506523-6249-1-git-send-email-ray.jui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <ray.jui@broadcom.com>
List-Id: devicetree@vger.kernel.org

In some of the future iProc based SoCs, pinconf is handled by another
block and the iProc GPIO controller is solely used as a GPIO controller.
This patch adds support of a new compatible string "brcm,iproc-gpio-only",
that is introduced to handle this case, where pinconf functions in this
driver are completely disabled

Signed-off-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Reviewed-by: Jon Mason <jon.mason@broadcom.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 41 ++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index 12a8922..bb5cfd9 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -716,7 +716,8 @@ static const struct of_device_id iproc_gpio_of_match[] = {
 	{ .compatible = "brcm,cygnus-asiu-gpio" },
 	{ .compatible = "brcm,cygnus-crmu-gpio" },
 	{ .compatible = "brcm,iproc-gpio" },
-	{ }
+	{ .compatible = "brcm,iproc-gpio-only" },
+	{ /* sentinel */ }
 };
 
 static int iproc_gpio_probe(struct platform_device *pdev)
@@ -781,24 +782,28 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = iproc_gpio_register_pinconf(chip);
-	if (ret) {
-		dev_err(dev, "unable to register pinconf\n");
-		goto err_rm_gpiochip;
-	}
-
-	/*
-	 * Optional DT property to disable unsupported pinconf parameters for
-	 * a particular iProc SoC
-	 */
-	ret = of_property_read_u32(dev->of_node, "brcm,pinconf-func-off",
-				   &pinconf_disable_mask);
-	if (!ret) {
-		ret = iproc_pinconf_disable_map_create(chip,
-						       pinconf_disable_mask);
+	if (!of_device_is_compatible(dev->of_node, "brcm,iproc-gpio-only")) {
+		ret = iproc_gpio_register_pinconf(chip);
 		if (ret) {
-			dev_err(dev, "unable to create pinconf disable map\n");
-			goto err_unregister_pinconf;
+			dev_err(dev, "unable to register pinconf\n");
+			goto err_rm_gpiochip;
+		}
+
+		/*
+		 * Optional DT property to disable unsupported pinconf
+		 * parameters for a particular iProc SoC
+		 */
+		ret = of_property_read_u32(dev->of_node,
+					   "brcm,pinconf-func-off",
+					   &pinconf_disable_mask);
+		if (!ret) {
+			ret = iproc_pinconf_disable_map_create(chip,
+							 pinconf_disable_mask);
+			if (ret) {
+				dev_err(dev,
+					"unable to create pinconf disable map\n");
+				goto err_unregister_pinconf;
+			}
 		}
 	}
 
-- 
2.1.4
