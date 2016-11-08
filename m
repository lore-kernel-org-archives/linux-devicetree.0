From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v2 1/2] pinctrl: sunxi: Add support for interrupt debouncing
Date: Tue,  8 Nov 2016 21:24:00 +0100
Message-ID: <7dbb47b16d83b843705aa05d4a5f1f7dfdc4e9a3.1478636546.git-series.maxime.ripard@free-electrons.com>
References: <cover.61acad25a6fb233e39141b52acd217415281bd73.1478636546.git-series.maxime.ripard@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.61acad25a6fb233e39141b52acd217415281bd73.1478636546.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.61acad25a6fb233e39141b52acd217415281bd73.1478636546.git-series.maxime.ripard@free-electrons.com>
References: <cover.61acad25a6fb233e39141b52acd217415281bd73.1478636546.git-series.maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

The pin controller found in the Allwinner SoCs has support for interrupts
debouncing.

However, this is not done per-pin, preventing us from using the generic
pinconf binding for that, but per irq bank, which, depending on the SoC,
ranges from one to five.

Introduce a device-wide property to deal with this using a microsecond
resolution. We can re-use the per-pin input-debounce property for that, so
let's do it!

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt | 14 ++++++++++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c                                 | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h                                 |  7 ++++++-
 3 files changed, 102 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
index 1685821eea41..350e155d9fc2 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
@@ -28,6 +28,20 @@ Required properties:
 - reg: Should contain the register physical address and length for the
   pin controller.
 
+- clocks: phandle to the clocks feeding the pin controller:
+  - "apb": the gated APB parent clock
+  - "hosc": the high frequency oscillator in the system
+  - "losc": the low frequency oscillator in the system
+
+Note: For backward compatibility reasons, the hosc and losc clocks are only
+required if you need to use the optional input-debounce property. Any new
+device tree should set them.
+
+Optional properties:
+  - input-debounce: Array of debouncing periods in microseconds. One period per
+    irq bank found in the controller
+
+
 Please refer to pinctrl-bindings.txt in this directory for details of the
 common pinctrl bindings used by client devices.
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 0facbea5f465..5c64fbb3de48 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -870,6 +870,85 @@ static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 	return 0;
 }
 
+static int sunxi_pinctrl_compute_debounce(struct clk *clk, int freq, int *diff)
+{
+	unsigned long clock = clk_get_rate(clk);
+	unsigned int best_diff = ~0, best_div;
+	int i;
+
+	for (i = 0; i < 8; i++) {
+		int cur_diff = abs(freq - (clock >> i));
+
+		if (cur_diff < best_diff) {
+			best_diff = cur_diff;
+			best_div = i;
+		}
+	}
+
+	*diff = best_diff;
+	return best_div;
+}
+
+static int sunxi_pinctrl_setup_debounce(struct sunxi_pinctrl *pctl,
+					struct device_node *node)
+{
+	unsigned int hosc_diff, losc_diff;
+	unsigned int hosc_div, losc_div;
+	struct clk *hosc, *losc;
+	u8 div, src;
+	int i, ret;
+
+	/* Deal with old DTs that didn't have the oscillators */
+	if (of_count_phandle_with_args(node, "clocks", "#clock-cells") != 3)
+		return 0;
+
+	/* If we don't have any setup, bail out */
+	if (!of_find_property(node, "input-debounce", NULL))
+		return 0;
+
+	losc = devm_clk_get(pctl->dev, "losc");
+	if (IS_ERR(losc))
+		return PTR_ERR(losc);
+
+	hosc = devm_clk_get(pctl->dev, "hosc");
+	if (IS_ERR(hosc))
+		return PTR_ERR(hosc);
+
+	for (i = 0; i < pctl->desc->irq_banks; i++) {
+		unsigned long debounce_freq;
+		u32 debounce;
+
+		ret = of_property_read_u32_index(node, "input-debounce",
+						 i, &debounce);
+		if (ret)
+			return ret;
+
+		debounce_freq = USEC_PER_SEC / debounce;
+		losc_div = sunxi_pinctrl_compute_debounce(losc,
+							  debounce_freq,
+							  &losc_diff);
+
+		hosc_div = sunxi_pinctrl_compute_debounce(hosc,
+							  debounce_freq,
+							  &hosc_diff);
+
+		if (hosc_diff < losc_diff) {
+			div = hosc_div;
+			src = 1;
+		} else {
+			div = losc_div;
+			src = 0;
+		}
+
+		writel(src | div << 4,
+		       pctl->membase +
+		       sunxi_irq_debounce_reg_from_bank(i,
+							pctl->desc->irq_bank_base));
+	}
+
+	return 0;
+}
+
 int sunxi_pinctrl_init(struct platform_device *pdev,
 		       const struct sunxi_pinctrl_desc *desc)
 {
@@ -1032,6 +1111,8 @@ int sunxi_pinctrl_init(struct platform_device *pdev,
 						 pctl);
 	}
 
+	sunxi_pinctrl_setup_debounce(pctl, node);
+
 	dev_info(&pdev->dev, "initialized sunXi PIO driver\n");
 
 	return 0;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 0afce1ab12d0..c0d97fe58e84 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -69,6 +69,8 @@
 #define IRQ_STATUS_IRQ_BITS		1
 #define IRQ_STATUS_IRQ_MASK		((1 << IRQ_STATUS_IRQ_BITS) - 1)
 
+#define IRQ_DEBOUNCE_REG	0x218
+
 #define IRQ_MEM_SIZE		0x20
 
 #define IRQ_EDGE_RISING		0x00
@@ -266,6 +268,11 @@ static inline u32 sunxi_irq_ctrl_offset(u16 irq)
 	return irq_num * IRQ_CTRL_IRQ_BITS;
 }
 
+static inline u32 sunxi_irq_debounce_reg_from_bank(u8 bank, unsigned bank_base)
+{
+	return IRQ_DEBOUNCE_REG + (bank_base + bank) * IRQ_MEM_SIZE;
+}
+
 static inline u32 sunxi_irq_status_reg_from_bank(u8 bank, unsigned bank_base)
 {
 	return IRQ_STATUS_REG + (bank_base + bank) * IRQ_MEM_SIZE;
-- 
git-series 0.8.11
