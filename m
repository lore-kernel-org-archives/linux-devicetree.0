From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH v3 7/7] mfd: arizona: Update several pdata members to unsigned
Date: Fri, 19 Jun 2015 11:33:09 +0100
Message-ID: <1434709989-28300-8-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1434709989-28300-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434709989-28300-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Device tree and ACPI primarily deal with unsigned ints, many of the
pdata members in the Arizona driver are signed ints but are only ever
assigned positive values. Changing these pdata fields to unsigned ints
avoids us having to choose between overly verbose code and Sparse
warnings.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 include/linux/mfd/arizona/pdata.h |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
index af44081..f2c8381 100644
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
