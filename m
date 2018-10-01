From: Yasha Cherikovsky <yasha.che3@gmail.com>
Subject: [RFC v2 2/7] dt-binding: interrupt-controller: Document RTL8186 SoC DT bindings
Date: Mon,  1 Oct 2018 13:29:47 +0300
Message-ID: <20181001102952.7913-3-yasha.che3@gmail.com>
References: <20181001102952.7913-1-yasha.che3@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181001102952.7913-1-yasha.che3@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org
Cc: Yasha Cherikovsky <yasha.che3@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds device tree binding doc for the
Realtek RTL8186 SoC interrupt controller.

Signed-off-by: Yasha Cherikovsky <yasha.che3@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@mips.com>
Cc: James Hogan <jhogan@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
---
 .../interrupt-controller/realtek,rtl8186-intc  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/realtek,rtl8186-intc

diff --git a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl8186-intc b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl8186-intc
new file mode 100644
index 000000000000..21956d210021
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl8186-intc
@@ -0,0 +1,18 @@
+Realtek RTL8186 SoC interrupt controller
+
+Required properties:
+
+- compatible : should be "realtek,rtl8186-intc"
+- interrupt-controller : Identifies the node as an interrupt controller.
+- #interrupt-cells : Specifies the number of cells needed to encode an
+  interrupt source. The value shall be 1.
+- reg : Specifies base physical address and size of the registers.
+
+Example:
+
+intc: interrupt-controller@1d010000 {
+	compatible = "realtek,rtl8186-intc";
+	interrupt-controller;
+	#interrupt-cells = <1>;
+	reg = <0x1d010000 0x8>;
+};
-- 
2.19.0
