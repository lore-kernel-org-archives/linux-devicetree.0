From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v5 5/7] extcon: arizona: Ensure variables are set for headphone detection
Date: Fri, 19 Jun 2015 17:23:32 +0100
Message-ID: <1434731014-19980-6-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1434731014-19980-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434731014-19980-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

The detecting flag really refers to the microphone detection stage and
as such should be cleared before arizona_identify_headphones is called.
Also the mic flag should be set before identify headphones is called as
well.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/extcon/extcon-arizona.c |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 8f0ef72..4c47eb2 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -765,10 +765,11 @@ static void arizona_micd_timeout_work(struct work_struct *work)
 	mutex_lock(&info->lock);
 
 	dev_dbg(info->arizona->dev, "MICD timed out, reporting HP\n");
-	arizona_identify_headphone(info);
 
 	info->detecting = false;
 
+	arizona_identify_headphone(info);
+
 	arizona_stop_mic(info);
 
 	mutex_unlock(&info->lock);
@@ -834,6 +835,9 @@ static void arizona_micd_detect(struct work_struct *work)
 
 	/* If we got a high impedence we should have a headset, report it. */
 	if (info->detecting && (val & ARIZONA_MICD_LVL_8)) {
+		info->mic = true;
+		info->detecting = false;
+
 		arizona_identify_headphone(info);
 
 		ret = extcon_set_cable_state_(info->edev,
@@ -849,8 +853,6 @@ static void arizona_micd_detect(struct work_struct *work)
 				ret);
 		}
 
-		info->mic = true;
-		info->detecting = false;
 		goto handled;
 	}
 
@@ -863,10 +865,11 @@ static void arizona_micd_detect(struct work_struct *work)
 	if (info->detecting && (val & MICD_LVL_1_TO_7)) {
 		if (info->jack_flips >= info->micd_num_modes * 10) {
 			dev_dbg(arizona->dev, "Detected HP/line\n");
-			arizona_identify_headphone(info);
 
 			info->detecting = false;
 
+			arizona_identify_headphone(info);
+
 			arizona_stop_mic(info);
 		} else {
 			info->micd_mode++;
-- 
1.7.2.5
