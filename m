From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 2/6] of: unittest: Add indirect overlay target test
Date: Mon,  9 May 2016 21:05:43 +0300
Message-ID: <1462817147-7620-3-git-send-email-pantelis.antoniou@konsulko.com>
References: <1462817147-7620-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462817147-7620-1-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Grant Likely <grant.likely@secretlab.ca>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

Add a unittest for the indirect overlay target case.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/of/unittest-data/testcases.dts      |  9 +++++
 drivers/of/unittest-data/tests-overlay.dtsi | 19 ++++++++++
 drivers/of/unittest.c                       | 59 +++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)

diff --git a/drivers/of/unittest-data/testcases.dts b/drivers/of/unittest-data/testcases.dts
index 12f7c3d..ec17ab7 100644
--- a/drivers/of/unittest-data/testcases.dts
+++ b/drivers/of/unittest-data/testcases.dts
@@ -75,5 +75,14 @@
 				target = <0x00000000>;
 			};
 		};
+		overlay16 {
+			fragment@0 {
+				target-indirect {
+					unittest16 {
+						target = <0x00000000>;
+					};
+				};
+			};
+		};
 	};
 }; };
diff --git a/drivers/of/unittest-data/tests-overlay.dtsi b/drivers/of/unittest-data/tests-overlay.dtsi
index 02ba56c..881d863 100644
--- a/drivers/of/unittest-data/tests-overlay.dtsi
+++ b/drivers/of/unittest-data/tests-overlay.dtsi
@@ -110,6 +110,12 @@
 						};
 					};
 				};
+
+				unittest16: test-unittest16 {
+					compatible = "unittest";
+					status = "disabled";
+					reg = <16>;
+				};
 			};
 		};
 
@@ -325,5 +331,18 @@
 			};
 		};
 
+		/* test enable using indirect functionality */
+		overlay16 {
+			fragment@0 {
+				target-indirect {
+					unittest16 {
+						target = <&unittest16>;
+					};
+				};
+				__overlay__ {
+					status = "okay";
+				};
+			};
+		};
 	};
 };
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index ff6939b..dd289c7 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1921,6 +1921,63 @@ static inline void of_unittest_overlay_i2c_15(void) { }
 
 #endif
 
+static void of_unittest_overlay_16(void)
+{
+	int ret;
+	int overlay_nr = 16;
+	int unittest_nr = 16;
+	enum overlay_type ovtype = PDEV_OVERLAY;
+	int before = 0;
+	int after = 1;
+	struct device_node *np = NULL;
+	int id = -1;
+
+	/* unittest device must not be in before state */
+	if (of_unittest_device_exists(unittest_nr, ovtype) != before) {
+		unittest(0, "overlay @\"%s\" with device @\"%s\" %s\n",
+				overlay_path(overlay_nr),
+				unittest_path(unittest_nr, ovtype),
+				!before ? "enabled" : "disabled");
+		return;
+	}
+
+	np = of_find_node_by_path(overlay_path(overlay_nr));
+	if (np == NULL) {
+		unittest(0, "could not find overlay node @\"%s\"\n",
+				overlay_path(overlay_nr));
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = of_overlay_create_indirect(np, "unittest16");
+	if (ret < 0) {
+		unittest(0, "could not create overlay from \"%s\"\n",
+				overlay_path(overlay_nr));
+		goto out;
+	}
+	id = ret;
+	of_unittest_track_overlay(id);
+
+	ret = 0;
+
+out:
+	of_node_put(np);
+
+	if (ret)
+		return;
+
+	/* unittest device must be to set to after state */
+	if (of_unittest_device_exists(unittest_nr, ovtype) != after) {
+		unittest(0, "overlay @\"%s\" failed to create @\"%s\" %s\n",
+				overlay_path(overlay_nr),
+				unittest_path(unittest_nr, ovtype),
+				!after ? "enabled" : "disabled");
+		return;
+	}
+
+	unittest(1, "overlay test %d passed\n", 16);
+}
+
 static void __init of_unittest_overlay(void)
 {
 	struct device_node *bus_np = NULL;
@@ -1972,6 +2029,8 @@ static void __init of_unittest_overlay(void)
 	of_unittest_overlay_10();
 	of_unittest_overlay_11();
 
+	of_unittest_overlay_16();
+
 #if IS_BUILTIN(CONFIG_I2C)
 	if (unittest(of_unittest_overlay_i2c_init() == 0, "i2c init failed\n"))
 		goto out;
-- 
1.7.12
