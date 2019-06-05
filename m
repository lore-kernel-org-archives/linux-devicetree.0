From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH 2/6] dt-bindings: qcom: Add ipq6018 bindings
Date: Wed,  5 Jun 2019 22:58:54 +0530
Message-ID: <1559755738-28643-3-git-send-email-sricharan@codeaurora.org>
References: <1559755738-28643-1-git-send-email-sricharan@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559755738-28643-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, sboyd@kernel.org, linus.walleij@linaro.org, agross@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: speriaka <speriaka@codeaurora.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f6316ab..7b19028 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -36,6 +36,7 @@ description: |
   	mdm9615
   	ipq8074
   	sdm845
+	ipq6018
 
   The 'board' element must be one of the following strings:
 
@@ -45,6 +46,7 @@ description: |
   	mtp
   	sbc
   	hk01
+	cp01-c1
 
   The 'soc_version' and 'board_version' elements take the form of v<Major>.<Minor>
   where the minor number may be omitted when it's zero, i.e.  v1.0 is the same
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
