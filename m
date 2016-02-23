From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 6/8] arm64: dts: qcom: fix usb digital voltage levels
Date: Tue, 23 Feb 2016 16:50:36 +0000
Message-ID: <1456246236-18341-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1456246153-18087-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456246153-18087-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch updates the digital voltage levels from corner values to
microvolts as we are going to use s1 regulator directly for vddcx
instead of s1_corner.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index a6fddce..2f40fdd 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -421,7 +421,7 @@
 			interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_BOTH>,
 				     <GIC_SPI 140 IRQ_TYPE_EDGE_RISING>;
 
-			qcom,vdd-levels = <1 5 7>;
+			qcom,vdd-levels = <500000 1000000 1320000>;
 			qcom,phy-init-sequence = <0x44 0x6B 0x24 0x13>;
 			dr_mode = "peripheral";
 			qcom,otg-control = <2>; // PMIC
-- 
1.9.1
