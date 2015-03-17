From: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 1/3] of/unittest: replace 'selftest' with 'unittest'
Date: Tue, 17 Mar 2015 03:19:58 +0000
Message-ID: <1426562400-102415-2-git-send-email-long.wanglong@huawei.com>
References: <1426562400-102415-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426562400-102415-1-git-send-email-long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch just replace the string 'selftest' with 'unittest'
in OF unittest and data and binding file.

I have tested it successfully on ARM.

Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/unittest.txt |  44 +-
 drivers/of/unittest-data/tests-overlay.dtsi    | 108 ++--
 drivers/of/unittest.c                          | 706 ++++++++++++-------------
 3 files changed, 429 insertions(+), 429 deletions(-)

diff --git a/Documentation/devicetree/bindings/unittest.txt b/Documentation/devicetree/bindings/unittest.txt
index 8933211..3bf58c2 100644
--- a/Documentation/devicetree/bindings/unittest.txt
+++ b/Documentation/devicetree/bindings/unittest.txt
@@ -1,60 +1,60 @@
-1) OF selftest platform device
+1) OF unittest platform device
 
-** selftest
+** unittest
 
 Required properties:
-- compatible: must be "selftest"
+- compatible: must be "unittest"
 
 All other properties are optional.
 
 Example:
-	selftest {
-		compatible = "selftest";
+	unittest {
+		compatible = "unittest";
 		status = "okay";
 	};
 
-2) OF selftest i2c adapter platform device
+2) OF unittest i2c adapter platform device
 
 ** platform device unittest adapter
 
 Required properties:
-- compatible: must be selftest-i2c-bus
+- compatible: must be unittest-i2c-bus
 
-Children nodes contain selftest i2c devices.
+Children nodes contain unittest i2c devices.
 
 Example:
-	selftest-i2c-bus {
-		compatible = "selftest-i2c-bus";
+	unittest-i2c-bus {
+		compatible = "unittest-i2c-bus";
 		status = "okay";
 	};
 
-3) OF selftest i2c device
+3) OF unittest i2c device
 
-** I2C selftest device
+** I2C unittest device
 
 Required properties:
-- compatible: must be selftest-i2c-dev
+- compatible: must be unittest-i2c-dev
 
 All other properties are optional
 
 Example:
-	selftest-i2c-dev {
-		compatible = "selftest-i2c-dev";
+	unittest-i2c-dev {
+		compatible = "unittest-i2c-dev";
 		status = "okay";
 	};
 
-4) OF selftest i2c mux device
+4) OF unittest i2c mux device
 
-** I2C selftest mux
+** I2C unittest mux
 
 Required properties:
-- compatible: must be selftest-i2c-mux
+- compatible: must be unittest-i2c-mux
 
-Children nodes contain selftest i2c bus nodes per channel.
+Children nodes contain unittest i2c bus nodes per channel.
 
 Example:
