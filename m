From: megous via linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: [PATCH v4 3/9] pinctrl: sunxi: Prepare for alternative
 bias voltage setting methods
Date: Sat, 13 Apr 2019 18:54:12 +0200
Message-ID: <20190413165418.27880-4-megous@megous.com>
References: <20190413165418.27880-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBPNIZDSQKGQEIOJMLOY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20190413165418.27880-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

H6 has a different I/O voltage bias setting method than A80. Prepare
existing code for using alternative bias voltage setting methods.

Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
---
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c   |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c       | 47 ++++++++++++---------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h       | 11 ++++-
 4 files changed, 39 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c b/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c
index e05dd9a5551d..a191a65217ac 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c
@@ -153,7 +153,7 @@ static const struct sunxi_pinctrl_desc sun9i_a80_r_pinctrl_data = {
 	.pin_base = PL_BASE,
 	.irq_banks = 2,
 	.disable_strict_mode = true,
-	.has_io_bias_cfg = true,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_GRP_CONFIG,
 };
 
 static int sun9i_a80_r_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c b/drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c
index da37d594a13d..0633a03d5e13 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c
@@ -722,7 +722,7 @@ static const struct sunxi_pinctrl_desc sun9i_a80_pinctrl_data = {
 	.npins = ARRAY_SIZE(sun9i_a80_pins),
 	.irq_banks = 5,
 	.disable_strict_mode = true,
-	.has_io_bias_cfg = true,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_GRP_CONFIG,
 };
 
 static int sun9i_a80_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index be04223591d4..98c4de5f4019 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -617,7 +617,7 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 	u32 val, reg;
 	int uV;
 
-	if (!pctl->desc->has_io_bias_cfg)
+	if (!pctl->desc->io_bias_cfg_variant)
 		return 0;
 
 	uV = regulator_get_voltage(supply);
@@ -628,25 +628,32 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 	if (uV == 0)
 		return 0;
 
-	/* Configured value must be equal or greater to actual voltage */
-	if (uV <= 1800000)
-		val = 0x0; /* 1.8V */
-	else if (uV <= 2500000)
-		val = 0x6; /* 2.5V */
-	else if (uV <= 2800000)
-		val = 0x9; /* 2.8V */
-	else if (uV <= 3000000)
-		val = 0xA; /* 3.0V */
-	else
-		val = 0xD; /* 3.3V */
-
-	pin -= pctl->desc->pin_base;
-
-	reg = readl(pctl->membase + sunxi_grp_config_reg(pin));
-	reg &= ~IO_BIAS_MASK;
-	writel(reg | val, pctl->membase + sunxi_grp_config_reg(pin));
-
-	return 0;
+	switch (pctl->desc->io_bias_cfg_variant) {
+	case BIAS_VOLTAGE_GRP_CONFIG:
+		/*
+		 * Configured value must be equal or greater to actual
+		 * voltage.
+		 */
+		if (uV <= 1800000)
+			val = 0x0; /* 1.8V */
+		else if (uV <= 2500000)
+			val = 0x6; /* 2.5V */
+		else if (uV <= 2800000)
+			val = 0x9; /* 2.8V */
+		else if (uV <= 3000000)
+			val = 0xA; /* 3.0V */
+		else
+			val = 0xD; /* 3.3V */
+
+		pin -= pctl->desc->pin_base;
+
+		reg = readl(pctl->membase + sunxi_grp_config_reg(pin));
+		reg &= ~IO_BIAS_MASK;
+		writel(reg | val, pctl->membase + sunxi_grp_config_reg(pin));
+		return 0;
+	default:
+		return -EINVAL;
+	}
 }
 
 static int sunxi_pmx_get_funcs_cnt(struct pinctrl_dev *pctldev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index ee15ab067b5f..a62b81357136 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -95,6 +95,15 @@
 #define PINCTRL_SUN7I_A20	BIT(7)
 #define PINCTRL_SUN8I_R40	BIT(8)
 
+enum sunxi_desc_bias_voltage {
+	BIAS_VOLTAGE_NONE,
+	/*
+	 * Bias voltage configuration is done through
+	 * Pn_GRP_CONFIG registers, as seen on A80 SoC.
+	 */
+	BIAS_VOLTAGE_GRP_CONFIG,
+};
+
 struct sunxi_desc_function {
 	unsigned long	variant;
 	const char	*name;
@@ -117,7 +126,7 @@ struct sunxi_pinctrl_desc {
 	const unsigned int		*irq_bank_map;
 	bool				irq_read_needs_mux;
 	bool				disable_strict_mode;
-	bool				has_io_bias_cfg;
+	enum sunxi_desc_bias_voltage	io_bias_cfg_variant;
 };
 
 struct sunxi_pinctrl_function {
-- 
2.21.0
