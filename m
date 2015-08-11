From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH RESEND 4/5] extcon: arizona: Add support for general purpose switch
Date: Tue, 11 Aug 2015 09:14:03 +0100
Message-ID: <1439280844-9808-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1439280844-9808-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439280844-9808-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, cw00.choi@samsung.com
Cc: patches@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, myungjoo.ham@samsung.com, sameo@linux.intel.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The switch is typically used in conjunction with the MICDET clamp in
order to suppress pops and clicks associated with jack insertion.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
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
