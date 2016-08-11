From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RESEND PATCH v2 3/3] dt-bindings: clock: Update bindings for MDM9615 GCC and LCC
Date: Thu, 11 Aug 2016 14:48:05 +0200
Message-ID: <1470919685-11260-4-git-send-email-narmstrong@baylibre.com>
References: <1470919685-11260-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470919685-11260-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc.txt | 1 +
 Documentation/devicetree/bindings/clock/qcom,lcc.txt | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
index 9a60fde..869a2f0 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
@@ -15,6 +15,7 @@ Required properties :
 			"qcom,gcc-msm8974pro"
 			"qcom,gcc-msm8974pro-ac"
 			"qcom,gcc-msm8996"
+			"qcom,gcc-mdm9615"
 
 - reg : shall contain base register location and length
 - #clock-cells : shall contain 1
diff --git a/Documentation/devicetree/bindings/clock/qcom,lcc.txt b/Documentation/devicetree/bindings/clock/qcom,lcc.txt
index dd755be..a3c78aa 100644
--- a/Documentation/devicetree/bindings/clock/qcom,lcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,lcc.txt
@@ -7,6 +7,7 @@ Required properties :
 			"qcom,lcc-msm8960"
 			"qcom,lcc-apq8064"
 			"qcom,lcc-ipq8064"
+			"qcom,lcc-mdm9615"
 
 - reg : shall contain base register location and length
 - #clock-cells : shall contain 1
-- 
1.9.1
