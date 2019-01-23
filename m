From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 2/2] dt-bindings: interrupt-controller: loongson ls1x intc
Date: Wed, 23 Jan 2019 14:23:35 +0800
Message-ID: <20190123062341.8957-2-jiaxun.yang@flygoat.com>
References: <20190122154557.22689-1-jiaxun.yang@flygoat.com>
 <20190123062341.8957-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123062341.8957-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dt-bindings doc about Loongson-1 interrupt controller

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../loongson,ls1x-intc.txt                    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,ls1x-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,ls1x-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls1x-intc.txt
new file mode 100644
index 000000000000..afa8fec45f88
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls1x-intc.txt
@@ -0,0 +1,28 @@
+Loongson ls1x Interrupt Controller
+
+Required properties:
+
+- compatible : should be "ingenic,<socname>-intc". Valid strings are:
+    loongson,ls1b-intc
+    loongson,ls1c-intc
+
+- reg : Specifies base physical address and size of the registers.
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode an
+  interrupt source. The value shall be 1.
+- interrupts : Specifies the CPU interrupts the controller is connected to,
+    - For ls1b, it must have 4 interrupts.
+    - For ls1c, it must have 5 interrupts.
+
+Example:
+
+intc: interrupt-controller@1fd01040 {
+	compatible = "loongson,ls1c-intc";
+	reg = <0x1fd01040 0x78>;
+
+	interrupt-controller;
+	#interrupt-cells = <1>;
+
+	interrupt-parent = <&cpu_intc>;
+	interrupts = <2>, <3>, <4>, <5>, <6>;
+};
\ No newline at end of file
-- 
2.20.1
