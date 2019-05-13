From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 8/9] soc: qcom: rpmpd: Add MSM8998 power-domains
Date: Mon, 13 May 2019 15:50:14 +0530
Message-ID: <20190513102015.26551-9-sibis@codeaurora.org>
References: <20190513102015.26551-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190513102015.26551-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc: david.brown@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, rnayak@codeaurora.org, marc.w.gonzalez@free.fr, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add the shared cx/mx and sensor sub-system's cx and mx
power-domains found on MSM8998.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/rpmpd.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 63db8b26642c..3c1a55cf25d6 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -20,9 +20,12 @@
  * RPMPD_X is X encoded as a little-endian, lower-case, ASCII string */
 #define RPMPD_SMPA 0x61706d73
 #define RPMPD_LDOA 0x616f646c
+#define RPMPD_RWCX 0x78637772
 #define RPMPD_RWMX 0x786d7772
 #define RPMPD_RWLC 0x636c7772
 #define RPMPD_RWLM 0x6d6c7772
+#define RPMPD_RWSC 0x63737772
+#define RPMPD_RWSM 0x6d737772
 
 /* Operation Keys */
 #define KEY_CORNER		0x6e726f63 /* corn */
@@ -136,6 +139,38 @@ static const struct rpmpd_desc msm8996_desc = {
 	.max_state = MAX_8996_RPMPD_STATE,
 };
 
+/* msm8998 RPM Power domains */
+DEFINE_RPMPD_PAIR(msm8998, vddcx, vddcx_ao, RWCX, LEVEL, 0);
+DEFINE_RPMPD_VFL(msm8998, vddcx_vfl, RWCX, 0);
+
+DEFINE_RPMPD_PAIR(msm8998, vddmx, vddmx_ao, RWMX, LEVEL, 0);
+DEFINE_RPMPD_VFL(msm8998, vddmx_vfl, RWMX, 0);
+
+DEFINE_RPMPD_LEVEL(msm8998, vdd_ssccx, RWSC, 0);
+DEFINE_RPMPD_VFL(msm8998, vdd_ssccx_vfl, RWSC, 0);
+
+DEFINE_RPMPD_LEVEL(msm8998, vdd_sscmx, RWSM, 0);
+DEFINE_RPMPD_VFL(msm8998, vdd_sscmx_vfl, RWSM, 0);
+
+static struct rpmpd *msm8998_rpmpds[] = {
+	[MSM8998_VDDCX] =		&msm8998_vddcx,
+	[MSM8998_VDDCX_AO] =		&msm8998_vddcx_ao,
+	[MSM8998_VDDCX_VFL] =		&msm8998_vddcx_vfl,
+	[MSM8998_VDDMX] =		&msm8998_vddmx,
+	[MSM8998_VDDMX_AO] =		&msm8998_vddmx_ao,
+	[MSM8998_VDDMX_VFL] =		&msm8998_vddmx_vfl,
+	[MSM8998_SSCCX] =		&msm8998_vdd_ssccx,
+	[MSM8998_SSCCX_VFL] =		&msm8998_vdd_ssccx_vfl,
+	[MSM8998_SSCMX] =		&msm8998_vdd_sscmx,
+	[MSM8998_SSCMX_VFL] =		&msm8998_vdd_sscmx_vfl,
+};
+
+static const struct rpmpd_desc msm8998_desc = {
+	.rpmpds = msm8998_rpmpds,
+	.num_pds = ARRAY_SIZE(msm8998_rpmpds),
+	.max_state = RPM_SMD_LEVEL_BINNING,
+};
+
 /* qcs404 RPM Power domains */
 DEFINE_RPMPD_PAIR(qcs404, vddmx, vddmx_ao, RWMX, LEVEL, 0);
 DEFINE_RPMPD_VFL(qcs404, vddmx_vfl, RWMX, 0);
@@ -164,6 +199,7 @@ static const struct rpmpd_desc qcs404_desc = {
 
 static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
+	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
 	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
 	{ }
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
