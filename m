From: Kumar Gala <galak@codeaurora.org>
Subject: [PATCH] arm: qcom: dts: gic: add compatible string for Qualcomm MSM GICs
Date: Wed,  4 Mar 2015 13:57:25 -0600
Message-ID: <1425499045-31450-1-git-send-email-galak@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org
Cc: Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, arm@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document the Qualcomm MSM GICs implementation as compatible with the
ARM GIC standard.

Signed-off-by: Kumar Gala <galak@codeaurora.org>
---
 Documentation/devicetree/bindings/arm/gic.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/gic.txt b/Documentation/devicetree/bindings/arm/gic.txt
index c97484b..6204630 100644
--- a/Documentation/devicetree/bindings/arm/gic.txt
+++ b/Documentation/devicetree/bindings/arm/gic.txt
@@ -18,6 +18,8 @@ Main node required properties:
 	"arm,arm11mp-gic"
 	"brcm,brahma-b15-gic"
 	"arm,arm1176jzf-devchip-gic"
+	"qcom,msm-8660-qgic"
+	"qcom,msm-qgic2"
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Specifies the number of cells needed to encode an
   interrupt source.  The type shall be a <u32> and the value shall be 3.
-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
