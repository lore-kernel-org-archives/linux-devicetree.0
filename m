From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 1/2] regulator: core: add regulator_has_continuous_voltage_range()
Date: Wed,  8 Mar 2017 12:02:45 -0800
Message-ID: <20170308200246.126331-1-mka@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The new function allows consumers to determine if a regulator is
continuous or discrete, and whether the results of
regulator_count_voltages() and regulator_list_voltage() correspond
to the regulator itself or its supply.

Change-Id: I1198cee9fff60dc747a02860e9652034f4d5da33
Signed-off-by: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Added regulator_has_continuous_voltage_range()

 drivers/regulator/core.c           | 16 ++++++++++++++++
 include/linux/regulator/consumer.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 53d4fc70dbd0..ce1d02792ef4 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2552,6 +2552,22 @@ int regulator_count_voltages(struct regulator *regulator)
 EXPORT_SYMBOL_GPL(regulator_count_voltages);
 
 /**
+ * regulator_has_continuous_voltage_range - is the regulator continuous
+ * or discrete
+ * @regulator: regulator source
+ *
+ * Returns true if the regulator has a continuous voltage range and
+ * false for discrete voltage regulators.
+ */
+int regulator_has_continuous_voltage_range(struct regulator *regulator)
+{
+	struct regulator_dev	*rdev = regulator->rdev;
+
+	return rdev->desc->continuous_voltage_range;
+}
+EXPORT_SYMBOL_GPL(regulator_has_continuous_voltage_range);
+
+/**
  * regulator_list_voltage - enumerate supported voltages
  * @regulator: regulator source
  * @selector: identify voltage to list
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index ea0fffa5faeb..19945b5a702e 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -241,6 +241,7 @@ void regulator_bulk_free(int num_consumers,
 			 struct regulator_bulk_data *consumers);
 
 int regulator_count_voltages(struct regulator *regulator);
+int regulator_has_continuous_voltage_range(struct regulator *regulator);
 int regulator_list_voltage(struct regulator *regulator, unsigned selector);
 int regulator_is_supported_voltage(struct regulator *regulator,
 				   int min_uV, int max_uV);
-- 
2.12.0.246.ga2ecc84866-goog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
