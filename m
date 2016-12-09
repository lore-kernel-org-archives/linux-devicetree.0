From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/2] irqchip/renesas-intc-irqpin: Add R-Car Gen1 fallback binding
Date: Fri,  9 Dec 2016 11:50:50 +0100
Message-ID: <1481280650-9258-3-git-send-email-horms+renesas@verge.net.au>
References: <1481280650-9258-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481280650-9258-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

In the case of Renesas R-Car hardware we know that there are generations of
SoCs, e.g. Gen 1, Gen 2 and Gen 3. But beyond that its not clear what the
relationship between IP blocks might be. For example, I believe that
r8a7779 is older than r8a7778 but that doesn't imply that the latter is a
descendant of the former or vice versa.

We can, however, by examining the documentation and behaviour of the
hardware at run-time observe that the current driver implementation appears
to be compatible with the IP blocks on SoCs within a given generation.

For the above reasons and convenience when enabling new SoCs a
per-generation fallback compatibility string scheme being adopted for
drivers for Renesas SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 .../interrupt-controller/renesas,intc-irqpin.txt   | 44 ++++++++++++----------
 drivers/irqchip/irq-renesas-intc-irqpin.c          |  2 +
 2 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
index 772c550d3b4b..e5a5251be9f5 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
@@ -2,13 +2,19 @@ DT bindings for the R-/SH-Mobile irqpin controller
 
 Required properties:
 
-- compatible: has to be "renesas,intc-irqpin-<soctype>", "renesas,intc-irqpin"
-  as fallback.
-  Examples with soctypes are:
+- compatible:
     - "renesas,intc-irqpin-r8a7740" (R-Mobile A1)
     - "renesas,intc-irqpin-r8a7778" (R-Car M1A)
     - "renesas,intc-irqpin-r8a7779" (R-Car H1)
     - "renesas,intc-irqpin-sh73a0" (SH-Mobile AG5)
+    - "renesas,rcar-gen1-intc-irqpin" (generic R-Car Gen1 compatible device)
+    - "renesas,intc-irqpin"         (generic device)
+
+    When compatible with a generic R-Car version, nodes must list the
+    SoC-specific version corresponding to the platform first followed by
+    the generic R-Car version.
+
+    "renesas,intc-irqpin" must be present and last.
 
 - reg: Base address and length of each register bank used by the external
   IRQ pins driven by the interrupt controller hardware module. The base
@@ -39,24 +45,22 @@ Optional properties:
 Example
 -------
 
-	irqpin1: interrupt-controller@e6900004 {
-		compatible = "renesas,intc-irqpin-r8a7740",
+	irqpin0: interrupt-controller@fe78001c {
+		compatible = "renesas,intc-irqpin-r8a7779",
+			     "renesas,rcar-gen1-intc-irqpin",
 			     "renesas,intc-irqpin";
 		#interrupt-cells = <2>;
+		status = "disabled";
 		interrupt-controller;
-		reg = <0xe6900004 4>,
-			<0xe6900014 4>,
-			<0xe6900024 1>,
-			<0xe6900044 1>,
-			<0xe6900064 1>;
-		interrupts = <0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp2_clks R8A7740_CLK_INTCA>;
-		power-domains = <&pd_a4s>;
+		reg = <0xfe78001c 4>,
+			<0xfe780010 4>,
+			<0xfe780024 4>,
+			<0xfe780044 4>,
+			<0xfe780064 4>,
+			<0xfe780000 4>;
+		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+		sense-bitfield-width = <2>;
 	};
diff --git a/drivers/irqchip/irq-renesas-intc-irqpin.c b/drivers/irqchip/irq-renesas-intc-irqpin.c
index 5fe1207a079c..70095b61a90a 100644
--- a/drivers/irqchip/irq-renesas-intc-irqpin.c
+++ b/drivers/irqchip/irq-renesas-intc-irqpin.c
@@ -378,6 +378,8 @@ static const struct of_device_id intc_irqpin_dt_ids[] = {
 	  .data = &intc_irqpin_irlm_r8a777x },
 	{ .compatible = "renesas,intc-irqpin-r8a7779",
 	  .data = &intc_irqpin_irlm_r8a777x },
+	{ .compatible = "renesas,rcar-gen1-intc-irqpin",
+	  .data = &intc_irqpin_irlm_r8a777x },
 	{ .compatible = "renesas,intc-irqpin-r8a7740",
 	  .data = &intc_irqpin_rmobile },
 	{ .compatible = "renesas,intc-irqpin-sh73a0",
-- 
2.7.0.rc3.207.g0ac5344
