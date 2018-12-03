From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] ARM: dts: imx7: Correct mask for GIC PPI interrupts
Date: Mon,  3 Dec 2018 15:40:20 -0200
Message-ID: <1543858820-3354-2-git-send-email-festevam@gmail.com>
References: <1543858820-3354-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1543858820-3354-1-git-send-email-festevam@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, marc.zyngier@arm.com, liviu.dudau@arm.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The GIC_CPU_MASK_SIMPLE() macro should take as its argument the actual
number of CPU cores the interrupt controller is wired to.

i.MX7S contains a single Cortex-A7, hence the second interrupt specifier
cell for Private Peripheral Interrupts should use "GIC_CPU_MASK_SIMPLE(1)".

Likewise, i.MX7D contains two Cortex-A7 cores, so it should use
"GIC_CPU_MASK_SIMPLE(2)" instead.

Tested on a imx7s-warp.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/imx7d.dtsi | 21 +++++++++++++++++++++
 arch/arm/boot/dts/imx7s.dtsi | 10 +++++-----
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index 826224b..6b298e3 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -24,6 +24,15 @@
 		};
 	};
 
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
 	cpu0_opp_table: opp-table {
 		compatible = "operating-points-v2";
 		opp-shared;
@@ -72,6 +81,18 @@
 				};
 			};
 		};
+
+		intc: interrupt-controller@31001000 {
+			compatible = "arm,cortex-a7-gic";
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupt-parent = <&intc>;
+			reg = <0x31001000 0x1000>,
+			      <0x31002000 0x2000>,
+			      <0x31004000 0x2000>,
+			      <0x31006000 0x2000>;
+		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 477901c..098d2cc 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -160,10 +160,10 @@
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupt-parent = <&intc>;
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
 	soc {
@@ -305,7 +305,7 @@
 
 		intc: interrupt-controller@31001000 {
 			compatible = "arm,cortex-a7-gic";
-			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			interrupt-parent = <&intc>;
-- 
2.7.4
