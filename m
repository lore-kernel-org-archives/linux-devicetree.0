Return-Path: <robherring2@gmail.com>
From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: arm: qcom: Add missing schema for MSM8974
Date: Tue, 18 Jun 2019 10:25:25 -0600
Message-Id: <20190618162525.5038-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: devicetree@vger.kernel.org
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The SoC/board bindings for MSM8974 are undocumented. Add the missing
bindings to the schema.

Cc: Andy Gross <agross@kernel.org>
Cc: David Brown <david.brown@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f6316ab66385..04867577306a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -101,6 +101,15 @@ properties:
               - qcom,msm8960-cdp
           - const: qcom,msm8960
 
+      - items:
+          - enum:
+              - fairphone,fp2
+              - lge,hammerhead
+              - sony,xperia-amami
+              - sony,xperia-castor
+              - sony,xperia-honami
+          - const: qcom,msm8974
+
       - items:
           - const: qcom,msm8916-mtp/1
           - const: qcom,msm8916-mtp
-- 
2.20.1
