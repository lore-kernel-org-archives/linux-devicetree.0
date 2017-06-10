From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v7 5/9] gpiolib: export gpiochip_irq_reqres and
 gpiochip_irq_relres
Date: Sat, 10 Jun 2017 23:57:37 +0200
Message-ID: <e6618077-a362-86cf-7cd3-f46de39396e4@gmail.com>
References: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

Customized versions of the request_resources and release_resources
callbacks usually just extend what is available in gpiochip_irq_reqres
and gpiochip_irq_relres. Therefore export them to make them available
to gpio drivers.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/gpio/gpiolib.c      | 6 ++++--
 include/linux/gpio/driver.h | 3 +++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 62ffb4e2..4d666abb 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1643,7 +1643,7 @@ static const struct irq_domain_ops gpiochip_domain_ops = {
 	.xlate	= irq_domain_xlate_twocell,
 };
 
-static int gpiochip_irq_reqres(struct irq_data *d)
+int gpiochip_irq_reqres(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 
@@ -1659,14 +1659,16 @@ static int gpiochip_irq_reqres(struct irq_data *d)
 	}
 	return 0;
 }
+EXPORT_SYMBOL_GPL(gpiochip_irq_reqres);
 
-static void gpiochip_irq_relres(struct irq_data *d)
+void gpiochip_irq_relres(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 
 	gpiochip_unlock_as_irq(chip, d->hwirq);
 	module_put(chip->gpiodev->owner);
 }
+EXPORT_SYMBOL_GPL(gpiochip_irq_relres);
 
 static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index af20369e..82bc27de 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -262,6 +262,9 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 			     bool nested,
 			     struct lock_class_key *lock_key);
 
+int gpiochip_irq_reqres(struct irq_data *d);
+void gpiochip_irq_relres(struct irq_data *d);
+
 #ifdef CONFIG_LOCKDEP
 
 /*
-- 
2.13.1


