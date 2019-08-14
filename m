From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 11/22] arm64: dts: qcom: pm8150b: Add gpio node
Date: Wed, 14 Aug 2019 18:20:01 +0530
Message-ID: <20190814125012.8700-12-vkoul@kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814125012.8700-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the gpio node found in pm8150b PMIC.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/pm8150b.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index 846197bd65cd..2bb2384461f7 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -65,6 +65,25 @@
 				label = "smb1355_therm";
 			};
 		};
+
+		pm8150b_gpios: gpio@c000 {
+			compatible = "qcom,pm8150b-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0x2 0xc0 0 IRQ_TYPE_NONE>,
+				     <0x2 0xc1 0 IRQ_TYPE_NONE>,
+				     <0x2 0xc2 0 IRQ_TYPE_NONE>,
+				     <0x2 0xc3 0 IRQ_TYPE_NONE>,
+				     <0x2 0xc4 0 IRQ_TYPE_NONE>,
+				     <0x2 0xc5 0 IRQ_TYPE_NONE>,
+				     <0x2 0xc6 0 IRQ_TYPE_NONE>,
+				     <0x2 0xc7 0 IRQ_TYPE_NONE>,
+				     <0x2 0xc8 0 IRQ_TYPE_NONE>,
+				     <0x2 0xc9 0 IRQ_TYPE_NONE>,
+				     <0x2 0xca 0 IRQ_TYPE_NONE>,
+				     <0x2 0xcb 0 IRQ_TYPE_NONE>;
+		};
 	};
 
 	qcom,pm8150@3 {
-- 
2.20.1
