From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] of: unitest: Add I2C overlay unit tests.
Date: Mon, 12 Jan 2015 19:02:49 +0200
Message-ID: <1421082169-10371-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Introduce I2C device tree overlay tests.
Tests insertion and removal of i2c adapters, i2c devices, and muxes.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/unittest.txt |  59 ++-
 drivers/of/unittest-data/tests-overlay.dtsi    |  94 +++++
 drivers/of/unittest.c                          | 512 ++++++++++++++++++++++---
 3 files changed, 614 insertions(+), 51 deletions(-)

diff --git a/Documentation/devicetree/bindings/unittest.txt b/Documentation/devicetree/bindings/unittest.txt
index 0f92a22..8933211 100644
--- a/Documentation/devicetree/bindings/unittest.txt
+++ b/Documentation/devicetree/bindings/unittest.txt
@@ -1,4 +1,4 @@
-* OF selftest platform device
+1) OF selftest platform device
 
 ** selftest
 
@@ -12,3 +12,60 @@ Example:
 		compatible = "selftest";
 		status = "okay";
 	};
+
+2) OF selftest i2c adapter platform device
+
+** platform device unittest adapter
+
+Required properties:
+- compatible: must be selftest-i2c-bus
+
+Children nodes contain selftest i2c devices.
+
+Example:
+	selftest-i2c-bus {
+		compatible = "selftest-i2c-bus";
+		status = "okay";
+	};
+
+3) OF selftest i2c device
+
+** I2C selftest device
+
+Required properties:
+- compatible: must be selftest-i2c-dev
+
+All other properties are optional
+
+Example:
+	selftest-i2c-dev {
+		compatible = "selftest-i2c-dev";
+		status = "okay";
+	};
+
+4) OF selftest i2c mux device
+
+** I2C selftest mux
+
+Required properties:
+- compatible: must be selftest-i2c-mux
+
+Children nodes contain selftest i2c bus nodes per channel.
+
+Example:
+	selftest-i2c-mux {
+		compatible = "selftest-i2c-mux";
+		status = "okay";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		channel-0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			i2c-dev {
+				reg = <8>;
+				compatible = "selftest-i2c-dev";
+				status = "okay";
+			};
+		};
+	};
diff --git a/drivers/of/unittest-data/tests-overlay.dtsi b/drivers/of/unittest-data/tests-overlay.dtsi
index a2b687d..244226c 100644
--- a/drivers/of/unittest-data/tests-overlay.dtsi
+++ b/drivers/of/unittest-data/tests-overlay.dtsi
@@ -68,6 +68,48 @@
 					status = "disabled";
 					reg = <8>;
 				};
+
+				i2c-test-bus {
+					compatible = "selftest-i2c-bus";
+					status = "okay";
+					reg = <50>;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					test-selftest12 {
+						reg = <8>;
+						compatible = "selftest-i2c-dev";
+						status = "disabled";
+					};
+
+					test-selftest13 {
+						reg = <9>;
+						compatible = "selftest-i2c-dev";
+						status = "okay";
+					};
+
+					test-selftest14 {
+						reg = <10>;
+						compatible = "selftest-i2c-mux";
+						status = "okay";
+
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							test-mux-dev {
+								reg = <32>;
+								compatible = "selftest-i2c-dev";
+								status = "okay";
+							};
+						};
+					};
+				};
 			};
 		};
 
@@ -231,5 +273,57 @@
 				};
 			};
 		};
+
+		/* test enable using absolute target path (i2c) */
+		overlay12 {
+			fragment@0 {
+				target-path = "/testcase-data/overlay-node/test-bus/i2c-test-bus/test-selftest12";
+				__overlay__ {
+					status = "okay";
+				};
+			};
+		};
+
+		/* test disable using absolute target path (i2c) */
+		overlay13 {
+			fragment@0 {
+				target-path = "/testcase-data/overlay-node/test-bus/i2c-test-bus/test-selftest13";
+				__overlay__ {
+					status = "disabled";
+				};
+			};
+		};
+
+		/* test mux overlay */
+		overlay15 {
+			fragment@0 {
+				target-path = "/testcase-data/overlay-node/test-bus/i2c-test-bus";
+				__overlay__ {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					test-selftest15 {
+						reg = <11>;
+						compatible = "selftest-i2c-mux";
+						status = "okay";
+
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							test-mux-dev {
+								reg = <32>;
+								compatible = "selftest-i2c-dev";
+								status = "okay";
+							};
+						};
+					};
+				};
+			};
+		};
+
 	};
 };
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 41a4a13..d1ce066 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -20,6 +20,9 @@
 #include <linux/platform_device.h>
 #include <linux/of_platform.h>
 
