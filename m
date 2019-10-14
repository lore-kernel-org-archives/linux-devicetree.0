From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH] arm64: dts: qcom: qcs404-evb: Set vdd_apc regulator in high power mode
Date: Mon, 14 Oct 2019 14:09:20 +0200
Message-ID: <20191014120920.12691-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

vdd_apc is the regulator that supplies the main CPU cluster.

At sudden CPU load changes, we have noticed invalid page faults on
addresses with all bits shifted, as well as on addresses with individual
bits flipped.

By putting the vdd_apc regulator in high power mode, the voltage drops
during sudden load changes will be less severe, and we have not been able
to reproduce the invalid page faults with the regulator in this mode.

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 501a7330dbc8..522d3ef72df5 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -73,6 +73,7 @@
 		regulator-always-on;
 		regulator-boot-on;
 		regulator-name = "vdd_apc";
+		regulator-initial-mode = <1>;
 		regulator-min-microvolt = <1048000>;
 		regulator-max-microvolt = <1384000>;
 	};
-- 
2.21.0
