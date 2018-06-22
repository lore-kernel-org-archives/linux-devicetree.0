From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 14/17] dt-bindings/interrupt-controller: add documentation
 for Marvell SEI controller
Date: Fri, 22 Jun 2018 17:14:29 +0200
Message-ID: <20180622151432.1566-15-miquel.raynal@bootlin.com>
References: <20180622151432.1566-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180622151432.1566-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Haim Boot <hayim@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Hanna Hawa <hannah@marvell.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Describe the System Error Interrupt (SEI) controller. It aggregates two
types of interrupts, wired and MSIs from respectively the AP and the
CPs, into a single SPI interrupt.

Suggested-by: Haim Boot <hayim@marvell.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/interrupt-controller/marvell,sei.txt  | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,sei.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,sei.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,sei.txt
new file mode 100644
index 000000000000..9aee3820f1a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,sei.txt
@@ -0,0 +1,39 @@
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
+MSIs. Each 'domain' is represented as a subnode.
+
+Required properties:
+
+- compatible: should be "marvell,armada-8k-sei".
+- reg: SEI registers location and length.
+- interrupts: identifies the parent IRQ that will be triggered.
+- marvell,sei-ranges: two ranges, the first one describe wired
+                      interrupts coming from the AP, the second one
+                      non-wired interrupts (MSI) from the CPs.
+- #interrupt-cells: number of cells to define an SEI wired interrupt
+                    coming from the AP, should be 1. The cell is the IRQ
+                    number.
+- interrupt-controller: identifies the node as an interrupt controller
+                        (AP only).
+- msi-controller: identifies the node as an MSI controller (CPs only).
+
+Example:
+
+        sei: interrupt-controller@3f0200 {
+                compatible = "marvell,armada-8k-sei";
+                reg = <0x3f0200 0x40>;
+                interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+                marvell,sei-ap-ranges = <0 21>;
+                marvell,sei-cp-ranges = <21 43>;
+                #interrupt-cells = <1>;
+                interrupt-controller;
+                msi-controller;
+        };
-- 
2.14.1
