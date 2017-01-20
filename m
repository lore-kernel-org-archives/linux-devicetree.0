From: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] of/unittest: Test platform bus added from overlay
Date: Fri, 20 Jan 2017 22:02:34 +0100
Message-ID: <20170120210234.11924-2-alexander.sverdlin@nokia.com>
References: <20170120205745.11851-1-alexander.sverdlin@nokia.com>
 <20170120210234.11924-1-alexander.sverdlin@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170120210234.11924-1-alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Check that it's possible to:
- add children to platform buses originating from overlays
- use overlay to enable a platform bus originating from overlay

Explicitly avoid unittest_probe(), because this test case checks the correct
creation of the devices only. Driver probing might be delayed (say, modules)
and correct device creation must not depend on it.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 drivers/of/unittest-data/tests-overlay.dtsi | 83 +++++++++++++++++++++++++++++
 drivers/of/unittest.c                       | 60 +++++++++++++++++++++
 2 files changed, 143 insertions(+)

diff --git a/drivers/of/unittest-data/tests-overlay.dtsi b/drivers/of/unittest-data/tests-overlay.dtsi
index 02ba56c20fe1..6925a992f9e2 100644
--- a/drivers/of/unittest-data/tests-overlay.dtsi
+++ b/drivers/of/unittest-data/tests-overlay.dtsi
@@ -325,5 +325,88 @@
 			};
 		};
 
+		/* test that platform buses from overlays are functional */
+		overlay16 {
+			fragment@0 {
+				target-path = "/testcase-data/overlay-node/test-bus";
+				__overlay__ {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					test-unittest16 {
+						/*
+						 * testing just device creation,
+						 * no unittest_probe() should
+						 * be called
+						 */
+						compatible = "simple-bus";
+						reg = <16>;
+					};
+				};
+			};
+		};
+
+		overlay17 {
+			fragment@0 {
+				target-path = "/testcase-data/overlay-node/test-bus";
+				__overlay__ {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					test-unittest16 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						test-unittest161 {
+							compatible = "unittest";
+							reg = <1>;
+						};
+					};
+				};
+			};
+		};
+
+		overlay18 {
+			fragment@0 {
+				target-path = "/testcase-data/overlay-node/test-bus";
+				__overlay__ {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					test-unittest18 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						/*
+						 * testing just device creation,
+						 * no unittest_probe() should
+						 * be called
+						 */
+						compatible = "simple-bus";
+						reg = <18>;
+						status = "disabled";
+
+						test-unittest181 {
+							compatible = "unittest";
+							reg = <1>;
+						};
+					};
+				};
+			};
+		};
+
+		overlay19 {
+			fragment@0 {
+				target-path = "/testcase-data/overlay-node/test-bus";
+				__overlay__ {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					test-unittest18 {
+						status = "okay";
+					};
+				};
+			};
+		};
+
 	};
 };
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 66bfa8d674ce..2c533709bb0e 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1854,6 +1854,63 @@ static inline void of_unittest_overlay_i2c_15(void) { }
 
 #endif
 
+/* test that platform buses populated by overlays are functional */
+static void of_unittest_overlay_16(void)
+{
+	int ret;
+	char *child_path;
+
+	/* add an empty bus */
+	ret = of_unittest_apply_overlay_check(16, 16, 0, 1, PDEV_OVERLAY);
+	if (unittest(ret == 0,
+			"overlay test %d failed; overlay application\n", 16))
+		return;
+
+	/* add a device to the bus */
+	ret = of_unittest_apply_overlay(17, 16, PDEV_OVERLAY);
+	if (unittest(ret == 0,
+			"overlay test %d failed; overlay application\n", 16))
+		return;
+
+	child_path = kasprintf(GFP_KERNEL, "%s/test-unittest161",
+			unittest_path(16, PDEV_OVERLAY));
+	if (unittest(child_path, "overlay test %d failed; kasprintf\n", 16))
+		return;
+
+	ret = of_path_device_type_exists(child_path, PDEV_OVERLAY);
+	kfree(child_path);
+	if (unittest(ret, "overlay test %d failed; no child device\n", 16))
+		return;
+}
+
+static void of_unittest_overlay_18(void)
+{
+	int ret;
+	char *child_path;
+
+	/* add a disabled bus */
+	ret = of_unittest_apply_overlay_check(18, 18, 0, 0, PDEV_OVERLAY);
+	if (unittest(ret == 0,
+			"overlay test %d failed; overlay application\n", 18))
+		return;
+
+	/* enable the bus */
+	ret = of_unittest_apply_overlay_check(19, 18, 0, 1, PDEV_OVERLAY);
+	if (unittest(ret == 0,
+			"overlay test %d failed; overlay application\n", 18))
+		return;
+
+	child_path = kasprintf(GFP_KERNEL, "%s/test-unittest181",
+			unittest_path(18, PDEV_OVERLAY));
+	if (unittest(child_path, "overlay test %d failed; kasprintf\n", 18))
+		return;
+
+	ret = of_path_device_type_exists(child_path, PDEV_OVERLAY);
+	kfree(child_path);
+	if (unittest(ret, "overlay test %d failed; no child device\n", 18))
+		return;
+}
+
 static void __init of_unittest_overlay(void)
 {
 	struct device_node *bus_np = NULL;
@@ -1916,6 +1973,9 @@ static void __init of_unittest_overlay(void)
 	of_unittest_overlay_i2c_cleanup();
 #endif
 
+	of_unittest_overlay_16();
+	of_unittest_overlay_18();
+
 	of_unittest_destroy_tracked_overlays();
 
 out:
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
