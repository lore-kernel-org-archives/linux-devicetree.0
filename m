From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/3] soc: qcom: rpmpd: Add QCS404 corners
Date: Wed, 20 Feb 2019 22:44:33 -0800
Message-ID: <20190221064434.2760-3-bjorn.andersson@linaro.org>
References: <20190221064434.2760-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221064434.2760-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the shared cx/mx and the low-power-island's cx and mx power-domains
found on QCS404.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.txt  |  1 +
 drivers/soc/qcom/rpmpd.c                      | 29 +++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h        |  9 ++++++
 3 files changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
index 980e5413d18f..b6c596883ea4 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
@@ -6,6 +6,7 @@ which then translates it into a corresponding voltage on a rail
 Required Properties:
  - compatible: Should be one of the following
 	* qcom,msm8996-rpmpd: RPM Power domain for the msm8996 family of SoC
+	* qcom,qcs404-rpmpd: RPM Power domain for the qcs404
 	* qcom,sdm845-rpmhpd: RPMh Power domain for the sdm845 family of SoC
  - #power-domain-cells: number of cells in Power domain specifier
 	must be 1.
diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 74b2f001b9c6..0001fcafaf97 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -19,6 +19,9 @@
 /* Resource types */
 #define RPMPD_SMPA 0x61706d73 /* smpa */
 #define RPMPD_LDOA 0x616f646c /* ldoa */
+#define RPMPD_RWMX 0x786d7772 /* rwmx */
+#define RPMPD_RWLC 0x636c7772 /* rwlc */
+#define RPMPD_RWLM 0x6d6c7772 /* rwlm */
 
 /* Operation Keys */
 #define KEY_CORNER		0x6e726f63 /* corn */
@@ -110,8 +113,34 @@ static const struct rpmpd_desc msm8996_desc = {
 	.num_pds = ARRAY_SIZE(msm8996_rpmpds),
 };
 
+/* qcs404 RPM Power domains */
+DEFINE_RPMPD_CORNER_PAIR(qcs404, vddmx, vddmx_ao, RWMX, 0);
+DEFINE_RPMPD_VFC(qcs404, vddmx_vfc, RWMX, 0);
+
+DEFINE_RPMPD_CORNER(qcs404, vdd_lpicx, RWLC, 0);
+DEFINE_RPMPD_VFC(qcs404, vdd_lpicx_vfc, RWLC, 0);
+
+DEFINE_RPMPD_CORNER(qcs404, vdd_lpimx, RWLM, 0);
+DEFINE_RPMPD_VFC(qcs404, vdd_lpimx_vfc, RWLM, 0);
+
+static struct rpmpd *qcs404_rpmpds[] = {
+	[QCS404_VDDMX] = &qcs404_vddmx,
+	[QCS404_VDDMX_AO] = &qcs404_vddmx_ao,
+	[QCS404_VDDMX_VFC] = &qcs404_vddmx_vfc,
+	[QCS404_LPICX] = &qcs404_vdd_lpicx,
+	[QCS404_LPICX_VFC] = &qcs404_vdd_lpicx_vfc,
+	[QCS404_LPIMX] = &qcs404_vdd_lpimx,
+	[QCS404_LPIMX_VFC] = &qcs404_vdd_lpimx_vfc,
+};
+
+static const struct rpmpd_desc qcs404_desc = {
+	.rpmpds = qcs404_rpmpds,
+	.num_pds = ARRAY_SIZE(qcs404_rpmpds),
+};
+
 static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
+	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
 	{ }
 };
 
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 87d9c6611682..0b1b147292a3 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -36,4 +36,13 @@
 #define MSM8996_VDDSSCX		5
 #define MSM8996_VDDSSCX_VFC	6
 
+/* QCS404 Power Domains */
+#define QCS404_VDDMX		0
+#define QCS404_VDDMX_AO		1
+#define QCS404_VDDMX_VFC	2
+#define QCS404_LPICX		3
+#define QCS404_LPICX_VFC	4
+#define QCS404_LPIMX		5
+#define QCS404_LPIMX_VFC	6
+
 #endif
-- 
2.18.0
