From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 2/3] arm64: dts: qcom: pms405: remove reduandant properties
Date: Thu,  1 Aug 2019 15:20:48 +0530
Message-ID: <20190801095049.13855-3-vkoul@kernel.org>
References: <20190801095049.13855-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190801095049.13855-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: devicetree@vger.kernel.org

pms405@1 nodes specified unnecessary #address-cells/#size-cells but the
subnodes dont have "ranges" or "reg" so remove it

arch/arm64/boot/dts/qcom/pms405.dtsi:141.21-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pms405@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/pms405.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
index a28386900a3b..ff4005186895 100644
--- a/arch/arm64/boot/dts/qcom/pms405.dtsi
+++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
@@ -141,8 +141,6 @@
 	pms405_1: pms405@1 {
 		compatible = "qcom,spmi-pmic";
 		reg = <0x1 SPMI_USID>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		pms405_spmi_regulators: regulators {
 			compatible = "qcom,pms405-regulators";
-- 
2.20.1
