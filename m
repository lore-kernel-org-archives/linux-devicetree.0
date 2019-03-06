From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 8/8] arm64: dts: qcom: pmi8998: add gpio-ranges
Date: Tue,  5 Mar 2019 19:53:16 -0500
Message-ID: <20190306005316.12232-9-masneyb@onstation.org>
References: <20190306005316.12232-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190306005316.12232-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org
Cc: david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds the gpio-ranges property so that the GPIO pins are initialized
by the GPIO framework and not pinctrl. This fixes a circular dependency
between these two frameworks so GPIO hogging can be used on this board.

This was not tested on this particular hardware, however this same
change was tested on qcom-pm8941 using a LG Nexus 5 (hammerhead) phone.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index 051f57e7d6ac..23f9146a161e 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -13,6 +13,7 @@
 			compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;
+			gpio-ranges = <&pmi8998_gpio 0 0 14>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-- 
2.20.1
