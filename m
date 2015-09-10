From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH 2/6] extcon: arizona: Additional settings to improve accuracy of HP detect
Date: Thu, 10 Sep 2015 12:41:43 +0100
Message-ID: <1441885307-24499-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1441885307-24499-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441885307-24499-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

If the TST_CAP_SEL bits aren't set correctly on wm5110/8280 there will
be a 100k load along side the headphones, which will affect the accurary
towards the very top of the detection range. This patch sets those bits.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 drivers/extcon/extcon-arizona.c |   19 +++++++++++++++++--
 1 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index b48fb29..7bfaacd 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -43,6 +43,9 @@
 #define ARIZONA_MICD_CLAMP_MODE_JDL_GP5H 0x9
 #define ARIZONA_MICD_CLAMP_MODE_JDH_GP5H 0xb
 
+#define ARIZONA_TST_CAP_DEFAULT 0x3
+#define ARIZONA_TST_CAP_CLAMP   0x1
+
 #define ARIZONA_HPDET_MAX 10000
 
 #define HPDET_DEBOUNCE 500
@@ -147,6 +150,7 @@ static void arizona_extcon_hp_clamp(struct arizona_extcon_info *info,
 {
 	struct arizona *arizona = info->arizona;
 	unsigned int mask = 0, val = 0;
+	unsigned int cap_sel = 0;
 	int ret;
 
 	switch (arizona->type) {
@@ -154,10 +158,21 @@ static void arizona_extcon_hp_clamp(struct arizona_extcon_info *info,
 	case WM8280:
 		mask = ARIZONA_HP1L_SHRTO | ARIZONA_HP1L_FLWR |
 		       ARIZONA_HP1L_SHRTI;
-		if (clamp)
+		if (clamp) {
 			val = ARIZONA_HP1L_SHRTO;
-		else
+			cap_sel = ARIZONA_TST_CAP_CLAMP;
+		} else {
 			val = ARIZONA_HP1L_FLWR | ARIZONA_HP1L_SHRTI;
+			cap_sel = ARIZONA_TST_CAP_DEFAULT;
+		}
+
+		ret = regmap_update_bits(arizona->regmap,
+					 ARIZONA_HP_TEST_CTRL_1,
+					 ARIZONA_HP1_TST_CAP_SEL_MASK,
+					 cap_sel);
+		if (ret != 0)
+			dev_warn(arizona->dev,
+				 "Failed to set TST_CAP_SEL: %d\n", ret);
 		break;
 	default:
 		mask = ARIZONA_RMV_SHRT_HP1L;
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
