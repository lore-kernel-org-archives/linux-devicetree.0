From: Hui Song <hui.song_1@nxp.com>
Subject: [PATCH v2] arm64: dts: ls1088a: fix gpio node
Date: Tue, 13 Aug 2019 10:04:57 +0800
Message-ID: <20190813020457.45370-1-hui.song_1@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Song Hui <hui.song_1@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Song Hui <hui.song_1@nxp.com>

Update the nodes to include little-endian
property to be consistent with the hardware
and add ls1088a gpio specify compatible.

Signed-off-by: Song Hui <hui.song_1@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 20f5ebd..d58d203 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -269,43 +269,47 @@
 		};
 
 		gpio0: gpio@2300000 {
-			compatible = "fsl,qoriq-gpio";
+			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
 			reg = <0x0 0x2300000 0x0 0x10000>;
 			interrupts = <0 36 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			little-endian;
 		};
 
 		gpio1: gpio@2310000 {
-			compatible = "fsl,qoriq-gpio";
+			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
 			reg = <0x0 0x2310000 0x0 0x10000>;
 			interrupts = <0 36 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			little-endian;
 		};
 
 		gpio2: gpio@2320000 {
-			compatible = "fsl,qoriq-gpio";
+			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
 			reg = <0x0 0x2320000 0x0 0x10000>;
 			interrupts = <0 37 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			little-endian;
 		};
 
 		gpio3: gpio@2330000 {
-			compatible = "fsl,qoriq-gpio";
+			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
 			reg = <0x0 0x2330000 0x0 0x10000>;
 			interrupts = <0 37 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			little-endian;
 		};
 
 		ifc: ifc@2240000 {
-- 
2.9.5
