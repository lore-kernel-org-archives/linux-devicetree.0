From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] dt-bindings: soc: qcom: Fix trivial language typos
Date: Tue,  8 Jan 2019 13:11:40 +0100
Message-ID: <1546949500-30044-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Kosina <trivial@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: devicetree@vger.kernel.org

Fix few trivial language typos in bindings.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt | 2 +-
 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
index 587bb1ddc8cc..1214192847ac 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
@@ -60,7 +60,7 @@ of these nodes are defined by the individual bindings for the specific function
 = EXAMPLE
 The following example represents the GLINK RPM node on a MSM8996 device, with
 the function for the "rpm_request" channel defined, which is used for
-regualtors and root clocks.
+regulators and root clocks.
 
 	apcs_glb: mailbox@9820000 {
 		compatible = "qcom,msm8996-apcs-hmss-global";
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
index a35af2dafdad..49e1d72d3648 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
@@ -41,12 +41,12 @@ processor ID) and a string identifier.
 - qcom,local-pid:
 	Usage: required
 	Value type: <u32>
-	Definition: specifies the identfier of the local endpoint of this edge
+	Definition: specifies the identifier of the local endpoint of this edge
 
 - qcom,remote-pid:
 	Usage: required
 	Value type: <u32>
-	Definition: specifies the identfier of the remote endpoint of this edge
+	Definition: specifies the identifier of the remote endpoint of this edge
 
 = SUBNODES
 Each SMP2P pair contain a set of inbound and outbound entries, these are
-- 
2.7.4
