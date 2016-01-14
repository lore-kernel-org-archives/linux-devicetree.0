From: Joshua Henderson <joshua.henderson@microchip.com>
Subject: [PATCH v5 01/14] dt/bindings: Add bindings for PIC32 interrupt controller
Date: Wed, 13 Jan 2016 18:15:34 -0700
Message-ID: <1452734299-460-2-git-send-email-joshua.henderson@microchip.com>
References: <1452734299-460-1-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1452734299-460-1-git-send-email-joshua.henderson@microchip.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, Cristian Birsan <cristian.birsan@microchip.com>, Joshua Henderson <joshua.henderson@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Cristian Birsan <cristian.birsan@microchip.com>

Document the devicetree bindings for the interrupt controller on
Microchip PIC32 class devices.

Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
---
Changes since v4:
	- Add new microchip,external-interrupts property
	- Provide a better description of some of the features
	- Clean up formatting
Changes since v3: None
Changes since v2: None
Changes since v1:
	- Remove hardware interrupt priorities from interrupt controller DT
	  bindings.
---
 .../interrupt-controller/microchip,pic32-evic.txt  |   67 ++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/microchip,pic32-evic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32-evic.txt b/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32-evic.txt
new file mode 100644
index 0000000..c3a1b37
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32-evic.txt
@@ -0,0 +1,67 @@
+Microchip PIC32 Interrupt Controller
+====================================
+
+The Microchip PIC32 contains an Enhanced Vectored Interrupt Controller (EVIC).
+It handles all internal and external interrupts. This controller exists outside
+of the CPU and is the arbitrator of all interrupts (including interrupts from
+the CPU itself) before they are presented to the CPU.
+
+External interrupts have a software configurable edge polarity. Non external
+interrupts have a type and polarity that is determined by the source of the
+interrupt.
+
+Required properties
+-------------------
+
+- compatible: Should be "microchip,pic32mzda-evic"
+- reg: Specifies physical base address and size of register range.
+- interrupt-controller: Identifies the node as an interrupt controller.
+- #interrupt cells: Specifies the number of cells used to encode an interrupt
+  source connected to this controller. The value shall be 2 and interrupt
+  descriptor shall have the following format:
+
+	<hw_irq irq_type>
+
+  hw_irq - represents the hardware interrupt number as in the data sheet.
+  irq_type - is used to describe the type and polarity of an interrupt. For
+  internal interrupts use IRQ_TYPE_EDGE_RISING for non persistent interrupts and
+  IRQ_TYPE_LEVEL_HIGH for persistent interrupts. For external interrupts use
+  IRQ_TYPE_EDGE_RISING or IRQ_TYPE_EDGE_FALLING to select the desired polarity.
+
+Optional properties
+-------------------
+- microchip,external-irqs: u32 array of external interrupts with software
+  polarity configuration. This array corresponds to the bits in the INTCON
+  SFR.
+
+Example
+-------
+
+evic: interrupt-controller@1f810000 {
+	compatible = "microchip,pic32mzda-evic";
+	interrupt-controller;
+	#interrupt-cells = <2>;
+	reg = <0x1f810000 0x1000>;
+	microchip,external-irqs = <3 8 13 18 23>;
+};
+
+Each device/peripheral must request its interrupt line with the associated type
+and polarity.
+
+Internal interrupt DTS snippet
+------------------------------
+
+device@1f800000 {
+	...
+	interrupts = <113 IRQ_TYPE_LEVEL_HIGH>;
+	...
+};
+
+External interrupt DTS snippet
+------------------------------
+
+device@1f800000 {
+	...
+	interrupts = <3 IRQ_TYPE_EDGE_RISING>;
+	...
+};
-- 
1.7.9.5
