From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] pinctrl: sun4i: GPIOs configured as irq must be
 set to input before reading
Date: Sun,  8 Mar 2015 22:13:57 +0100
Message-ID: <1425849237-30182-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBHXX6KTQKGQEUX4G6BQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On sun4i-a10, when GPIOs are configured as external interrupt the value for
them in the data register does not seem to get updated, so set their mux to
input (and restore afterwards) when reading the pin.

Missed edges seem to be buffered, so this does not introduce a race
condition.

I've also tested this on sun5i-a13 and sun7i-a20 and those do not seem to
be affected, the input value representation in the data register does seem
to correctly get updated to the actual pin value while in irq mode there.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c |  1 +
 drivers/pinctrl/sunxi/pinctrl-sunxi.c     | 14 ++++++++++++--
 drivers/pinctrl/sunxi/pinctrl-sunxi.h     |  4 ++++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c b/drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c
index 24c5d88..3c68a8e 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c
@@ -1011,6 +1011,7 @@ static const struct sunxi_pinctrl_desc sun4i_a10_pinctrl_data = {
 	.pins = sun4i_a10_pins,
 	.npins = ARRAY_SIZE(sun4i_a10_pins),
 	.irq_banks = 1,
+	.irq_read_needs_mux = true,
 };
 
 static int sun4i_a10_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 3d074433..f8e171b 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -29,6 +29,7 @@
 #include <linux/slab.h>
 
 #include "../core.h"
+#include "../../gpio/gpiolib.h"
 #include "pinctrl-sunxi.h"
 
 static struct irq_chip sunxi_pinctrl_edge_irq_chip;
@@ -464,10 +465,19 @@ static int sunxi_pinctrl_gpio_direction_input(struct gpio_chip *chip,
 static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct sunxi_pinctrl *pctl = dev_get_drvdata(chip->dev);
-
 	u32 reg = sunxi_data_reg(offset);
 	u8 index = sunxi_data_offset(offset);
-	u32 val = (readl(pctl->membase + reg) >> index) & DATA_PINS_MASK;
+	u32 set_mux = pctl->desc->irq_read_needs_mux &&
+			test_bit(FLAG_USED_AS_IRQ, &chip->desc[offset].flags);
+	u32 val;
+
+	if (set_mux)
+		sunxi_pmx_set(pctl->pctl_dev, offset, SUN4I_FUNC_INPUT);
+
+	val = (readl(pctl->membase + reg) >> index) & DATA_PINS_MASK;
+
+	if (set_mux)
+		sunxi_pmx_set(pctl->pctl_dev, offset, SUN4I_FUNC_IRQ);
 
 	return val;
 }
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 5a51523..e248e81 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -77,6 +77,9 @@
 #define IRQ_LEVEL_LOW		0x03
 #define IRQ_EDGE_BOTH		0x04
 
+#define SUN4I_FUNC_INPUT	0
+#define SUN4I_FUNC_IRQ		6
+
 struct sunxi_desc_function {
 	const char	*name;
 	u8		muxval;
@@ -94,6 +97,7 @@ struct sunxi_pinctrl_desc {
 	int				npins;
 	unsigned			pin_base;
 	unsigned			irq_banks;
+	bool				irq_read_needs_mux;
 };
 
 struct sunxi_pinctrl_function {
-- 
2.3.1
