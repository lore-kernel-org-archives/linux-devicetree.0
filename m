From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/6] extcon-gpio: Do not unnecessarily initialize variables
Date: Thu, 29 Aug 2013 21:29:33 -0700
Message-ID: <1377836978-24082-2-git-send-email-linux@roeck-us.net>
References: <1377836978-24082-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1377836978-24082-1-git-send-email-linux@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Grant Likely <grant.likely@linaro.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/extcon/extcon-gpio.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
index 02bec32..77d35a7 100644
--- a/drivers/extcon/extcon-gpio.c
+++ b/drivers/extcon/extcon-gpio.c
@@ -80,7 +80,7 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 {
 	struct gpio_extcon_platform_data *pdata = pdev->dev.platform_data;
 	struct gpio_extcon_data *extcon_data;
-	int ret = 0;
+	int ret;
 
 	if (!pdata)
 		return -EBUSY;
-- 
1.7.9.7
