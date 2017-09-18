From: srinivas.kandagatla@linaro.org
Subject: [PATCH] ARM: dts: qcom-apq8064: disable gsbi6 i2c by default at soc dtsi
Date: Mon, 18 Sep 2017 12:04:37 +0200
Message-ID: <20170918100437.27105-1-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This patch marks gsbi i2c node at soc level dtsi, so that kernel
would not assume that its enabled and result in pin conflicts on
some boards like IFC6410 which do use these pins for uart.

Without this patch we see below pin conflict:
apq8064-pinctrl 800000.pinctrl: pin GPIO_16 already requested by
 16540000.serial; cannot claim for 16580000.i2c
apq8064-pinctrl 800000.pinctrl: pin-16 (16580000.i2c) status -22
apq8064-pinctrl 800000.pinctrl: could not request pin 16 (GPIO_16)
 from group gpio16  on device 800000.pinctrl
i2c_qup 16580000.i2c: Error applying setting, reverse things back
i2c_qup: probe of 16580000.i2c failed with error -22

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index f3db185a6809..f0438bc671f7 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -590,6 +590,7 @@
 				clocks = <&gcc GSBI6_QUP_CLK>,
 					 <&gcc GSBI6_H_CLK>;
 				clock-names = "core", "iface";
+				status = "disabled";
 			};
 		};
 
-- 
2.11.0
