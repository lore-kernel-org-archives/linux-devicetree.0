From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v4 2/2] dt-bindings: qcom: Add MDM9615 bindings
Date: Sat,  3 Sep 2016 14:53:46 +0200
Message-ID: <20160903125346.18451-3-narmstrong@baylibre.com>
References: <20160903125346.18451-1-narmstrong@baylibre.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160903125346.18451-1-narmstrong@baylibre.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, linux@armlinux.org.uk, sboyd@codeaurora.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/qcom.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.txt b/Documentation/devicetree/bindings/arm/qcom.txt
index 3e24518..43abf4e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.txt
+++ b/Documentation/devicetree/bindings/arm/qcom.txt
@@ -22,6 +22,7 @@ The 'SoC' element must be one of the following strings:
 	msm8916
 	msm8974
 	msm8996
+	mdm9615
 
 The 'board' element must be one of the following strings:
 
-- 
2.7.0
