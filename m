From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v5 33/37] devicetree: document Ingenic SoC UART binding
Date: Sun, 24 May 2015 16:11:43 +0100
Message-ID: <1432480307-23789-34-git-send-email-paul.burton@imgtec.com>
References: <1432480307-23789-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432480307-23789-1-git-send-email-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lars-Peter Clausen <lars@metafoo.de>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add binding documentation for the UARTs found in Ingenic SoCs.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Acked-by: Rob Herring <robh@kernel.org>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---

Changes in v5: None
Changes in v4: None
Changes in v3:
- Merge binding documentation for Ingenic SoCs whose bindings differ
  only by their compatible strings.

Changes in v2: None

 .../devicetree/bindings/serial/ingenic,uart.txt    | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/ingenic,uart.txt

diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.txt b/Documentation/devicetree/bindings/serial/ingenic,uart.txt
new file mode 100644
index 0000000..c2d3b3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/ingenic,uart.txt
@@ -0,0 +1,22 @@
+* Ingenic SoC UART
+
+Required properties:
+- compatible : "ingenic,jz4740-uart" or "ingenic,jz4780-uart"
+- reg : offset and length of the register set for the device.
+- interrupts : should contain uart interrupt.
+- clocks : phandles to the module & baud clocks.
+- clock-names: tuple listing input clock names.
+	Required elements: "baud", "module"
+
+Example:
+
+uart0: serial@10030000 {
+	compatible = "ingenic,jz4740-uart";
+	reg = <0x10030000 0x100>;
+
+	interrupt-parent = <&intc>;
+	interrupts = <9>;
+
+	clocks = <&ext>, <&cgu JZ4740_CLK_UART0>;
+	clock-names = "baud", "module";
+};
-- 
2.4.1
