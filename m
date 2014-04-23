From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 1/2] of: selftest: add deferred probe interrupt test
Date: Wed, 23 Apr 2014 17:57:40 -0500
Message-ID: <1398293861-7682-2-git-send-email-robherring2@gmail.com>
References: <1398293861-7682-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398293861-7682-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>, Grant Likely <grant.likely@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, thierry.reding@gmail.com, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh@kernel.org>

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/selftest.c                          | 32 ++++++++++++++++++++++++++
 drivers/of/testcase-data/tests-interrupts.dtsi | 12 ++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
index ae44500..fe70b86 100644
--- a/drivers/of/selftest.c
+++ b/drivers/of/selftest.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
+#include <linux/of_platform.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
@@ -427,6 +428,36 @@ static void __init of_selftest_match_node(void)
 	}
 }
 
+static void __init of_selftest_platform_populate(void)
+{
+	int irq;
+	struct device_node *np;
+	struct platform_device *pdev;
+
+	np = of_find_node_by_path("/testcase-data");
+	of_platform_populate(np, of_default_bus_match_table, NULL, NULL);
+
+	/* Test that a missing irq domain returns -EPROBE_DEFER */
+	np = of_find_node_by_path("/testcase-data/testcase-device1");
+	pdev = of_find_device_by_node(np);
+	if (!pdev)
+		selftest(0, "device 1 creation failed\n");
+	irq = platform_get_irq(pdev, 0);
+	if (irq != -EPROBE_DEFER)
+		selftest(0, "device deferred probe failed - %d\n", irq);
+
+	/* Test that a parsing failure does not return -EPROBE_DEFER */
+	np = of_find_node_by_path("/testcase-data/testcase-device2");
+	pdev = of_find_device_by_node(np);
+	if (!pdev)
+		selftest(0, "device 2 creation failed\n");
+	irq = platform_get_irq(pdev, 0);
+	if (irq >= 0 || irq == -EPROBE_DEFER)
+		selftest(0, "device parsing error failed - %d\n", irq);
+
+	selftest(1, "passed");
+}
+
 static int __init of_selftest(void)
 {
 	struct device_node *np;
@@ -445,6 +476,7 @@ static int __init of_selftest(void)
 	of_selftest_parse_interrupts();
 	of_selftest_parse_interrupts_extended();
 	of_selftest_match_node();
+	of_selftest_platform_populate();
 	pr_info("end of selftest - %i passed, %i failed\n",
 		selftest_results.passed, selftest_results.failed);
 	return 0;
diff --git a/drivers/of/testcase-data/tests-interrupts.dtsi b/drivers/of/testcase-data/tests-interrupts.dtsi
index c843720..45cbdf8 100644
--- a/drivers/of/testcase-data/tests-interrupts.dtsi
+++ b/drivers/of/testcase-data/tests-interrupts.dtsi
@@ -54,5 +54,17 @@
 						      <&test_intmap1 1 2>;
 			};
 		};
+
+		testcase-device1 {
+			compatible = "testcase-device";
+			interrupt-parent = <&test_intc0>;
+			interrupts = <1>;
+		};
+
+		testcase-device2 {
+			compatible = "testcase-device";
+			interrupts = <1>;
+		};
 	};
+
 };
-- 
1.9.1
