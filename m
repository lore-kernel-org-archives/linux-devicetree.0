From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v6 11/14] dt-bindings/interrupt-controller: add documentation
 for Marvell SEI controller
Date: Mon,  1 Oct 2018 16:13:55 +0200
Message-ID: <20181001141358.31508-12-miquel.raynal@bootlin.com>
References: <20181001141358.31508-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181001141358.31508-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Catalin Marinas <catalin.marinas@arm.com>, Gregory Clement <gregory.clement@bootlin.com>, Haim Boot <hayim@marvell.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Describe the System Error Interrupt (SEI) controller. It aggregates two
types of interrupts, wired and MSIs from respectively the AP and the
CPs, into a single SPI interrupt.

Suggested-by: Haim Boot <hayim@marvell.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../interrupt-controller/marvell,sei.txt      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,sei.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,sei.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,sei.txt
new file mode 100644
index 000000000000..0beafed502f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,sei.txt
@@ -0,0 +1,36 @@
+Marvell SEI (System Error Interrupt) Controller
+-----------------------------------------------
+
+Marvell SEI (System Error Interrupt) controller is an interrupt
+aggregator. It receives interrupts from several sources and aggregates
+them to a single interrupt line (an SPI) on the parent interrupt
+controller.
+
+This interrupt controller can handle up to 64 SEIs, a set comes from the
+AP and is wired while a second set comes from the CPs by the mean of
+MSIs.
+
+Required properties:
+
+- compatible: should be one of:
+              * "marvell,ap806-sei"
+- reg: SEI registers location and length.
+- interrupts: identifies the parent IRQ that will be triggered.
+- #interrupt-cells: number of cells to define an SEI wired interrupt
+                    coming from the AP, should be 1. The cell is the IRQ
+                    number.
+- interrupt-controller: identifies the node as an interrupt controller
+                        for AP interrupts.
+- msi-controller: identifies the node as an MSI controller for the CPs
+                  interrupts.
+
+Example:
+
+        sei: interrupt-controller@3f0200 {
+                compatible = "marvell,ap806-sei";
+                reg = <0x3f0200 0x40>;
+                interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+                #interrupt-cells = <1>;
+                interrupt-controller;
+                msi-controller;
+        };
-- 
2.17.1
