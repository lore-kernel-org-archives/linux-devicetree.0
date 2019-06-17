From: guoren@kernel.org
Subject: [PATCH] dt-bindings: csky: Add csky PMU bindings
Date: Mon, 17 Jun 2019 20:21:39 +0800
Message-ID: <1560774099-8808-1-git-send-email-guoren@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, guoren@kernel.org, han_mao@c-sky.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Mao Han <han_mao@c-sky.com>

This patch adds the documentation to describe that how to add pmu node in
dts.

Signed-off-by: Mao Han <han_mao@c-sky.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
---
 Documentation/devicetree/bindings/csky/pmu.txt | 38 ++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/csky/pmu.txt

diff --git a/Documentation/devicetree/bindings/csky/pmu.txt b/Documentation/devicetree/bindings/csky/pmu.txt
new file mode 100644
index 0000000..728d05c
--- /dev/null
+++ b/Documentation/devicetree/bindings/csky/pmu.txt
@@ -0,0 +1,38 @@
+===============================
+C-SKY Performance Monitor Units
+===============================
+
+C-SKY Performance Monitor is designed for ck807/ck810/ck860 SMP soc and
+it could count cpu's events for helping analysis performance issues.
+
+============================
+PMU node bindings definition
+============================
+
+	Description: Describes PMU
+
+	PROPERTIES
+
+	- compatible
+		Usage: required
+		Value type: <string>
+		Definition: must be "csky,csky-pmu"
+	- interrupts
+		Usage: required
+		Value type: <u32 IRQ_TYPE_XXX>
+		Definition: must be pmu irq num defined by soc
+	- count-width
+		Usage: optional
+		Value type: <u32>
+		Definition: the width of pmu counter
+
+Examples:
+---------
+#include <dt-bindings/interrupt-controller/irq.h>
+
+	pmu: performace-monitor {
+		compatible = "csky,csky-pmu";
+		interrupts = <23 IRQ_TYPE_EDGE_RISING>;
+		interrupt-parent = <&intc>;
+		count-width = <48>;
+        };
-- 
2.7.4
