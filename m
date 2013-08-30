From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/6] extcon-gpio: If the gpio driver/chip supports debounce, use it
Date: Thu, 29 Aug 2013 21:29:34 -0700
Message-ID: <1377836978-24082-3-git-send-email-linux@roeck-us.net>
References: <1377836978-24082-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1377836978-24082-1-git-send-email-linux@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Grant Likely <grant.likely@linaro.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/extcon/extcon-gpio.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
index 77d35a7..973600e 100644
--- a/drivers/extcon/extcon-gpio.c
+++ b/drivers/extcon/extcon-gpio.c
@@ -111,6 +111,11 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err;
 
+	/* Use gpio debounce if available. If so, don't debounce in software. */
+	if (pdata->debounce &&
+	    !gpio_set_debounce(extcon_data->gpio, pdata->debounce * 1000))
+		extcon_data->debounce_jiffies = 0;
+
 	INIT_DELAYED_WORK(&extcon_data->work, gpio_extcon_work);
 
 	extcon_data->irq = gpio_to_irq(extcon_data->gpio);
-- 
1.7.9.7
