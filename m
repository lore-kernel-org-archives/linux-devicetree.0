From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 16/20] dt-bindings: qcom_nandc: fix the ipq806x device tree example
Date: Sat,  5 Aug 2017 21:49:54 +0530
Message-ID: <1501949998-29859-17-git-send-email-absahu@codeaurora.org>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, boris.brezillon@free-electrons.com, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: richard@nod.at, cyrille.pitchen@wedev4u.fr, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

1. Correct the compatible string for IPQ806x
2. Change the NAND controller and NAND chip nodes name
   for more clarity.

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
