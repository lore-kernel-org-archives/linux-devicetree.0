From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 1/3] dt-bindings: interrupt-controller: Add Realtek RTD1295
Date: Mon, 28 Aug 2017 12:53:42 +0200
Message-ID: <20170828105344.8338-2-afaerber@suse.de>
References: <20170828105344.8338-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170828105344.8338-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Roc He <hepeng@zidoo.tv>, =?UTF-8?q?=E8=92=8B=E4=B8=BD=E7=90=B4?= <jiang.liqin@geniatech.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add binding for Realtek RTD1295 IRQ mux.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v1 -> v2:
 * Dropped reference to common interrupt.txt bindings (Rob)
 
 .../interrupt-controller/realtek,rtd119x-mux.txt   | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/realtek,rtd119x-mux.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtd119x-mux.txt b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtd119x-mux.txt
new file mode 100644
index 000000000000..952e5c54a5fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtd119x-mux.txt
@@ -0,0 +1,23 @@
+Realtek RTD119x/129x IRQ Mux Controller
+=======================================
+
+Required properties:
+
+- compatible           :  Should be one of the following:
+                          - "realtek,rtd1295-irq-mux"
+                          - "realtek,rtd1295-iso-irq-mux"
+- reg                  :  Specifies base physical address and size of the registers.
+- interrupts           :  Specifies the interrupt line which is mux'ed.
+- interrupt-controller :  Presence indicates the node as interrupt controller.
+- #interrupt-cells     :  Shall be 1. See common bindings in interrupt.txt.
+
+
+Example:
+
+	interrupt-controller@98007000 {
+		compatible = "realtek,rtd1295-iso-irq-mux";
+		reg = <0x98007000 0x100>;
+		interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+	};
-- 
2.12.3
