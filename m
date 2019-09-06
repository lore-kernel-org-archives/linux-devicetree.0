From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] gpio: of: Switch to EXPORT_SYMBOL_GPL()
Date: Fri,  6 Sep 2019 10:45:38 +0200
Message-ID: <20190906084539.21838-4-geert+renesas@glider.be>
References: <20190906084539.21838-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906084539.21838-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

All exported functions provide genuine Linux-specific functionality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpiolib-of.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index fad3aad667558325..7aea6d0f3ace9b82 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -274,7 +274,7 @@ int of_get_named_gpio_flags(struct device_node *np, const char *list_name,
 	else
 		return desc_to_gpio(desc);
 }
-EXPORT_SYMBOL(of_get_named_gpio_flags);
+EXPORT_SYMBOL_GPL(of_get_named_gpio_flags);
 
 /**
  * gpiod_get_from_of_node() - obtain a GPIO from an OF node
@@ -343,7 +343,7 @@ struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
 
 	return desc;
 }
-EXPORT_SYMBOL(gpiod_get_from_of_node);
+EXPORT_SYMBOL_GPL(gpiod_get_from_of_node);
 
 /*
  * The SPI GPIO bindings happened before we managed to establish that GPIO
@@ -719,7 +719,7 @@ int of_mm_gpiochip_add_data(struct device_node *np,
 	pr_err("%pOF: GPIO chip registration failed with status %d\n", np, ret);
 	return ret;
 }
-EXPORT_SYMBOL(of_mm_gpiochip_add_data);
+EXPORT_SYMBOL_GPL(of_mm_gpiochip_add_data);
 
 /**
  * of_mm_gpiochip_remove - Remove memory mapped GPIO chip (bank)
@@ -736,7 +736,7 @@ void of_mm_gpiochip_remove(struct of_mm_gpio_chip *mm_gc)
 	iounmap(mm_gc->regs);
 	kfree(gc->label);
 }
-EXPORT_SYMBOL(of_mm_gpiochip_remove);
+EXPORT_SYMBOL_GPL(of_mm_gpiochip_remove);
 
 static void of_gpiochip_init_valid_mask(struct gpio_chip *chip)
 {
-- 
2.17.1
