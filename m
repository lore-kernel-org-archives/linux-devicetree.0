From: Yasha Cherikovsky <yasha.che3@gmail.com>
Subject: [RFC 2/5] dt-binding: timer: Document RTL8186 SoC DT bindings
Date: Sun, 30 Sep 2018 17:15:07 +0300
Message-ID: <20180930141510.2690-3-yasha.che3@gmail.com>
References: <20180930141510.2690-1-yasha.che3@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180930141510.2690-1-yasha.che3@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, linux-mips@linux-mips.org
Cc: Yasha Cherikovsky <yasha.che3@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds device tree binding doc for the
Realtek RTL8186 SoC timer controller.

Signed-off-by: Yasha Cherikovsky <yasha.che3@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@mips.com>
Cc: James Hogan <jhogan@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
---
 .../bindings/timer/realtek,rtl8186-timer.txt    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/realtek,rtl8186-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/realtek,rtl8186-timer.txt b/Documentation/devicetree/bindings/timer/realtek,rtl8186-timer.txt
new file mode 100644
index 000000000000..eaa6292c16e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/realtek,rtl8186-timer.txt
@@ -0,0 +1,17 @@
+Realtek RTL8186 SoC timer
+
+Required properties:
+
+- compatible : Should be "realtek,rtl8186-timer".
+- reg : Specifies base physical address and size of the registers.
+- interrupts : The interrupt number of the timer.
+- clocks: phandle to the source clock (usually a 22 MHz fixed clock)
+
+Example:
+
+timer {
+	compatible = "realtek,rtl8186-timer";
+	reg = <0x1d010050 0x30>;
+	interrupts = <0>;
+	clocks = <&sysclk>;
+};
-- 
2.19.0
