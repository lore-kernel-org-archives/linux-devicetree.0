From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 5/6] dt-bindings: soc: qcom: aoss: Add SM8150 and SC7180 support
Date: Mon, 29 Jul 2019 17:36:32 +0530
Message-ID: <20190729120633.20451-6-sibis@codeaurora.org>
References: <20190729120633.20451-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729120633.20451-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, vkoul@kernel.org, aneela@codeaurora.org
Cc: mark.rutland@arm.com, agross@kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, clew@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add SM8150 and SC7180 AOSS QMP to the list of possible bindings.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
index 954ffee0a9c45..91b972c1fee57 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
@@ -15,7 +15,10 @@ power-domains.
 - compatible:
 	Usage: required
 	Value type: <string>
-	Definition: must be "qcom,sdm845-aoss-qmp"
+	Definition: must be one of:
+		    "qcom,sdm845-aoss-qmp"
+		    "qcom,sm8150-aoss-qmp"
+		    "qcom,sc7180-aoss-qmp"
 
 - reg:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
