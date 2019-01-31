From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcom: msm8996: Disabled VFE SMMU
Date: Thu, 31 Jan 2019 12:20:55 -0800
Message-ID: <20190131202055.13301-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Initializing the SMMU trips a security violation, so disable the VFE
SMMU for now.

Fixes: f3442ab97257 ("arm64: dts: qcom: msm8996: Add VFE SMMU node")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 6ba96916c66d..c761269caf80 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1000,7 +1000,7 @@
 			clock-names = "iface",
 				      "bus";
 			#iommu-cells = <1>;
-			status = "ok";
+			status = "disabled";
 		};
 
 		camss: camss@a00000 {
-- 
2.18.0