+#include <linux/i2c.h>
+#include <linux/i2c-mux.h>
+
 #include "of_private.h"
 
 static struct selftest_results {
@@ -1034,17 +1037,94 @@ static int of_path_platform_device_exists(const char *path)
 	return pdev != NULL;
 }
 
-static const char *selftest_path(int nr)
+#if IS_ENABLED(CONFIG_I2C)
+
+/* get the i2c client device instantiated at the path */
+static struct i2c_client *of_path_to_i2c_client(const char *path)
+{
+	struct device_node *np;
+	struct i2c_client *client;
+
+	np = of_find_node_by_path(path);
+	if (np == NULL)
+		return NULL;
+
+	client = of_find_i2c_device_by_node(np);
+	of_node_put(np);
+
+	return client;
+}
+
+/* find out if a i2c client device exists at that path */
+static int of_path_i2c_client_exists(const char *path)
+{
+	struct i2c_client *client;
+
+	client = of_path_to_i2c_client(path);
+	if (client)
+		put_device(&client->dev);
+	return client != NULL;
+}
+#else
+static int of_path_i2c_client_exists(const char *path)
+{
+	return 0;
+}
+#endif
+
+enum overlay_type {
+	PDEV_OVERLAY,
+	I2C_OVERLAY
+};
+
+static int of_path_device_type_exists(const char *path,
+		enum overlay_type ovtype)
 {
+	switch (ovtype) {
+	case PDEV_OVERLAY:
+		return of_path_platform_device_exists(path);
+	case I2C_OVERLAY:
+		return of_path_i2c_client_exists(path);
+	}
+	return 0;
+}
+
+static const char *selftest_path(int nr, enum overlay_type ovtype)
+{
+	const char *base;
 	static char buf[256];
 
-	snprintf(buf, sizeof(buf) - 1,
-		"/testcase-data/overlay-node/test-bus/test-selftest%d", nr);
+	switch (ovtype) {
+	case PDEV_OVERLAY:
+		base = "/testcase-data/overlay-node/test-bus";
+		break;
+	case I2C_OVERLAY:
+		base = "/testcase-data/overlay-node/test-bus/i2c-test-bus";
+		break;
+	default:
+		buf[0] = '\0';
+		return buf;
+	}
+	snprintf(buf, sizeof(buf) - 1, "%s/test-selftest%d", base, nr);
 	buf[sizeof(buf) - 1] = '\0';
-
 	return buf;
 }
 
