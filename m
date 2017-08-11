From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 16/20] dt-bindings: qcom_nandc: fix the ipq806x device tree example
Date: Fri, 11 Aug 2017 17:09:31 +0530
Message-ID: <1502451575-15712-17-git-send-email-absahu@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: boris.brezillon@free-electrons.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

1. Correct the compatible string for IPQ806x
2. Change the NAND controller and NAND chip nodes name
   for more clarity.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
index 26360fe..f475b65 100644
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -42,8 +42,8 @@ partition.txt for more detail.
 
 Example:
 
-nand@1ac00000 {
-	compatible = "qcom,ebi2-nandc";
+nand-controller@1ac00000 {
+	compatible = "qcom,ipq806x-nand";
 	reg = <0x1ac00000 0x800>;
 
 	clocks = <&gcc EBI2_CLK>,
@@ -58,7 +58,7 @@ nand@1ac00000 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	nandcs@0 {
+	nand@0 {
 		reg = <0>;
 
 		nand-ecc-strength = <4>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
