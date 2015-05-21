From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: [PATCH 5/7] clocksource: Add Pistachio SoC general purpose timer binding document
Date: Thu, 21 May 2015 18:41:05 -0300
Message-ID: <1432244465-15313-1-git-send-email-ezequiel.garcia@imgtec.com>
References: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org
Cc: Andrew Bresticker <abrestic@chromium.org>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Thomas Gleixner <tglx@linutronix.de>, Damien.Horsley@imgtec.com, Govindraj.Raja@imgtec.com, Ezequiel Garcia <ezequiel.garcia@imgtec.com>
List-Id: devicetree@vger.kernel.org

Add a device-tree binding document for the clocksource driver provided
by Pistachio SoC general purpose timers.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
---
 .../bindings/timer/img,pistachio-gptimer.txt       | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/img,pistachio-gptimer.txt

diff --git a/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.txt b/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.txt
new file mode 100644
index 0000000..f1b7c08
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.txt
@@ -0,0 +1,29 @@
+* Pistachio general-purpose timer based clocksource
+
+Required properties:
+ - compatible: "img,pistachio-gptimer".
+ - reg: Address range of the timer registers.
+ - interrupts: An interrupt for each of the four timers
+ - clocks : Should contain a clock specifier for each entry in clock-names
+ - clock-names : Should contain the following entries:
+                "sys", interface clock
+                "slow", slow counter clock
+                "fast", fast counter clock
+ - img,cr-periph: Must contain a phandle to the peripheral control
+		  syscon node.
+
+Example:
+	timer: timer@18102000 {
+		compatible = "img,pistachio-gptimer";
+		reg = <0x18102000 0x100>;
+		interrupts = <GIC_SHARED 60 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SHARED 61 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SHARED 62 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SHARED 63 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk_periph PERIPH_CLK_COUNTER_FAST>,
+		         <&clk_periph PERIPH_CLK_COUNTER_SLOW>,
+			 <&cr_periph SYS_CLK_TIMER>;
+		clock-names = "fast", "slow", "sys";
+		img,cr-periph = <&cr_periph>;
+	};
+
-- 
2.3.3
