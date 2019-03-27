From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 5/9] soc: qcom: rpmpd: Add QCS404 power-domains
Date: Wed, 27 Mar 2019 18:08:28 +0530
Message-ID: <20190327123832.11566-6-sibis@codeaurora.org>
References: <20190327123832.11566-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190327123832.11566-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, rnayak@codeaurora.org
Cc: david.brown@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Add the shared cx/mx and the low-power-island's cx and mx power-domains
found on QCS404.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[sibi: Fixup corner/vfc with vlfl/vfl]
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/rpmpd.c | 52 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index ca736ceb969c..238a9e02e890 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -19,11 +19,16 @@
 /* Resource types */
 #define RPMPD_SMPA 0x61706d73 /* smpa */
 #define RPMPD_LDOA 0x616f646c /* ldoa */
+#define RPMPD_RWMX 0x786d7772 /* rwmx */
+#define RPMPD_RWLC 0x636c7772 /* rwlc */
+#define RPMPD_RWLM 0x6d6c7772 /* rwlm */
 
 /* Operation Keys */
 #define KEY_CORNER		0x6e726f63 /* corn */
 #define KEY_ENABLE		0x6e657773 /* swen */
 #define KEY_FLOOR_CORNER	0x636676   /* vfc */
+#define KEY_FLOOR_LEVEL		0x6c6676   /* vfl */
+#define KEY_LEVEL		0x6c766c76 /* vlvl */
 
 #define MAX_8996_RPMPD_STATE	6
 
@@ -54,6 +59,14 @@
 		.key = KEY_CORNER,					\
 	}
 
+#define DEFINE_RPMPD_LEVEL(_platform, _name, r_type, r_id)		\
+	static struct rpmpd _platform##_##_name = {			\
+		.pd = { .name = #_name, },				\
+		.res_type = RPMPD_##r_type,				\
+		.res_id = r_id,						\
+		.key = KEY_LEVEL,					\
+	}
+
 #define DEFINE_RPMPD_VFC(_platform, _name, r_type, r_id)		\
 	static struct rpmpd _platform##_##_name = {			\
 		.pd = { .name = #_name, },				\
@@ -62,6 +75,14 @@
 		.key = KEY_FLOOR_CORNER,				\
 	}
 
+#define DEFINE_RPMPD_VFL(_platform, _name, r_type, r_id)		\
+	static struct rpmpd _platform##_##_name = {			\
+		.pd = { .name = #_name, },				\
+		.res_type = RPMPD_##r_type,				\
+		.res_id = r_id,						\
+		.key = KEY_FLOOR_LEVEL,					\
+	}
+
 struct rpmpd_req {
 	__le32 key;
 	__le32 nbytes;
@@ -114,8 +135,35 @@ static const struct rpmpd_desc msm8996_desc = {
 	.max_state = MAX_8996_RPMPD_STATE,
 };
 
+/* qcs404 RPM Power domains */
+DEFINE_RPMPD_PAIR(qcs404, vddmx, vddmx_ao, RWMX, LEVEL, 0);
+DEFINE_RPMPD_VFL(qcs404, vddmx_vfl, RWMX, 0);
+
+DEFINE_RPMPD_LEVEL(qcs404, vdd_lpicx, RWLC, 0);
+DEFINE_RPMPD_VFL(qcs404, vdd_lpicx_vfl, RWLC, 0);
+
+DEFINE_RPMPD_LEVEL(qcs404, vdd_lpimx, RWLM, 0);
+DEFINE_RPMPD_VFL(qcs404, vdd_lpimx_vfl, RWLM, 0);
+
+static struct rpmpd *qcs404_rpmpds[] = {
+	[QCS404_VDDMX] = &qcs404_vddmx,
+	[QCS404_VDDMX_AO] = &qcs404_vddmx_ao,
+	[QCS404_VDDMX_VFL] = &qcs404_vddmx_vfl,
+	[QCS404_LPICX] = &qcs404_vdd_lpicx,
+	[QCS404_LPICX_VFL] = &qcs404_vdd_lpicx_vfl,
+	[QCS404_LPIMX] = &qcs404_vdd_lpimx,
+	[QCS404_LPIMX_VFL] = &qcs404_vdd_lpimx_vfl,
+};
+
+static const struct rpmpd_desc qcs404_desc = {
+	.rpmpds = qcs404_rpmpds,
+	.num_pds = ARRAY_SIZE(qcs404_rpmpds),
+	.max_state = RPM_SMD_LEVEL_BINNING,
+};
+
 static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
+	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
 	{ }
 };
 
@@ -230,7 +278,9 @@ static int rpmpd_set_performance(struct generic_pm_domain *domain,
 
 	pd->corner = state;
 
-	if (!pd->enabled && pd->key != KEY_FLOOR_CORNER)
+	/* Always send updates for vfc and vfl */
+	if (!pd->enabled && pd->key != KEY_FLOOR_CORNER &&
+	    pd->key != KEY_FLOOR_LEVEL)
 		goto out;
 
 	ret = rpmpd_aggregate_corner(pd);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
