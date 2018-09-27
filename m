From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] arm64: dts: qcom: pm8998: Use ADC temperature to temp-alarm node
Date: Thu, 27 Sep 2018 14:22:53 -0700
Message-ID: <20180927212253.177200-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

The temperature information from the temp-alarm block itself is very
coarse ("temperature is above/below trip points"). Provide the driver
with the die temperature channel of the ADC on the PMIC for more precise
readings.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
- based on agross/for-next (7a002fe0179c "Merge branch
  'defconfig-for-4.20' into all-for-4.20-redo"))
- depends on e13d757279bb ("iio: adc: Add QCOM SPMI PMIC5 ADC driver")
  from IIO pull request:
  git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git tags/iio-for-4.20a
- to work properly https://patchwork.kernel.org/patch/10594491/ is
  needed
---
 arch/arm64/boot/dts/qcom/pm8998.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
index 048f19fa0150..fab5a826fb01 100644
--- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
@@ -58,6 +58,8 @@
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;
 			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pm8998_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
 			#thermal-sensor-cells = <0>;
 		};
 
-- 
2.19.0.605.g01d371f741-goog
