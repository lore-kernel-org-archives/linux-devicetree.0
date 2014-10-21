From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v4 2/6] pinctrl: rockchip: save and restore gpio6_c6 pinmux in suspend/resume
Date: Tue, 21 Oct 2014 16:19:48 -0700
Message-ID: <1413933588-25721-1-git-send-email-zyw@rock-chips.com>
References: <1413933461-25602-1-git-send-email-zyw@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413933461-25602-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Save and restore the gpio6_c6 pinmux setting, since Maskrom of RK3288
would modify it to sdmmc0_det, so it need to be restored to the correct
setting after resume from Maskrom.

Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/pinctrl/pinctrl-rockchip.c |   29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index c4a988d..e2068fe 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1771,16 +1771,43 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 }
 
 #ifdef CONFIG_PM_SLEEP
+
+#define RK3288_GRF_GPIO6C_IOMUX		0x64
+#define GPIO6C6_SEL_WRITE_ENABLE	BIT(28)
+
+static u32 rk3288_grf_gpio6c_iomux;
+
 static int rockchip_pinctrl_suspend(struct device *dev)
 {
 	struct rockchip_pinctrl *info = dev_get_drvdata(dev);
+	int ret = pinctrl_force_sleep(info->pctl_dev);
+
+	if (ret)
+		return ret;
+
+	/*
+	 * RK3288 GPIO6_C6 mux would be modified by Maskrom when resume, so save
+	 * the setting here, and restore it at resume.
+	 */
+	if (info->ctrl->type == RK3288) {
+		ret = regmap_read(info->regmap_base, RK3288_GRF_GPIO6C_IOMUX,
+				  &rk3288_grf_gpio6c_iomux);
+		if (ret)
+			return ret;
+	}
 
-	return pinctrl_force_sleep(info->pctl_dev);
+	return 0;
 }
 
 static int rockchip_pinctrl_resume(struct device *dev)
 {
 	struct rockchip_pinctrl *info = dev_get_drvdata(dev);
+	int ret = regmap_write(info->regmap_base, RK3288_GRF_GPIO6C_IOMUX,
+			       rk3288_grf_gpio6c_iomux |
+			       GPIO6C6_SEL_WRITE_ENABLE);
+
+	if (ret)
+		return ret;
 
 	return pinctrl_force_default(info->pctl_dev);
 }
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
