From: Aleix Roca Nonell <kernelrocks@gmail.com>
Subject: [PATCH 1/6] dt-bindings: interrupt-controller: Document RTD129x
Date: Sun, 7 Jul 2019 15:22:46 +0200
Message-ID: <20190707132246.GB13340@arks.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add binding for Realtek RTD129x interrupt controller.

Signed-off-by: Aleix Roca Nonell <kernelrocks@gmail.com>
---
 .../realtek,rtd129x-intc.txt                  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/realtek,rtd129x-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtd129x-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtd129x-intc.txt
new file mode 100644
index 000000000000..3ebb7c02afe5
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtd129x-intc.txt
@@ -0,0 +1,24 @@
+Realtek RTD129x IRQ Interrupt Controller
+=======================================
+
+Required properties:
+
+- compatible           :  Should be one of the following:
+                          - "realtek,rtd129x-intc-misc"
+                          - "realtek,rtd129x-intc-iso"
+- reg                  :  Specifies the address of the ISR, IER and Unmask
+                          register in couples of "address length".
+- interrupts           :  Specifies the interrupt line which is mux'ed.
+- interrupt-controller :  Presence indicates the node as interrupt controller.
+- #interrupt-cells     :  Shall be 1. See common bindings in interrupt.txt.
+
+
+Example:
+
+	interrupt-controller@98007000 {
+		compatible = "realtek,rtd129x-iso-irq-mux";
+		reg = <0x98007000 0x4 0x98007040 0x4 0x98007004 0x4>;
+		interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+	};
-- 
2.21.0
