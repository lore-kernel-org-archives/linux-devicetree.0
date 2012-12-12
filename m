From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v4 7/7] leds: leds-pwm: Add device tree bindings
Date: Wed, 12 Dec 2012 10:04:52 +0100
Message-ID: <1355303092-15523-8-git-send-email-peter.ujfalusi@ti.com>
References: <1355303092-15523-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355303092-15523-1-git-send-email-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Support for device tree booted kernel.

For usage see:
Documentation/devicetree/bindings/leds/leds-pwm.txt

Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/leds/leds-pwm.txt          |  48 +++++++++
 drivers/leds/leds-pwm.c                            | 112 +++++++++++++++++----
 2 files changed, 140 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt b/Documentation/devicetree/bindings/leds/leds-pwm.txt
new file mode 100644
index 0000000..7297107
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-pwm.txt
@@ -0,0 +1,48 @@
+LED connected to PWM
+
+Required properties:
+- compatible : should be "pwm-leds".
+
+Each LED is represented as a sub-node of the pwm-leds device.  Each
+node's name represents the name of the corresponding LED.
+
+LED sub-node properties:
+- pwms : PWM property to point to the PWM device (phandle)/port (id) and to
+  specify the period time to be used: <&phandle id period_ns>;
+- pwm-names : (optional) Name to be used by the PWM subsystem for the PWM device
+  For the pwms and pwm-names property please refer to:
+  Documentation/devicetree/bindings/pwm/pwm.txt
+- max-brightness : Maximum brightness possible for the LED
+- label :  (optional)
+  see Documentation/devicetree/bindings/leds/common.txt
+- linux,default-trigger :  (optional)
+  see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+twl_pwm: pwm {
+	/* provides two PWMs (id 0, 1 for PWM1 and PWM2) */
+	compatible = "ti,twl6030-pwm";
+	#pwm-cells = <2>;
+};
+
+twl_pwmled: pwmled {
+	/* provides one PWM (id 0 for Charing indicator LED) */
+	compatible = "ti,twl6030-pwmled";
+	#pwm-cells = <2>;
+};
+
+pwmleds {
+	compatible = "pwm-leds";
+	kpad {
+		label = "omap4::keypad";
+		pwms = <&twl_pwm 0 7812500>;
+		max-brightness = <127>;
+	};
+
+	charging {
+		label = "omap4:green:chrg";
+		pwms = <&twl_pwmled 0 7812500>;
+		max-brightness = <255>;
+	};
+};
diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 46f4e44..a1ea5f6 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
+#include <linux/of_platform.h>
 #include <linux/fb.h>
 #include <linux/leds.h>
 #include <linux/err.h>
@@ -58,46 +59,110 @@ static inline size_t sizeof_pwm_leds_priv(int num_leds)
 		      (sizeof(struct led_pwm_data) * num_leds);
 }
 
