From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v4 1/6] pinctrl: rockchip: add suspend/resume functions
Date: Tue, 21 Oct 2014 16:19:17 -0700
Message-ID: <1413933557-25684-1-git-send-email-zyw@rock-chips.com>
References: <1413933461-25602-1-git-send-email-zyw@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413933461-25602-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Mike Turquette <mturquette@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dianders@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Chris Zhong <zyw@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Chris <zyw@rock-chips.com>

support suspend/resume of pinctrl, it allows handling sleep mode
for hogged pins in pinctrl

Signed-off-by: Chris Zhong <zyw@rock-chips.com>

---

Changes in v4:
- use SIMPLE_DEV_PM_OPS for suspend/resume struct

Changes in v3: None
Changes in v2: None

 drivers/pinctrl/pinctrl-rockchip.c |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 016f457..c4a988d 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1770,6 +1770,25 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 	return ctrl;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int rockchip_pinctrl_suspend(struct device *dev)
+{
+	struct rockchip_pinctrl *info = dev_get_drvdata(dev);
+
+	return pinctrl_force_sleep(info->pctl_dev);
+}
+
+static int rockchip_pinctrl_resume(struct device *dev)
+{
+	struct rockchip_pinctrl *info = dev_get_drvdata(dev);
+
+	return pinctrl_force_default(info->pctl_dev);
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(rockchip_pinctrl_dev_pm_ops, rockchip_pinctrl_suspend,
+			 rockchip_pinctrl_resume);
+
 static int rockchip_pinctrl_probe(struct platform_device *pdev)
 {
 	struct rockchip_pinctrl *info;
@@ -1983,6 +2002,7 @@ static struct platform_driver rockchip_pinctrl_driver = {
 	.driver = {
 		.name	= "rockchip-pinctrl",
 		.owner	= THIS_MODULE,
+		.pm = &rockchip_pinctrl_dev_pm_ops,
 		.of_match_table = rockchip_pinctrl_dt_match,
 	},
 };
-- 
1.7.9.5
