From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v4 5/6] clk: qcom: ipq4019: Add all the frequencies for apss cpu
Date: Fri, 25 Nov 2016 21:11:32 +0530
Message-ID: <1480088493-4590-6-git-send-email-absahu@codeaurora.org>
References: <1480088493-4590-1-git-send-email-absahu@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480088493-4590-1-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pradeepb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, snlakshm-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The APSS CPU clock does not contain all the frequencies in its
frequency table so this patch adds the same.

Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 320750c..eeafca2 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -569,10 +569,20 @@ struct clk_fepll {
 };
 
 static const struct freq_tbl ftbl_gcc_apps_clk[] = {
-	F(48000000, P_XO,	   1, 0, 0),
+	F(48000000,  P_XO,         1, 0, 0),
 	F(200000000, P_FEPLL200,   1, 0, 0),
+	F(384000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(413000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(448000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(488000000, P_DDRPLLAPSS, 1, 0, 0),
 	F(500000000, P_FEPLL500,   1, 0, 0),
-	F(626000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(512000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(537000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(565000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(597000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(632000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(672000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(716000000, P_DDRPLLAPSS, 1, 0, 0),
 	{ }
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
