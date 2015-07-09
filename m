From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH 4/5] extcon: arizona: Add support for general purpose switch
Date: Thu,  9 Jul 2015 11:09:15 +0100
Message-ID: <1436436556-15540-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1436436556-15540-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436436556-15540-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

The switch is typically used in conjunction with the MICDET clamp in
order to suppress pops and clicks associated with jack insertion.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 drivers/extcon/extcon-arizona.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index f372156..b48fb29 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1216,6 +1216,8 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
 	pdata->micd_software_compare = device_property_read_bool(arizona->dev,
 						"wlf,micd-software-compare");
 
+	device_property_read_u32(arizona->dev, "wlf,gpsw", &pdata->gpsw);
+
 	return 0;
 }
 
@@ -1313,6 +1315,10 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 		info->micd_num_modes = ARRAY_SIZE(micd_default_modes);
 	}
 
+	if (arizona->pdata.gpsw > 0)
+		regmap_update_bits(arizona->regmap, ARIZONA_GP_SWITCH_1,
+				ARIZONA_SW1_MODE_MASK, arizona->pdata.gpsw);
+
 	if (arizona->pdata.micd_pol_gpio > 0) {
 		if (info->micd_modes[0].gpio)
 			mode = GPIOF_OUT_INIT_HIGH;
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
