From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [RFC 2/3] of: add IEEE 802.11 device configuration support code
Date: Mon,  3 Oct 2016 00:50:58 +0200
Message-ID: <20161002225059.16757-3-martin.blumenstingl@googlemail.com>
References: <20161002225059.16757-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161002225059.16757-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for parsing the device tree of IEEE 802.11 devices.

Some drivers (for example ath9k) already have custom platform_data
code to enable/disable specific bands. There are some other drivers
(for example the currently out-of-tree mt76 driver) which need similar
logic.
Thus we provide a generic implementation for IEEE 802.11 device
configuration OF properties, which can be used by all drivers.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 drivers/of/Kconfig           |  4 +++
 drivers/of/Makefile          |  1 +
 drivers/of/of_ieee80211.c    | 83 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_ieee80211.h | 38 ++++++++++++++++++++
 4 files changed, 126 insertions(+)
 create mode 100644 drivers/of/of_ieee80211.c
 create mode 100644 include/linux/of_ieee80211.h

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index bc07ad3..3ef5e12 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -116,4 +116,8 @@ config OF_OVERLAY
 config OF_NUMA
 	bool
 
+config OF_IEEE80211
+	depends on CFG80211 || WLAN
+	def_bool y
+
 endif # OF
diff --git a/drivers/of/Makefile b/drivers/of/Makefile
index d7efd9d..00bd746 100644
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -14,5 +14,6 @@ obj-$(CONFIG_OF_RESERVED_MEM) += of_reserved_mem.o
 obj-$(CONFIG_OF_RESOLVE)  += resolver.o
 obj-$(CONFIG_OF_OVERLAY) += overlay.o
 obj-$(CONFIG_OF_NUMA) += of_numa.o
+obj-$(CONFIG_OF_IEEE80211) += of_ieee80211.o
 
 obj-$(CONFIG_OF_UNITTEST) += unittest-data/
diff --git a/drivers/of/of_ieee80211.c b/drivers/of/of_ieee80211.c
new file mode 100644
index 0000000..f529058
--- /dev/null
+++ b/drivers/of/of_ieee80211.c
@@ -0,0 +1,83 @@
+/*
+ * OF helpers for IEEE 802.11 devices.
+ *
+ * Copyright (C) 2016 Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ *
+ * This file contains the code used to make IRQ descriptions in the
+ * device tree to actual irq numbers on an interrupt controller
+ * driver.
+ */
+#include <linux/export.h>
+#include <linux/of.h>
+#include <linux/of_ieee80211.h>
+
+/**
+ * of_ieee80211_is_2ghz_enabled - Check if the IEEE 802.11 2.4GHz frequency
+ * band is enabled for the given device_node
+ * @np:	Pointer to the given device_node
+ *
+ * When the the 2.4GHz band is defined in an conflicting state (both enabled
+ * and disabled are set) then we leave it disabled.
+ */
+bool of_ieee80211_is_2ghz_enabled(struct device_node *np)
+{
+	bool enabled = of_property_read_bool(np, "enable-ieee80211-2ghz");
+
+	if (enabled && of_ieee80211_is_2ghz_disabled(np)) {
+		pr_err("%s: conflicting configuration for the 2.4GHz band\n",
+		       of_node_full_name(np));
+		return false;
+	}
+
+	return enabled;
+}
+EXPORT_SYMBOL(of_ieee80211_is_2ghz_enabled);
+
+/**
+ * of_ieee80211_is_5ghz_enabled - Check if the IEEE 802.11 5GHz frequency band
+ * is enabled for the given device_node
+ * @np:	Pointer to the given device_node
+ *
+ * When the the 5GHz band is defined in an conflicting state (both enabled
+ * and disabled are set) then we leave it disabled.
+ */
+bool of_ieee80211_is_5ghz_enabled(struct device_node *np)
+{
+	bool enabled = of_property_read_bool(np, "enable-ieee80211-5ghz");
+
+	if (enabled && of_ieee80211_is_2ghz_disabled(np)) {
+		pr_err("%s: conflicting configuration for the 5GHz band\n",
+		       of_node_full_name(np));
+		return false;
+	}
+
+	return enabled;
+}
+EXPORT_SYMBOL(of_ieee80211_is_5ghz_enabled);
+
+/**
+ * of_ieee80211_is_2ghz_disabled - Check if the IEEE 802.11 2.4GHz frequency
+ * band is disabled for the given device_node
+ * @np:	Pointer to the given device_node
+ */
+bool of_ieee80211_is_2ghz_disabled(struct device_node *np)
+{
+	return of_property_read_bool(np, "disable-ieee80211-2ghz");
+}
+EXPORT_SYMBOL(of_ieee80211_is_2ghz_disabled);
+
+/**
+ * of_ieee80211_is_5ghz_disabled - Check if the IEEE 802.11 5GHz frequency
+ * band is disabled for the given device_node
+ * @np:	Pointer to the given device_node
+ */
+bool of_ieee80211_is_5ghz_disabled(struct device_node *np)
+{
+	return of_property_read_bool(np, "disable-ieee80211-5ghz");
+}
+EXPORT_SYMBOL(of_ieee80211_is_5ghz_disabled);
diff --git a/include/linux/of_ieee80211.h b/include/linux/of_ieee80211.h
new file mode 100644
index 0000000..a25a66e
--- /dev/null
+++ b/include/linux/of_ieee80211.h
@@ -0,0 +1,38 @@
+#ifndef __OF_IEEE80211_H
+#define __OF_IEEE80211_H
+
+struct device_node;
+
+#ifdef CONFIG_OF_IEEE80211
+
+bool of_ieee80211_is_2ghz_enabled(struct device_node *np);
+bool of_ieee80211_is_5ghz_enabled(struct device_node *np);
+
+bool of_ieee80211_is_2ghz_disabled(struct device_node *np);
+bool of_ieee80211_is_5ghz_disabled(struct device_node *np);
+
+#else /* CONFIG_OF_IEEE80211 */
+
+static inline bool of_ieee80211_is_2ghz_enabled(struct device_node *np)
+{
+	return false;
+}
+
+static inline bool of_ieee80211_is_5ghz_enabled(struct device_node *np)
+{
+	return false;
+}
+
+static inline bool of_ieee80211_is_2ghz_disabled(struct device_node *np)
+{
+	return false;
+}
+
+static inline bool of_ieee80211_is_5ghz_disabled(struct device_node *np)
+{
+	return false;
+}
+
+#endif /* CONFIG_OF_IEEE80211 */
+
+#endif /* __OF_IEEE80211_H */
-- 
2.10.0
