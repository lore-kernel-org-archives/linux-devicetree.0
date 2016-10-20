From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] dt-binding: soc: qcom: smd: Add label property
Date: Wed, 19 Oct 2016 19:38:10 -0700
Message-ID: <1476931090-1616-1-git-send-email-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The label property can be used to specify a name of the edge, for
consistent naming purposes.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt
index 97d9b3e1bf39..ea1dc75ec9ea 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt
@@ -43,6 +43,13 @@ The edge is described by the following properties:
 	Definition: the identifier for the remote processor as known by the rest
 		    of the system.
 
+- label:
+	Usage: optional
+	Value type: <string>
+	Definition: name of the edge, used for debugging and identification
+		    purposes. The node name will be used if this is not
+		    present.
+
 = SMD DEVICES
 
 In turn, subnodes of the "edges" represent devices tied to SMD channels on that
-- 
2.5.0
