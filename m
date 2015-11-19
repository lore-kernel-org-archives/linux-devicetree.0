From: Mans Rullgard <mans@mansr.com>
Subject: [PATCH 1/2] devicetree: add binding for Sigma Designs SMP86xx interrupt controller
Date: Thu, 19 Nov 2015 18:33:45 +0000
Message-ID: <1447958026-3015-2-git-send-email-mans@mansr.com>
References: <1447958026-3015-1-git-send-email-mans@mansr.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447958026-3015-1-git-send-email-mans@mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds a binding for the secondary interrupt controller in
Sigma Designs SMP86xx and SMP87xx chips.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 .../interrupt-controller/sigma,smp8642-intc.txt    | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sigma,smp8642-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sigma,smp8642-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/sigma,smp8642-intc.txt
new file mode 100644
index 0000000..f82cddf
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/sigma,smp8642-intc.txt
@@ -0,0 +1,47 @@
+Sigma Designs SMP86xx/SMP87xx secondary interrupt controller
+
+Required properties:
+- compatible: should be "sigma,smp8642-intc"
+- reg: physical address of MMIO region
+- interrupt-parent: phandle of parent interrupt controller
+- interrupt-controller: boolean
+
+One child node per control block with properties:
+- sigma,reg-offset: offset of registers from main base address
+- interrupt-controller: boolean
+- #interrupt-cells: should be <2>, interrupt index and flags per interrupts.txt
+- interrupts: interrupt spec of primary interrupt controller
+- label: (optional) name for display purposes
+
+Example:
+
+intc: interrupt-controller@6e000 {
+	compatible = "sigma,smp8642-intc";
+	reg = <0x6e000 0x400>;
+	interrupt-parent = <&gic>;
+	interrupt-controller;
+
+	irq0: irq0 {
+		sigma,reg-offset = <0x000>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+		label = "IRQ0";
+	};
+
+	irq1: irq1 {
+		sigma,reg-offset = <0x100>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+		label = "IRQ1";
+	};
+
+	irq2: irq2 {
+		sigma,reg-offset = <0x300>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+		label = "IRQ2";
+	};
+};
-- 
2.6.3
