From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/2] dt-bindings: pinctrl: Document drive strength settings for BM1880 SoC
Date: Mon,  3 Jun 2019 13:04:20 +0530
Message-ID: <20190603073421.10314-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, linux-gpio@vger.kernel.org, alec.lin@bitmain.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Document drive strength settings for Bitmain BM1880 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../bindings/pinctrl/bitmain,bm1880-pinctrl.txt       | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
index 4eb089bcb5f3..4980776122cc 100644
--- a/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
@@ -100,6 +100,17 @@ Optional Properties:
                   Valid values are:
                   <0>  - Slow
                   <1>  - Fast
+- drive-strength: Integer. Selects the drive strength for the specified
+                  pins in mA.
+                  Valid values are:
+                  <4>
+                  <8>
+                  <12>
+                  <16>
+                  <20>
+                  <24>
+                  <28>
+                  <32>
 
 Example:
         pinctrl: pinctrl@400 {
-- 
2.17.1
