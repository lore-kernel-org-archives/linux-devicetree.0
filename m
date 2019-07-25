From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 2/3] arm64: dts: qcom: pms405: remove reduandant properties
Date: Thu, 25 Jul 2019 19:21:49 +0530
Message-ID: <20190725135150.9972-3-vkoul@kernel.org>
References: <20190725135150.9972-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725135150.9972-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

pms405@1 nodes specified unnecessary #address-cells/#size-cells but the
subnodes dont have "ranges" or "reg" so remove it

arch/arm64/boot/dts/qcom/pms405.dtsi:141.21-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pms405@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/pms405.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
index 3c10cf04d26e..32678f7ce90d 100644
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
