From: Parthiban Nallathambi <pn@denx.de>
Subject: [PATCH v6 5/5] arm64: dts: actions: Add pinctrl node for Actions Semi S700
Date: Tue, 13 Nov 2018 11:07:09 +0100
Message-ID: <20181113100709.5615-6-pn@denx.de>
References: <20181113100709.5615-1-pn@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181113100709.5615-1-pn@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, manivannan.sadhasivam@linaro.org, afaerber@suse.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will.deacon@arm.com, mp-cs@actions-semi.com, thomas.liau@actions-semi.com, linux@cubietech.com, pn@denx.de, sravanhome@gmail.com
List-Id: devicetree@vger.kernel.org

From: Saravanan Sekar <sravanhome@gmail.com>

Add pinctrl nodes for Actions Semi S700 SoC

Signed-off-by: Parthiban Nallathambi <pn@denx.de>
Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
---
 arch/arm64/boot/dts/actions/s700.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
index 192c7b39c8c1..dceadb945da3 100644
--- a/arch/arm64/boot/dts/actions/s700.dtsi
+++ b/arch/arm64/boot/dts/actions/s700.dtsi
@@ -186,5 +186,21 @@
 			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "timer1";
 		};
+
+		pinctrl: pinctrl@e01b0000 {
+			compatible = "actions,s700-pinctrl";
+			reg = <0x0 0xe01b0000 0x0 0x1000>;
+			clocks = <&cmu CLK_GPIO>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 0 136>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };
-- 
2.17.2
