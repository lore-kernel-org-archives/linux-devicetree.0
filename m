From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v2 1/5] arm64: dts: sprd: Remove PMIC INTC irq trigger type
Date: Wed, 13 Feb 2019 20:32:45 +0800
Message-ID: <b6a32917d1e231277d240a4084bebb6ad91247e3.1550060544.git.baolin.wang@linaro.org>
References: <cover.1550060543.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550060543.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1550060543.git.baolin.wang@linaro.org>
References: <cover.1550060543.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de
Cc: olof@lixom.net, orsonzhai@gmail.com, zhang.lyra@gmail.com, devicetree@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

The Spreadtrum PMIC INTC controller has no registers to set trigger type,
since it is always high level trigger as default. So remove its child
devices' irq trigger type setting and change #interrupt-cells to 1.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 arch/arm64/boot/dts/sprd/sc2731.dtsi |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/sprd/sc2731.dtsi b/arch/arm64/boot/dts/sprd/sc2731.dtsi
index 82bd642..f2f2aa5 100644
--- a/arch/arm64/boot/dts/sprd/sc2731.dtsi
+++ b/arch/arm64/boot/dts/sprd/sc2731.dtsi
@@ -13,7 +13,7 @@
 		spi-max-frequency = <26000000>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-controller;
-		#interrupt-cells = <2>;
+		#interrupt-cells = <1>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -43,14 +43,14 @@
 			compatible = "sprd,sc27xx-rtc", "sprd,sc2731-rtc";
 			reg = <0x280>;
 			interrupt-parent = <&sc2731_pmic>;
-			interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <2>;
 		};
 
 		pmic_eic: gpio@300 {
 			compatible = "sprd,sc27xx-eic";
 			reg = <0x300>;
 			interrupt-parent = <&sc2731_pmic>;
-			interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <5>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
@@ -69,7 +69,7 @@
 			compatible = "sprd,sc27xx-adc", "sprd,sc2731-adc";
 			reg = <0x480>;
 			interrupt-parent = <&sc2731_pmic>;
-			interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <0>;
 			#io-channel-cells = <1>;
 			hwlocks = <&hwlock 4>;
 		};
-- 
1.7.9.5
