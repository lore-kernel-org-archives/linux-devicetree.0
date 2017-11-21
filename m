From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v3 12/16] dt-bindings: phy-qcom-qmp: Update bindings for QMP V3 USB PHY
Date: Tue, 21 Nov 2017 14:53:22 +0530
Message-ID: <1511256206-1587-13-git-send-email-mgautam@codeaurora.org>
References: <1511256206-1587-1-git-send-email-mgautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1511256206-1587-1-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Varadarajan Narayanan <varada@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Update compatible string and clock names for QMP version V3
USB PHY.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
---
 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index b6a9f2b..dcf1b8f 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -8,7 +8,8 @@ Required properties:
  - compatible: compatible list, contains:
 	       "qcom,ipq8074-qmp-pcie-phy" for PCIe phy on IPQ8074
 	       "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
-	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996.
+	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996,
+	       "qcom,qmp-v3-usb3-phy" for USB3 QMP V3 phy.
 
  - reg: offset and length of register set for PHY's common serdes block.
 
@@ -25,10 +26,13 @@ Required properties:
  - clock-names: "cfg_ahb" for phy config clock,
 		"aux" for phy aux clock,
 		"ref" for 19.2 MHz ref clk,
+		"com_aux" for phy common block aux clock,
 		For "qcom,msm8996-qmp-pcie-phy" must contain:
 			"aux", "cfg_ahb", "ref".
 		For "qcom,msm8996-qmp-usb3-phy" must contain:
 			"aux", "cfg_ahb", "ref".
+		For "qcom,qmp-v3-usb3-phy" must contain:
+			"aux", "cfg_ahb", "ref", "com_aux".
 
  - resets: a list of phandles and reset controller specifier pairs,
 	   one for each entry in reset-names.
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
