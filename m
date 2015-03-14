From: Frank Rowand <frowand.list@gmail.com>
Subject: [Patch 4/5] dt: unittest: reduce checkpatch noise - line after declarations
Date: Sat, 14 Mar 2015 00:02:31 -0700
Message-ID: <5503DD07.5020407@gmail.com>
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

Fix warnings pointed out by checkpatch.

No bug fixes, but reduce the number of checkpatch warnings so that future
problems will stand out better.

Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>
---
 drivers/of/unittest.c |    5 +++++
 1 file changed, 5 insertions(+)

Index: b/drivers/of/unittest.c
===================================================================
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -279,6 +279,7 @@ static void __init of_selftest_parse_pha
 
 	for (i = 0; i < 8; i++) {
 		bool passed = true;
+
 		rc = of_parse_phandle_with_args(np, "phandle-list",
 						"#phandle-cells", i, &args);
 
@@ -539,6 +540,7 @@ static void __init of_selftest_parse_int
 
 	for (i = 0; i < 4; i++) {
 		bool passed = true;
+
 		args.args_count = 0;
 		rc = of_irq_parse_one(np, i, &args);
 
@@ -559,6 +561,7 @@ static void __init of_selftest_parse_int
 
 	for (i = 0; i < 4; i++) {
 		bool passed = true;
+
 		args.args_count = 0;
 		rc = of_irq_parse_one(np, i, &args);
 
@@ -611,6 +614,7 @@ static void __init of_selftest_parse_int
 
 	for (i = 0; i < 7; i++) {
 		bool passed = true;
+
 		rc = of_irq_parse_one(np, i, &args);
 
 		/* Test the values from tests-phandle.dtsi */
@@ -905,6 +909,7 @@ static int __init selftest_data_add(void
 	np = selftest_data_node->child;
 	while (np) {
 		struct device_node *next = np->sibling;
+
 		np->parent = of_root;
 		attach_node_and_children(np);
 		np = next;
