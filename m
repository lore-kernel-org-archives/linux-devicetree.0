From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2 4/7] ARM: dts: imx6ul: add interrupt of virt-capable GIC
Date: Wed, 10 Jan 2018 22:04:50 +0100
Message-ID: <20180110210453.19264-4-stefan@agner.ch>
References: <20180110210453.19264-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180110210453.19264-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

The Cortex-A7 and its GIC support virtualization extensions. To
make use of them the CPU private interrupt needs to be specified.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/imx6ul.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 1b14e4d39c26..993fbdbdd506 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -100,8 +100,10 @@
 
 	intc: interrupt-controller@a01000 {
 		compatible = "arm,gic-400", "arm,cortex-a7-gic";
+		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		#interrupt-cells = <3>;
 		interrupt-controller;
+		interrupt-parent = <&intc>;
 		reg = <0x00a01000 0x1000>,
 		      <0x00a02000 0x2000>,
 		      <0x00a04000 0x2000>,
-- 
2.15.1
