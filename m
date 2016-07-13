From: Thomas Pedersen <twp@codeaurora.org>
Subject: [PATCH] ipq8064: dts: force AP148 SATA port mapping
Date: Wed, 13 Jul 2016 11:47:22 -0700
Message-ID: <1468435642-23452-1-git-send-email-twp@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org
Cc: linux@qca.qualcomm.com, devicetree@vger.kernel.org, Thomas Pedersen <twp@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

AP148 has a SATA port, but no entity to populate the AHCI
Port Implemented register, so force this in DT.

Signed-off-by: Thomas Pedersen <twp@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
index d501382..348503d 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
@@ -95,6 +95,7 @@
 		};
 
 		sata@29000000 {
+			ports-implemented = <0x1>;
 			status = "ok";
 		};
 	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
