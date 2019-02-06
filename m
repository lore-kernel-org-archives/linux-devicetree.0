From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 1/9] pinctrl: sunxi: Support I/O bias voltage
 setting on A80
Date: Wed,  6 Feb 2019 11:32:31 +0800
Message-ID: <20190206033239.3619-2-wens@csie.org>
References: <20190206033239.3619-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBX5K5HRAKGQENB26VHI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190206033239.3619-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The A80 SoC has configuration registers for I/O bias voltage. Incorrect
settings would make the affected peripherals inoperable in some cases,
such as Ethernet RGMII signals biased at 2.5V with the settings still
at 3.3V. However low speed signals such as MDIO on the same group of
pins seem to be unaffected.

Previously there was no way to know what the actual voltage used was,
short of hard-coding a value in the device tree. With the new pin bank
regulator supply support in place, the driver can now query the
regulator for its voltage, and if it's valid (as opposed to being the
dummy regulator), set the bias voltage setting accordingly.

Add a quirk to denote the presence of the configuration registers, and
a function to set the correct setting based on the voltage read back
from the regulator.

This is only done when the regulator is first acquired and enabled.
While it would be nice to have a notifier on the regulator so that when
the voltage changes, the driver can update the setting, in practice no
board currently supports dynamic changing of the I/O voltages.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c   |  1 +
 drivers/pinctrl/sunxi/pinctrl-sunxi.c       | 41 +++++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h       | 12 ++++++
 4 files changed, 55 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c b/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c
index c63086c98335..e05dd9a5551d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c
@@ -153,6 +153,7 @@ static const struct sunxi_pinctrl_desc sun9i_a80_r_pinctrl_data = {
 	.pin_base = PL_BASE,
 	.irq_banks = 2,
 	.disable_strict_mode = true,
+	.has_io_bias_cfg = true,
 };
 
 static int sun9i_a80_r_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c b/drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c
index 5553c0eb0f41..da37d594a13d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c
@@ -722,6 +722,7 @@ static const struct sunxi_pinctrl_desc sun9i_a80_pinctrl_data = {
 	.npins = ARRAY_SIZE(sun9i_a80_pins),
 	.irq_banks = 5,
 	.disable_strict_mode = true,
+	.has_io_bias_cfg = true,
 };
 
 static int sun9i_a80_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 0e7fa69e93df..8dd25caea2cf 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -603,6 +603,45 @@ static const struct pinconf_ops sunxi_pconf_ops = {
 	.pin_config_group_set	= sunxi_pconf_group_set,
 };
 
+static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
+					 unsigned pin,
+					 struct regulator *supply)
+{
+	u32 val, reg;
+	int uV;
+
+	if (!pctl->desc->has_io_bias_cfg)
+		return 0;
+
+	uV = regulator_get_voltage(supply);
+	if (uV < 0)
+		return uV;
+
+	/* Might be dummy regulator with no voltage set */
+	if (uV == 0)
+		return 0;
+
+	/* Configured value must be equal or greater to actual voltage */
+	if (uV <= 1800000)
+		val = 0x0; /* 1.8V */
+	else if (uV <= 2500000)
+		val = 0x6; /* 2.5V */
+	else if (uV <= 2800000)
+		val = 0x9; /* 2.8V */
+	else if (uV <= 3000000)
+		val = 0xA; /* 3.0V */
+	else
+		val = 0xD; /* 3.3V */
+
+	pin -= pctl->desc->pin_base;
+
+	reg = readl(pctl->membase + sunxi_grp_config_reg(pin));
+	reg &= ~IO_BIAS_MASK;
+	writel(reg | val, pctl->membase + sunxi_grp_config_reg(pin));
+
+	return 0;
+}
+
 static int sunxi_pmx_get_funcs_cnt(struct pinctrl_dev *pctldev)
 {
 	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
@@ -725,6 +764,8 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 		goto out;
 	}
 
+	sunxi_pinctrl_set_io_bias_cfg(pctl, offset, reg);
+
 	s_reg->regulator = reg;
 	refcount_set(&s_reg->refcount, 1);
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 034c0317c8d6..ee15ab067b5f 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -79,6 +79,10 @@
 #define IRQ_LEVEL_LOW		0x03
 #define IRQ_EDGE_BOTH		0x04
 
+#define GRP_CFG_REG		0x300
+
+#define IO_BIAS_MASK		GENMASK(3, 0)
+
 #define SUN4I_FUNC_INPUT	0
 #define SUN4I_FUNC_IRQ		6
 
@@ -113,6 +117,7 @@ struct sunxi_pinctrl_desc {
 	const unsigned int		*irq_bank_map;
 	bool				irq_read_needs_mux;
 	bool				disable_strict_mode;
+	bool				has_io_bias_cfg;
 };
 
 struct sunxi_pinctrl_function {
@@ -338,6 +343,13 @@ static inline u32 sunxi_irq_status_offset(u16 irq)
 	return irq_num * IRQ_STATUS_IRQ_BITS;
 }
 
+static inline u32 sunxi_grp_config_reg(u16 pin)
+{
+	u8 bank = pin / PINS_PER_BANK;
+
+	return GRP_CFG_REG + bank * 0x4;
+}
+
 int sunxi_pinctrl_init_with_variant(struct platform_device *pdev,
 				    const struct sunxi_pinctrl_desc *desc,
 				    unsigned long variant);
-- 
2.20.1
