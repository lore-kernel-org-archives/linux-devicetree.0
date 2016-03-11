From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 1/5] gpio: of: Scan available child node for gpio-hog
Date: Fri, 11 Mar 2016 19:13:20 +0530
Message-ID: <1457703804-3016-2-git-send-email-ldewangan@nvidia.com>
References: <1457703804-3016-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457703804-3016-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, mpa@pengutronix.de, swarren@wwwdotorg.org, treding@nvidia.com
Cc: bparrot@ti.com, acourbot@nvidia.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Look for child node which are available when iterating for
gpio hog node for request/set GPIO initial configuration
during OF gpio chip registration.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>

---
Changes from V1:
- Add Thierey's acks.
---
 drivers/gpio/gpiolib-of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 42a4bb7..f2ba1a4 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -210,7 +210,7 @@ static void of_gpiochip_scan_gpios(struct gpio_chip *chip)
 	enum gpio_lookup_flags lflags;
 	enum gpiod_flags dflags;
 
-	for_each_child_of_node(chip->of_node, np) {
+	for_each_available_child_of_node(chip->of_node, np) {
 		if (!of_property_read_bool(np, "gpio-hog"))
 			continue;
 
-- 
2.1.4
