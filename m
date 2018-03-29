From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v4 4/7] dt-bindings: phy-qcom-qmp: Update bindings for sdm845
Date: Thu, 29 Mar 2018 16:34:23 +0530
Message-ID: <1522321466-21755-5-git-send-email-mgautam@codeaurora.org>
References: <1522321466-21755-1-git-send-email-mgautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522321466-21755-1-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, robh@kernel.org, sboyd@codeaurora.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, vivek.gautam@codeaurora.org, evgreen@chromium.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Varadarajan Narayanan <varada@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Update compatible strings for USB3 PHYs on SDM845.
One is QMPv3 DisplayPort-USB combo PHY and other one
is USB UNI PHY which is single lane USB3 PHY without
DP capability. While at it also remove "qcom,qmp-v3-usb3-phy"
compatible string which was earlier added for sdm845
only as there wouldn't be any user of same.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
---
 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index dcf1b8f..266a1bb 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -9,7 +9,8 @@ Required properties:
 	       "qcom,ipq8074-qmp-pcie-phy" for PCIe phy on IPQ8074
 	       "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
 	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996,
-	       "qcom,qmp-v3-usb3-phy" for USB3 QMP V3 phy.
+	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
+	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845.
 
  - reg: offset and length of register set for PHY's common serdes block.
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
