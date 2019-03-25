From: Harish Bandi <c-hbandi@codeaurora.org>
Subject: [PATCH v4 2/2] dt-bindings: net: bluetooth: Add device tree bindings for QTI chip WCN3998
Date: Mon, 25 Mar 2019 17:01:31 +0530
Message-ID: <1553513491-25763-3-git-send-email-c-hbandi@codeaurora.org>
References: <1553513491-25763-1-git-send-email-c-hbandi@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553513491-25763-1-git-send-email-c-hbandi@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marcel@holtmann.org, johan.hedberg@gmail.com
Cc: mka@chromium.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, anubhavg@codeaurora.org, devicetree@vger.kernel.org, mark.rutland@arm.com, obh+dt@kernel.org, Harish Bandi <c-hbandi@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch enables regulators for the Qualcomm Bluetooth WCN3998
controller.

Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
---
Changes in V4:
- Removed new compatible WCN3998
- changed wcn3990 to wcn399* to represent wcn399* family
---
 Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
index 824c0e2..de9cefa 100644
--- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
@@ -11,20 +11,21 @@ Required properties:
  - compatible: should contain one of the following:
    * "qcom,qca6174-bt"
    * "qcom,wcn3990-bt"
+   * "qcom,wcn3998-bt"
 
 Optional properties for compatible string qcom,qca6174-bt:
 
  - enable-gpios: gpio specifier used to enable chip
  - clocks: clock provided to the controller (SUSCLK_32KHZ)
 
-Required properties for compatible string qcom,wcn3990-bt:
+Required properties for compatible string qcom,wcn399*-bt:
 
  - vddio-supply: VDD_IO supply regulator handle.
  - vddxo-supply: VDD_XO supply regulator handle.
  - vddrf-supply: VDD_RF supply regulator handle.
  - vddch0-supply: VDD_CH0 supply regulator handle.
 
-Optional properties for compatible string qcom,wcn3990-bt:
+Optional properties for compatible string qcom,wcn399*-bt:
 
  - max-speed: see Documentation/devicetree/bindings/serial/slave-device.txt
 
@@ -44,7 +45,7 @@ serial@7570000 {
 
 serial@898000 {
 	bluetooth {
-		compatible = "qcom,wcn3990-bt";
+		compatible = "qcom,wcn399*-bt";
 
 		vddio-supply = <&vreg_s4a_1p8>;
 		vddxo-supply = <&vreg_l7a_1p8>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
