From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v4 8/8] mfd: arizona: Update several pdata members to unsigned
Date: Fri, 19 Jun 2015 13:37:36 +0100
Message-ID: <1434717456-31995-9-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1434717456-31995-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434717456-31995-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Device tree and ACPI primarily deal with unsigned ints, many of the
pdata members in the Arizona driver are signed ints but are only ever
assigned positive values. Changing these pdata fields to unsigned ints
avoids us having to choose between overly verbose code and Sparse
warnings.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 include/linux/mfd/arizona/pdata.h |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
index bd68355..85b132c 100644
--- a/include/linux/mfd/arizona/pdata.h
+++ b/include/linux/mfd/arizona/pdata.h
@@ -104,7 +104,7 @@ struct arizona_pdata {
 	 * useful for systems where and I2S bus with multiple data
 	 * lines is mastered.
 	 */
-	int max_channels_clocked[ARIZONA_MAX_AIF];
+	unsigned int max_channels_clocked[ARIZONA_MAX_AIF];
 
 	/** GPIO5 is used for jack detection */
 	bool jd_gpio5;
@@ -128,22 +128,22 @@ struct arizona_pdata {
 	unsigned int hpdet_channel;
 
 	/** Extra debounce timeout used during initial mic detection (ms) */
-	int micd_detect_debounce;
+	unsigned int micd_detect_debounce;
 
 	/** GPIO for mic detection polarity */
 	int micd_pol_gpio;
 
 	/** Mic detect ramp rate */
-	int micd_bias_start_time;
+	unsigned int micd_bias_start_time;
 
 	/** Mic detect sample rate */
-	int micd_rate;
+	unsigned int micd_rate;
 
 	/** Mic detect debounce level */
-	int micd_dbtime;
+	unsigned int micd_dbtime;
 
 	/** Mic detect timeout (ms) */
-	int micd_timeout;
+	unsigned int micd_timeout;
 
 	/** Force MICBIAS on for mic detect */
 	bool micd_force_micbias;
-- 
1.7.2.5
