From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 3/4] dt-bindings: arm: stm32: Document Avenger96 devicetree binding
Date: Fri, 31 May 2019 12:08:48 +0530
Message-ID: <20190531063849.26142-4-manivannan.sadhasivam@linaro.org>
References: <20190531063849.26142-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190531063849.26142-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, robh+dt@kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, loic.pallardy@st.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

This commit documents Avenger96 devicetree binding based on
STM32MP157 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index f53dc0f2d7b3..4d194f1eb03a 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -25,5 +25,7 @@ properties:
           - const: st,stm32h743
 
       - items:
+          - enum:
+              - arrow,stm32mp157a-avenger96 # Avenger96
           - const: st,stm32mp157
 ...
-- 
2.17.1
