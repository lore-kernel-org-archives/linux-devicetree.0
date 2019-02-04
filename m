From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH v3 3/5] dt-bindings: phy-qcom-qmp: Add
 qcom,msm8998-qmp-ufs-phy
Date: Mon, 4 Feb 2019 18:38:14 +0100
Message-ID: <73f65f2d-2137-1d2b-be19-eae77773ccc1@free.fr>
References: <e3c82a49-c601-effc-348f-f768656c659f@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e3c82a49-c601-effc-348f-f768656c659f@free.fr>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: MSM <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Evan Green <evgreen@chromium.org>, Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, DT <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add compatible string for QMP UFS phy on msm8998.

Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index 41a1074228ba..6ec278f5af86 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -9,6 +9,7 @@ Required properties:
 	       "qcom,ipq8074-qmp-pcie-phy" for PCIe phy on IPQ8074
 	       "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
 	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996,
+	       "qcom,msm8998-qmp-ufs-phy" for UFS QMP phy on msm8998,
 	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
 	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845,
 	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845.
-- 
2.17.1
