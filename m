From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 3/6] dt-bindings: remoteproc: qcom: Remove additional definition tag
Date: Thu, 30 Aug 2018 00:42:12 +0530
Message-ID: <20180829191215.10071-4-sibis@codeaurora.org>
References: <20180829191215.10071-1-sibis@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829191215.10071-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, mka@chromium.org, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Remove the additional definition tag declared for WCSS sub-system
under reset-names.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 601dd9f389aa..3a66cde5895a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -58,8 +58,8 @@ on the Qualcomm Hexagon core.
 	Usage: required
 	Value type: <stringlist>
 	Definition: must be "mss_restart" for the modem sub-system
-	Definition: must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
-		    for the wcss syb-system
+		    must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
+		    for the wcss sub-system
 
 - cx-supply:
 - mss-supply:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
