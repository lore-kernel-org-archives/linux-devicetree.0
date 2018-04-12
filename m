From: Can Guo <cang@codeaurora.org>
Subject: [PATCH v4 2/2] dt-bindings: phy-qcom-qmp: Add UFS phy compatible string for sdm845
Date: Thu, 12 Apr 2018 09:43:12 +0800
Message-ID: <20180412014312.19108-3-cang@codeaurora.org>
References: <20180412014312.19108-1-cang@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180412014312.19108-1-cang@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, mgautam@codeaurora.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Can Guo <cang@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Update the compatible string for UFS QMP PHY on SDM845.

Signed-off-by: Can Guo <cang@codeaurora.org>
Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index cef8765..6e68a6d 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -11,7 +11,8 @@ Required properties:
 	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996,
 	       "qcom,qmp-v3-usb3-phy" for USB3 QMP V3 phy,
 	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
-	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845.
+	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845,
+	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845.
 
  - reg: offset and length of register set for PHY's common serdes block.
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
