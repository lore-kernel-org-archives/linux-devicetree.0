From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v5 1/7] leds: leds-pwm: Convert to use devm_get_pwm
Date: Fri, 21 Dec 2012 10:43:55 +0100
Message-ID: <1356083041-29179-2-git-send-email-peter.ujfalusi@ti.com>
References: <1356083041-29179-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1356083041-29179-1-git-send-email-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
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

Update the driver to use the new API for requesting pwm so we can take
advantage of the pwm_lookup table to find the correct pwm to be used for the
LED functionality.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
---
 drivers/leds/leds-pwm.c  | 19 ++++++-------------
 include/linux/leds_pwm.h |  2 +-
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 2157524..351257c 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -67,12 +67,11 @@ static int led_pwm_probe(struct platform_device *pdev)
 		cur_led = &pdata->leds[i];
 		led_dat = &leds_data[i];
 
-		led_dat->pwm = pwm_request(cur_led->pwm_id,
-				cur_led->name);
+		led_dat->pwm = devm_pwm_get(&pdev->dev, cur_led->name);
 		if (IS_ERR(led_dat->pwm)) {
 			ret = PTR_ERR(led_dat->pwm);
-			dev_err(&pdev->dev, "unable to request PWM %d\n",
-					cur_led->pwm_id);
+			dev_err(&pdev->dev, "unable to request PWM for %s\n",
+				cur_led->name);
 			goto err;
 		}
 
@@ -86,10 +85,8 @@ static int led_pwm_probe(struct platform_device *pdev)
 		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
 
 		ret = led_classdev_register(&pdev->dev, &led_dat->cdev);
-		if (ret < 0) {
-			pwm_free(led_dat->pwm);
+		if (ret < 0)
 			goto err;
-		}
 	}
 
 	platform_set_drvdata(pdev, leds_data);
@@ -98,10 +95,8 @@ static int led_pwm_probe(struct platform_device *pdev)
 
 err:
 	if (i > 0) {
-		for (i = i - 1; i >= 0; i--) {
+		for (i = i - 1; i >= 0; i--)
 			led_classdev_unregister(&leds_data[i].cdev);
-			pwm_free(leds_data[i].pwm);
-		}
 	}
 
 	return ret;
@@ -115,10 +110,8 @@ static int led_pwm_remove(struct platform_device *pdev)
 
 	leds_data = platform_get_drvdata(pdev);
 
-	for (i = 0; i < pdata->num_leds; i++) {
+	for (i = 0; i < pdata->num_leds; i++)
 		led_classdev_unregister(&leds_data[i].cdev);
-		pwm_free(leds_data[i].pwm);
-	}
 
 	return 0;
 }
diff --git a/include/linux/leds_pwm.h b/include/linux/leds_pwm.h
index 33a0711..a65e964 100644
--- a/include/linux/leds_pwm.h
+++ b/include/linux/leds_pwm.h
@@ -7,7 +7,7 @@
 struct led_pwm {
 	const char	*name;
 	const char	*default_trigger;
-	unsigned	pwm_id;
+	unsigned	pwm_id __deprecated;
 	u8 		active_low;
 	unsigned 	max_brightness;
 	unsigned	pwm_period_ns;
-- 
1.8.0.2