-static int led_pwm_probe(struct platform_device *pdev)
+static struct led_pwm_priv *led_pwm_create_of(struct platform_device *pdev)
 {
-	struct led_pwm_platform_data *pdata = pdev->dev.platform_data;
+	struct device_node *node = pdev->dev.of_node;
+	struct device_node *child;
 	struct led_pwm_priv *priv;
-	int i, ret = 0;
+	int count, ret;
 
-	if (!pdata)
-		return -EBUSY;
+	/* count LEDs in this device, so we know how much to allocate */
+	count = of_get_child_count(node);
+	if (!count)
+		return NULL;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof_pwm_leds_priv(pdata->num_leds),
+	priv = devm_kzalloc(&pdev->dev, sizeof_pwm_leds_priv(count),
 			    GFP_KERNEL);
 	if (!priv)
-		return -ENOMEM;
+		return NULL;
 
-	for (i = 0; i < pdata->num_leds; i++) {
-		struct led_pwm *cur_led = &pdata->leds[i];
-		struct led_pwm_data *led_dat = &priv->leds[i];
+	for_each_child_of_node(node, child) {
+		struct led_pwm_data *led_dat = &priv->leds[priv->num_leds];
 
-		led_dat->pwm = devm_pwm_get(&pdev->dev, cur_led->name);
+		led_dat->cdev.name = of_get_property(child, "label",
+						     NULL) ? : child->name;
+
+		led_dat->pwm = devm_of_pwm_get(&pdev->dev, child, NULL);
 		if (IS_ERR(led_dat->pwm)) {
-			ret = PTR_ERR(led_dat->pwm);
 			dev_err(&pdev->dev, "unable to request PWM for %s\n",
-				cur_led->name);
+				led_dat->cdev.name);
 			goto err;
 		}
+		/* Get the period from PWM core when n*/
+		led_dat->period = pwm_get_period(led_dat->pwm);
+
+		led_dat->cdev.default_trigger = of_get_property(child,
+						"linux,default-trigger", NULL);
+		of_property_read_u32(child, "max-brightness",
+				     &led_dat->cdev.max_brightness);
 
-		led_dat->cdev.name = cur_led->name;
-		led_dat->cdev.default_trigger = cur_led->default_trigger;
-		led_dat->active_low = cur_led->active_low;
-		led_dat->period = cur_led->pwm_period_ns;
 		led_dat->cdev.brightness_set = led_pwm_set;
 		led_dat->cdev.brightness = LED_OFF;
-		led_dat->cdev.max_brightness = cur_led->max_brightness;
 		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
 
 		ret = led_classdev_register(&pdev->dev, &led_dat->cdev);
-		if (ret < 0)
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to register for %s\n",
+				led_dat->cdev.name);
+			of_node_put(child);
 			goto err;
+		}
+		priv->num_leds++;
+	}
+
+	return priv;
+err:
+	while (priv->num_leds--)
+		led_classdev_unregister(&priv->leds[priv->num_leds].cdev);
+
+	return NULL;
+}
+
+static int led_pwm_probe(struct platform_device *pdev)
+{
+	struct led_pwm_platform_data *pdata = pdev->dev.platform_data;
+	struct led_pwm_priv *priv;
+	int i, ret = 0;
+
+	if (pdata && pdata->num_leds) {
+		priv = devm_kzalloc(&pdev->dev,
+				    sizeof_pwm_leds_priv(pdata->num_leds),
+				    GFP_KERNEL);
+		if (!priv)
+			return -ENOMEM;
+
+		for (i = 0; i < pdata->num_leds; i++) {
+			struct led_pwm *cur_led = &pdata->leds[i];
+			struct led_pwm_data *led_dat = &priv->leds[i];
+
+			led_dat->pwm = devm_pwm_get(&pdev->dev, cur_led->name);
+			if (IS_ERR(led_dat->pwm)) {
+				ret = PTR_ERR(led_dat->pwm);
+				dev_err(&pdev->dev,
+					"unable to request PWM for %s\n",
+					cur_led->name);
+				goto err;
+			}
+
+			led_dat->cdev.name = cur_led->name;
+			led_dat->cdev.default_trigger = cur_led->default_trigger;
+			led_dat->active_low = cur_led->active_low;
+			led_dat->period = cur_led->pwm_period_ns;
+			led_dat->cdev.brightness_set = led_pwm_set;
+			led_dat->cdev.brightness = LED_OFF;
+			led_dat->cdev.max_brightness = cur_led->max_brightness;
+			led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
+
+			ret = led_classdev_register(&pdev->dev, &led_dat->cdev);
+			if (ret < 0)
+				goto err;
+		}
+		priv->num_leds = pdata->num_leds;
+	} else {
+		priv = led_pwm_create_of(pdev);
+		if (!priv)
+			return -ENODEV;
 	}
-	priv->num_leds = pdata->num_leds;
 
 	platform_set_drvdata(pdev, priv);
 
@@ -121,12 +186,19 @@ static int led_pwm_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id of_pwm_leds_match[] = {
+	{ .compatible = "pwm-leds", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_pwm_leds_match);
+
 static struct platform_driver led_pwm_driver = {
 	.probe		= led_pwm_probe,
 	.remove		= led_pwm_remove,
 	.driver		= {
 		.name	= "leds_pwm",
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(of_pwm_leds_match),
 	},
 };
 
-- 
1.8.0
