From: Rich Felker <dalias@libc.org>
Subject: [PATCH v7 1/2] of: add J-Core timer bindings
Date: Sat, 24 Sep 2016 05:07:36 +0000
Message-ID: <50f237f1d7cf25e5ef5608d0e8806c1d56d6e18d.1474693319.git.dalias@libc.org>
References: <cover.1474693319.git.dalias@libc.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1474693319.git.dalias@libc.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Rich Felker <dalias@libc.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/timer/jcore,pit.txt        | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/jcore,pit.txt

diff --git a/Documentation/devicetree/bindings/timer/jcore,pit.txt b/Documentation/devicetree/bindings/timer/jcore,pit.txt
new file mode 100644
index 0000000..af5dd35
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/jcore,pit.txt
@@ -0,0 +1,24 @@
+J-Core Programmable Interval Timer and Clocksource
+
+Required properties:
+
+- compatible: Must be "jcore,pit".
+
+- reg: Memory region(s) for timer/clocksource registers. For SMP,
+  there should be one region per cpu, indexed by the sequential,
+  zero-based hardware cpu number.
+
+- interrupts: An interrupt to assign for the timer. The actual pit
+  core is integrated with the aic and allows the timer interrupt
+  assignment to be programmed by software, but this property is
+  required in order to reserve an interrupt number that doesn't
+  conflict with other devices.
+
+
+Example:
+
+timer@200 {
+	compatible = "jcore,pit";
+	reg = < 0x200 0x30 0x500 0x30 >;
+	interrupts = < 0x48 >;
+};
-- 
2.10.0
