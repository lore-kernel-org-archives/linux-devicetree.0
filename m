From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 10/14] dt-bindings/interrupt-controller: update Marvell ICU
 bindings
Date: Thu,  5 Jul 2018 14:40:07 +0200
Message-ID: <20180705124011.7661-11-miquel.raynal@bootlin.com>
References: <20180705124011.7661-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180705124011.7661-1-miquel.raynal@bootlin.com>
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

Change the documentation to reflect the new bindings used for Marvell
ICU. This involves describing each interrupt group as a subnode of the
ICU node. Each of them having their own compatible.

The DT binding documentation still documents the legacy binding, where
there was a single node with no subnode.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/interrupt-controller/marvell,icu.txt  | 83 ++++++++++++++++++----
 1 file changed, 71 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt
index 649b7ec9d9b1..83b4fbf8af65 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt
@@ -5,6 +5,8 @@ The Marvell ICU (Interrupt Consolidation Unit) controller is
 responsible for collecting all wired-interrupt sources in the CP and
 communicating them to the GIC in the AP, the unit translates interrupt
 requests on input wires to MSG memory mapped transactions to the GIC.
+These messages will access a different GIC memory area depending on
+their type (NSR, SR, SEI, REI, etc).
 
 Required properties:
 
@@ -12,20 +14,19 @@ Required properties:
 
 - reg: Should contain ICU registers location and length.
 
+Subnodes: Each group of interrupt is declared as a subnode of the ICU,
+with their own compatible.
+
+Required properties for the icu_nsr/icu_sei subnodes:
+
+- compatible: Should be "marvell,cp110-icu-nsr" or "marvell,cp110-icu-sei".
+
 - #interrupt-cells: Specifies the number of cells needed to encode an
-  interrupt source. The value shall be 3.
+  interrupt source. The value shall be 2.
 
-  The 1st cell is the group type of the ICU interrupt. Possible group
-  types are:
+  The 1st cell is the index of the interrupt in the ICU unit.
 
-   ICU_GRP_NSR (0x0) : Shared peripheral interrupt, non-secure
-   ICU_GRP_SR  (0x1) : Shared peripheral interrupt, secure
-   ICU_GRP_SEI (0x4) : System error interrupt
-   ICU_GRP_REI (0x5) : RAM error interrupt
-
-  The 2nd cell is the index of the interrupt in the ICU unit.
-
-  The 3rd cell is the type of the interrupt. See arm,gic.txt for
+  The 2nd cell is the type of the interrupt. See arm,gic.txt for
   details.
 
 - interrupt-controller: Identifies the node as an interrupt
@@ -35,17 +36,75 @@ Required properties:
   that allows to trigger interrupts using MSG memory mapped
   transactions.
 
+Note: each 'interrupts' property referring to any 'icu_xxx' node shall
+      have a different number within [0:206].
+
 Example:
 
 icu: interrupt-controller@1e0000 {
 	compatible = "marvell,cp110-icu";
 	reg = <0x1e0000 0x440>;
+
+	CP110_LABEL(icu_nsr): interrupt-controller@10 {
+		compatible = "marvell,cp110-icu-nsr";
+		reg = <0x10 0x20>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		msi-parent = <&gicp>;
+	};
+
+	CP110_LABEL(icu_sei): interrupt-controller@50 {
+		compatible = "marvell,cp110-icu-sei";
+		reg = <0x50 0x10>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		msi-parent = <&sei>;
+	};
+};
+
+node1 {
+	interrupt-parent = <&icu_nsr>;
+	interrupts = <106 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+node2 {
+	interrupt-parent = <&icu_sei>;
+	interrupts = <107 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+/* Would not work with the above nodes */
+node3 {
+	interrupt-parent = <&icu_nsr>;
+	interrupts = <107 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+Note on legacy bindings:
+Before using a subnode for each domain, only NSR were
+supported. Bindings were different in this way:
+
+- #interrupt-cells: The value was 3.
+	The 1st cell was the group type of the ICU interrupt. Possible
+	group types were:
+	ICU_GRP_NSR (0x0) : Shared peripheral interrupt, non-secure
+	ICU_GRP_SR  (0x1) : Shared peripheral interrupt, secure
+	ICU_GRP_SEI (0x4) : System error interrupt
+	ICU_GRP_REI (0x5) : RAM error interrupt
+	The 2nd cell was the index of the interrupt in the ICU unit.
+	The 3rd cell was the type of the interrupt. See arm,gic.txt for
+	details.
+
+Example:
+
+icu: interrupt-controller@1e0000 {
+	compatible = "marvell,cp110-icu";
+	reg = <0x1e0000 0x440>;
+
 	#interrupt-cells = <3>;
 	interrupt-controller;
 	msi-parent = <&gicp>;
 };
 
-usb3h0: usb3@500000 {
+node1 {
 	interrupt-parent = <&icu>;
 	interrupts = <ICU_GRP_NSR 106 IRQ_TYPE_LEVEL_HIGH>;
 };
-- 
2.14.1
