From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] ARM: dts: imx6ul: Correct mask for GIC PPI interrupts
Date: Mon,  3 Dec 2018 15:40:19 -0200
Message-ID: <1543858820-3354-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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

i.MX6UL contains a single Cortex-A7, hence the second interrupt specifier
cell for Private Peripheral Interrupts should use "GIC_CPU_MASK_SIMPLE(1)".

Tested on a imx6ul-evk.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Hi,

This is based on the following commit:

commit 2acb79e15119512da9b6a49906840e7678cfb618
Author: Geert Uytterhoeven <geert+renesas@glider.be>
Date:   Mon May 7 15:19:52 2018 +0200

    ARM: dts: r8a7790: Correct mask for GIC PPI interrupts

    R-Car H2 (r8a7790) contains four Cortex-A15 and four Cortex-A7 cores,
    hence the second interrupt specifier cell for Private Peripheral
    Interrupts should use "GIC_CPU_MASK_SIMPLE(8)", to make sure interrupts
    can be delivered to all 8 processor cores.

    Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
    Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

and the confirmation from Liviu Dudau that GIC_CPU_MASK_SIMPLE()
should take the number of cores in the system as the argument:

http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/315298.html

 arch/arm/boot/dts/imx6ul.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 99c3663..0efc85f 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -94,7 +94,7 @@
 
 	intc: interrupt-controller@a01000 {
 		compatible = "arm,gic-400", "arm,cortex-a7-gic";
-		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		interrupt-parent = <&intc>;
@@ -106,10 +106,10 @@
 
 	timer {
 		compatible = "arm,armv7-timer";
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-parent = <&intc>;
 		status = "disabled";
 	};
-- 
2.7.4
