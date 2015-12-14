From: Joshua Henderson <joshua.henderson@microchip.com>
Subject: [PATCH v2 01/14] DEVICETREE: Add bindings for PIC32 interrupt controller
Date: Mon, 14 Dec 2015 15:42:03 -0700
Message-ID: <1450133093-7053-2-git-send-email-joshua.henderson@microchip.com>
References: <1450133093-7053-1-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1450133093-7053-1-git-send-email-joshua.henderson@microchip.com>
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
 .../interrupt-controller/microchip,pic32-evic.txt  |   58 ++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/microchip,pic32-evic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32-evic.txt b/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32-evic.txt
new file mode 100644
index 0000000..6f4389a
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32-evic.txt
@@ -0,0 +1,58 @@
+Microchip PIC32 Interrupt Controller
+====================================
+
+The Microchip PIC32 contains an Enhanced Vectored Interrupt Controller
+(EVIC). It handles internal and external interrupts and provides support for
+irq type and polarity.
+
+Required properties
+-------------------
+
+- compatible: Should be "microchip,pic32mzda-evic"
+
+- reg: Specifies physical base address and size of register range.
+
+- interrupt-controller: Identifies the node as an interrupt controller.
+
+- #interrupt cells: Specifies the number of cells used to encode an interrupt
+source connected to this controller. The value shall be 2 and interrupt
+descriptor shall have the following format:
+	<hw_irq irq_type>
+
+hw_irq - represents the hardware interrupt number as in the data sheet.
+
+irq_type - is used to describe the type and polarity of an interrupt. For
+internal interrupts use IRQ_TYPE_EDGE_RISING for non persistent interrupts and
+IRQ_TYPE_LEVEL_HIGH for persistent interrupts. For external interrupts use
+IRQ_TYPE_EDGE_RISING or IRQ_TYPE_EDGE_FALLING to select the desired polarity.
+
+Example
+-------
+
+evic: interrupt-controller@1f810000 {
+        compatible = "microchip,pic32mzda-evic";
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        reg = <0x1f810000 0x1000>;
+};
+
+Each device must request his interrupt line with the associated priority and
+polarity
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
