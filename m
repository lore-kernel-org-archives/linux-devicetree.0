From: Frank Rowand <frowand.list@gmail.com>
Subject: [Patch 1/5] dt: unittest: early return from test skips tests
Date: Fri, 13 Mar 2015 23:57:40 -0700
Message-ID: <5503DBE4.8030006@gmail.com>
References: <5503C65F.4030000@gmail.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5503C65F.4030000@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sonymobile.com>

Fix bugs pointed out by checkpatch.

Mis-coding of two if statements caused early return from function.

Number of tests completed increased from 102 to 107.
Number of tests failed increased from 0 to 2.

Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>
---
 drivers/of/unittest.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

Index: b/drivers/of/unittest.c
===================================================================
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -762,12 +762,14 @@ static void __init of_selftest_platform_
 	irq = platform_get_irq(pdev, 0);
 	selftest(irq < 0 && irq != -EPROBE_DEFER, "device parsing error failed - %d\n", irq);
 
-	if (selftest(np = of_find_node_by_path("/testcase-data/platform-tests"),
-		     "No testcase data in device tree\n"));
+	np = of_find_node_by_path("/testcase-data/platform-tests");
+	selftest(np, "No testcase data in device tree\n");
+	if (!np)
 		return;
 
-	if (selftest(!(rc = device_register(&test_bus)),
-		     "testbus registration failed; rc=%i\n", rc));
+	rc = device_register(&test_bus);
+	selftest(!rc, "testbus registration failed; rc=%i\n", rc);
+	if (rc)
 		return;
 
 	for_each_child_of_node(np, child) {
