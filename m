From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v3 3/3] leds: Make led_set_brightness_sync() also use __led_set_brightness()
Date: Wed, 17 Jul 2019 15:59:48 +0200
Message-ID: <20190717135948.19340-4-jjhiblot@ti.com>
References: <20190717135948.19340-1-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190717135948.19340-1-jjhiblot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, daniel.thompson@linaro.org
Cc: dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@ti.com>
List-Id: devicetree@vger.kernel.org

There are some LED drivers that do not implement brightness_set_blocking(),
for those drivers led_set_brightness_sync() cannot work.
Fixing it by calling first __led_set_brightness() and falling back to
__led_set_brightness_blocking() if it failed.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 drivers/leds/led-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index dab32cf778f2..4a0506081c0e 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -320,15 +320,19 @@ int led_set_brightness_sync(struct led_classdev *led_cdev,
 	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
 		return -EBUSY;
 
-	led_cdev->brightness = min(value, led_cdev->max_brightness);
+	value = min(value, led_cdev->max_brightness);
 
 	if (led_cdev->flags & LED_SUSPENDED)
 		return 0;
 
-	ret = __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
+	ret = __led_set_brightness(led_cdev, value);
+	if (ret == -ENOTSUPP)
+		ret = __led_set_brightness_blocking(led_cdev, value);
 	if (ret)
 		return ret;
 
+	led_cdev->brightness = value;
+
 	return __led_handle_regulator(led_cdev, led_cdev->brightness);
 }
 EXPORT_SYMBOL_GPL(led_set_brightness_sync);
-- 
2.17.1
