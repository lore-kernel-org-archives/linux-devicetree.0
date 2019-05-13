From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 3/9] soc: qcom: rpmpd: Modify corner defining macros
Date: Mon, 13 May 2019 15:50:09 +0530
Message-ID: <20190513102015.26551-4-sibis@codeaurora.org>
References: <20190513102015.26551-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190513102015.26551-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc: david.brown@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, rnayak@codeaurora.org, marc.w.gonzalez@free.fr, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

QCS404 uses individual resource type magic for each power-domain, so
adjust the macros slightly to make them reusable for this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[sibi: Extend rpmpd corner pair to a generic rpmpd pair]
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/rpmpd.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 94015ece40e9..bac4499c269d 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -16,7 +16,8 @@
 
 #define domain_to_rpmpd(domain) container_of(domain, struct rpmpd, pd)
 
-/* Resource types */
+/* Resource types:
+ * RPMPD_X is X encoded as a little-endian, lower-case, ASCII string */
 #define RPMPD_SMPA 0x61706d73
 #define RPMPD_LDOA 0x616f646c
 
@@ -27,46 +28,41 @@
 
 #define MAX_8996_RPMPD_STATE	6
 
-#define DEFINE_RPMPD_CORNER_SMPA(_platform, _name, _active, r_id)		\
+#define DEFINE_RPMPD_PAIR(_platform, _name, _active, r_type, r_key,	\
+			  r_id)						\
 	static struct rpmpd _platform##_##_active;			\
 	static struct rpmpd _platform##_##_name = {			\
 		.pd = {	.name = #_name,	},				\
 		.peer = &_platform##_##_active,				\
-		.res_type = RPMPD_SMPA,					\
+		.res_type = RPMPD_##r_type,				\
 		.res_id = r_id,						\
-		.key = KEY_CORNER,					\
+		.key = KEY_##r_key,					\
 	};								\
 	static struct rpmpd _platform##_##_active = {			\
 		.pd = { .name = #_active, },				\
 		.peer = &_platform##_##_name,				\
 		.active_only = true,					\
-		.res_type = RPMPD_SMPA,					\
+		.res_type = RPMPD_##r_type,				\
 		.res_id = r_id,						\
-		.key = KEY_CORNER,					\
+		.key = KEY_##r_key,					\
 	}
 
-#define DEFINE_RPMPD_CORNER_LDOA(_platform, _name, r_id)			\
+#define DEFINE_RPMPD_CORNER(_platform, _name, r_type, r_id)		\
 	static struct rpmpd _platform##_##_name = {			\
 		.pd = { .name = #_name, },				\
-		.res_type = RPMPD_LDOA,					\
+		.res_type = RPMPD_##r_type,				\
 		.res_id = r_id,						\
 		.key = KEY_CORNER,					\
 	}
 
-#define DEFINE_RPMPD_VFC(_platform, _name, r_id, r_type)		\
+#define DEFINE_RPMPD_VFC(_platform, _name, r_type, r_id)		\
 	static struct rpmpd _platform##_##_name = {			\
 		.pd = { .name = #_name, },				\
-		.res_type = r_type,					\
+		.res_type = RPMPD_##r_type,				\
 		.res_id = r_id,						\
 		.key = KEY_FLOOR_CORNER,				\
 	}
 
-#define DEFINE_RPMPD_VFC_SMPA(_platform, _name, r_id)			\
-	DEFINE_RPMPD_VFC(_platform, _name, r_id, RPMPD_SMPA)
-
-#define DEFINE_RPMPD_VFC_LDOA(_platform, _name, r_id)			\
-	DEFINE_RPMPD_VFC(_platform, _name, r_id, RPMPD_LDOA)
-
 struct rpmpd_req {
 	__le32 key;
 	__le32 nbytes;
@@ -96,12 +92,12 @@ struct rpmpd_desc {
 static DEFINE_MUTEX(rpmpd_lock);
 
 /* msm8996 RPM Power domains */
-DEFINE_RPMPD_CORNER_SMPA(msm8996, vddcx, vddcx_ao, 1);
-DEFINE_RPMPD_CORNER_SMPA(msm8996, vddmx, vddmx_ao, 2);
-DEFINE_RPMPD_CORNER_LDOA(msm8996, vddsscx, 26);
+DEFINE_RPMPD_PAIR(msm8996, vddcx, vddcx_ao, SMPA, CORNER, 1);
+DEFINE_RPMPD_PAIR(msm8996, vddmx, vddmx_ao, SMPA, CORNER, 2);
+DEFINE_RPMPD_CORNER(msm8996, vddsscx, LDOA, 26);
 
-DEFINE_RPMPD_VFC_SMPA(msm8996, vddcx_vfc, 1);
-DEFINE_RPMPD_VFC_LDOA(msm8996, vddsscx_vfc, 26);
+DEFINE_RPMPD_VFC(msm8996, vddcx_vfc, SMPA, 1);
+DEFINE_RPMPD_VFC(msm8996, vddsscx_vfc, LDOA, 26);
 
 static struct rpmpd *msm8996_rpmpds[] = {
 	[MSM8996_VDDCX] =	&msm8996_vddcx,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
