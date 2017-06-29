From: Varadarajan Narayanan <varada@codeaurora.org>
Subject: [PATCH v7 2/4] dt-bindings: qcom: Add ipq8074 bindings
Date: Thu, 29 Jun 2017 11:48:32 +0530
Message-ID: <1498717114-338-3-git-send-email-varada@codeaurora.org>
References: <1498717114-338-1-git-send-email-varada@codeaurora.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1498717114-338-1-git-send-email-varada@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org, linus.walleij@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: absahu@codeaurora.org, sjaganat@codeaurora.org, sricharan@codeaurora.org, Varadarajan Narayanan <varada@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
---
 Documentation/devicetree/bindings/arm/qcom.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.txt b/Documentation/devicetree/bindings/arm/qcom.txt
index 028d16e..0ed4d39 100644
--- a/Documentation/devicetree/bindings/arm/qcom.txt
+++ b/Documentation/devicetree/bindings/arm/qcom.txt
@@ -25,6 +25,7 @@ The 'SoC' element must be one of the following strings:
 	msm8994
 	msm8996
 	mdm9615
+	ipq8074
 
 The 'board' element must be one of the following strings:
 
@@ -33,6 +34,7 @@ The 'board' element must be one of the following strings:
 	dragonboard
 	mtp
 	sbc
+	hk01
 
 The 'soc_version' and 'board_version' elements take the form of v<Major>.<Minor>
 where the minor number may be omitted when it's zero, i.e.  v1.0 is the same
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