-	selftest-i2c-mux {
-		compatible = "selftest-i2c-mux";
+	unittest-i2c-mux {
+		compatible = "unittest-i2c-mux";
 		status = "okay";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -64,7 +64,7 @@ Example:
 			#size-cells = <0>;
 			i2c-dev {
 				reg = <8>;
-				compatible = "selftest-i2c-dev";
+				compatible = "unittest-i2c-dev";
 				status = "okay";
 			};
 		};
diff --git a/drivers/of/unittest-data/tests-overlay.dtsi b/drivers/of/unittest-data/tests-overlay.dtsi
index 244226c..02ba56c 100644
--- a/drivers/of/unittest-data/tests-overlay.dtsi
+++ b/drivers/of/unittest-data/tests-overlay.dtsi
@@ -4,94 +4,94 @@
 		overlay-node {
 
 			/* test bus */
-			selftestbus: test-bus {
+			unittestbus: test-bus {
 				compatible = "simple-bus";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				selftest100: test-selftest100 {
-					compatible = "selftest";
+				unittest100: test-unittest100 {
+					compatible = "unittest";
 					status = "okay";
 					reg = <100>;
 				};
 
-				selftest101: test-selftest101 {
-					compatible = "selftest";
+				unittest101: test-unittest101 {
+					compatible = "unittest";
 					status = "disabled";
 					reg = <101>;
 				};
 
-				selftest0: test-selftest0 {
-					compatible = "selftest";
+				unittest0: test-unittest0 {
+					compatible = "unittest";
 					status = "disabled";
 					reg = <0>;
 				};
 
-				selftest1: test-selftest1 {
-					compatible = "selftest";
+				unittest1: test-unittest1 {
+					compatible = "unittest";
 					status = "okay";
 					reg = <1>;
 				};
 
-				selftest2: test-selftest2 {
-					compatible = "selftest";
+				unittest2: test-unittest2 {
+					compatible = "unittest";
 					status = "disabled";
 					reg = <2>;
 				};
 
-				selftest3: test-selftest3 {
-					compatible = "selftest";
+				unittest3: test-unittest3 {
+					compatible = "unittest";
 					status = "okay";
 					reg = <3>;
 				};
 
-				selftest5: test-selftest5 {
-					compatible = "selftest";
+				unittest5: test-unittest5 {
+					compatible = "unittest";
 					status = "disabled";
 					reg = <5>;
 				};
 
-				selftest6: test-selftest6 {
-					compatible = "selftest";
+				unittest6: test-unittest6 {
+					compatible = "unittest";
 					status = "disabled";
 					reg = <6>;
 				};
 
-				selftest7: test-selftest7 {
-					compatible = "selftest";
+				unittest7: test-unittest7 {
+					compatible = "unittest";
 					status = "disabled";
 					reg = <7>;
 				};
 
-				selftest8: test-selftest8 {
-					compatible = "selftest";
+				unittest8: test-unittest8 {
+					compatible = "unittest";
 					status = "disabled";
 					reg = <8>;
 				};
 
 				i2c-test-bus {
-					compatible = "selftest-i2c-bus";
+					compatible = "unittest-i2c-bus";
 					status = "okay";
 					reg = <50>;
 
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					test-selftest12 {
+					test-unittest12 {
 						reg = <8>;
-						compatible = "selftest-i2c-dev";
+						compatible = "unittest-i2c-dev";
 						status = "disabled";
 					};
 
-					test-selftest13 {
+					test-unittest13 {
 						reg = <9>;
-						compatible = "selftest-i2c-dev";
+						compatible = "unittest-i2c-dev";
 						status = "okay";
 					};
 
-					test-selftest14 {
+					test-unittest14 {
 						reg = <10>;
-						compatible = "selftest-i2c-mux";
+						compatible = "unittest-i2c-mux";
 						status = "okay";
 
 						#address-cells = <1>;
@@ -104,7 +104,7 @@
 
 							test-mux-dev {
 								reg = <32>;
-								compatible = "selftest-i2c-dev";
+								compatible = "unittest-i2c-dev";
 								status = "okay";
 							};
 						};
@@ -116,7 +116,7 @@
 		/* test enable using absolute target path */
 		overlay0 {
 			fragment@0 {
-				target-path = "/testcase-data/overlay-node/test-bus/test-selftest0";
+				target-path = "/testcase-data/overlay-node/test-bus/test-unittest0";
 				__overlay__ {
 					status = "okay";
 				};
@@ -126,7 +126,7 @@
 		/* test disable using absolute target path */
 		overlay1 {
 			fragment@0 {
-				target-path = "/testcase-data/overlay-node/test-bus/test-selftest1";
+				target-path = "/testcase-data/overlay-node/test-bus/test-unittest1";
 				__overlay__ {
 					status = "disabled";
 				};
@@ -136,7 +136,7 @@
 		/* test enable using label */
 		overlay2 {
 			fragment@0 {
-				target = <&selftest2>;
+				target = <&unittest2>;
 				__overlay__ {
 					status = "okay";
 				};
@@ -146,7 +146,7 @@
 		/* test disable using label */
 		overlay3 {
 			fragment@0 {
-				target = <&selftest3>;
+				target = <&unittest3>;
 				__overlay__ {
 					status = "disabled";
 				};
@@ -156,15 +156,15 @@
 		/* test insertion of a full node */
 		overlay4 {
 			fragment@0 {
-				target = <&selftestbus>;
+				target = <&unittestbus>;
 				__overlay__ {
 
 					/* suppress DTC warning */
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					test-selftest4 {
-						compatible = "selftest";
+					test-unittest4 {
+						compatible = "unittest";
 						status = "okay";
 						reg = <4>;
 					};
@@ -175,7 +175,7 @@
 		/* test overlay apply revert */
 		overlay5 {
 			fragment@0 {
-				target-path = "/testcase-data/overlay-node/test-bus/test-selftest5";
+				target-path = "/testcase-data/overlay-node/test-bus/test-unittest5";
 				__overlay__ {
 					status = "okay";
 				};
@@ -185,7 +185,7 @@
 		/* test overlays application and removal in sequence */
 		overlay6 {
 			fragment@0 {
-				target-path = "/testcase-data/overlay-node/test-bus/test-selftest6";
+				target-path = "/testcase-data/overlay-node/test-bus/test-unittest6";
 				__overlay__ {
 					status = "okay";
 				};
@@ -193,7 +193,7 @@
 		};
 		overlay7 {
 			fragment@0 {
-				target-path = "/testcase-data/overlay-node/test-bus/test-selftest7";
+				target-path = "/testcase-data/overlay-node/test-bus/test-unittest7";
 				__overlay__ {
 					status = "okay";
 				};
@@ -203,7 +203,7 @@
 		/* test overlays application and removal in bad sequence */
 		overlay8 {
 			fragment@0 {
-				target-path = "/testcase-data/overlay-node/test-bus/test-selftest8";
+				target-path = "/testcase-data/overlay-node/test-bus/test-unittest8";
 				__overlay__ {
 					status = "okay";
 				};
@@ -211,7 +211,7 @@
 		};
 		overlay9 {
 			fragment@0 {
-				target-path = "/testcase-data/overlay-node/test-bus/test-selftest8";
+				target-path = "/testcase-data/overlay-node/test-bus/test-unittest8";
 				__overlay__ {
 					property-foo = "bar";
 				};
@@ -227,16 +227,16 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					test-selftest10 {
-						compatible = "selftest";
+					test-unittest10 {
+						compatible = "unittest";
 						status = "okay";
 						reg = <10>;
 
 						#address-cells = <1>;
 						#size-cells = <0>;
 
-						test-selftest101 {
-							compatible = "selftest";
+						test-unittest101 {
+							compatible = "unittest";
 							status = "okay";
 							reg = <1>;
 						};
@@ -255,16 +255,16 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					test-selftest11 {
-						compatible = "selftest";
+					test-unittest11 {
+						compatible = "unittest";
 						status = "okay";
 						reg = <11>;
 
 						#address-cells = <1>;
 						#size-cells = <0>;
 
-						test-selftest111 {
-							compatible = "selftest";
+						test-unittest111 {
+							compatible = "unittest";
 							status = "okay";
 							reg = <1>;
 						};
@@ -277,7 +277,7 @@
 		/* test enable using absolute target path (i2c) */
 		overlay12 {
 			fragment@0 {
-				target-path = "/testcase-data/overlay-node/test-bus/i2c-test-bus/test-selftest12";
+				target-path = "/testcase-data/overlay-node/test-bus/i2c-test-bus/test-unittest12";
 				__overlay__ {
 					status = "okay";
 				};
@@ -287,7 +287,7 @@
 		/* test disable using absolute target path (i2c) */
 		overlay13 {
 			fragment@0 {
-				target-path = "/testcase-data/overlay-node/test-bus/i2c-test-bus/test-selftest13";
+				target-path = "/testcase-data/overlay-node/test-bus/i2c-test-bus/test-unittest13";
 				__overlay__ {
 					status = "disabled";
 				};
@@ -301,9 +301,9 @@
 				__overlay__ {
 					#address-cells = <1>;
 					#size-cells = <0>;
-					test-selftest15 {
+					test-unittest15 {
 						reg = <11>;
-						compatible = "selftest-i2c-mux";
+						compatible = "unittest-i2c-mux";
 						status = "okay";
 
 						#address-cells = <1>;
@@ -316,7 +316,7 @@
 
 							test-mux-dev {
 								reg = <32>;
-								compatible = "selftest-i2c-dev";
+								compatible = "unittest-i2c-dev";
 								status = "okay";
 							};
 						};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index aba8946..ab7e75c 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -25,110 +25,110 @@
 
 #include "of_private.h"
 
-static struct selftest_results {
+static struct unittest_results {
 	int passed;
 	int failed;
-} selftest_results;
+} unittest_results;
 
-#define selftest(result, fmt, ...) ({ \
+#define unittest(result, fmt, ...) ({ \
 	bool failed = !(result); \
 	if (failed) { \
-		selftest_results.failed++; \
+		unittest_results.failed++; \
 		pr_err("FAIL %s():%i " fmt, __func__, __LINE__, ##__VA_ARGS__); \
 	} else { \
-		selftest_results.passed++; \
+		unittest_results.passed++; \
 		pr_debug("pass %s():%i\n", __func__, __LINE__); \
 	} \
 	failed; \
 })
 
-static void __init of_selftest_find_node_by_name(void)
+static void __init of_unittest_find_node_by_name(void)
 {
 	struct device_node *np;
 	const char *options;
 
 	np = of_find_node_by_path("/testcase-data");
-	selftest(np && !strcmp("/testcase-data", np->full_name),
+	unittest(np && !strcmp("/testcase-data", np->full_name),
 		"find /testcase-data failed\n");
 	of_node_put(np);
 
 	/* Test if trailing '/' works */
 	np = of_find_node_by_path("/testcase-data/");
-	selftest(!np, "trailing '/' on /testcase-data/ should fail\n");
+	unittest(!np, "trailing '/' on /testcase-data/ should fail\n");
 
 	np = of_find_node_by_path("/testcase-data/phandle-tests/consumer-a");
-	selftest(np && !strcmp("/testcase-data/phandle-tests/consumer-a", np->full_name),
+	unittest(np && !strcmp("/testcase-data/phandle-tests/consumer-a", np->full_name),
 		"find /testcase-data/phandle-tests/consumer-a failed\n");
 	of_node_put(np);
 
 	np = of_find_node_by_path("testcase-alias");
-	selftest(np && !strcmp("/testcase-data", np->full_name),
+	unittest(np && !strcmp("/testcase-data", np->full_name),
 		"find testcase-alias failed\n");
 	of_node_put(np);
 
 	/* Test if trailing '/' works on aliases */
 	np = of_find_node_by_path("testcase-alias/");
-	selftest(!np, "trailing '/' on testcase-alias/ should fail\n");
+	unittest(!np, "trailing '/' on testcase-alias/ should fail\n");
 
 	np = of_find_node_by_path("testcase-alias/phandle-tests/consumer-a");
-	selftest(np && !strcmp("/testcase-data/phandle-tests/consumer-a", np->full_name),
+	unittest(np && !strcmp("/testcase-data/phandle-tests/consumer-a", np->full_name),
 		"find testcase-alias/phandle-tests/consumer-a failed\n");
 	of_node_put(np);
 
 	np = of_find_node_by_path("/testcase-data/missing-path");
-	selftest(!np, "non-existent path returned node %s\n", np->full_name);
+	unittest(!np, "non-existent path returned node %s\n", np->full_name);
 	of_node_put(np);
 
 	np = of_find_node_by_path("missing-alias");
-	selftest(!np, "non-existent alias returned node %s\n", np->full_name);
+	unittest(!np, "non-existent alias returned node %s\n", np->full_name);
 	of_node_put(np);
 
 	np = of_find_node_by_path("testcase-alias/missing-path");
-	selftest(!np, "non-existent alias with relative path returned node %s\n", np->full_name);
+	unittest(!np, "non-existent alias with relative path returned node %s\n", np->full_name);
 	of_node_put(np);
 
 	np = of_find_node_opts_by_path("/testcase-data:testoption", &options);
-	selftest(np && !strcmp("testoption", options),
+	unittest(np && !strcmp("testoption", options),
 		 "option path test failed\n");
 	of_node_put(np);
 
 	np = of_find_node_opts_by_path("/testcase-data:test/option", &options);
-	selftest(np && !strcmp("test/option", options),
+	unittest(np && !strcmp("test/option", options),
 		 "option path test, subcase #1 failed\n");
 	of_node_put(np);
 
 	np = of_find_node_opts_by_path("/testcase-data:testoption", NULL);
-	selftest(np, "NULL option path test failed\n");
+	unittest(np, "NULL option path test failed\n");
 	of_node_put(np);
 
 	np = of_find_node_opts_by_path("testcase-alias:testaliasoption",
 				       &options);
-	selftest(np && !strcmp("testaliasoption", options),
+	unittest(np && !strcmp("testaliasoption", options),
 		 "option alias path test failed\n");
 	of_node_put(np);
 
 	np = of_find_node_opts_by_path("testcase-alias:test/alias/option",
 				       &options);
-	selftest(np && !strcmp("test/alias/option", options),
+	unittest(np && !strcmp("test/alias/option", options),
 		 "option alias path test, subcase #1 failed\n");
 	of_node_put(np);
 
 	np = of_find_node_opts_by_path("testcase-alias:testaliasoption", NULL);
-	selftest(np, "NULL option alias path test failed\n");
+	unittest(np, "NULL option alias path test failed\n");
 	of_node_put(np);
 
 	options = "testoption";
 	np = of_find_node_opts_by_path("testcase-alias", &options);
-	selftest(np && !options, "option clearing test failed\n");
+	unittest(np && !options, "option clearing test failed\n");
 	of_node_put(np);
 
 	options = "testoption";
 	np = of_find_node_opts_by_path("/", &options);
-	selftest(np && !options, "option clearing root node test failed\n");
+	unittest(np && !options, "option clearing root node test failed\n");
 	of_node_put(np);
 }
 
-static void __init of_selftest_dynamic(void)
+static void __init of_unittest_dynamic(void)
 {
 	struct device_node *np;
 	struct property *prop;
@@ -142,7 +142,7 @@ static void __init of_selftest_dynamic(void)
 	/* Array of 4 properties for the purpose of testing */
 	prop = kzalloc(sizeof(*prop) * 4, GFP_KERNEL);
 	if (!prop) {
-		selftest(0, "kzalloc() failed\n");
+		unittest(0, "kzalloc() failed\n");
 		return;
 	}
 
@@ -150,20 +150,20 @@ static void __init of_selftest_dynamic(void)
 	prop->name = "new-property";
 	prop->value = "new-property-data";
 	prop->length = strlen(prop->value);
-	selftest(of_add_property(np, prop) == 0, "Adding a new property failed\n");
+	unittest(of_add_property(np, prop) == 0, "Adding a new property failed\n");
 
 	/* Try to add an existing property - should fail */
 	prop++;
 	prop->name = "new-property";
 	prop->value = "new-property-data-should-fail";
 	prop->length = strlen(prop->value);
-	selftest(of_add_property(np, prop) != 0,
+	unittest(of_add_property(np, prop) != 0,
 		 "Adding an existing property should have failed\n");
 
 	/* Try to modify an existing property - should pass */
 	prop->value = "modify-property-data-should-pass";
 	prop->length = strlen(prop->value);
-	selftest(of_update_property(np, prop) == 0,
+	unittest(of_update_property(np, prop) == 0,
 		 "Updating an existing property should have passed\n");
 
 	/* Try to modify non-existent property - should pass*/
@@ -171,11 +171,11 @@ static void __init of_selftest_dynamic(void)
 	prop->name = "modify-property";
 	prop->value = "modify-missing-property-data-should-pass";
 	prop->length = strlen(prop->value);
-	selftest(of_update_property(np, prop) == 0,
+	unittest(of_update_property(np, prop) == 0,
 		 "Updating a missing property should have passed\n");
 
 	/* Remove property - should pass */
-	selftest(of_remove_property(np, prop) == 0,
+	unittest(of_remove_property(np, prop) == 0,
 		 "Removing a property should have passed\n");
 
 	/* Adding very large property - should pass */
@@ -183,13 +183,13 @@ static void __init of_selftest_dynamic(void)
 	prop->name = "large-property-PAGE_SIZEx8";
 	prop->length = PAGE_SIZE * 8;
 	prop->value = kzalloc(prop->length, GFP_KERNEL);
-	selftest(prop->value != NULL, "Unable to allocate large buffer\n");
+	unittest(prop->value != NULL, "Unable to allocate large buffer\n");
 	if (prop->value)
-		selftest(of_add_property(np, prop) == 0,
+		unittest(of_add_property(np, prop) == 0,
 			 "Adding a large property should have passed\n");
 }
 
-static int __init of_selftest_check_node_linkage(struct device_node *np)
+static int __init of_unittest_check_node_linkage(struct device_node *np)
 {
 	struct device_node *child;
 	int count = 0, rc;
@@ -201,7 +201,7 @@ static int __init of_selftest_check_node_linkage(struct device_node *np)
 			return -EINVAL;
 		}
 
-		rc = of_selftest_check_node_linkage(child);
+		rc = of_unittest_check_node_linkage(child);
 		if (rc < 0)
 			return rc;
 		count += rc;
@@ -210,7 +210,7 @@ static int __init of_selftest_check_node_linkage(struct device_node *np)
 	return count + 1;
 }
 
-static void __init of_selftest_check_tree_linkage(void)
+static void __init of_unittest_check_tree_linkage(void)
 {
 	struct device_node *np;
 	int allnode_count = 0, child_count;
@@ -220,10 +220,10 @@ static void __init of_selftest_check_tree_linkage(void)
 
 	for_each_of_allnodes(np)
 		allnode_count++;
-	child_count = of_selftest_check_node_linkage(of_root);
+	child_count = of_unittest_check_node_linkage(of_root);
 
-	selftest(child_count > 0, "Device node data structure is corrupted\n");
-	selftest(child_count == allnode_count, "allnodes list size (%i) doesn't match"
+	unittest(child_count > 0, "Device node data structure is corrupted\n");
+	unittest(child_count == allnode_count, "allnodes list size (%i) doesn't match"
 		 "sibling lists size (%i)\n", allnode_count, child_count);
 	pr_debug("allnodes list size (%i); sibling lists size (%i)\n", allnode_count, child_count);
 }
@@ -234,7 +234,7 @@ struct node_hash {
 };
 
 static DEFINE_HASHTABLE(phandle_ht, 8);
-static void __init of_selftest_check_phandles(void)
+static void __init of_unittest_check_phandles(void)
 {
 	struct device_node *np;
 	struct node_hash *nh;
@@ -262,7 +262,7 @@ static void __init of_selftest_check_phandles(void)
 		hash_add(phandle_ht, &nh->node, np->phandle);
 		phandle_count++;
 	}
-	selftest(dup_count == 0, "Found %i duplicates in %i phandles\n",
+	unittest(dup_count == 0, "Found %i duplicates in %i phandles\n",
 		 dup_count, phandle_count);
 
 	/* Clean up */
@@ -272,7 +272,7 @@ static void __init of_selftest_check_phandles(void)
 	}
 }
 
-static void __init of_selftest_parse_phandle_with_args(void)
+static void __init of_unittest_parse_phandle_with_args(void)
 {
 	struct device_node *np;
 	struct of_phandle_args args;
@@ -285,7 +285,7 @@ static void __init of_selftest_parse_phandle_with_args(void)
 	}
 
 	rc = of_count_phandle_with_args(np, "phandle-list", "#phandle-cells");
-	selftest(rc == 7, "of_count_phandle_with_args() returned %i, expected 7\n", rc);
+	unittest(rc == 7, "of_count_phandle_with_args() returned %i, expected 7\n", rc);
 
 	for (i = 0; i < 8; i++) {
 		bool passed = true;
@@ -337,44 +337,44 @@ static void __init of_selftest_parse_phandle_with_args(void)
 			passed = false;
 		}
 
-		selftest(passed, "index %i - data error on node %s rc=%i\n",
+		unittest(passed, "index %i - data error on node %s rc=%i\n",
 			 i, args.np->full_name, rc);
 	}
 
 	/* Check for missing list property */
 	rc = of_parse_phandle_with_args(np, "phandle-list-missing",
 					"#phandle-cells", 0, &args);
-	selftest(rc == -ENOENT, "expected:%i got:%i\n", -ENOENT, rc);
+	unittest(rc == -ENOENT, "expected:%i got:%i\n", -ENOENT, rc);
 	rc = of_count_phandle_with_args(np, "phandle-list-missing",
 					"#phandle-cells");
-	selftest(rc == -ENOENT, "expected:%i got:%i\n", -ENOENT, rc);
+	unittest(rc == -ENOENT, "expected:%i got:%i\n", -ENOENT, rc);
 
 	/* Check for missing cells property */
 	rc = of_parse_phandle_with_args(np, "phandle-list",
 					"#phandle-cells-missing", 0, &args);
-	selftest(rc == -EINVAL, "expected:%i got:%i\n", -EINVAL, rc);
+	unittest(rc == -EINVAL, "expected:%i got:%i\n", -EINVAL, rc);
 	rc = of_count_phandle_with_args(np, "phandle-list",
 					"#phandle-cells-missing");
-	selftest(rc == -EINVAL, "expected:%i got:%i\n", -EINVAL, rc);
+	unittest(rc == -EINVAL, "expected:%i got:%i\n", -EINVAL, rc);
 
 	/* Check for bad phandle in list */
 	rc = of_parse_phandle_with_args(np, "phandle-list-bad-phandle",
 					"#phandle-cells", 0, &args);
-	selftest(rc == -EINVAL, "expected:%i got:%i\n", -EINVAL, rc);
+	unittest(rc == -EINVAL, "expected:%i got:%i\n", -EINVAL, rc);
 	rc = of_count_phandle_with_args(np, "phandle-list-bad-phandle",
 					"#phandle-cells");
-	selftest(rc == -EINVAL, "expected:%i got:%i\n", -EINVAL, rc);
+	unittest(rc == -EINVAL, "expected:%i got:%i\n", -EINVAL, rc);
 
 	/* Check for incorrectly formed argument list */
 	rc = of_parse_phandle_with_args(np, "phandle-list-bad-args",
 					"#phandle-cells", 1, &args);
-	selftest(rc == -EINVAL, "expected:%i got:%i\n", -EINVAL, rc);
+	unittest(rc == -EINVAL, "expected:%i got:%i\n", -EINVAL, rc);
 	rc = of_count_phandle_with_args(np, "phandle-list-bad-args",
 					"#phandle-cells");
-	selftest(rc == -EINVAL, "expected:%i got:%i\n", -EINVAL, rc);
+	unittest(rc == -EINVAL, "expected:%i got:%i\n", -EINVAL, rc);
 }
 
-static void __init of_selftest_property_string(void)
+static void __init of_unittest_property_string(void)
 {
 	const char *strings[4];
 	struct device_node *np;
@@ -387,79 +387,79 @@ static void __init of_selftest_property_string(void)
 	}
 
 	rc = of_property_match_string(np, "phandle-list-names", "first");
-	selftest(rc == 0, "first expected:0 got:%i\n", rc);
+	unittest(rc == 0, "first expected:0 got:%i\n", rc);
 	rc = of_property_match_string(np, "phandle-list-names", "second");
-	selftest(rc == 1, "second expected:1 got:%i\n", rc);
+	unittest(rc == 1, "second expected:1 got:%i\n", rc);
 	rc = of_property_match_string(np, "phandle-list-names", "third");
-	selftest(rc == 2, "third expected:2 got:%i\n", rc);
+	unittest(rc == 2, "third expected:2 got:%i\n", rc);
 	rc = of_property_match_string(np, "phandle-list-names", "fourth");
-	selftest(rc == -ENODATA, "unmatched string; rc=%i\n", rc);
+	unittest(rc == -ENODATA, "unmatched string; rc=%i\n", rc);
 	rc = of_property_match_string(np, "missing-property", "blah");
-	selftest(rc == -EINVAL, "missing property; rc=%i\n", rc);
+	unittest(rc == -EINVAL, "missing property; rc=%i\n", rc);
 	rc = of_property_match_string(np, "empty-property", "blah");
-	selftest(rc == -ENODATA, "empty property; rc=%i\n", rc);
+	unittest(rc == -ENODATA, "empty property; rc=%i\n", rc);
 	rc = of_property_match_string(np, "unterminated-string", "blah");
-	selftest(rc == -EILSEQ, "unterminated string; rc=%i\n", rc);
+	unittest(rc == -EILSEQ, "unterminated string; rc=%i\n", rc);
 
 	/* of_property_count_strings() tests */
 	rc = of_property_count_strings(np, "string-property");
-	selftest(rc == 1, "Incorrect string count; rc=%i\n", rc);
+	unittest(rc == 1, "Incorrect string count; rc=%i\n", rc);
 	rc = of_property_count_strings(np, "phandle-list-names");
-	selftest(rc == 3, "Incorrect string count; rc=%i\n", rc);
+	unittest(rc == 3, "Incorrect string count; rc=%i\n", rc);
 	rc = of_property_count_strings(np, "unterminated-string");
-	selftest(rc == -EILSEQ, "unterminated string; rc=%i\n", rc);
+	unittest(rc == -EILSEQ, "unterminated string; rc=%i\n", rc);
 	rc = of_property_count_strings(np, "unterminated-string-list");
-	selftest(rc == -EILSEQ, "unterminated string array; rc=%i\n", rc);
+	unittest(rc == -EILSEQ, "unterminated string array; rc=%i\n", rc);
 
 	/* of_property_read_string_index() tests */
 	rc = of_property_read_string_index(np, "string-property", 0, strings);
-	selftest(rc == 0 && !strcmp(strings[0], "foobar"), "of_property_read_string_index() failure; rc=%i\n", rc);
+	unittest(rc == 0 && !strcmp(strings[0], "foobar"), "of_property_read_string_index() failure; rc=%i\n", rc);
 	strings[0] = NULL;
 	rc = of_property_read_string_index(np, "string-property", 1, strings);
-	selftest(rc == -ENODATA && strings[0] == NULL, "of_property_read_string_index() failure; rc=%i\n", rc);
+	unittest(rc == -ENODATA && strings[0] == NULL, "of_property_read_string_index() failure; rc=%i\n", rc);
 	rc = of_property_read_string_index(np, "phandle-list-names", 0, strings);
-	selftest(rc == 0 && !strcmp(strings[0], "first"), "of_property_read_string_index() failure; rc=%i\n", rc);
+	unittest(rc == 0 && !strcmp(strings[0], "first"), "of_property_read_string_index() failure; rc=%i\n", rc);
 	rc = of_property_read_string_index(np, "phandle-list-names", 1, strings);
-	selftest(rc == 0 && !strcmp(strings[0], "second"), "of_property_read_string_index() failure; rc=%i\n", rc);
+	unittest(rc == 0 && !strcmp(strings[0], "second"), "of_property_read_string_index() failure; rc=%i\n", rc);
 	rc = of_property_read_string_index(np, "phandle-list-names", 2, strings);
-	selftest(rc == 0 && !strcmp(strings[0], "third"), "of_property_read_string_index() failure; rc=%i\n", rc);
+	unittest(rc == 0 && !strcmp(strings[0], "third"), "of_property_read_string_index() failure; rc=%i\n", rc);
 	strings[0] = NULL;
 	rc = of_property_read_string_index(np, "phandle-list-names", 3, strings);
-	selftest(rc == -ENODATA && strings[0] == NULL, "of_property_read_string_index() failure; rc=%i\n", rc);
+	unittest(rc == -ENODATA && strings[0] == NULL, "of_property_read_string_index() failure; rc=%i\n", rc);
 	strings[0] = NULL;
 	rc = of_property_read_string_index(np, "unterminated-string", 0, strings);
-	selftest(rc == -EILSEQ && strings[0] == NULL, "of_property_read_string_index() failure; rc=%i\n", rc);
+	unittest(rc == -EILSEQ && strings[0] == NULL, "of_property_read_string_index() failure; rc=%i\n", rc);
 	rc = of_property_read_string_index(np, "unterminated-string-list", 0, strings);
-	selftest(rc == 0 && !strcmp(strings[0], "first"), "of_property_read_string_index() failure; rc=%i\n", rc);
+	unittest(rc == 0 && !strcmp(strings[0], "first"), "of_property_read_string_index() failure; rc=%i\n", rc);
 	strings[0] = NULL;
 	rc = of_property_read_string_index(np, "unterminated-string-list", 2, strings); /* should fail */
-	selftest(rc == -EILSEQ && strings[0] == NULL, "of_property_read_string_index() failure; rc=%i\n", rc);
+	unittest(rc == -EILSEQ && strings[0] == NULL, "of_property_read_string_index() failure; rc=%i\n", rc);
 	strings[1] = NULL;
 
 	/* of_property_read_string_array() tests */
 	rc = of_property_read_string_array(np, "string-property", strings, 4);
-	selftest(rc == 1, "Incorrect string count; rc=%i\n", rc);
+	unittest(rc == 1, "Incorrect string count; rc=%i\n", rc);
 	rc = of_property_read_string_array(np, "phandle-list-names", strings, 4);
-	selftest(rc == 3, "Incorrect string count; rc=%i\n", rc);
+	unittest(rc == 3, "Incorrect string count; rc=%i\n", rc);
 	rc = of_property_read_string_array(np, "unterminated-string", strings, 4);
-	selftest(rc == -EILSEQ, "unterminated string; rc=%i\n", rc);
+	unittest(rc == -EILSEQ, "unterminated string; rc=%i\n", rc);
 	/* -- An incorrectly formed string should cause a failure */
 	rc = of_property_read_string_array(np, "unterminated-string-list", strings, 4);
-	selftest(rc == -EILSEQ, "unterminated string array; rc=%i\n", rc);
+	unittest(rc == -EILSEQ, "unterminated string array; rc=%i\n", rc);
 	/* -- parsing the correctly formed strings should still work: */
 	strings[2] = NULL;
 	rc = of_property_read_string_array(np, "unterminated-string-list", strings, 2);
-	selftest(rc == 2 && strings[2] == NULL, "of_property_read_string_array() failure; rc=%i\n", rc);
+	unittest(rc == 2 && strings[2] == NULL, "of_property_read_string_array() failure; rc=%i\n", rc);
 	strings[1] = NULL;
 	rc = of_property_read_string_array(np, "phandle-list-names", strings, 1);
-	selftest(rc == 1 && strings[1] == NULL, "Overwrote end of string array; rc=%i, str='%s'\n", rc, strings[1]);
+	unittest(rc == 1 && strings[1] == NULL, "Overwrote end of string array; rc=%i, str='%s'\n", rc, strings[1]);
 }
 
 #define propcmp(p1, p2) (((p1)->length == (p2)->length) && \
 			(p1)->value && (p2)->value && \
 			!memcmp((p1)->value, (p2)->value, (p1)->length) && \
 			!strcmp((p1)->name, (p2)->name))
-static void __init of_selftest_property_copy(void)
+static void __init of_unittest_property_copy(void)
 {
 #ifdef CONFIG_OF_DYNAMIC
 	struct property p1 = { .name = "p1", .length = 0, .value = "" };
@@ -467,20 +467,20 @@ static void __init of_selftest_property_copy(void)
 	struct property *new;
 
 	new = __of_prop_dup(&p1, GFP_KERNEL);
-	selftest(new && propcmp(&p1, new), "empty property didn't copy correctly\n");
+	unittest(new && propcmp(&p1, new), "empty property didn't copy correctly\n");
 	kfree(new->value);
 	kfree(new->name);
 	kfree(new);
 
 	new = __of_prop_dup(&p2, GFP_KERNEL);
-	selftest(new && propcmp(&p2, new), "non-empty property didn't copy correctly\n");
+	unittest(new && propcmp(&p2, new), "non-empty property didn't copy correctly\n");
 	kfree(new->value);
 	kfree(new->name);
 	kfree(new);
 #endif
 }
 
-static void __init of_selftest_changeset(void)
+static void __init of_unittest_changeset(void)
 {
 #ifdef CONFIG_OF_DYNAMIC
 	struct property *ppadd, padd = { .name = "prop-add", .length = 0, .value = "" };
@@ -490,51 +490,51 @@ static void __init of_selftest_changeset(void)
 	struct of_changeset chgset;
 
 	n1 = __of_node_dup(NULL, "/testcase-data/changeset/n1");
-	selftest(n1, "testcase setup failure\n");
+	unittest(n1, "testcase setup failure\n");
 	n2 = __of_node_dup(NULL, "/testcase-data/changeset/n2");
-	selftest(n2, "testcase setup failure\n");
+	unittest(n2, "testcase setup failure\n");
 	n21 = __of_node_dup(NULL, "%s/%s", "/testcase-data/changeset/n2", "n21");
-	selftest(n21, "testcase setup failure %p\n", n21);
+	unittest(n21, "testcase setup failure %p\n", n21);
 	nremove = of_find_node_by_path("/testcase-data/changeset/node-remove");
-	selftest(nremove, "testcase setup failure\n");
+	unittest(nremove, "testcase setup failure\n");
 	ppadd = __of_prop_dup(&padd, GFP_KERNEL);
-	selftest(ppadd, "testcase setup failure\n");
+	unittest(ppadd, "testcase setup failure\n");
 	ppupdate = __of_prop_dup(&pupdate, GFP_KERNEL);
-	selftest(ppupdate, "testcase setup failure\n");
+	unittest(ppupdate, "testcase setup failure\n");
 	parent = nremove->parent;
 	n1->parent = parent;
 	n2->parent = parent;
 	n21->parent = n2;
 	n2->child = n21;
 	ppremove = of_find_property(parent, "prop-remove", NULL);
-	selftest(ppremove, "failed to find removal prop");
+	unittest(ppremove, "failed to find removal prop");
 
 	of_changeset_init(&chgset);
-	selftest(!of_changeset_attach_node(&chgset, n1), "fail attach n1\n");
-	selftest(!of_changeset_attach_node(&chgset, n2), "fail attach n2\n");
-	selftest(!of_changeset_detach_node(&chgset, nremove), "fail remove node\n");
-	selftest(!of_changeset_attach_node(&chgset, n21), "fail attach n21\n");
-	selftest(!of_changeset_add_property(&chgset, parent, ppadd), "fail add prop\n");
-	selftest(!of_changeset_update_property(&chgset, parent, ppupdate), "fail update prop\n");
-	selftest(!of_changeset_remove_property(&chgset, parent, ppremove), "fail remove prop\n");
+	unittest(!of_changeset_attach_node(&chgset, n1), "fail attach n1\n");
+	unittest(!of_changeset_attach_node(&chgset, n2), "fail attach n2\n");
+	unittest(!of_changeset_detach_node(&chgset, nremove), "fail remove node\n");
+	unittest(!of_changeset_attach_node(&chgset, n21), "fail attach n21\n");
+	unittest(!of_changeset_add_property(&chgset, parent, ppadd), "fail add prop\n");
+	unittest(!of_changeset_update_property(&chgset, parent, ppupdate), "fail update prop\n");
+	unittest(!of_changeset_remove_property(&chgset, parent, ppremove), "fail remove prop\n");
 	mutex_lock(&of_mutex);
-	selftest(!of_changeset_apply(&chgset), "apply failed\n");
+	unittest(!of_changeset_apply(&chgset), "apply failed\n");
 	mutex_unlock(&of_mutex);
 
 	/* Make sure node names are constructed correctly */
-	selftest((np = of_find_node_by_path("/testcase-data/changeset/n2/n21")),
+	unittest((np = of_find_node_by_path("/testcase-data/changeset/n2/n21")),
 		 "'%s' not added\n", n21->full_name);
 	of_node_put(np);
 
 	mutex_lock(&of_mutex);
-	selftest(!of_changeset_revert(&chgset), "revert failed\n");
+	unittest(!of_changeset_revert(&chgset), "revert failed\n");
 	mutex_unlock(&of_mutex);
 
 	of_changeset_destroy(&chgset);
 #endif
 }
 
-static void __init of_selftest_parse_interrupts(void)
+static void __init of_unittest_parse_interrupts(void)
 {
 	struct device_node *np;
 	struct of_phandle_args args;
@@ -555,7 +555,7 @@ static void __init of_selftest_parse_interrupts(void)
 		passed &= (args.args_count == 1);
 		passed &= (args.args[0] == (i + 1));
 
-		selftest(passed, "index %i - data error on node %s rc=%i\n",
+		unittest(passed, "index %i - data error on node %s rc=%i\n",
 			 i, args.np->full_name, rc);
 	}
 	of_node_put(np);
@@ -600,13 +600,13 @@ static void __init of_selftest_parse_interrupts(void)
 		default:
 			passed = false;
 		}
-		selftest(passed, "index %i - data error on node %s rc=%i\n",
+		unittest(passed, "index %i - data error on node %s rc=%i\n",
 			 i, args.np->full_name, rc);
 	}
 	of_node_put(np);
 }
 
-static void __init of_selftest_parse_interrupts_extended(void)
+static void __init of_unittest_parse_interrupts_extended(void)
 {
 	struct device_node *np;
 	struct of_phandle_args args;
@@ -669,7 +669,7 @@ static void __init of_selftest_parse_interrupts_extended(void)
 			passed = false;
 		}
 
-		selftest(passed, "index %i - data error on node %s rc=%i\n",
+		unittest(passed, "index %i - data error on node %s rc=%i\n",
 			 i, args.np->full_name, rc);
 	}
 	of_node_put(np);
@@ -710,7 +710,7 @@ static struct {
 	{ .path = "/testcase-data/match-node/name9", .data = "K", },
 };
 
-static void __init of_selftest_match_node(void)
+static void __init of_unittest_match_node(void)
 {
 	struct device_node *np;
 	const struct of_device_id *match;
@@ -719,32 +719,32 @@ static void __init of_selftest_match_node(void)
 	for (i = 0; i < ARRAY_SIZE(match_node_tests); i++) {
 		np = of_find_node_by_path(match_node_tests[i].path);
 		if (!np) {
-			selftest(0, "missing testcase node %s\n",
+			unittest(0, "missing testcase node %s\n",
 				match_node_tests[i].path);
 			continue;
 		}
 
 		match = of_match_node(match_node_table, np);
 		if (!match) {
-			selftest(0, "%s didn't match anything\n",
+			unittest(0, "%s didn't match anything\n",
 				match_node_tests[i].path);
 			continue;
 		}
 
 		if (strcmp(match->data, match_node_tests[i].data) != 0) {
-			selftest(0, "%s got wrong match. expected %s, got %s\n",
+			unittest(0, "%s got wrong match. expected %s, got %s\n",
 				match_node_tests[i].path, match_node_tests[i].data,
 				(const char *)match->data);
 			continue;
 		}
-		selftest(1, "passed");
+		unittest(1, "passed");
 	}
 }
 
 struct device test_bus = {
 	.init_name = "unittest-bus",
 };
-static void __init of_selftest_platform_populate(void)
+static void __init of_unittest_platform_populate(void)
 {
 	int irq, rc;
 	struct device_node *np, *child, *grandchild;
@@ -760,30 +760,30 @@ static void __init of_selftest_platform_populate(void)
 	/* Test that a missing irq domain returns -EPROBE_DEFER */
 	np = of_find_node_by_path("/testcase-data/testcase-device1");
 	pdev = of_find_device_by_node(np);
-	selftest(pdev, "device 1 creation failed\n");
+	unittest(pdev, "device 1 creation failed\n");
 
 	irq = platform_get_irq(pdev, 0);
-	selftest(irq == -EPROBE_DEFER, "device deferred probe failed - %d\n", irq);
+	unittest(irq == -EPROBE_DEFER, "device deferred probe failed - %d\n", irq);
 
 	/* Test that a parsing failure does not return -EPROBE_DEFER */
 	np = of_find_node_by_path("/testcase-data/testcase-device2");
 	pdev = of_find_device_by_node(np);
-	selftest(pdev, "device 2 creation failed\n");
+	unittest(pdev, "device 2 creation failed\n");
 	irq = platform_get_irq(pdev, 0);
-	selftest(irq < 0 && irq != -EPROBE_DEFER, "device parsing error failed - %d\n", irq);
+	unittest(irq < 0 && irq != -EPROBE_DEFER, "device parsing error failed - %d\n", irq);
 
-	if (selftest(np = of_find_node_by_path("/testcase-data/platform-tests"),
+	if (unittest(np = of_find_node_by_path("/testcase-data/platform-tests"),
 		     "No testcase data in device tree\n"));
 		return;
 
-	if (selftest(!(rc = device_register(&test_bus)),
+	if (unittest(!(rc = device_register(&test_bus)),
 		     "testbus registration failed; rc=%i\n", rc));
 		return;
 
 	for_each_child_of_node(np, child) {
 		of_platform_populate(child, match, NULL, &test_bus);
 		for_each_child_of_node(child, grandchild)
-			selftest(of_find_device_by_node(grandchild),
+			unittest(of_find_device_by_node(grandchild),
 				 "Could not create device for node '%s'\n",
 				 grandchild->name);
 	}
@@ -791,7 +791,7 @@ static void __init of_selftest_platform_populate(void)
 	of_platform_depopulate(&test_bus);
 	for_each_child_of_node(np, child) {
 		for_each_child_of_node(child, grandchild)
-			selftest(!of_find_device_by_node(grandchild),
+			unittest(!of_find_device_by_node(grandchild),
 				 "device didn't get destroyed '%s'\n",
 				 grandchild->name);
 	}
@@ -861,13 +861,13 @@ static int attach_node_and_children(struct device_node *np)
 }
 
 /**
- *	selftest_data_add - Reads, copies data from
+ *	unittest_data_add - Reads, copies data from
  *	linked tree and attaches it to the live tree
  */
-static int __init selftest_data_add(void)
+static int __init unittest_data_add(void)
 {
-	void *selftest_data;
-	struct device_node *selftest_data_node, *np;
+	void *unittest_data;
+	struct device_node *unittest_data_node, *np;
 	extern uint8_t __dtb_testcases_begin[];
 	extern uint8_t __dtb_testcases_end[];
 	const int size = __dtb_testcases_end - __dtb_testcases_begin;
@@ -880,27 +880,27 @@ static int __init selftest_data_add(void)
 	}
 
 	/* creating copy */
-	selftest_data = kmemdup(__dtb_testcases_begin, size, GFP_KERNEL);
+	unittest_data = kmemdup(__dtb_testcases_begin, size, GFP_KERNEL);
 
-	if (!selftest_data) {
-		pr_warn("%s: Failed to allocate memory for selftest_data; "
+	if (!unittest_data) {
+		pr_warn("%s: Failed to allocate memory for unittest_data; "
 			"not running tests\n", __func__);
 		return -ENOMEM;
 	}
-	of_fdt_unflatten_tree(selftest_data, &selftest_data_node);
-	if (!selftest_data_node) {
+	of_fdt_unflatten_tree(unittest_data, &unittest_data_node);
+	if (!unittest_data_node) {
 		pr_warn("%s: No tree to attach; not running tests\n", __func__);
 		return -ENODATA;
 	}
-	of_node_set_flag(selftest_data_node, OF_DETACHED);
-	rc = of_resolve_phandles(selftest_data_node);
+	of_node_set_flag(unittest_data_node, OF_DETACHED);
+	rc = of_resolve_phandles(unittest_data_node);
 	if (rc) {
 		pr_err("%s: Failed to resolve phandles (rc=%i)\n", __func__, rc);
 		return -EINVAL;
 	}
 
 	if (!of_root) {
-		of_root = selftest_data_node;
+		of_root = unittest_data_node;
 		for_each_of_allnodes(np)
 			__of_attach_node_sysfs(np);
 		of_aliases = of_find_node_by_path("/aliases");
@@ -909,7 +909,7 @@ static int __init selftest_data_add(void)
 	}
 
 	/* attach the sub-tree to live tree */
-	np = selftest_data_node->child;
+	np = unittest_data_node->child;
 	while (np) {
 		struct device_node *next = np->sibling;
 		np->parent = of_root;
@@ -921,7 +921,7 @@ static int __init selftest_data_add(void)
 
 #ifdef CONFIG_OF_OVERLAY
 
-static int selftest_probe(struct platform_device *pdev)
+static int unittest_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
@@ -939,7 +939,7 @@ static int selftest_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int selftest_remove(struct platform_device *pdev)
+static int unittest_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
@@ -948,18 +948,18 @@ static int selftest_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct of_device_id selftest_match[] = {
-	{ .compatible = "selftest", },
+static struct of_device_id unittest_match[] = {
+	{ .compatible = "unittest", },
 	{},
 };
 
-static struct platform_driver selftest_driver = {
-	.probe			= selftest_probe,
-	.remove			= selftest_remove,
+static struct platform_driver unittest_driver = {
+	.probe			= unittest_probe,
+	.remove			= unittest_remove,
 	.driver = {
-		.name		= "selftest",
+		.name		= "unittest",
 		.owner		= THIS_MODULE,
-		.of_match_table	= of_match_ptr(selftest_match),
+		.of_match_table	= of_match_ptr(unittest_match),
 	},
 };
 
@@ -1041,7 +1041,7 @@ static int of_path_device_type_exists(const char *path,
 	return 0;
 }
 
-static const char *selftest_path(int nr, enum overlay_type ovtype)
+static const char *unittest_path(int nr, enum overlay_type ovtype)
 {
 	const char *base;
 	static char buf[256];
@@ -1057,16 +1057,16 @@ static const char *selftest_path(int nr, enum overlay_type ovtype)
 		buf[0] = '\0';
 		return buf;
 	}
-	snprintf(buf, sizeof(buf) - 1, "%s/test-selftest%d", base, nr);
+	snprintf(buf, sizeof(buf) - 1, "%s/test-unittest%d", base, nr);
 	buf[sizeof(buf) - 1] = '\0';
 	return buf;
 }
 
-static int of_selftest_device_exists(int selftest_nr, enum overlay_type ovtype)
+static int of_unittest_device_exists(int unittest_nr, enum overlay_type ovtype)
 {
 	const char *path;
 
-	path = selftest_path(selftest_nr, ovtype);
+	path = unittest_path(unittest_nr, ovtype);
 
 	switch (ovtype) {
 	case PDEV_OVERLAY:
@@ -1090,7 +1090,7 @@ static const char *overlay_path(int nr)
 
 static const char *bus_path = "/testcase-data/overlay-node/test-bus";
 
-static int of_selftest_apply_overlay(int selftest_nr, int overlay_nr,
+static int of_unittest_apply_overlay(int unittest_nr, int overlay_nr,
 		int *overlay_id)
 {
 	struct device_node *np = NULL;
@@ -1098,7 +1098,7 @@ static int of_selftest_apply_overlay(int selftest_nr, int overlay_nr,
 
 	np = of_find_node_by_path(overlay_path(overlay_nr));
 	if (np == NULL) {
-		selftest(0, "could not find overlay node @\"%s\"\n",
+		unittest(0, "could not find overlay node @\"%s\"\n",
 				overlay_path(overlay_nr));
 		ret = -EINVAL;
 		goto out;
@@ -1106,7 +1106,7 @@ static int of_selftest_apply_overlay(int selftest_nr, int overlay_nr,
 
 	ret = of_overlay_create(np);
 	if (ret < 0) {
-		selftest(0, "could not create overlay from \"%s\"\n",
+		unittest(0, "could not create overlay from \"%s\"\n",
 				overlay_path(overlay_nr));
 		goto out;
 	}
@@ -1124,31 +1124,31 @@ out:
 }
 
 /* apply an overlay while checking before and after states */
-static int of_selftest_apply_overlay_check(int overlay_nr, int selftest_nr,
+static int of_unittest_apply_overlay_check(int overlay_nr, int unittest_nr,
 		int before, int after, enum overlay_type ovtype)
 {
 	int ret;
 
-	/* selftest device must not be in before state */
-	if (of_selftest_device_exists(selftest_nr, ovtype) != before) {
-		selftest(0, "overlay @\"%s\" with device @\"%s\" %s\n",
+	/* unittest device must not be in before state */
+	if (of_unittest_device_exists(unittest_nr, ovtype) != before) {
+		unittest(0, "overlay @\"%s\" with device @\"%s\" %s\n",
 				overlay_path(overlay_nr),
-				selftest_path(selftest_nr, ovtype),
+				unittest_path(unittest_nr, ovtype),
 				!before ? "enabled" : "disabled");
 		return -EINVAL;
 	}
 
-	ret = of_selftest_apply_overlay(overlay_nr, selftest_nr, NULL);
+	ret = of_unittest_apply_overlay(overlay_nr, unittest_nr, NULL);
 	if (ret != 0) {
-		/* of_selftest_apply_overlay already called selftest() */
+		/* of_unittest_apply_overlay already called unittest() */
 		return ret;
 	}
 
-	/* selftest device must be to set to after state */
-	if (of_selftest_device_exists(selftest_nr, ovtype) != after) {
-		selftest(0, "overlay @\"%s\" failed to create @\"%s\" %s\n",
+	/* unittest device must be to set to after state */
+	if (of_unittest_device_exists(unittest_nr, ovtype) != after) {
+		unittest(0, "overlay @\"%s\" failed to create @\"%s\" %s\n",
 				overlay_path(overlay_nr),
-				selftest_path(selftest_nr, ovtype),
+				unittest_path(unittest_nr, ovtype),
 				!after ? "enabled" : "disabled");
 		return -EINVAL;
 	}
@@ -1157,50 +1157,50 @@ static int of_selftest_apply_overlay_check(int overlay_nr, int selftest_nr,
 }
 
 /* apply an overlay and then revert it while checking before, after states */
-static int of_selftest_apply_revert_overlay_check(int overlay_nr,
-		int selftest_nr, int before, int after,
+static int of_unittest_apply_revert_overlay_check(int overlay_nr,
+		int unittest_nr, int before, int after,
 		enum overlay_type ovtype)
 {
 	int ret, ov_id;
 
-	/* selftest device must be in before state */
-	if (of_selftest_device_exists(selftest_nr, ovtype) != before) {
-		selftest(0, "overlay @\"%s\" with device @\"%s\" %s\n",
+	/* unittest device must be in before state */
+	if (of_unittest_device_exists(unittest_nr, ovtype) != before) {
+		unittest(0, "overlay @\"%s\" with device @\"%s\" %s\n",
 				overlay_path(overlay_nr),
-				selftest_path(selftest_nr, ovtype),
+				unittest_path(unittest_nr, ovtype),
 				!before ? "enabled" : "disabled");
 		return -EINVAL;
 	}
 
 	/* apply the overlay */
-	ret = of_selftest_apply_overlay(overlay_nr, selftest_nr, &ov_id);
+	ret = of_unittest_apply_overlay(overlay_nr, unittest_nr, &ov_id);
 	if (ret != 0) {
-		/* of_selftest_apply_overlay already called selftest() */
+		/* of_unittest_apply_overlay already called unittest() */
 		return ret;
 	}
 
-	/* selftest device must be in after state */
-	if (of_selftest_device_exists(selftest_nr, ovtype) != after) {
-		selftest(0, "overlay @\"%s\" failed to create @\"%s\" %s\n",
+	/* unittest device must be in after state */
+	if (of_unittest_device_exists(unittest_nr, ovtype) != after) {
+		unittest(0, "overlay @\"%s\" failed to create @\"%s\" %s\n",
 				overlay_path(overlay_nr),
-				selftest_path(selftest_nr, ovtype),
+				unittest_path(unittest_nr, ovtype),
 				!after ? "enabled" : "disabled");
 		return -EINVAL;
 	}
 
 	ret = of_overlay_destroy(ov_id);
 	if (ret != 0) {
-		selftest(0, "overlay @\"%s\" failed to be destroyed @\"%s\"\n",
+		unittest(0, "overlay @\"%s\" failed to be destroyed @\"%s\"\n",
 				overlay_path(overlay_nr),
-				selftest_path(selftest_nr, ovtype));
+				unittest_path(unittest_nr, ovtype));
 		return ret;
 	}
 
-	/* selftest device must be again in before state */
-	if (of_selftest_device_exists(selftest_nr, PDEV_OVERLAY) != before) {
-		selftest(0, "overlay @\"%s\" with device @\"%s\" %s\n",
+	/* unittest device must be again in before state */
+	if (of_unittest_device_exists(unittest_nr, PDEV_OVERLAY) != before) {
+		unittest(0, "overlay @\"%s\" with device @\"%s\" %s\n",
 				overlay_path(overlay_nr),
-				selftest_path(selftest_nr, ovtype),
+				unittest_path(unittest_nr, ovtype),
 				!before ? "enabled" : "disabled");
 		return -EINVAL;
 	}
@@ -1209,98 +1209,98 @@ static int of_selftest_apply_revert_overlay_check(int overlay_nr,
 }
 
 /* test activation of device */
-static void of_selftest_overlay_0(void)
+static void of_unittest_overlay_0(void)
 {
 	int ret;
 
 	/* device should enable */
-	ret = of_selftest_apply_overlay_check(0, 0, 0, 1, PDEV_OVERLAY);
+	ret = of_unittest_apply_overlay_check(0, 0, 0, 1, PDEV_OVERLAY);
 	if (ret != 0)
 		return;
 
-	selftest(1, "overlay test %d passed\n", 0);
+	unittest(1, "overlay test %d passed\n", 0);
 }
 
 /* test deactivation of device */
-static void of_selftest_overlay_1(void)
+static void of_unittest_overlay_1(void)
 {
 	int ret;
 
 	/* device should disable */
-	ret = of_selftest_apply_overlay_check(1, 1, 1, 0, PDEV_OVERLAY);
+	ret = of_unittest_apply_overlay_check(1, 1, 1, 0, PDEV_OVERLAY);
 	if (ret != 0)
 		return;
 
-	selftest(1, "overlay test %d passed\n", 1);
+	unittest(1, "overlay test %d passed\n", 1);
 }
 
 /* test activation of device */
-static void of_selftest_overlay_2(void)
+static void of_unittest_overlay_2(void)
 {
 	int ret;
 
 	/* device should enable */
-	ret = of_selftest_apply_overlay_check(2, 2, 0, 1, PDEV_OVERLAY);
+	ret = of_unittest_apply_overlay_check(2, 2, 0, 1, PDEV_OVERLAY);
 	if (ret != 0)
 		return;
 
-	selftest(1, "overlay test %d passed\n", 2);
+	unittest(1, "overlay test %d passed\n", 2);
 }
 
 /* test deactivation of device */
-static void of_selftest_overlay_3(void)
+static void of_unittest_overlay_3(void)
 {
 	int ret;
 
 	/* device should disable */
-	ret = of_selftest_apply_overlay_check(3, 3, 1, 0, PDEV_OVERLAY);
+	ret = of_unittest_apply_overlay_check(3, 3, 1, 0, PDEV_OVERLAY);
 	if (ret != 0)
 		return;
 
-	selftest(1, "overlay test %d passed\n", 3);
+	unittest(1, "overlay test %d passed\n", 3);
 }
 
 /* test activation of a full device node */
-static void of_selftest_overlay_4(void)
+static void of_unittest_overlay_4(void)
 {
 	int ret;
 
 	/* device should disable */
-	ret = of_selftest_apply_overlay_check(4, 4, 0, 1, PDEV_OVERLAY);
+	ret = of_unittest_apply_overlay_check(4, 4, 0, 1, PDEV_OVERLAY);
 	if (ret != 0)
 		return;
 
-	selftest(1, "overlay test %d passed\n", 4);
+	unittest(1, "overlay test %d passed\n", 4);
 }
 
 /* test overlay apply/revert sequence */
-static void of_selftest_overlay_5(void)
+static void of_unittest_overlay_5(void)
 {
 	int ret;
 
 	/* device should disable */
-	ret = of_selftest_apply_revert_overlay_check(5, 5, 0, 1, PDEV_OVERLAY);
+	ret = of_unittest_apply_revert_overlay_check(5, 5, 0, 1, PDEV_OVERLAY);
 	if (ret != 0)
 		return;
 
-	selftest(1, "overlay test %d passed\n", 5);
+	unittest(1, "overlay test %d passed\n", 5);
 }
 
 /* test overlay application in sequence */
-static void of_selftest_overlay_6(void)
+static void of_unittest_overlay_6(void)
 {
 	struct device_node *np;
 	int ret, i, ov_id[2];
-	int overlay_nr = 6, selftest_nr = 6;
+	int overlay_nr = 6, unittest_nr = 6;
 	int before = 0, after = 1;
 
-	/* selftest device must be in before state */
+	/* unittest device must be in before state */
 	for (i = 0; i < 2; i++) {
-		if (of_selftest_device_exists(selftest_nr + i, PDEV_OVERLAY)
+		if (of_unittest_device_exists(unittest_nr + i, PDEV_OVERLAY)
 				!= before) {
-			selftest(0, "overlay @\"%s\" with device @\"%s\" %s\n",
+			unittest(0, "overlay @\"%s\" with device @\"%s\" %s\n",
 					overlay_path(overlay_nr + i),
-					selftest_path(selftest_nr + i,
+					unittest_path(unittest_nr + i,
 						PDEV_OVERLAY),
 					!before ? "enabled" : "disabled");
 			return;
@@ -1312,14 +1312,14 @@ static void of_selftest_overlay_6(void)
 
 		np = of_find_node_by_path(overlay_path(overlay_nr + i));
 		if (np == NULL) {
-			selftest(0, "could not find overlay node @\"%s\"\n",
+			unittest(0, "could not find overlay node @\"%s\"\n",
 					overlay_path(overlay_nr + i));
 			return;
 		}
 
 		ret = of_overlay_create(np);
 		if (ret < 0)  {
-			selftest(0, "could not create overlay from \"%s\"\n",
+			unittest(0, "could not create overlay from \"%s\"\n",
 					overlay_path(overlay_nr + i));
 			return;
 		}
@@ -1327,12 +1327,12 @@ static void of_selftest_overlay_6(void)
 	}
 
 	for (i = 0; i < 2; i++) {
-		/* selftest device must be in after state */
-		if (of_selftest_device_exists(selftest_nr + i, PDEV_OVERLAY)
+		/* unittest device must be in after state */
+		if (of_unittest_device_exists(unittest_nr + i, PDEV_OVERLAY)
 				!= after) {
-			selftest(0, "overlay @\"%s\" failed @\"%s\" %s\n",
+			unittest(0, "overlay @\"%s\" failed @\"%s\" %s\n",
 					overlay_path(overlay_nr + i),
-					selftest_path(selftest_nr + i,
+					unittest_path(unittest_nr + i,
 						PDEV_OVERLAY),
 					!after ? "enabled" : "disabled");
 			return;
@@ -1342,36 +1342,36 @@ static void of_selftest_overlay_6(void)
 	for (i = 1; i >= 0; i--) {
 		ret = of_overlay_destroy(ov_id[i]);
 		if (ret != 0) {
-			selftest(0, "overlay @\"%s\" failed destroy @\"%s\"\n",
+			unittest(0, "overlay @\"%s\" failed destroy @\"%s\"\n",
 					overlay_path(overlay_nr + i),
-					selftest_path(selftest_nr + i,
+					unittest_path(unittest_nr + i,
 						PDEV_OVERLAY));
 			return;
 		}
 	}
 
 	for (i = 0; i < 2; i++) {
-		/* selftest device must be again in before state */
-		if (of_selftest_device_exists(selftest_nr + i, PDEV_OVERLAY)
+		/* unittest device must be again in before state */
+		if (of_unittest_device_exists(unittest_nr + i, PDEV_OVERLAY)
 				!= before) {
-			selftest(0, "overlay @\"%s\" with device @\"%s\" %s\n",
+			unittest(0, "overlay @\"%s\" with device @\"%s\" %s\n",
 					overlay_path(overlay_nr + i),
-					selftest_path(selftest_nr + i,
+					unittest_path(unittest_nr + i,
 						PDEV_OVERLAY),
 					!before ? "enabled" : "disabled");
 			return;
 		}
 	}
 
-	selftest(1, "overlay test %d passed\n", 6);
+	unittest(1, "overlay test %d passed\n", 6);
 }
 
 /* test overlay application in sequence */
-static void of_selftest_overlay_8(void)
+static void of_unittest_overlay_8(void)
 {
 	struct device_node *np;
 	int ret, i, ov_id[2];
-	int overlay_nr = 8, selftest_nr = 8;
+	int overlay_nr = 8, unittest_nr = 8;
 
 	/* we don't care about device state in this test */
 
@@ -1380,14 +1380,14 @@ static void of_selftest_overlay_8(void)
 
 		np = of_find_node_by_path(overlay_path(overlay_nr + i));
 		if (np == NULL) {
-			selftest(0, "could not find overlay node @\"%s\"\n",
+			unittest(0, "could not find overlay node @\"%s\"\n",
 					overlay_path(overlay_nr + i));
 			return;
 		}
 
 		ret = of_overlay_create(np);
 		if (ret < 0)  {
-			selftest(0, "could not create overlay from \"%s\"\n",
+			unittest(0, "could not create overlay from \"%s\"\n",
 					overlay_path(overlay_nr + i));
 			return;
 		}
@@ -1397,9 +1397,9 @@ static void of_selftest_overlay_8(void)
 	/* now try to remove first overlay (it should fail) */
 	ret = of_overlay_destroy(ov_id[0]);
 	if (ret == 0) {
-		selftest(0, "overlay @\"%s\" was destroyed @\"%s\"\n",
+		unittest(0, "overlay @\"%s\" was destroyed @\"%s\"\n",
 				overlay_path(overlay_nr + 0),
-				selftest_path(selftest_nr,
+				unittest_path(unittest_nr,
 					PDEV_OVERLAY));
 		return;
 	}
@@ -1408,85 +1408,85 @@ static void of_selftest_overlay_8(void)
 	for (i = 1; i >= 0; i--) {
 		ret = of_overlay_destroy(ov_id[i]);
 		if (ret != 0) {
-			selftest(0, "overlay @\"%s\" not destroyed @\"%s\"\n",
+			unittest(0, "overlay @\"%s\" not destroyed @\"%s\"\n",
 					overlay_path(overlay_nr + i),
-					selftest_path(selftest_nr,
+					unittest_path(unittest_nr,
 						PDEV_OVERLAY));
 			return;
 		}
 	}
 
-	selftest(1, "overlay test %d passed\n", 8);
+	unittest(1, "overlay test %d passed\n", 8);
 }
 
 /* test insertion of a bus with parent devices */
-static void of_selftest_overlay_10(void)
+static void of_unittest_overlay_10(void)
 {
 	int ret;
 	char *child_path;
 
 	/* device should disable */
-	ret = of_selftest_apply_overlay_check(10, 10, 0, 1, PDEV_OVERLAY);
-	if (selftest(ret == 0,
+	ret = of_unittest_apply_overlay_check(10, 10, 0, 1, PDEV_OVERLAY);
+	if (unittest(ret == 0,
 			"overlay test %d failed; overlay application\n", 10))
 		return;
 
-	child_path = kasprintf(GFP_KERNEL, "%s/test-selftest101",
-			selftest_path(10, PDEV_OVERLAY));
-	if (selftest(child_path, "overlay test %d failed; kasprintf\n", 10))
+	child_path = kasprintf(GFP_KERNEL, "%s/test-unittest101",
+			unittest_path(10, PDEV_OVERLAY));
+	if (unittest(child_path, "overlay test %d failed; kasprintf\n", 10))
 		return;
 
 	ret = of_path_device_type_exists(child_path, PDEV_OVERLAY);
 	kfree(child_path);
-	if (selftest(ret, "overlay test %d failed; no child device\n", 10))
+	if (unittest(ret, "overlay test %d failed; no child device\n", 10))
 		return;
 }
 
 /* test insertion of a bus with parent devices (and revert) */
-static void of_selftest_overlay_11(void)
+static void of_unittest_overlay_11(void)
 {
 	int ret;
 
 	/* device should disable */
-	ret = of_selftest_apply_revert_overlay_check(11, 11, 0, 1,
+	ret = of_unittest_apply_revert_overlay_check(11, 11, 0, 1,
 			PDEV_OVERLAY);
-	if (selftest(ret == 0,
+	if (unittest(ret == 0,
 			"overlay test %d failed; overlay application\n", 11))
 		return;
 }
 
 #if IS_BUILTIN(CONFIG_I2C) && IS_ENABLED(CONFIG_OF_OVERLAY)
 
-struct selftest_i2c_bus_data {
+struct unittest_i2c_bus_data {
 	struct platform_device	*pdev;
 	struct i2c_adapter	adap;
 };
 
-static int selftest_i2c_master_xfer(struct i2c_adapter *adap,
+static int unittest_i2c_master_xfer(struct i2c_adapter *adap,
 		struct i2c_msg *msgs, int num)
 {
-	struct selftest_i2c_bus_data *std = i2c_get_adapdata(adap);
+	struct unittest_i2c_bus_data *std = i2c_get_adapdata(adap);
 
 	(void)std;
 
 	return num;
 }
 
-static u32 selftest_i2c_functionality(struct i2c_adapter *adap)
+static u32 unittest_i2c_functionality(struct i2c_adapter *adap)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
 }
 
-static const struct i2c_algorithm selftest_i2c_algo = {
-	.master_xfer	= selftest_i2c_master_xfer,
-	.functionality	= selftest_i2c_functionality,
+static const struct i2c_algorithm unittest_i2c_algo = {
+	.master_xfer	= unittest_i2c_master_xfer,
+	.functionality	= unittest_i2c_functionality,
 };
 
-static int selftest_i2c_bus_probe(struct platform_device *pdev)
+static int unittest_i2c_bus_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct selftest_i2c_bus_data *std;
+	struct unittest_i2c_bus_data *std;
 	struct i2c_adapter *adap;
 	int ret;
 
@@ -1500,7 +1500,7 @@ static int selftest_i2c_bus_probe(struct platform_device *pdev)
 
 	std = devm_kzalloc(dev, sizeof(*std), GFP_KERNEL);
 	if (!std) {
-		dev_err(dev, "Failed to allocate selftest i2c data\n");
+		dev_err(dev, "Failed to allocate unittest i2c data\n");
 		return -ENOMEM;
 	}
 
@@ -1513,7 +1513,7 @@ static int selftest_i2c_bus_probe(struct platform_device *pdev)
 	adap->nr = -1;
 	strlcpy(adap->name, pdev->name, sizeof(adap->name));
 	adap->class = I2C_CLASS_DEPRECATED;
-	adap->algo = &selftest_i2c_algo;
+	adap->algo = &unittest_i2c_algo;
 	adap->dev.parent = dev;
 	adap->dev.of_node = dev->of_node;
 	adap->timeout = 5 * HZ;
@@ -1528,11 +1528,11 @@ static int selftest_i2c_bus_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int selftest_i2c_bus_remove(struct platform_device *pdev)
+static int unittest_i2c_bus_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct selftest_i2c_bus_data *std = platform_get_drvdata(pdev);
+	struct unittest_i2c_bus_data *std = platform_get_drvdata(pdev);
 
 	dev_dbg(dev, "%s for node @%s\n", __func__, np->full_name);
 	i2c_del_adapter(&std->adap);
@@ -1540,21 +1540,21 @@ static int selftest_i2c_bus_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct of_device_id selftest_i2c_bus_match[] = {
-	{ .compatible = "selftest-i2c-bus", },
+static struct of_device_id unittest_i2c_bus_match[] = {
+	{ .compatible = "unittest-i2c-bus", },
 	{},
 };
 
-static struct platform_driver selftest_i2c_bus_driver = {
-	.probe			= selftest_i2c_bus_probe,
-	.remove			= selftest_i2c_bus_remove,
+static struct platform_driver unittest_i2c_bus_driver = {
+	.probe			= unittest_i2c_bus_probe,
+	.remove			= unittest_i2c_bus_remove,
 	.driver = {
-		.name		= "selftest-i2c-bus",
-		.of_match_table	= of_match_ptr(selftest_i2c_bus_match),
+		.name		= "unittest-i2c-bus",
+		.of_match_table	= of_match_ptr(unittest_i2c_bus_match),
 	},
 };
 
-static int selftest_i2c_dev_probe(struct i2c_client *client,
+static int unittest_i2c_dev_probe(struct i2c_client *client,
 		const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
@@ -1570,7 +1570,7 @@ static int selftest_i2c_dev_probe(struct i2c_client *client,
 	return 0;
 };
 
-static int selftest_i2c_dev_remove(struct i2c_client *client)
+static int unittest_i2c_dev_remove(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct device_node *np = client->dev.of_node;
@@ -1579,42 +1579,42 @@ static int selftest_i2c_dev_remove(struct i2c_client *client)
 	return 0;
 }
 
-static const struct i2c_device_id selftest_i2c_dev_id[] = {
-	{ .name = "selftest-i2c-dev" },
+static const struct i2c_device_id unittest_i2c_dev_id[] = {
+	{ .name = "unittest-i2c-dev" },
 	{ }
 };
 
-static struct i2c_driver selftest_i2c_dev_driver = {
+static struct i2c_driver unittest_i2c_dev_driver = {
 	.driver = {
-		.name = "selftest-i2c-dev",
+		.name = "unittest-i2c-dev",
 		.owner = THIS_MODULE,
 	},
-	.probe = selftest_i2c_dev_probe,
-	.remove = selftest_i2c_dev_remove,
-	.id_table = selftest_i2c_dev_id,
+	.probe = unittest_i2c_dev_probe,
+	.remove = unittest_i2c_dev_remove,
+	.id_table = unittest_i2c_dev_id,
 };
 
 #if IS_BUILTIN(CONFIG_I2C_MUX)
 
-struct selftest_i2c_mux_data {
+struct unittest_i2c_mux_data {
 	int nchans;
 	struct i2c_adapter *adap[];
 };
 
-static int selftest_i2c_mux_select_chan(struct i2c_adapter *adap,
+static int unittest_i2c_mux_select_chan(struct i2c_adapter *adap,
 			       void *client, u32 chan)
 {
 	return 0;
 }
 
-static int selftest_i2c_mux_probe(struct i2c_client *client,
+static int unittest_i2c_mux_probe(struct i2c_client *client,
 		const struct i2c_device_id *id)
 {
 	int ret, i, nchans, size;
 	struct device *dev = &client->dev;
 	struct i2c_adapter *adap = to_i2c_adapter(dev->parent);
 	struct device_node *np = client->dev.of_node, *child;
-	struct selftest_i2c_mux_data *stm;
+	struct unittest_i2c_mux_data *stm;
 	u32 reg, max_reg;
 
 	dev_dbg(dev, "%s for node @%s\n", __func__, np->full_name);
@@ -1638,7 +1638,7 @@ static int selftest_i2c_mux_probe(struct i2c_client *client,
 		return -EINVAL;
 	}
 
-	size = offsetof(struct selftest_i2c_mux_data, adap[nchans]);
+	size = offsetof(struct unittest_i2c_mux_data, adap[nchans]);
 	stm = devm_kzalloc(dev, size, GFP_KERNEL);
 	if (!stm) {
 		dev_err(dev, "Out of memory\n");
@@ -1647,7 +1647,7 @@ static int selftest_i2c_mux_probe(struct i2c_client *client,
 	stm->nchans = nchans;
 	for (i = 0; i < nchans; i++) {
 		stm->adap[i] = i2c_add_mux_adapter(adap, dev, client,
-				0, i, 0, selftest_i2c_mux_select_chan, NULL);
+				0, i, 0, unittest_i2c_mux_select_chan, NULL);
 		if (!stm->adap[i]) {
 			dev_err(dev, "Failed to register mux #%d\n", i);
 			for (i--; i >= 0; i--)
@@ -1661,11 +1661,11 @@ static int selftest_i2c_mux_probe(struct i2c_client *client,
 	return 0;
 };
 
-static int selftest_i2c_mux_remove(struct i2c_client *client)
+static int unittest_i2c_mux_remove(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct device_node *np = client->dev.of_node;
-	struct selftest_i2c_mux_data *stm = i2c_get_clientdata(client);
+	struct unittest_i2c_mux_data *stm = i2c_get_clientdata(client);
 	int i;
 
 	dev_dbg(dev, "%s for node @%s\n", __func__, np->full_name);
@@ -1674,166 +1674,166 @@ static int selftest_i2c_mux_remove(struct i2c_client *client)
 	return 0;
 }
 
-static const struct i2c_device_id selftest_i2c_mux_id[] = {
-	{ .name = "selftest-i2c-mux" },
+static const struct i2c_device_id unittest_i2c_mux_id[] = {
+	{ .name = "unittest-i2c-mux" },
 	{ }
 };
 
-static struct i2c_driver selftest_i2c_mux_driver = {
+static struct i2c_driver unittest_i2c_mux_driver = {
 	.driver = {
-		.name = "selftest-i2c-mux",
+		.name = "unittest-i2c-mux",
 		.owner = THIS_MODULE,
 	},
-	.probe = selftest_i2c_mux_probe,
-	.remove = selftest_i2c_mux_remove,
-	.id_table = selftest_i2c_mux_id,
+	.probe = unittest_i2c_mux_probe,
+	.remove = unittest_i2c_mux_remove,
+	.id_table = unittest_i2c_mux_id,
 };
 
 #endif
 
-static int of_selftest_overlay_i2c_init(void)
+static int of_unittest_overlay_i2c_init(void)
 {
 	int ret;
 
-	ret = i2c_add_driver(&selftest_i2c_dev_driver);
-	if (selftest(ret == 0,
-			"could not register selftest i2c device driver\n"))
+	ret = i2c_add_driver(&unittest_i2c_dev_driver);
+	if (unittest(ret == 0,
+			"could not register unittest i2c device driver\n"))
 		return ret;
 
-	ret = platform_driver_register(&selftest_i2c_bus_driver);
-	if (selftest(ret == 0,
-			"could not register selftest i2c bus driver\n"))
+	ret = platform_driver_register(&unittest_i2c_bus_driver);
+	if (unittest(ret == 0,
+			"could not register unittest i2c bus driver\n"))
 		return ret;
 
 #if IS_BUILTIN(CONFIG_I2C_MUX)
-	ret = i2c_add_driver(&selftest_i2c_mux_driver);
-	if (selftest(ret == 0,
-			"could not register selftest i2c mux driver\n"))
+	ret = i2c_add_driver(&unittest_i2c_mux_driver);
+	if (unittest(ret == 0,
+			"could not register unittest i2c mux driver\n"))
 		return ret;
 #endif
 
 	return 0;
 }
 
-static void of_selftest_overlay_i2c_cleanup(void)
+static void of_unittest_overlay_i2c_cleanup(void)
 {
 #if IS_BUILTIN(CONFIG_I2C_MUX)
-	i2c_del_driver(&selftest_i2c_mux_driver);
+	i2c_del_driver(&unittest_i2c_mux_driver);
 #endif
-	platform_driver_unregister(&selftest_i2c_bus_driver);
-	i2c_del_driver(&selftest_i2c_dev_driver);
+	platform_driver_unregister(&unittest_i2c_bus_driver);
+	i2c_del_driver(&unittest_i2c_dev_driver);
 }
 
-static void of_selftest_overlay_i2c_12(void)
+static void of_unittest_overlay_i2c_12(void)
 {
 	int ret;
 
 	/* device should enable */
-	ret = of_selftest_apply_overlay_check(12, 12, 0, 1, I2C_OVERLAY);
+	ret = of_unittest_apply_overlay_check(12, 12, 0, 1, I2C_OVERLAY);
 	if (ret != 0)
 		return;
 
-	selftest(1, "overlay test %d passed\n", 12);
+	unittest(1, "overlay test %d passed\n", 12);
 }
 
 /* test deactivation of device */
-static void of_selftest_overlay_i2c_13(void)
+static void of_unittest_overlay_i2c_13(void)
 {
 	int ret;
 
 	/* device should disable */
-	ret = of_selftest_apply_overlay_check(13, 13, 1, 0, I2C_OVERLAY);
+	ret = of_unittest_apply_overlay_check(13, 13, 1, 0, I2C_OVERLAY);
 	if (ret != 0)
 		return;
 
-	selftest(1, "overlay test %d passed\n", 13);
+	unittest(1, "overlay test %d passed\n", 13);
 }
 
 /* just check for i2c mux existence */
-static void of_selftest_overlay_i2c_14(void)
+static void of_unittest_overlay_i2c_14(void)
 {
 }
 
-static void of_selftest_overlay_i2c_15(void)
+static void of_unittest_overlay_i2c_15(void)
 {
 	int ret;
 
 	/* device should enable */
-	ret = of_selftest_apply_overlay_check(16, 15, 0, 1, I2C_OVERLAY);
+	ret = of_unittest_apply_overlay_check(16, 15, 0, 1, I2C_OVERLAY);
 	if (ret != 0)
 		return;
 
-	selftest(1, "overlay test %d passed\n", 15);
+	unittest(1, "overlay test %d passed\n", 15);
 }
 
 #else
 
-static inline void of_selftest_overlay_i2c_14(void) { }
-static inline void of_selftest_overlay_i2c_15(void) { }
+static inline void of_unittest_overlay_i2c_14(void) { }
+static inline void of_unittest_overlay_i2c_15(void) { }
 
 #endif
 
-static void __init of_selftest_overlay(void)
+static void __init of_unittest_overlay(void)
 {
 	struct device_node *bus_np = NULL;
 	int ret;
 
-	ret = platform_driver_register(&selftest_driver);
+	ret = platform_driver_register(&unittest_driver);
 	if (ret != 0) {
-		selftest(0, "could not register selftest driver\n");
+		unittest(0, "could not register unittest driver\n");
 		goto out;
 	}
 
 	bus_np = of_find_node_by_path(bus_path);
 	if (bus_np == NULL) {
-		selftest(0, "could not find bus_path \"%s\"\n", bus_path);
+		unittest(0, "could not find bus_path \"%s\"\n", bus_path);
 		goto out;
 	}
 
 	ret = of_platform_populate(bus_np, of_default_bus_match_table,
 			NULL, NULL);
 	if (ret != 0) {
-		selftest(0, "could not populate bus @ \"%s\"\n", bus_path);
+		unittest(0, "could not populate bus @ \"%s\"\n", bus_path);
 		goto out;
 	}
 
-	if (!of_selftest_device_exists(100, PDEV_OVERLAY)) {
-		selftest(0, "could not find selftest0 @ \"%s\"\n",
-				selftest_path(100, PDEV_OVERLAY));
+	if (!of_unittest_device_exists(100, PDEV_OVERLAY)) {
+		unittest(0, "could not find unittest0 @ \"%s\"\n",
+				unittest_path(100, PDEV_OVERLAY));
 		goto out;
 	}
 
-	if (of_selftest_device_exists(101, PDEV_OVERLAY)) {
-		selftest(0, "selftest1 @ \"%s\" should not exist\n",
-				selftest_path(101, PDEV_OVERLAY));
+	if (of_unittest_device_exists(101, PDEV_OVERLAY)) {
+		unittest(0, "unittest1 @ \"%s\" should not exist\n",
+				unittest_path(101, PDEV_OVERLAY));
 		goto out;
 	}
 
-	selftest(1, "basic infrastructure of overlays passed");
+	unittest(1, "basic infrastructure of overlays passed");
 
 	/* tests in sequence */
-	of_selftest_overlay_0();
-	of_selftest_overlay_1();
-	of_selftest_overlay_2();
-	of_selftest_overlay_3();
-	of_selftest_overlay_4();
-	of_selftest_overlay_5();
-	of_selftest_overlay_6();
-	of_selftest_overlay_8();
-
-	of_selftest_overlay_10();
-	of_selftest_overlay_11();
+	of_unittest_overlay_0();
+	of_unittest_overlay_1();
+	of_unittest_overlay_2();
+	of_unittest_overlay_3();
+	of_unittest_overlay_4();
+	of_unittest_overlay_5();
+	of_unittest_overlay_6();
+	of_unittest_overlay_8();
+
+	of_unittest_overlay_10();
+	of_unittest_overlay_11();
 
 #if IS_BUILTIN(CONFIG_I2C)
-	if (selftest(of_selftest_overlay_i2c_init() == 0, "i2c init failed\n"))
+	if (unittest(of_unittest_overlay_i2c_init() == 0, "i2c init failed\n"))
 		goto out;
 
-	of_selftest_overlay_i2c_12();
-	of_selftest_overlay_i2c_13();
-	of_selftest_overlay_i2c_14();
-	of_selftest_overlay_i2c_15();
+	of_unittest_overlay_i2c_12();
+	of_unittest_overlay_i2c_13();
+	of_unittest_overlay_i2c_14();
+	of_unittest_overlay_i2c_15();
 
-	of_selftest_overlay_i2c_cleanup();
+	of_unittest_overlay_i2c_cleanup();
 #endif
 
 out:
@@ -1841,16 +1841,16 @@ out:
 }
 
 #else
-static inline void __init of_selftest_overlay(void) { }
+static inline void __init of_unittest_overlay(void) { }
 #endif
 
-static int __init of_selftest(void)
+static int __init of_unittest(void)
 {
 	struct device_node *np;
 	int res;
 
-	/* adding data for selftest */
-	res = selftest_data_add();
+	/* adding data for unittest */
+	res = unittest_data_add();
 	if (res)
 		return res;
 	if (!of_aliases)
@@ -1863,27 +1863,27 @@ static int __init of_selftest(void)
 	}
 	of_node_put(np);
 
-	pr_info("start of selftest - you will see error messages\n");
-	of_selftest_check_tree_linkage();
-	of_selftest_check_phandles();
-	of_selftest_find_node_by_name();
-	of_selftest_dynamic();
-	of_selftest_parse_phandle_with_args();
-	of_selftest_property_string();
-	of_selftest_property_copy();
-	of_selftest_changeset();
-	of_selftest_parse_interrupts();
-	of_selftest_parse_interrupts_extended();
-	of_selftest_match_node();
-	of_selftest_platform_populate();
-	of_selftest_overlay();
+	pr_info("start of unittest - you will see error messages\n");
+	of_unittest_check_tree_linkage();
+	of_unittest_check_phandles();
+	of_unittest_find_node_by_name();
+	of_unittest_dynamic();
+	of_unittest_parse_phandle_with_args();
+	of_unittest_property_string();
+	of_unittest_property_copy();
+	of_unittest_changeset();
+	of_unittest_parse_interrupts();
+	of_unittest_parse_interrupts_extended();
+	of_unittest_match_node();
+	of_unittest_platform_populate();
+	of_unittest_overlay();
 
 	/* Double check linkage after removing testcase data */
-	of_selftest_check_tree_linkage();
+	of_unittest_check_tree_linkage();
 
-	pr_info("end of selftest - %i passed, %i failed\n",
-		selftest_results.passed, selftest_results.failed);
+	pr_info("end of unittest - %i passed, %i failed\n",
+		unittest_results.passed, unittest_results.failed);
 
 	return 0;
 }
-late_initcall(of_selftest);
+late_initcall(of_unittest);
-- 
1.8.3.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
