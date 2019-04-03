From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] hwmon: pwm-fan: Disable PWM if fetching cooling data fails
Date: Wed,  3 Apr 2019 14:48:33 +0200
Message-ID: <1554295713-18656-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: Lukasz Majewski <l.majewski@samsung.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, "# 4 . 14" <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

In case pwm_fan_of_get_cooling_data() fails we should disable the PWM
just like in the other error cases.

Reported-by: Guenter Rock <linux@roeck-us.net>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Fixes: 2e5219c77183 ("hwmon: (pwm-fan) Read PWM FAN configuration from device tree")
Cc: <stable@vger.kernel.org> # 4.14
---
 drivers/hwmon/pwm-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 167221c..e4c5197 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -271,7 +271,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	ret = pwm_fan_of_get_cooling_data(&pdev->dev, ctx);
 	if (ret)
-		return ret;
+		goto err_pwm_disable;
 
 	ctx->pwm_fan_state = ctx->pwm_fan_max_state;
 	if (IS_ENABLED(CONFIG_THERMAL)) {
-- 
2.7.4
