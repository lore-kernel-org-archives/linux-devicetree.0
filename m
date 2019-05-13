From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 4/9] dt-bindings: power: Add rpm power domain bindings for qcs404
Date: Mon, 13 May 2019 15:50:10 +0530
Message-ID: <20190513102015.26551-5-sibis@codeaurora.org>
References: <20190513102015.26551-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190513102015.26551-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc: david.brown@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, rnayak@codeaurora.org, marc.w.gonzalez@free.fr, Rob Herring <robh@kernel.org>, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Add RPM power domain bindings for the qcs404 family of SoC

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
[sibis: Add supported rpmpd states for qcs404]
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.txt  |  1 +
 include/dt-bindings/power/qcom-rpmpd.h        | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
index 980e5413d18f..172ccf940c5c 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
@@ -6,6 +6,7 @@ which then translates it into a corresponding voltage on a rail
 Required Properties:
  - compatible: Should be one of the following
 	* qcom,msm8996-rpmpd: RPM Power domain for the msm8996 family of SoC
+	* qcom,qcs404-rpmpd: RPM Power domain for the qcs404 family of SoC
 	* qcom,sdm845-rpmhpd: RPMh Power domain for the sdm845 family of SoC
  - #power-domain-cells: number of cells in Power domain specifier
 	must be 1.
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 87d9c6611682..450378662944 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -36,4 +36,26 @@
 #define MSM8996_VDDSSCX		5
 #define MSM8996_VDDSSCX_VFC	6
 
+/* QCS404 Power Domains */
+#define QCS404_VDDMX		0
+#define QCS404_VDDMX_AO		1
+#define QCS404_VDDMX_VFL	2
+#define QCS404_LPICX		3
+#define QCS404_LPICX_VFL	4
+#define QCS404_LPIMX		5
+#define QCS404_LPIMX_VFL	6
+
+/* RPM SMD Power Domain performance levels */
+#define RPM_SMD_LEVEL_RETENTION       16
+#define RPM_SMD_LEVEL_RETENTION_PLUS  32
+#define RPM_SMD_LEVEL_MIN_SVS         48
+#define RPM_SMD_LEVEL_LOW_SVS         64
+#define RPM_SMD_LEVEL_SVS             128
+#define RPM_SMD_LEVEL_SVS_PLUS        192
+#define RPM_SMD_LEVEL_NOM             256
+#define RPM_SMD_LEVEL_NOM_PLUS        320
+#define RPM_SMD_LEVEL_TURBO           384
+#define RPM_SMD_LEVEL_TURBO_NO_CPR    416
+#define RPM_SMD_LEVEL_BINNING         512
+
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
