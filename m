From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 2/3] dt-bindings: phy-qcom-qmp: Add sm8150 UFS phy compatible string
Date: Wed,  4 Sep 2019 15:38:34 +0530
Message-ID: <20190904100835.6099-3-vkoul@kernel.org>
References: <20190904100835.6099-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904100835.6099-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-Id: devicetree@vger.kernel.org

Document "qcom,sdm845-qmp-ufs-phy" compatible string for QMP UFS PHY
found on SM8150.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index 085fbd676cfc..eac9ad3cbbc8 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -14,7 +14,8 @@ Required properties:
 	       "qcom,msm8998-qmp-pcie-phy" for PCIe QMP phy on msm8998,
 	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
 	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845,
-	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845.
+	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845,
+	       "qcom,sm8150-qmp-ufs-phy" for UFS QMP phy on sm8150.
 
 - reg:
   - index 0: address and length of register set for PHY's common
@@ -57,6 +58,8 @@ Required properties:
 			"aux", "cfg_ahb", "ref", "com_aux".
 		For "qcom,sdm845-qmp-ufs-phy" must contain:
 			"ref", "ref_aux".
+		For "qcom,sm8150-qmp-ufs-phy" must contain:
+			"ref", "ref_aux".
 
  - resets: a list of phandles and reset controller specifier pairs,
 	   one for each entry in reset-names.
@@ -83,6 +86,8 @@ Required properties:
 			"phy", "common".
 		For "qcom,sdm845-qmp-ufs-phy": must contain:
 			"ufsphy".
+		For "qcom,sm8150-qmp-ufs-phy": must contain:
+			"ufsphy".
 
  - vdda-phy-supply: Phandle to a regulator supply to PHY core block.
  - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
-- 
2.20.1
