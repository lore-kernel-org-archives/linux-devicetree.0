From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH ARM-next] ARM: dts: qcom-msm8974: change invalid flag IRQ NONE to valid value
Date: Tue, 25 Sep 2018 06:46:51 -0400
Message-ID: <20180925104651.16596-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org
Cc: david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, frank.rowand@sony.com, masneyb@onstation.org
List-Id: devicetree@vger.kernel.org

The following commits used IRQ_TYPE_NONE since that matched what was
already in the file and I do not have access to the datasheets for
these devices. After these patches were submitted, commit dcf145011400
("ARM: dts: qcom-msm8974: change invalid flag IRQ NONE to valid value")
changed all of these values to IRQ_TYPE_LEVEL_HIGH. This patch corrects
the IRQ type for these two commits:

commit bd9392507588 ("ARM: dts: qcom: msm8974-hammerhead: add device
tree bindings for ALS / proximity")

commit fe8d81fe7d9a ("ARM: dts: qcom: msm8974-hammerhead: add device
tree bindings for mpu6515") 

Prior to these patches, I was having issues with the bmp280 sensor
returning temperature / pressure skipped errors, however these errors
have gone away with these patches.

Patches were tested on a LG Nexus 5 (hammerhead) phone.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 84e1fee1bf1a..a808973f9dc7 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -719,7 +719,7 @@
 			status = "disabled";
 			compatible = "qcom,i2c-qup-v2.1.1";
 			reg = <0xf9925000 0x1000>;
-			interrupts = <0 97 IRQ_TYPE_NONE>;
+			interrupts = <0 97 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
 			#address-cells = <1>;
@@ -754,7 +754,7 @@
 			status = "disabled";
 			compatible = "qcom,i2c-qup-v2.1.1";
 			reg = <0xf9968000 0x1000>;
-			interrupts = <0 106 IRQ_TYPE_NONE>;
+			interrupts = <0 106 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc GCC_BLSP2_QUP6_I2C_APPS_CLK>, <&gcc GCC_BLSP2_AHB_CLK>;
 			clock-names = "core", "iface";
 			#address-cells = <1>;
-- 
2.17.1