+static int of_selftest_device_exists(int selftest_nr, enum overlay_type ovtype)
+{
+	const char *path;
+
+	path = selftest_path(selftest_nr, ovtype);
+
+	switch (ovtype) {
+	case PDEV_OVERLAY:
+		return of_path_platform_device_exists(path);
+	case I2C_OVERLAY:
+		return of_path_i2c_client_exists(path);
+	}
+	return 0;
+}
+
 static const char *overlay_path(int nr)
 {
 	static char buf[256];
@@ -1093,16 +1173,15 @@ out:
 
 /* apply an overlay while checking before and after states */
 static int of_selftest_apply_overlay_check(int overlay_nr, int selftest_nr,
-		int before, int after)
+		int before, int after, enum overlay_type ovtype)
 {
 	int ret;
 
 	/* selftest device must not be in before state */
-	if (of_path_platform_device_exists(selftest_path(selftest_nr))
-			!= before) {
+	if (of_selftest_device_exists(selftest_nr, ovtype) != before) {
 		selftest(0, "overlay @\"%s\" with device @\"%s\" %s\n",
 				overlay_path(overlay_nr),
-				selftest_path(selftest_nr),
+				selftest_path(selftest_nr, ovtype),
 				!before ? "enabled" : "disabled");
 		return -EINVAL;
 	}
@@ -1114,11 +1193,10 @@ static int of_selftest_apply_overlay_check(int overlay_nr, int selftest_nr,
 	}
 
 	/* selftest device must be to set to after state */
-	if (of_path_platform_device_exists(selftest_path(selftest_nr))
-			!= after) {
+	if (of_selftest_device_exists(selftest_nr, ovtype) != after) {
 		selftest(0, "overlay @\"%s\" failed to create @\"%s\" %s\n",
 				overlay_path(overlay_nr),
-				selftest_path(selftest_nr),
+				selftest_path(selftest_nr, ovtype),
 				!after ? "enabled" : "disabled");
 		return -EINVAL;
 	}
@@ -1128,16 +1206,16 @@ static int of_selftest_apply_overlay_check(int overlay_nr, int selftest_nr,
 
 /* apply an overlay and then revert it while checking before, after states */
 static int of_selftest_apply_revert_overlay_check(int overlay_nr,
-		int selftest_nr, int before, int after)
+		int selftest_nr, int before, int after,
+		enum overlay_type ovtype)
 {
 	int ret, ov_id;
 
 	/* selftest device must be in before state */
-	if (of_path_platform_device_exists(selftest_path(selftest_nr))
-			!= before) {
+	if (of_selftest_device_exists(selftest_nr, ovtype) != before) {
 		selftest(0, "overlay @\"%s\" with device @\"%s\" %s\n",
 				overlay_path(overlay_nr),
-				selftest_path(selftest_nr),
+				selftest_path(selftest_nr, ovtype),
 				!before ? "enabled" : "disabled");
 		return -EINVAL;
 	}
@@ -1150,11 +1228,10 @@ static int of_selftest_apply_revert_overlay_check(int overlay_nr,
 	}
 
 	/* selftest device must be in after state */
-	if (of_path_platform_device_exists(selftest_path(selftest_nr))
-			!= after) {
+	if (of_selftest_device_exists(selftest_nr, ovtype) != after) {
 		selftest(0, "overlay @\"%s\" failed to create @\"%s\" %s\n",
 				overlay_path(overlay_nr),
-				selftest_path(selftest_nr),
+				selftest_path(selftest_nr, ovtype),
 				!after ? "enabled" : "disabled");
 		return -EINVAL;
 	}
@@ -1163,16 +1240,15 @@ static int of_selftest_apply_revert_overlay_check(int overlay_nr,
 	if (ret != 0) {
 		selftest(0, "overlay @\"%s\" failed to be destroyed @\"%s\"\n",
 				overlay_path(overlay_nr),
-				selftest_path(selftest_nr));
+				selftest_path(selftest_nr, ovtype));
 		return ret;
 	}
 
 	/* selftest device must be again in before state */
-	if (of_path_platform_device_exists(selftest_path(selftest_nr))
-			!= before) {
+	if (of_selftest_device_exists(selftest_nr, PDEV_OVERLAY) != before) {
 		selftest(0, "overlay @\"%s\" with device @\"%s\" %s\n",
 				overlay_path(overlay_nr),
-				selftest_path(selftest_nr),
+				selftest_path(selftest_nr, ovtype),
 				!before ? "enabled" : "disabled");
 		return -EINVAL;
 	}
@@ -1186,7 +1262,7 @@ static void of_selftest_overlay_0(void)
 	int ret;
 
 	/* device should enable */
-	ret = of_selftest_apply_overlay_check(0, 0, 0, 1);
+	ret = of_selftest_apply_overlay_check(0, 0, 0, 1, PDEV_OVERLAY);
 	if (ret != 0)
 		return;
 
@@ -1199,7 +1275,7 @@ static void of_selftest_overlay_1(void)
 	int ret;
 
 	/* device should disable */
-	ret = of_selftest_apply_overlay_check(1, 1, 1, 0);
+	ret = of_selftest_apply_overlay_check(1, 1, 1, 0, PDEV_OVERLAY);
 	if (ret != 0)
 		return;
 
@@ -1212,7 +1288,7 @@ static void of_selftest_overlay_2(void)
 	int ret;
 
 	/* device should enable */
-	ret = of_selftest_apply_overlay_check(2, 2, 0, 1);
+	ret = of_selftest_apply_overlay_check(2, 2, 0, 1, PDEV_OVERLAY);
 	if (ret != 0)
 		return;
 
@@ -1225,7 +1301,7 @@ static void of_selftest_overlay_3(void)
 	int ret;
 
 	/* device should disable */
-	ret = of_selftest_apply_overlay_check(3, 3, 1, 0);
+	ret = of_selftest_apply_overlay_check(3, 3, 1, 0, PDEV_OVERLAY);
 	if (ret != 0)
 		return;
 
@@ -1238,7 +1314,7 @@ static void of_selftest_overlay_4(void)
 	int ret;
 
 	/* device should disable */
-	ret = of_selftest_apply_overlay_check(4, 4, 0, 1);
+	ret = of_selftest_apply_overlay_check(4, 4, 0, 1, PDEV_OVERLAY);
 	if (ret != 0)
 		return;
 
@@ -1251,7 +1327,7 @@ static void of_selftest_overlay_5(void)
 	int ret;
 
 	/* device should disable */
-	ret = of_selftest_apply_revert_overlay_check(5, 5, 0, 1);
+	ret = of_selftest_apply_revert_overlay_check(5, 5, 0, 1, PDEV_OVERLAY);
 	if (ret != 0)
 		return;
 
@@ -1268,12 +1344,12 @@ static void of_selftest_overlay_6(void)
 
 	/* selftest device must be in before state */
 	for (i = 0; i < 2; i++) {
-		if (of_path_platform_device_exists(
-					selftest_path(selftest_nr + i))
+		if (of_selftest_device_exists(selftest_nr + i, PDEV_OVERLAY)
 				!= before) {
 			selftest(0, "overlay @\"%s\" with device @\"%s\" %s\n",
 					overlay_path(overlay_nr + i),
-					selftest_path(selftest_nr + i),
+					selftest_path(selftest_nr + i,
+						PDEV_OVERLAY),
 					!before ? "enabled" : "disabled");
 			return;
 		}
@@ -1300,12 +1376,12 @@ static void of_selftest_overlay_6(void)
 
 	for (i = 0; i < 2; i++) {
 		/* selftest device must be in after state */
-		if (of_path_platform_device_exists(
-					selftest_path(selftest_nr + i))
+		if (of_selftest_device_exists(selftest_nr + i, PDEV_OVERLAY)
 				!= after) {
 			selftest(0, "overlay @\"%s\" failed @\"%s\" %s\n",
 					overlay_path(overlay_nr + i),
-					selftest_path(selftest_nr + i),
+					selftest_path(selftest_nr + i,
+						PDEV_OVERLAY),
 					!after ? "enabled" : "disabled");
 			return;
 		}
@@ -1316,19 +1392,20 @@ static void of_selftest_overlay_6(void)
 		if (ret != 0) {
 			selftest(0, "overlay @\"%s\" failed destroy @\"%s\"\n",
 					overlay_path(overlay_nr + i),
-					selftest_path(selftest_nr + i));
+					selftest_path(selftest_nr + i,
+						PDEV_OVERLAY));
 			return;
 		}
 	}
 
 	for (i = 0; i < 2; i++) {
 		/* selftest device must be again in before state */
-		if (of_path_platform_device_exists(
-					selftest_path(selftest_nr + i))
+		if (of_selftest_device_exists(selftest_nr + i, PDEV_OVERLAY)
 				!= before) {
 			selftest(0, "overlay @\"%s\" with device @\"%s\" %s\n",
 					overlay_path(overlay_nr + i),
-					selftest_path(selftest_nr + i),
+					selftest_path(selftest_nr + i,
+						PDEV_OVERLAY),
 					!before ? "enabled" : "disabled");
 			return;
 		}
@@ -1370,7 +1447,8 @@ static void of_selftest_overlay_8(void)
 	if (ret == 0) {
 		selftest(0, "overlay @\"%s\" was destroyed @\"%s\"\n",
 				overlay_path(overlay_nr + 0),
-				selftest_path(selftest_nr));
+				selftest_path(selftest_nr,
+					PDEV_OVERLAY));
 		return;
 	}
 
@@ -1380,7 +1458,8 @@ static void of_selftest_overlay_8(void)
 		if (ret != 0) {
 			selftest(0, "overlay @\"%s\" not destroyed @\"%s\"\n",
 					overlay_path(overlay_nr + i),
-					selftest_path(selftest_nr));
+					selftest_path(selftest_nr,
+						PDEV_OVERLAY));
 			return;
 		}
 	}
@@ -1395,16 +1474,17 @@ static void of_selftest_overlay_10(void)
 	char *child_path;
 
 	/* device should disable */
-	ret = of_selftest_apply_overlay_check(10, 10, 0, 1);
-	if (selftest(ret == 0, "overlay test %d failed; overlay application\n", 10))
+	ret = of_selftest_apply_overlay_check(10, 10, 0, 1, PDEV_OVERLAY);
+	if (selftest(ret == 0,
+			"overlay test %d failed; overlay application\n", 10))
 		return;
 
 	child_path = kasprintf(GFP_KERNEL, "%s/test-selftest101",
-			selftest_path(10));
+			selftest_path(10, PDEV_OVERLAY));
 	if (selftest(child_path, "overlay test %d failed; kasprintf\n", 10))
 		return;
 
-	ret = of_path_platform_device_exists(child_path);
+	ret = of_path_device_type_exists(child_path, PDEV_OVERLAY);
 	kfree(child_path);
 	if (selftest(ret, "overlay test %d failed; no child device\n", 10))
 		return;
@@ -1416,11 +1496,331 @@ static void of_selftest_overlay_11(void)
 	int ret;
 
 	/* device should disable */
-	ret = of_selftest_apply_revert_overlay_check(11, 11, 0, 1);
-	if (selftest(ret == 0, "overlay test %d failed; overlay application\n", 11))
+	ret = of_selftest_apply_revert_overlay_check(11, 11, 0, 1,
+			PDEV_OVERLAY);
+	if (selftest(ret == 0,
+			"overlay test %d failed; overlay application\n", 11))
+		return;
+}
+
+#if IS_ENABLED(CONFIG_I2C) && IS_ENABLED(CONFIG_OF_OVERLAY)
+
+struct selftest_i2c_bus_data {
+	struct platform_device	*pdev;
+	struct i2c_adapter	adap;
+};
+
+static int selftest_i2c_master_xfer(struct i2c_adapter *adap,
+		struct i2c_msg *msgs, int num)
+{
+	struct selftest_i2c_bus_data *std = i2c_get_adapdata(adap);
+
+	(void)std;
+
+	return num;
+}
+
+static u32 selftest_i2c_functionality(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm selftest_i2c_algo = {
+	.master_xfer	= selftest_i2c_master_xfer,
+	.functionality	= selftest_i2c_functionality,
+};
+
+static int selftest_i2c_bus_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct selftest_i2c_bus_data *std;
+	struct i2c_adapter *adap;
+	int ret;
+
+	if (np == NULL) {
+		dev_err(dev, "No OF data for device\n");
+		return -EINVAL;
+
+	}
+
+	dev_dbg(dev, "%s for node @%s\n", __func__, np->full_name);
+
+	std = devm_kzalloc(dev, sizeof(*std), GFP_KERNEL);
+	if (!std) {
+		dev_err(dev, "Failed to allocate selftest i2c data\n");
+		return -ENOMEM;
+	}
+
+	/* link them together */
+	std->pdev = pdev;
+	platform_set_drvdata(pdev, std);
+
+	adap = &std->adap;
+	i2c_set_adapdata(adap, std);
+	adap->nr = -1;
+	strlcpy(adap->name, pdev->name, sizeof(adap->name));
+	adap->class = I2C_CLASS_DEPRECATED;
+	adap->algo = &selftest_i2c_algo;
+	adap->dev.parent = dev;
+	adap->dev.of_node = dev->of_node;
+	adap->timeout = 5 * HZ;
+	adap->retries = 3;
+
+	ret = i2c_add_numbered_adapter(adap);
+	if (ret != 0) {
+		dev_err(dev, "Failed to add I2C adapter\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int selftest_i2c_bus_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct selftest_i2c_bus_data *std = platform_get_drvdata(pdev);
+
+	dev_dbg(dev, "%s for node @%s\n", __func__, np->full_name);
+	i2c_del_adapter(&std->adap);
+
+	return 0;
+}
+
+static struct of_device_id selftest_i2c_bus_match[] = {
+	{ .compatible = "selftest-i2c-bus", },
+	{},
+};
+
+static struct platform_driver selftest_i2c_bus_driver = {
+	.probe			= selftest_i2c_bus_probe,
+	.remove			= selftest_i2c_bus_remove,
+	.driver = {
+		.name		= "selftest-i2c-bus",
+		.of_match_table	= of_match_ptr(selftest_i2c_bus_match),
+	},
+};
+
+static int selftest_i2c_dev_probe(struct i2c_client *client,
+		const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct device_node *np = client->dev.of_node;
+
+	if (!np) {
+		dev_err(dev, "No OF node\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "%s for node @%s\n", __func__, np->full_name);
+
+	return 0;
+};
+
+static int selftest_i2c_dev_remove(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct device_node *np = client->dev.of_node;
+
+	dev_dbg(dev, "%s for node @%s\n", __func__, np->full_name);
+	return 0;
+}
+
+static const struct i2c_device_id selftest_i2c_dev_id[] = {
+	{ .name = "selftest-i2c-dev" },
+	{ }
+};
+
+static struct i2c_driver selftest_i2c_dev_driver = {
+	.driver = {
+		.name = "selftest-i2c-dev",
+		.owner = THIS_MODULE,
+	},
+	.probe = selftest_i2c_dev_probe,
+	.remove = selftest_i2c_dev_remove,
+	.id_table = selftest_i2c_dev_id,
+};
+
+#if IS_ENABLED(CONFIG_I2C_MUX)
+
+struct selftest_i2c_mux_data {
+	int nchans;
+	struct i2c_adapter *adap[];
+};
+
+static int selftest_i2c_mux_select_chan(struct i2c_adapter *adap,
+			       void *client, u32 chan)
+{
+	return 0;
+}
+
+static int selftest_i2c_mux_probe(struct i2c_client *client,
+		const struct i2c_device_id *id)
+{
+	int ret, i, nchans, size;
+	struct device *dev = &client->dev;
+	struct i2c_adapter *adap = to_i2c_adapter(dev->parent);
+	struct device_node *np = client->dev.of_node, *child;
+	struct selftest_i2c_mux_data *stm;
+	u32 reg, max_reg;
+
+	dev_dbg(dev, "%s for node @%s\n", __func__, np->full_name);
+
+	if (!np) {
+		dev_err(dev, "No OF node\n");
+		return -EINVAL;
+	}
+
+	max_reg = (u32)-1;
+	for_each_child_of_node(np, child) {
+		ret = of_property_read_u32(child, "reg", &reg);
+		if (ret)
+			continue;
+		if (max_reg == (u32)-1 || reg > max_reg)
+			max_reg = reg;
+	}
+	nchans = max_reg == (u32)-1 ? 0 : max_reg + 1;
+	if (nchans == 0) {
+		dev_err(dev, "No channels\n");
+		return -EINVAL;
+	}
+
+	size = offsetof(struct selftest_i2c_mux_data, adap[nchans]);
+	stm = devm_kzalloc(dev, size, GFP_KERNEL);
+	if (!stm) {
+		dev_err(dev, "Out of memory\n");
+		return -ENOMEM;
+	}
+	stm->nchans = nchans;
+	for (i = 0; i < nchans; i++) {
+		stm->adap[i] = i2c_add_mux_adapter(adap, dev, client,
+				0, i, 0, selftest_i2c_mux_select_chan, NULL);
+		if (!stm->adap[i]) {
+			dev_err(dev, "Failed to register mux #%d\n", i);
+			for (i--; i >= 0; i--)
+				i2c_del_mux_adapter(stm->adap[i]);
+			return -ENODEV;
+		}
+	}
+
+	i2c_set_clientdata(client, stm);
+
+	return 0;
+};
+
+static int selftest_i2c_mux_remove(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct device_node *np = client->dev.of_node;
+	struct selftest_i2c_mux_data *stm = i2c_get_clientdata(client);
+	int i;
+
+	dev_dbg(dev, "%s for node @%s\n", __func__, np->full_name);
+	for (i = stm->nchans - 1; i >= 0; i--)
+		i2c_del_mux_adapter(stm->adap[i]);
+	return 0;
+}
+
+static const struct i2c_device_id selftest_i2c_mux_id[] = {
+	{ .name = "selftest-i2c-mux" },
+	{ }
+};
+
+static struct i2c_driver selftest_i2c_mux_driver = {
+	.driver = {
+		.name = "selftest-i2c-mux",
+		.owner = THIS_MODULE,
+	},
+	.probe = selftest_i2c_mux_probe,
+	.remove = selftest_i2c_mux_remove,
+	.id_table = selftest_i2c_mux_id,
+};
+
+#endif
+
+static int of_selftest_overlay_i2c_init(void)
+{
+	int ret;
+
+	ret = i2c_add_driver(&selftest_i2c_dev_driver);
+	if (selftest(ret == 0,
+			"could not register selftest i2c device driver\n"))
+		return ret;
+
+	ret = platform_driver_register(&selftest_i2c_bus_driver);
+	if (selftest(ret == 0,
+			"could not register selftest i2c bus driver\n"))
+		return ret;
+
+#if IS_ENABLED(CONFIG_I2C_MUX)
+	ret = i2c_add_driver(&selftest_i2c_mux_driver);
+	if (selftest(ret == 0,
+			"could not register selftest i2c mux driver\n"))
+		return ret;
+#endif
+
+	return 0;
+}
+
+static void of_selftest_overlay_i2c_cleanup(void)
+{
+#if IS_ENABLED(CONFIG_I2C_MUX)
+	i2c_del_driver(&selftest_i2c_mux_driver);
+#endif
+	platform_driver_unregister(&selftest_i2c_bus_driver);
+	i2c_del_driver(&selftest_i2c_dev_driver);
+}
+
+static void of_selftest_overlay_i2c_12(void)
+{
+	int ret;
+
+	/* device should enable */
+	ret = of_selftest_apply_overlay_check(12, 12, 0, 1, I2C_OVERLAY);
+	if (ret != 0)
+		return;
+
+	selftest(1, "overlay test %d passed\n", 12);
+}
+
+/* test deactivation of device */
+static void of_selftest_overlay_i2c_13(void)
+{
+	int ret;
+
+	/* device should disable */
+	ret = of_selftest_apply_overlay_check(13, 13, 1, 0, I2C_OVERLAY);
+	if (ret != 0)
 		return;
+
+	selftest(1, "overlay test %d passed\n", 13);
+}
+
+/* just check for i2c mux existence */
+static void of_selftest_overlay_i2c_14(void)
+{
 }
 
+static void of_selftest_overlay_i2c_15(void)
+{
+	int ret;
+
+	/* device should enable */
+	ret = of_selftest_apply_overlay_check(16, 15, 0, 1, I2C_OVERLAY);
+	if (ret != 0)
+		return;
+
+	selftest(1, "overlay test %d passed\n", 15);
+}
+
+#else
+
+static inline void of_selftest_overlay_i2c_14(void) { }
+static inline void of_selftest_overlay_i2c_15(void) { }
+
+#endif
+
 static void __init of_selftest_overlay(void)
 {
 	struct device_node *bus_np = NULL;
@@ -1445,15 +1845,15 @@ static void __init of_selftest_overlay(void)
 		goto out;
 	}
 
-	if (!of_path_platform_device_exists(selftest_path(100))) {
+	if (!of_selftest_device_exists(100, PDEV_OVERLAY)) {
 		selftest(0, "could not find selftest0 @ \"%s\"\n",
-				selftest_path(100));
+				selftest_path(100, PDEV_OVERLAY));
 		goto out;
 	}
 
-	if (of_path_platform_device_exists(selftest_path(101))) {
+	if (of_selftest_device_exists(101, PDEV_OVERLAY)) {
 		selftest(0, "selftest1 @ \"%s\" should not exist\n",
-				selftest_path(101));
+				selftest_path(101, PDEV_OVERLAY));
 		goto out;
 	}
 
@@ -1472,6 +1872,18 @@ static void __init of_selftest_overlay(void)
 	of_selftest_overlay_10();
 	of_selftest_overlay_11();
 
+#if IS_ENABLED(CONFIG_I2C)
+	if (selftest(of_selftest_overlay_i2c_init() == 0, "i2c init failed\n"))
+		goto out;
+
+	of_selftest_overlay_i2c_12();
+	of_selftest_overlay_i2c_13();
+	of_selftest_overlay_i2c_14();
+	of_selftest_overlay_i2c_15();
+
+	of_selftest_overlay_i2c_cleanup();
+#endif
+
 out:
 	of_node_put(bus_np);
 }
-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
