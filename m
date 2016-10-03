From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 3/9] pinctrl: sunxi: Handle bias disable
Date: Mon,  3 Oct 2016 12:21:01 +0200
Message-ID: <f4de32e1b124b25c27e34efcadc1d332cb93ee59.1475489558.git-series.maxime.ripard@free-electrons.com>
References: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
References: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

So far, putting NO_PULL in allwinner,pull was ignored, behaving like if
that property was not there at all.

Obviously, this is not the right thing to do, and in that case, we really
need to just disable the bias.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 8 ++++++++
 1 file changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 5be455d5e252..6f6f1e0011e2 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -166,6 +166,8 @@ static int sunxi_pctrl_parse_bias_prop(struct device_node *node)
 		return -EINVAL;
 
 	switch (val) {
+	case SUN4I_PINCTRL_NO_PULL:
+		return PIN_CONFIG_BIAS_DISABLE;
 	case SUN4I_PINCTRL_PULL_UP:
 		return PIN_CONFIG_BIAS_PULL_UP;
 	case SUN4I_PINCTRL_PULL_DOWN:
@@ -402,6 +404,12 @@ static int sunxi_pconf_group_set(struct pinctrl_dev *pctldev,
 				| dlevel << sunxi_dlevel_offset(pin),
 				pctl->membase + sunxi_dlevel_reg(pin));
 			break;
+		case PIN_CONFIG_BIAS_DISABLE:
+			val = readl(pctl->membase + sunxi_pull_reg(pin));
+			mask = PULL_PINS_MASK << sunxi_pull_offset(pin);
+			writel((val & ~mask),
+			       pctl->membase + sunxi_pull_reg(pin));
+			break;
 		case PIN_CONFIG_BIAS_PULL_UP:
 			val = readl(pctl->membase + sunxi_pull_reg(pin));
 			mask = PULL_PINS_MASK << sunxi_pull_offset(pin);
-- 
git-series 0.8.10
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
