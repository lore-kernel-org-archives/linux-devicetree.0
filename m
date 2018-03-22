From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v2 5/6] dt-bindings: phy-qcom-usb2: Update bindings for sdm845
Date: Thu, 22 Mar 2018 14:20:45 +0530
Message-ID: <1521708646-5379-6-git-send-email-mgautam@codeaurora.org>
References: <1521708646-5379-1-git-send-email-mgautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521708646-5379-1-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Update compatible strings for USB2 PHYs on sdm845.
There are two QUSB2 PHYs present on sdm845. Few PHY registers
programming is different for these PHYs related to electrical
parameters, otherwise both are same.

Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
---
 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
index 42c9742..b99a57f 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
@@ -6,7 +6,9 @@ QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
 Required properties:
  - compatible: compatible list, contains
 	       "qcom,msm8996-qusb2-phy" for 14nm PHY on msm8996,
-	       "qcom,qusb2-v2-phy" for QUSB2 V2 PHY.
+	       "qcom,qusb2-v2-phy" for QUSB2 V2 PHY,
+	       "qcom,sdm845-qusb2-phy-1" for primary PHY on sdm845,
+	       "qcom,sdm845-qusb2-phy-2" for secondary PHY on sdm845.
 
  - reg: offset and length of the PHY register set.
  - #phy-cells: must be 0.
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
