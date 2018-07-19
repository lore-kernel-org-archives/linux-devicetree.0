From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: arm: mediatek: Document Mediatek X20 Development Board
Date: Thu, 19 Jul 2018 16:24:49 +0530
Message-ID: <1531997690-6040-2-git-send-email-manivannan.sadhasivam@linaro.org>
References: <1531997690-6040-1-git-send-email-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531997690-6040-1-git-send-email-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, taiten.peng@linaro.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, manivannanece23@gmail.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Document Mediatek X20 Development Board which is a 96Boards Consumer
Edition platform based on MT6797 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/mediatek.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
index 7d21ab3..356df1e 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -47,6 +47,9 @@ Supported boards:
 - Evaluation board for MT6797(Helio X20):
     Required root node properties:
       - compatible = "mediatek,mt6797-evb", "mediatek,mt6797";
+- Mediatek X20 Development Board:
+    Required root node properties:
+      - compatible = "archermind,mt6797-x20-dev", "mediatek,mt6797";
 - Reference board variant 1 for MT7622:
     Required root node properties:
       - compatible = "mediatek,mt7622-rfb1", "mediatek,mt7622";
-- 
2.7.4
