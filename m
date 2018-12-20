From: Johan Hovold <johan@kernel.org>
Subject: [PATCH] arm64: dts: msm8996: fix blsp2_uart1 4-pin pinconfig
Date: Thu, 20 Dec 2018 17:17:50 +0100
Message-ID: <20181220161750.12587-1-johan@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Fix "gpiio5" typo in the (currently unused) blsp2_uart1 4-pin sleep
config.

Fixes: 22e6789f9493 ("arm64: dts: msm8996: add blsp2_uart1 pinctrl")
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8996-pins.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
index c5c42e94f387..1d1f7f91739a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
@@ -139,7 +139,7 @@
 		};
 
 		pinconf {
-			pins = "gpio4", "gpiio5", "gpio6", "gpio7";
+			pins = "gpio4", "gpio5", "gpio6", "gpio7";
 			drive-strength = <2>;
 			bias-disable;
 		};
-- 
2.20.1
