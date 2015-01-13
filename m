From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 2/5] irqchip: Add DT binding doc for dumb demuxer chips
Date: Tue, 13 Jan 2015 19:46:18 +0100
Message-ID: <1421174781-4340-3-git-send-email-boris.brezillon@free-electrons.com>
References: <1421174781-4340-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1421174781-4340-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Boris Brezillon <boris.brezillon@free-electrons.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add documentation for the dumb demuxer.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 .../bindings/interrupt-controller/dumb-demux.txt   | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/dumb-demux.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/dumb-demux.txt b/Documentation/devicetree/bindings/interrupt-controller/dumb-demux.txt
new file mode 100644
index 0000000..1c777ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/dumb-demux.txt
@@ -0,0 +1,34 @@
+* Generic Dumb Interrupt Demultiplexer
+
+This Dumb demultiplixer simply forward all incoming interrupts to its
+enabled/unmasked children.
+
+Required properties:
+- compatible: Should be "irqchip-dumb-demux".
+- interrupt-controller: Identifies the node as an interrupt controller.
+- interrupts-extended or interrupt-parent and interrupts: Reference the source
+  interrupt connected to this dumb demuxer.
+- #interrupt-cells: The number of cells to define the interrupts (should be 1).
+  The only cell is the IRQ number.
+- irqs: u32 bitfield specifying the interrupts provided by the demuxer.
+
+Examples:
+	/*
+	 * Dumb demuxer controller
+	 */
+	dumb_irq1_demux: dumb-irq-demux@1 {
+		compatible = "irqchip-dumb-demux";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		interrupts-extended = <&aic 1 IRQ_TYPE_LEVEL_HIGH 7>;
+		irqs = <0x3f>;
+	};
+
+	/*
+	 * Device connected on this dumb demuxer
+	 */
+	dma: dma-controller@ffffec00 {
+		compatible = "atmel,at91sam9g45-dma";
+		reg = <0xffffec00 0x200>;
+		interrupts-extended = <&dumb_irq1_demux 0>;
+	};
-- 
1.9.1
