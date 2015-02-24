From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH] clocksource: mips-gic: Allow GIC clock to be specified in device-tree
Date: Mon, 23 Feb 2015 18:28:34 -0800
Message-ID: <1424744914-1244-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, James Hogan <james.hogan@imgtec.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

As an alternative to the "clock-frequency" property, allow the GIC
timer operating clock to be specified in the device-tree instead.
This is useful on systems which use common clock or where the GIC
is not fixed to a particular frequency and is instead, for example,
derived from the CPU clock.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Cc: James Hogan <james.hogan@imgtec.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
---
 .../devicetree/bindings/interrupt-controller/mips-gic.txt      |  5 +++++
 drivers/clocksource/mips-gic-timer.c                           | 10 +++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt b/Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
index 5a65478..aae4c38 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
@@ -27,8 +27,13 @@ Optional properties:
 Required properties for timer sub-node:
 - compatible : Should be "mti,gic-timer".
 - interrupts : Interrupt for the GIC local timer.
+
+Optional properties for timer sub-node:
+- clocks : GIC timer operating clock.
 - clock-frequency : Clock frequency at which the GIC timers operate.
 
+Note that one of clocks or clock-frequency must be specified.
+
 Example:
 
 	gic: interrupt-controller@1bdc0000 {
diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 3bd31b1..1809f52 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -5,6 +5,7 @@
  *
  * Copyright (C) 2012 MIPS Technologies, Inc.  All rights reserved.
  */
+#include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
 #include <linux/init.h>
@@ -146,11 +147,18 @@ void __init gic_clocksource_init(unsigned int frequency)
 
 static void __init gic_clocksource_of_init(struct device_node *node)
 {
+	struct clk *clk;
+
 	if (WARN_ON(!gic_present || !node->parent ||
 		    !of_device_is_compatible(node->parent, "mti,gic")))
 		return;
 
-	if (of_property_read_u32(node, "clock-frequency", &gic_frequency)) {
+	clk = of_clk_get(node, 0);
+	if (!IS_ERR(clk)) {
+		gic_frequency = clk_get_rate(clk);
+		clk_put(clk);
+	} else if (of_property_read_u32(node, "clock-frequency",
+					&gic_frequency)) {
 		pr_err("GIC frequency not specified.\n");
 		return;
 	}
-- 
2.2.0.rc0.207.ga3a616c
