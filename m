From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/5] RFC: gpio: Add API to explicitly name a consumer
Date: Mon, 18 Jun 2018 09:45:52 +0200
Message-ID: <20180618074556.6944-2-linus.walleij@linaro.org>
References: <20180618074556.6944-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180618074556.6944-1-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dev@lists.96boards.org
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, John Stultz <john.stultz@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Andy Shevchenko <andy@infradead.org>
List-Id: devicetree@vger.kernel.org

The GPIO (descriptor) API registers a "label" naming what is
currently using the GPIO line. Typically this is taken from
things like the device tree node, so "reset-gpios" will result
in he line being labeled "reset".

The technical effect is pretty much zero: the use is for
debug and introspection, such as "lsgpio" and debugfs files.

However sometimes the user want this cuddly feeling of
listing all GPIO lines and seeing exactly what they are for
and it gives a very fulfilling sense of control. Especially
in the cases when the device tree node doesn't provide a
good name, or anonymous GPIO lines assigned just to
"gpios" in the device tree because the usage is implicit.

For these cases it may be nice to be able to label the
line directly and explicitly.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c        | 13 +++++++++++++
 include/linux/gpio/consumer.h |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e11a3bb03820..c6f77e806cb8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3193,6 +3193,19 @@ int gpiod_cansleep(const struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_cansleep);
 
+/**
+ * gpiod_set_consumer_name() - set the consumer name for the descriptor
+ * @desc: gpio to set the consumer name on
+ * @name: the new consumer name
+ */
+void gpiod_set_consumer_name(struct gpio_desc *desc, const char *name)
+{
+	VALIDATE_DESC_VOID(desc);
+	/* Just overwrite whatever the previous name was */
+	desc->label = name;
+}
+EXPORT_SYMBOL_GPL(gpiod_set_consumer_name);
+
 /**
  * gpiod_to_irq() - return the IRQ corresponding to a GPIO
  * @desc: gpio whose IRQ will be returned (already requested)
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 243112c7fa7d..e8aaf34dd65d 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -145,6 +145,7 @@ int gpiod_is_active_low(const struct gpio_desc *desc);
 int gpiod_cansleep(const struct gpio_desc *desc);
 
 int gpiod_to_irq(const struct gpio_desc *desc);
+void gpiod_set_consumer_name(struct gpio_desc *desc, const char *name);
 
 /* Convert between the old gpio_ and new gpiod_ interfaces */
 struct gpio_desc *gpio_to_desc(unsigned gpio);
@@ -467,6 +468,12 @@ static inline int gpiod_to_irq(const struct gpio_desc *desc)
 	return -EINVAL;
 }
 
+static inline void gpiod_set_consumer_name(struct gpio_desc *desc, const char *name)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(1);
+}
+
 static inline struct gpio_desc *gpio_to_desc(unsigned gpio)
 {
 	return ERR_PTR(-EINVAL);
-- 
2.17.0
