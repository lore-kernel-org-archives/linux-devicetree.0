From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] arm64: dts: qcom: sm8150: Update parent clock for rpmhcc
Date: Thu, 22 Aug 2019 22:35:33 +0530
Message-ID: <20190822170533.8056-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Since rphmcc expects the parent clock name as 'xo_board', update the
parent clock name.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 379c40b9a52f..f92c590fd3dc 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -650,7 +650,7 @@
 			rpmhcc: clock-controller {
 				compatible = "qcom,sm8150-rpmh-clk";
 				#clock-cells = <1>;
-				clock-names = "xo";
+				clock-names = "xo_board";
 				clocks = <&xo_board>;
 			};
 		};
-- 
2.20.1
