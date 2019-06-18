Return-Path: <robherring2@gmail.com>
From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: arm: qcom: Add missing schema for IPQ4019 boards
Date: Tue, 18 Jun 2019 10:26:49 -0600
Message-Id: <20190618162649.5901-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: devicetree@vger.kernel.org
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The board bindings for IPQ4019 are undocumented. Add the missing bindings
to the schema.

Cc: Andy Gross <agross@kernel.org>
Cc: David Brown <david.brown@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
Note that this doesn't match the dts files as they don't use both 
compatible strings, just the board string. They need to be fixed.

 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 04867577306a..54ef6b6b9189 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -119,6 +119,11 @@ properties:
           - const: qcom,msm8996-mtp
 
       - items:
+          - enum:
+              - qcom,ipq4019-ap-dk04.1-c3
+              - qcom,ipq4019-ap-dk07.1-c1
+              - qcom,ipq4019-ap-dk07.1-c2
+              - qcom,ipq4019-dk04.1-c1
           - const: qcom,ipq4019
 
       - items:
-- 
2.20.1
