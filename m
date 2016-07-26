From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 2/2] ARM: dts: imx7d: fix GIC nodes interrupt and register specification
Date: Mon, 25 Jul 2016 23:42:36 -0700
Message-ID: <20160726064236.11034-2-stefan@agner.ch>
References: <20160726064236.11034-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160726064236.11034-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

The i.MX 7 as a GICv2, hence its CPU interface register map (the
second register region) is 8kB long. Add the VGIC maintenance
interrupt which allows to use the new VGIC driver.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Suggested-by: Marc Zyngier <marc.zyngier@arm.com>
---
 arch/arm/boot/dts/imx7s.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index d89587a..c63591c 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -292,10 +292,11 @@
 
 		intc: interrupt-controller@31001000 {
 			compatible = "arm,cortex-a7-gic";
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			reg = <0x31001000 0x1000>,
-			      <0x31002000 0x1000>,
+			      <0x31002000 0x2000>,
 			      <0x31004000 0x2000>,
 			      <0x31006000 0x2000>;
 		};
-- 
2.9.0
