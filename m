From: Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V11 2/8] dt-bindings: interrupt-controller: C-SKY SMP intc
Date: Tue,  9 Oct 2018 22:41:29 +0800
Message-ID: <aefee1fdd64ae805c698a9323f80b5396fc8bd24.1539095312.git.ren_guo@c-sky.com>
References: <cover.1539095311.git.ren_guo@c-sky.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1539095311.git.ren_guo@c-sky.com>
In-Reply-To: <cover.1539095311.git.ren_guo@c-sky.com>
References: <cover.1539095311.git.ren_guo@c-sky.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, will.deacon@arm.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <ren_guo@c-sky.com>
List-Id: devicetree@vger.kernel.org

Dt-bindings doc about C-SKY Multi-processors interrupt controller.

Changelog:
 - Should be: '#interrupt-cells' not 'interrupt-cells'

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/interrupt-controller/csky,mpintc.txt  | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
new file mode 100644
index 0000000..ab921f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
@@ -0,0 +1,40 @@
+===========================================
+C-SKY Multi-processors Interrupt Controller
+===========================================
+
+C-SKY Multi-processors Interrupt Controller is designed for ck807/ck810/ck860
+SMP soc, and it also could be used in non-SMP system.
+
+Interrupt number definition:
+
+  0-15  : software irq, and we use 15 as our IPI_IRQ.
+ 16-31  : private  irq, and we use 16 as the co-processor timer.
+ 31-1024: common irq for soc ip.
+
+=============================
+intc node bindings definition
+=============================
+
+	Description: Describes SMP interrupt controller
+
+	PROPERTIES
+
+	- compatible
+		Usage: required
+		Value type: <string>
+		Definition: must be "csky,mpintc"
+	- #interrupt-cells
+		Usage: required
+		Value type: <u32>
+		Definition: must be <1>
+	- interrupt-controller:
+		Usage: required
+
+Examples:
+---------
+
+	intc: interrupt-controller {
+		compatible = "csky,mpintc";
+		#interrupt-cells = <1>;
+		interrupt-controller;
+	};
-- 
2.7.4
