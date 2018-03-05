From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH] regulator: core: Fix build errors
Date: Mon, 05 Mar 2018 14:03:59 +0100
Message-ID: <1520255039-11136-1-git-send-email-m.purski@samsung.com>
References: <CGME20180305130412eucas1p225fe12cfbdec20475a578a2b0463d0f5@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Maciej Purski <m.purski@samsung.com>
List-Id: devicetree@vger.kernel.org

Build errors detected by kbuild test robot occur on non-of
architectures.

This patch fixes this behavior as well as using plain integer instead
of NULL in of_count_phandle_with_args().

Fixes: 0c55103 ("regulator: core: Parse coupled regulators properties")
Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 drivers/regulator/internal.h     | 34 ++++++++++++++++++++++++++--------
 drivers/regulator/of_regulator.c |  8 +++++---
 2 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index f253a47..485db15 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -63,6 +63,14 @@ struct regulator_init_data *regulator_of_get_init_data(struct device *dev,
 			         const struct regulator_desc *desc,
 				 struct regulator_config *config,
 				 struct device_node **node);
+
+struct regulator_dev *of_parse_coupled_regulator(struct regulator_dev *rdev,
+						 int index);
+
+int of_get_n_coupled(struct regulator_dev *rdev);
+
+bool of_check_coupling_data(struct regulator_dev *rdev);
+
 #else
 static inline struct regulator_init_data *
 regulator_of_get_init_data(struct device *dev,
@@ -72,8 +80,25 @@ regulator_of_get_init_data(struct device *dev,
 {
 	return NULL;
 }
-#endif
 
+static inline struct regulator_dev *
+of_parse_coupled_regulator(struct regulator_dev *rdev,
+			   int index)
+{
+	return NULL;
+}
+
+static inline int of_get_n_coupled(struct regulator_dev *rdev)
+{
+	return 0;
+}
+
+static inline bool of_check_coupling_data(struct regulator_dev *rdev)
+{
+	return false;
+}
+
+#endif
 enum regulator_get_type {
 	NORMAL_GET,
 	EXCLUSIVE_GET,
@@ -83,11 +108,4 @@ enum regulator_get_type {
 
 struct regulator *_regulator_get(struct device *dev, const char *id,
 				 enum regulator_get_type get_type);
-
-struct regulator_dev *of_parse_coupled_regulator(struct regulator_dev *rdev,
-						 int index);
-
-int of_get_n_coupled(struct regulator_dev *rdev);
-
-bool of_check_coupling_data(struct regulator_dev *rdev);
 #endif
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index cf3210c..c6e61c7 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -421,7 +421,8 @@ int of_get_n_coupled(struct regulator_dev *rdev)
 	int n_phandles;
 
 	n_phandles = of_count_phandle_with_args(node,
-						"regulator-coupled-with", 0);
+						"regulator-coupled-with",
+						NULL);
 
 	return (n_phandles > 0) ? n_phandles : 0;
 }
@@ -434,7 +435,8 @@ static bool of_coupling_find_node(struct device_node *src,
 	bool found = false;
 
 	n_phandles = of_count_phandle_with_args(src,
-						"regulator-coupled-with", 0);
+						"regulator-coupled-with",
+						NULL);
 
 	for (i = 0; i < n_phandles; i++) {
 		struct device_node *tmp = of_parse_phandle(src,
@@ -495,7 +497,7 @@ bool of_check_coupling_data(struct regulator_dev *rdev)
 
 		c_n_phandles = of_count_phandle_with_args(c_node,
 							  "regulator-coupled-with",
-							  0);
+							  NULL);
 
 		if (c_n_phandles != n_phandles) {
 			dev_err(&rdev->dev, "number of couped reg phandles mismatch\n");
-- 
2.7.4
