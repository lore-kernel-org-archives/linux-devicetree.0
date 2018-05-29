From: Can Guo <cang@codeaurora.org>
Subject: [PATCH v6 3/3] dt-bindings: phy-qcom-qmp: Add UFS phy compatible string for sdm845
Date: Tue, 29 May 2018 12:37:51 +0800
Message-ID: <20180529043751.10580-4-cang@codeaurora.org>
References: <20180529043751.10580-1-cang@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180529043751.10580-1-cang@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, mgautam@codeaurora.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Can Guo <cang@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Update the compatible string for UFS QMP PHY on SDM845.

Signed-off-by: Can Guo <cang@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index cef8765..930d94c 100644
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
 
@@ -29,6 +30,7 @@ Required properties:
 		"aux" for phy aux clock,
 		"ref" for 19.2 MHz ref clk,
 		"com_aux" for phy common block aux clock,
+		"ref_aux" for phy reference aux clock,
 		For "qcom,msm8996-qmp-pcie-phy" must contain:
 			"aux", "cfg_ahb", "ref".
 		For "qcom,msm8996-qmp-usb3-phy" must contain:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
