From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 5/5] ARM: dts: qcom: sd600eval: Enable riva-pil
Date: Wed, 21 Dec 2016 03:49:39 -0800
Message-ID: <20161221114939.19973-5-bjorn.andersson@linaro.org>
References: <20161221114939.19973-1-bjorn.andersson@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161221114939.19973-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

My SD600eval broke, so this is untested.

 arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts b/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
index b7dcab28642d..8fee42901a3d 100644
--- a/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
@@ -355,5 +355,12 @@
 				cd-gpios	= <&tlmm_pinmux 26 GPIO_ACTIVE_HIGH>;
 			};
 		};
+
+		riva-pil@3204000 {
+			status = "okay";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&riva_wlan_pin_a>, <&riva_bt_pin_a>, <&riva_fm_pin_a>;
+		};
 	};
 };
-- 
2.11.0
