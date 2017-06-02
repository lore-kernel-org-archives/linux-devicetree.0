From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v2 2/6] dt-bindings: interrupt-controller: add DT binding for
 the Marvell ICU
Date: Fri,  2 Jun 2017 12:06:53 +0200
Message-ID: <1496398017-6487-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1496398017-6487-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1496398017-6487-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Yehuda Yitschak <yehuday@marvell.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This commit adds the Device Tree binding documentation for the Marvell
ICU interrupt controller, which collects wired interrupts from the
devices located into the CP110 hardware block of Marvell Armada 7K/8K,
and converts them into SPI interrupts in the GIC located in the AP
hardware block, using the GICP extension.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../bindings/interrupt-controller/marvell,icu.txt  | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt
new file mode 100644
index 0000000..3e7954c
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt
@@ -0,0 +1,54 @@
+Marvell ICU Interrupt Controller
+--------------------------------
+
+The Marvell ICU (Interrupt Consolidation Unit) controller is
+responsible for collecting all wired-interrupt sources in the CP and
+communicating them to the GIC in the AP, the unit translates interrupt
+requests on input wires to MSG memory mapped transactions to the GIC.
+
+Required properties:
+
+- compatible: Should be "marvell,cp110-icu"
+
+- reg: Should contain ICU registers location and length.
+
+- #interrupt-cells: Specifies the number of cells needed to encode an
+  interrupt source. The value shall be 3.
+
+  The 1st cell is the group type of the ICU interrupt. Possible group
+  types are:
+
+   ICU_GRP_NSR (0x0) : Shared peripheral interrupt, non-secure
+   ICU_GRP_SR  (0x1) : Shared peripheral interrupt, secure
+   ICU_GRP_SEI (0x4) : System error interrupt
+   ICU_GRP_REI (0x5) : RAM error interrupt
+
+  The 2nd cell is the index of the interrupt in the ICU unit.
+
+  The 3rd cell is the type of the interrupt. See arm,gic.txt for
+  details.
+
+- interrupt-controller: Identifies the node as an interrupt
+  controller.
+
+- interrupt-parent: Indicates the node of the parent interrupt
+  controller. Should be pointer to the GIC.
+
+- gicp: Should point to the GICP controller, the GIC extension that
+  allows to trigger interrupts using MSG memory mapped transactions.
+
+Example:
+
+icu: interrupt-controller@1e0000 {
+	compatible = "marvell,cp110-icu";
+	reg = <0x1e0000 0x10>;
+	#interrupt-cells = <3>;
+	interrupt-controller;
+	interrupt-parent = <&gic>;
+	marvell,gicp = <&gicp>;
+};
+
+usb3h0: usb3@500000 {
+	interrupt-parent = <&icu>;
+	interrupts = <ICU_GRP_NSR 106 IRQ_TYPE_LEVEL_HIGH>;
+};
-- 
2.7.4
