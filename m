From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 1/4] dt-bindings: reset: aoss: Add AOSS reset binding for SC7180 SoCs
Date: Wed, 21 Aug 2019 15:24:39 +0530
Message-ID: <20190821095442.24495-2-sibis@codeaurora.org>
References: <20190821095442.24495-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821095442.24495-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc: agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add SC7180 AOSS reset to the list of possible bindings.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
index 510c748656ec5..8f0bbdc6afd91 100644
--- a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
+++ b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
@@ -8,7 +8,8 @@ Required properties:
 - compatible:
 	Usage: required
 	Value type: <string>
-	Definition: must be:
+	Definition: must be one of:
+		    "qcom,sc7180-aoss-cc"
 		    "qcom,sdm845-aoss-cc"
 
 - reg:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
