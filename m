From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH v4 2/8] extcon: arizona: Factor out initial GPIO state
Date: Fri, 19 Jun 2015 13:37:30 +0100
Message-ID: <1434717456-31995-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1434717456-31995-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434717456-31995-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 drivers/extcon/extcon-arizona.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 1fbe3b4..c4d179b 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1135,6 +1135,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 	struct arizona *arizona = dev_get_drvdata(pdev->dev.parent);
 	struct arizona_pdata *pdata = &arizona->pdata;
 	struct arizona_extcon_info *info;
+	int gpio_initial_level;
 	unsigned int val;
 	unsigned int clamp_mode;
 	int jack_irq_fall, jack_irq_rise;
@@ -1226,8 +1227,9 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 		info->micd_num_modes = ARRAY_SIZE(micd_default_modes);
 	}
 
+	gpio_initial_level = info->micd_modes[0].gpio;
 	if (arizona->pdata.micd_pol_gpio > 0) {
-		if (info->micd_modes[0].gpio)
+		if (gpio_initial_level)
 			mode = GPIOF_OUT_INIT_HIGH;
 		else
 			mode = GPIOF_OUT_INIT_LOW;
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
