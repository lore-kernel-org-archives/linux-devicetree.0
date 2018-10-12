From: Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V12 6/8] dt-bindings: timer: C-SKY Multi-processor timer
Date: Fri, 12 Oct 2018 20:12:19 +0800
Message-ID: <45401df64791c7badd5dd8d3101031e2cddaf213.1539315341.git.ren_guo@c-sky.com>
References: <d6a649276d1b5641f2b8518e55016501d69e6128.1539315341.git.ren_guo@c-sky.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d6a649276d1b5641f2b8518e55016501d69e6128.1539315341.git.ren_guo@c-sky.com>
In-Reply-To: <cover.1539315341.git.ren_guo@c-sky.com>
References: <cover.1539315341.git.ren_guo@c-sky.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, will.deacon@arm.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <ren_guo@c-sky.com>
List-Id: devicetree@vger.kernel.org

Dt-bingdings doc for C-SKY SMP system setting.

Changelog:
 - Drop the interrupt-parent.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/timer/csky,mptimer.txt     | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/csky,mptimer.txt

diff --git a/Documentation/devicetree/bindings/timer/csky,mptimer.txt b/Documentation/devicetree/bindings/timer/csky,mptimer.txt
new file mode 100644
index 0000000..15cfec0
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/csky,mptimer.txt
@@ -0,0 +1,42 @@
+============================
+C-SKY Multi-processors Timer
+============================
+
+C-SKY multi-processors timer is designed for C-SKY SMP system and the
+regs is accessed by cpu co-processor 4 registers with mtcr/mfcr.
+
+ - PTIM_CTLR "cr<0, 14>" Control reg to start reset timer.
+ - PTIM_TSR  "cr<1, 14>" Interrupt cleanup status reg.
+ - PTIM_CCVR "cr<3, 14>" Current counter value reg.
+ - PTIM_LVR  "cr<6, 14>" Window value reg to triger next event.
+
+==============================
+timer node bindings definition
+==============================
+
+	Description: Describes SMP timer
+
+	PROPERTIES
+
+	- compatible
+		Usage: required
+		Value type: <string>
+		Definition: must be "csky,mptimer"
+	- clocks
+		Usage: required
+		Value type: <node>
+		Definition: must be input clk node
+	- interrupts
+		Usage: required
+		Value type: <u32>
+		Definition: must be timer irq num defined by soc
+
+Examples:
+---------
+
+	timer: timer {
+		compatible = "csky,mptimer";
+		clocks = <&dummy_apb_clk>;
+		interrupts = <16>;
+		interrupt-parent = <&intc>;
+	};
-- 
2.7.4
