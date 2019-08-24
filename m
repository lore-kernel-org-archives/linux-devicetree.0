From: Sibi Sankar <sibis@codeaurora.org>
Subject: [RESEND PATCH v2 1/2] dt-bindings: reset: aoss: Add AOSS reset binding for SC7180 SoCs
Date: Sat, 24 Aug 2019 20:54:10 +0530
Message-ID: <20190824152411.21757-2-sibis@codeaurora.org>
References: <20190824152411.21757-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190824152411.21757-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc: agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add SC7180 AOSS reset to the list of possible bindings.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
index 510c748656ec5..3eb6a22ced4bc 100644
--- a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
+++ b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
@@ -8,8 +8,8 @@ Required properties:
 - compatible:
 	Usage: required
 	Value type: <string>
-	Definition: must be:
-		    "qcom,sdm845-aoss-cc"
+	Definition: must be one of:
+		"qcom,sc7180-aoss-cc", "qcom,sdm845-aoss-cc"
 
 - reg:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
