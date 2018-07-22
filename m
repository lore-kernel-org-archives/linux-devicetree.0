From: Saravanan Sekar <sravanhome@gmail.com>
Subject: [PATCH 5/5] arm64: dts: actions: Add pinctrl node for Actions Semi S700
Date: Sun, 22 Jul 2018 18:36:01 +0200
Message-ID: <20180722163601.28346-6-sravanhome@gmail.com>
References: <20180722163601.28346-1-sravanhome@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722163601.28346-1-sravanhome@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: manivannan.sadhasivam@linaro.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, catalin.marinas@arm.com, will.deacon@arm.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, pn@denx.de, mp-cs@actions-semi.com, jeff.chen@actions-semi.com, thomas.liau@actions-semi.com, linux@cubietech.com, Saravanan Sekar <sravanhome@gmail.com>
List-Id: devicetree@vger.kernel.org

Add pinctrl nodes for Actions Semi S700 SoC

Signed-off-by: Parthiban Nallathambi <pn@denx.de>
Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
---
 arch/arm64/boot/dts/actions/s700.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
index 59d29e4ca404..88edac21e03f 100644
--- a/arch/arm64/boot/dts/actions/s700.dtsi
+++ b/arch/arm64/boot/dts/actions/s700.dtsi
@@ -179,5 +179,11 @@
 			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "timer1";
 		};
+
+		pinctrl: pinctrl@e01b0000 {
+			compatible = "actions,s700-pinctrl";
+			reg = <0x0 0xe01b0000 0x0 0x1000>;
+			clocks = <&cmu CLK_GPIO>;
+		};
 	};
 };
-- 
2.18.0
