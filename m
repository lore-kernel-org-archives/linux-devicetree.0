From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 4/6] pinctrl: rockchip: remove redundant check
Date: Tue, 15 Oct 2013 12:48:35 +0200
Message-ID: <201310151248.36087.heiko@sntech.de>
References: <201310151246.49402.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201310151246.49402.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The check limiting bias options to supported ones is already
done thru rockchip_pinconf_pull_valid. Therefore this check is
redundant and can be removed.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/pinctrl/pinctrl-rockchip.c |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index bfa3abe..c5bbd24 100644
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
