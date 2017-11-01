From: Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v2 2/2] dt-binding: timer: document NPCM7xx timer DT bindings
Date: Wed,  1 Nov 2017 14:16:44 +0200
Message-ID: <1509538604-8218-3-git-send-email-tmaimon77@gmail.com>
References: <1509538604-8218-1-git-send-email-tmaimon77@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1509538604-8218-1-git-send-email-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, tglx@linutronix.de, avifishman70@gmail.com, brendanhiggins@google.com, raltherr@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
List-Id: devicetree@vger.kernel.org

Added device tree binding documentation for Nuvoton NPCM7xx timer.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/timer/nuvoton,npcm7xx-timer.txt       | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
new file mode 100644
index 000000000000..d1beea901509
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
@@ -0,0 +1,25 @@
+Nuvoton NPCM7xx timer
+
+Nuvoton NPCM7xx have three timer modules, each timer module provides five 24-bit
+timer counters.
+
+Required properties:
+- compatible      : "nuvoton,npcm7xx-timer" for Poleg NPCM7xx.
+- reg             : Offset and length of the register set for the device.
+- interrupts      : Contain the timer interrupt with flags for
+                    falling edge.
+
+Required clocking property, have to be one of:
+- clocks          : phandle of timer reference clock.
+- clock-frequency : The frequency in Hz of the clock that drives the NPCM7xx
+                    timer (usually 25000000).
+
+Example:
+
+timer@f0008000 {
+    compatible = "nuvoton,npcm7xx-timer";
+    interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+    reg = <0xf0008000 0x1000>;
+    clocks = <&clk NPCM7XX_CLK_TIMER>;
+};
+
-- 
2.14.1
