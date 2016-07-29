From: Bhushan Shah <bshah@kde.org>
Subject: [PATCH v3 3/5] ARM: dts: qcom: msm8974: Add fixed regulator node for vph-pwr-reg
Date: Fri, 29 Jul 2016 11:39:08 +0530
Message-ID: <20160729060910.16943-4-bshah@kde.org>
References: <20160729060910.16943-1-bshah@kde.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160729060910.16943-1-bshah@kde.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Cc: Bhushan Shah <bshah@kde.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Cc: Andy Gross <andy.gross@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Bhushan Shah <bshah@kde.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
    - Rename vph-pwr-reg to vreg_vph_pwr

 arch/arm/boot/dts/qcom-msm8974.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 1f9b649..b2ee2f1 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -622,4 +622,14 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&boost_bypass_n_pin>;
 	};
+
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
 };
-- 
2.9.0
