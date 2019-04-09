From: megous via linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: [PATCH v2 06/13] pinctrl: sunxi: Support I/O bias
 voltage setting on H6
Date: Tue,  9 Apr 2019 02:24:45 +0200
Message-ID: <20190409002452.14551-7-megous@megous.com>
References: <20190409002452.14551-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBXOMV7SQKGQEUS5O6EI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20190409002452.14551-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Naveen Gupta <naveen.gupta-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, brcm802
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

H6 SoC has a "pio group withstand voltage mode" register (datasheet
description), that needs to be used to select either 1.8V or 3.3V I/O mode,
based on what voltage is powering the respective pin banks and is thus used
for I/O signals.

Add support for configuring this register according to the voltage of the
pin bank regulator (if enabled).

This is similar to the support for I/O bias voltage setting patch for A80
and the same concerns apply. See:

  commit 402bfb3c1352 ("Support I/O bias voltage setting on A80")

Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c |  1 +
 drivers/pinctrl/sunxi/pinctrl-sunxi.c     | 10 ++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h     |  4 ++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c
index ef4268cc6227..30b1befa8ed8 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c
@@ -591,6 +591,7 @@ static const struct sunxi_pinctrl_desc h6_pinctrl_data = {
 	.irq_banks = 4,
 	.irq_bank_map = h6_irq_bank_map,
 	.irq_read_needs_mux = true,
+	.io_bias_cfg_variant = IO_BIAS_CFG_V2,
 };
 
 static int h6_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index b8dd58ef33b7..0ab50a15a716 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -607,6 +607,8 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 					 unsigned pin,
 					 struct regulator *supply)
 {
+	unsigned short bank = pin / PINS_PER_BANK;
+	unsigned long flags;
 	u32 val, reg;
 	int uV;
 
@@ -642,6 +644,14 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		reg = readl(pctl->membase + sunxi_grp_config_reg(pin));
 		reg &= ~IO_BIAS_MASK;
 		writel(reg | val, pctl->membase + sunxi_grp_config_reg(pin));
+	} else if (pctl->desc->io_bias_cfg_variant == IO_BIAS_CFG_V2) {
+		val = uV <= 1800000 ? 1 : 0;
+
+		raw_spin_lock_irqsave(&pctl->lock, flags);
+		reg = readl(pctl->membase + PIO_POW_MOD_SEL_REG);
+		reg &= ~(1 << bank);
+		writel(reg | val << bank, pctl->membase + PIO_POW_MOD_SEL_REG);
+		raw_spin_unlock_irqrestore(&pctl->lock, flags);
 	}
 
 	return 0;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 642f667e99d2..4044a3cb1819 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -95,8 +95,12 @@
 #define PINCTRL_SUN7I_A20	BIT(7)
 #define PINCTRL_SUN8I_R40	BIT(8)
 
+#define PIO_POW_MOD_SEL_REG	0x340
+
 /* Bias voltage configuration done via Pn_GRP_CONFIG registers. */
 #define IO_BIAS_CFG_V1		1
+/* Bias voltage set in the PIO_POW_MOD_SEL_REG register. */
+#define IO_BIAS_CFG_V2		2
 
 struct sunxi_desc_function {
 	unsigned long	variant;
-- 
2.21.0
