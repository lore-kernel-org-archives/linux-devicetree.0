From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 2/2] gpio: propagate of_parse_phandle_with_args errors
Date: Fri, 29 Jun 2012 13:57:59 +0900
Message-ID: <1340945879-11712-3-git-send-email-acourbot@nvidia.com>
References: <1340945879-11712-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1340945879-11712-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@stericsson.com>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

Make of_get_named_gpio_flags propagate any error it receives from
of_parse_phandle_with_args instead of inconditionally returning -EINVAL.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/gpiolib-of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 8389d4a..a71aeca 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -73,7 +73,7 @@ int of_get_named_gpio_flags(struct device_node *np, const char *propname,
 					 &gg_data.gpiospec);
 	if (ret) {
 		pr_debug("%s: can't parse gpios property\n", __func__);
-		return -EINVAL;
+		return ret;
 	}
 
 	gpiochip_find(&gg_data, of_gpiochip_find_and_xlate);
-- 
1.7.11.1
