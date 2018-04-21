From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 14/17] dt-bindings/interrupt-controller: add description for
 Marvell SEI node
Date: Sat, 21 Apr 2018 15:55:34 +0200
Message-ID: <20180421135537.24716-15-miquel.raynal@bootlin.com>
References: <20180421135537.24716-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180421135537.24716-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Catalin Marinas <catalin.marinas@arm.com>, Gregory Clement <gregory.clement@bootlin.com>, Haim Boot <hayim@marvell.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Describe the SEI (System Error Interrupt) controller driver. The
controller is part of the GIC. It aggregates two types of interrupts,
wired and MSIs from respectively the AP and the CPs, into a single SPI
interrupt.

Suggested-by: Haim Boot <hayim@marvell.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/interrupt-controller/marvell,sei.txt  | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,sei.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,sei.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,sei.txt
new file mode 100644
index 000000000000..a246d59552b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,sei.txt
@@ -0,0 +1,54 @@
+Marvell SEI (System Error Interrupt) Controller
+-----------------------------------------------
+
+Marvell SEI (System Error Interrupt) controller is an interrupt aggregator.
+It receives interrupts from several sources and aggregates them to a single
+interrupt line (an SPI) on the primary interrupt controller.
+
+The IRQ chip can handle up to 64 SEIs, a set comes from the AP and is
+wired while a second set comes from the CPs by the mean of MSIs. Each
+'domain' is represented as a subnode.
+
+Required properties:
+
+- compatible: should be "marvell,armada-8k-sei".
+- reg: SEI registers location and length.
+- interrupts: identifies the parent IRQ that will be triggered.
+- #address-cells: should be '1', represents the position of the first
+                  IRQ of a given type in the SEI range.
+- #size-cells: should be '1', represents the number of a given type of
+               IRQs.
+
+Child node 'sei-wired-controller' required properties:
+
+- reg: the range of wired interrupts.
+- #interrupt-cells: number of cells to define an SEI wired interrupt
+                    coming from the AP, should be 1. The cell is the IRQ
+                    number.
+- interrupt-controller: identifies the node as an interrupt controller.
+
+Child node 'sei-msi-controller' required properties:
+
+- reg: the range of non-wired interrupts triggered by way of MSIs.
+- msi-controller: identifies the node as an MSI controller.
+
+Example:
+
+        sei: sei@3f0200 {
+               compatible = "marvell,armada-8k-sei";
+               reg = <0x3f0200 0x40>;
+               interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+               #address-cells = <1>;
+               #size-cells = <1>;
+
+               sei_wired_controller: sei-wired-controller@0 {
+                       reg = <0 21>;
+                       #interrupt-cells = <1>;
+                       interrupt-controller;
+               };
+
+               sei_msi_controller: sei-msi-controller@21 {
+                       reg = <21 43>;
+                       msi-controller;
+               };
+       };
-- 
2.14.1
