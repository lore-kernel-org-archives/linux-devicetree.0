From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v7 4/6] regulator: core: Resolve coupled regulators
Date: Mon, 23 Apr 2018 16:33:40 +0200
Message-ID: <1524494022-22260-5-git-send-email-m.purski@samsung.com>
References: <1524494022-22260-1-git-send-email-m.purski@samsung.com>
        <CGME20180423143401eucas1p1cfe9b2c807cf88b3f3b68b7b2f580e83@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1524494022-22260-1-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Maciej Purski <m.purski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Odroid XU3/4 and other Exynos5422 based boards there is a case, that
different devices on the board are supplied by different regulators
with non-fixed voltages. If one of these devices temporarily requires
higher voltage, there might occur a situation that the spread between
two devices' voltages is so high, that there is a risk of changing
'high' and 'low' states on the interconnection between devices powered
by those regulators.

Fill coupling descriptor with data obtained from DTS using previously
defined of_functions. Fail to register a regulator, if some data
inconsistency occurs. If some coupled regulators are not yet registered,
don't fail to register, but try to resolve them in late init call.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 drivers/regulator/core.c | 100 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index acca5de..82b002e 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -4117,6 +4117,96 @@ static int regulator_register_resolve_supply(struct device *dev, void *data)
 	return 0;
 }
 
+static int regulator_fill_coupling_array(struct regulator_dev *rdev)
+{
+	struct coupling_desc *c_desc = &rdev->coupling_desc;
+	int n_coupled = c_desc->n_coupled;
+	struct regulator_dev *c_rdev;
+	int i;
+
+	for (i = 1; i < n_coupled; i++) {
+		/* already resolved */
+		if (c_desc->coupled_rdevs[i])
+			continue;
+
+		c_rdev = of_parse_coupled_regulator(rdev, i - 1);
+
+		if (c_rdev) {
+			c_desc->coupled_rdevs[i] = c_rdev;
+			c_desc->n_resolved++;
+		}
+	}
+
+	if (rdev->coupling_desc.n_resolved < n_coupled)
+		return -1;
+	else
+		return 0;
+}
+
+static int regulator_register_fill_coupling_array(struct device *dev,
+						  void *data)
+{
+	struct regulator_dev *rdev = dev_to_rdev(dev);
+
+	if (!IS_ENABLED(CONFIG_OF))
+		return 0;
+
+	if (regulator_fill_coupling_array(rdev))
+		rdev_dbg(rdev, "unable to resolve coupling\n");
+
+	return 0;
+}
+
+static int regulator_resolve_coupling(struct regulator_dev *rdev)
+{
+	int n_phandles;
+
+	if (!IS_ENABLED(CONFIG_OF))
+		n_phandles = 0;
+	else
+		n_phandles = of_get_n_coupled(rdev);
+
+	if (n_phandles + 1 > MAX_COUPLED) {
+		rdev_err(rdev, "too many regulators coupled\n");
+		return -EPERM;
+	}
+
+	/*
+	 * Every regulator should always have coupling descriptor filled with
+	 * at least pointer to itself.
+	 */
+	rdev->coupling_desc.coupled_rdevs[0] = rdev;
+	rdev->coupling_desc.n_coupled = n_phandles + 1;
+	rdev->coupling_desc.n_resolved++;
+
+	/* regulator isn't coupled */
+	if (n_phandles == 0)
+		return 0;
+
+	/* regulator, which can't change its voltage, can't be coupled */
+	if (!regulator_ops_is_valid(rdev, REGULATOR_CHANGE_VOLTAGE)) {
+		rdev_err(rdev, "voltage operation not allowed\n");
+		return -EPERM;
+	}
+
+	if (rdev->constraints->max_spread <= 0) {
+		rdev_err(rdev, "wrong max_spread value\n");
+		return -EPERM;
+	}
+
+	if (!of_check_coupling_data(rdev))
+		return -EPERM;
+
+	/*
+	 * After everything has been checked, try to fill rdevs array
+	 * with pointers to regulators parsed from device tree. If some
+	 * regulators are not registered yet, retry in late init call
+	 */
+	regulator_fill_coupling_array(rdev);
+
+	return 0;
+}
+
 /**
  * regulator_register - register regulator
  * @regulator_desc: regulator to register
@@ -4250,6 +4340,13 @@ regulator_register(const struct regulator_desc *regulator_desc,
 	if (ret < 0)
 		goto wash;
 
+	mutex_lock(&regulator_list_mutex);
+	ret = regulator_resolve_coupling(rdev);
+	mutex_unlock(&regulator_list_mutex);
+
+	if (ret != 0)
+		goto wash;
+
 	/* add consumers devices */
 	if (init_data) {
 		mutex_lock(&regulator_list_mutex);
@@ -4744,6 +4841,9 @@ static int __init regulator_init_complete(void)
 	class_for_each_device(&regulator_class, NULL, NULL,
 			      regulator_late_cleanup);
 
+	class_for_each_device(&regulator_class, NULL, NULL,
+			      regulator_register_fill_coupling_array);
+
 	return 0;
 }
 late_initcall_sync(regulator_init_complete);
-- 
2.7.4
