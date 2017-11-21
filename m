From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v3 08/16] dt-bindings: phy-qcom-qusb2: Update binding for QUSB2 V2 version
Date: Tue, 21 Nov 2017 14:53:18 +0530
Message-ID: <1511256206-1587-9-git-send-email-mgautam@codeaurora.org>
References: <1511256206-1587-1-git-send-email-mgautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1511256206-1587-1-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Update generic compatible string for QUSB2 V2 PHY. This will allow
all targets using QUSB2 V2 use same string.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
---
 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
index aa0fcb0..42c9742 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
@@ -4,7 +4,10 @@ Qualcomm QUSB2 phy controller
 QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
 
 Required properties:
- - compatible: compatible list, contains "qcom,msm8996-qusb2-phy".
+ - compatible: compatible list, contains
+	       "qcom,msm8996-qusb2-phy" for 14nm PHY on msm8996,
+	       "qcom,qusb2-v2-phy" for QUSB2 V2 PHY.
+
  - reg: offset and length of the PHY register set.
  - #phy-cells: must be 0.
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
