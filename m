From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 3/5] pinctrl: rockchip: remove redundant check
Date: Wed, 16 Oct 2013 01:08:11 +0200
Message-ID: <201310160108.12261.heiko@sntech.de>
References: <201310160106.42329.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201310160106.42329.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The check limiting bias options to supported ones is already
done thru rockchip_pinconf_pull_valid. Therefore this check is
redundant and can be removed.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/pinctrl/pinctrl-rockchip.c |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index efca116..91027dd 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -424,12 +424,6 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 
 	switch (ctrl->type) {
 	case RK2928:
-		if (pull != PIN_CONFIG_BIAS_PULL_PIN_DEFAULT &&
-					pull != PIN_CONFIG_BIAS_DISABLE) {
-			dev_err(info->dev, "only PIN_DEFAULT and DISABLE allowed\n");
-			return -EINVAL;
-		}
-
 		ctrl->pull_calc_reg(bank, pin_num, &reg, &bit);
 
 		spin_lock_irqsave(&bank->slock, flags);
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
