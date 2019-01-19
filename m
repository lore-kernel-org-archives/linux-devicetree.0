From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v6 12/15] arm64: dts: qcom: pmi8994: add interrupt controller properties
Date: Sat, 19 Jan 2019 15:42:49 -0500
Message-ID: <20190119204252.18370-13-masneyb@onstation.org>
References: <20190119204252.18370-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190119204252.18370-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com
Cc: shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add interrupt controller properties now that spmi-gpio is a proper
hierarchical IRQ chip. The interrupts property is no longer needed so
remove it.

This change was not tested on any hardware but the same change was
tested on qcom-pm8941.dtsi using a LG Nexus 5 (hammerhead) phone with
no issues.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
Changes since v4:
- None  

Patch introduced in v4.

 arch/arm64/boot/dts/qcom/pmi8994.dtsi | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index dae1cdc23f54..3aee10e3f921 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -15,16 +15,8 @@
 			reg = <0xc000>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			interrupts = <2 0xc0 0 IRQ_TYPE_NONE>,
-				     <2 0xc1 0 IRQ_TYPE_NONE>,
-				     <2 0xc2 0 IRQ_TYPE_NONE>,
-				     <2 0xc3 0 IRQ_TYPE_NONE>,
-				     <2 0xc4 0 IRQ_TYPE_NONE>,
-				     <2 0xc5 0 IRQ_TYPE_NONE>,
-				     <2 0xc6 0 IRQ_TYPE_NONE>,
-				     <2 0xc7 0 IRQ_TYPE_NONE>,
-				     <2 0xc8 0 IRQ_TYPE_NONE>,
-				     <2 0xc9 0 IRQ_TYPE_NONE>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 	};
 
-- 
2.17.2
