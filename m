From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v3 3/6] dt-bindings: phy-qcom-qmp: Update bindings for sdm845
Date: Fri, 23 Mar 2018 11:41:24 +0530
Message-ID: <1521785487-29866-4-git-send-email-mgautam@codeaurora.org>
References: <1521785487-29866-1-git-send-email-mgautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521785487-29866-1-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Varadarajan Narayanan <varada@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Update compatible strings for USB3 PHYs on SDM845.
One is QMPv3 DisplayPort-USB combo PHY and other one
is USB UNI PHY which is single lane USB3 PHY without
DP capability.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
---
 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index dcf1b8f..cef8765 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -9,7 +9,9 @@ Required properties:
 	       "qcom,ipq8074-qmp-pcie-phy" for PCIe phy on IPQ8074
 	       "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
 	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996,
-	       "qcom,qmp-v3-usb3-phy" for USB3 QMP V3 phy.
+	       "qcom,qmp-v3-usb3-phy" for USB3 QMP V3 phy,
+	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
+	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845.
 
  - reg: offset and length of register set for PHY's common serdes block.
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
