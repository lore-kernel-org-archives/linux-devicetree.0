From: Brian Norris <computersforpeace@gmail.com>
Subject: [RFC PATCH v1 2/3] device property: Support complex MAC address lookup
Date: Tue, 14 Aug 2018 15:37:57 -0700
Message-ID: <20180814223758.117433-3-briannorris@chromium.org>
References: <20180814223758.117433-1-briannorris@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180814223758.117433-1-briannorris@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

Some firmwares include data tables that can be used to derive a MAC
address for devices on the system, but those firmwares don't directly
stash the MAC address in a device property. Support having other drivers
register lookup functions, where the device property contains
"<format>:<key>" strings; a lookup driver can register support for
handling "<format>", and "<key>" can be used by the format parser to
identify which MAC address is being requested.

This is particularly useful for the Google Vital Product Data (VPD)
format [1], which holds various product-specific key/value pairs, often
stashed in the boot flash.

[1] Ref:
https://chromium.googlesource.com/chromiumos/platform/vpd/+/master/README.md

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/base/property.c  | 83 +++++++++++++++++++++++++++++++++++++++-
 include/linux/property.h | 23 +++++++++++
 2 files changed, 104 insertions(+), 2 deletions(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 240ab5230ff6..fae3390fc56c 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -10,6 +10,7 @@
 #include <linux/acpi.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_graph.h>
@@ -1264,6 +1265,78 @@ static void *fwnode_get_mac_addr(struct fwnode_handle *fwnode,
 	return NULL;
 }
 
+static LIST_HEAD(mac_addr_providers);
+static DEFINE_MUTEX(mac_addr_providers_mutex);
+
+void device_register_mac_addr_provider(struct device_mac_addr_provider *prov)
+{
+	mutex_lock(&mac_addr_providers_mutex);
+	list_add(&prov->entry, &mac_addr_providers);
+	mutex_unlock(&mac_addr_providers_mutex);
+}
+EXPORT_SYMBOL(device_register_mac_addr_provider);
+
+void device_unregister_mac_addr_provider(struct device_mac_addr_provider *prov)
+{
+	struct device_mac_addr_provider *p;
+
+	mutex_lock(&mac_addr_providers_mutex);
+	list_for_each_entry(p, &mac_addr_providers, entry) {
+		if (p == prov) {
+			list_del(&p->entry);
+			goto out;
+		}
+	}
+
+out:
+	mutex_unlock(&mac_addr_providers_mutex);
+}
+EXPORT_SYMBOL(device_unregister_mac_addr_provider);
+
+static void *fwnode_lookup_mac_addr(struct fwnode_handle *fwnode,
+				    char *addr, int alen)
+{
+	struct device_mac_addr_provider *prov;
+	const char *prop, *sep;
+	u8 mac[ETH_ALEN];
+	int ret;
+
+	ret = fwnode_property_read_string(fwnode, "mac-address-lookup", &prop);
+	if (ret)
+		return NULL;
+
+	sep = strchr(prop, ':');
+	if (!sep)
+		return NULL;
+
+	if (alen != ETH_ALEN)
+		return NULL;
+
+	mutex_lock(&mac_addr_providers_mutex);
+	list_for_each_entry(prov, &mac_addr_providers, entry) {
+		if (strncmp(prov->prefix, prop, strlen(prov->prefix)))
+			continue;
+
+		if (prop + strlen(prov->prefix) != sep)
+			continue;
+
+		ret = prov->lookup(sep + 1, mac);
+		if (ret)
+			continue;
+
+		if (!is_valid_ether_addr(mac))
+			continue;
+
+		ether_addr_copy(addr, mac);
+
+		mutex_unlock(&mac_addr_providers_mutex);
+		return addr;
+	}
+	mutex_unlock(&mac_addr_providers_mutex);
+
+	return NULL;
+}
+
 /**
  * fwnode_get_mac_address - Get the MAC from the firmware node
  * @fwnode:	Pointer to the firmware node
@@ -1274,7 +1347,9 @@ static void *fwnode_get_mac_addr(struct fwnode_handle *fwnode,
  * checked first, because that is supposed to contain to "most recent" MAC
  * address. If that isn't set, then 'local-mac-address' is checked next,
  * because that is the default address.  If that isn't set, then the obsolete
- * 'address' is checked, just in case we're using an old device tree.
+ * 'address' is checked, just in case we're using an old device tree.  And
+ * finally, we check for a method of indirect MAC address lookup, via
+ * 'mac-address-lookup'.
  *
  * Note that the 'address' property is supposed to contain a virtual address of
  * the register set, but some DTS files have redefined that property to be the
@@ -1299,7 +1374,11 @@ void *fwnode_get_mac_address(struct fwnode_handle *fwnode, char *addr, int alen)
 	if (res)
 		return res;
 
-	return fwnode_get_mac_addr(fwnode, "address", addr, alen);
+	res = fwnode_get_mac_addr(fwnode, "address", addr, alen);
+	if (res)
+		return res;
+
+	return fwnode_lookup_mac_addr(fwnode, addr, alen);
 }
 EXPORT_SYMBOL(fwnode_get_mac_address);
 
diff --git a/include/linux/property.h b/include/linux/property.h
index ac8a1ebc4c1b..aca5dbb51e19 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -14,6 +14,7 @@
 #define _LINUX_PROPERTY_H_
 
 #include <linux/fwnode.h>
+#include <linux/list.h>
 #include <linux/types.h>
 
 struct device;
@@ -285,6 +286,28 @@ const void *device_get_match_data(struct device *dev);
 
 int device_get_phy_mode(struct device *dev);
 
+/**
+ * struct device_mac_addr_provider - MAC address provider
+ *
+ * Provide methods by which the rest of the kernel can retrieve MAC addresses,
+ * e.g., from a firmware table.
+ *
+ * @entry: list head, for keeping track of all providers
+ * @prefix: string which uniquely identifies the provider
+ * @lookup: Look up a MAC address by key. The provider may associate this @key
+ *	with a stored MAC address; if a match is found, the provider copies the
+ *	associated MAC address to @mac. If not found, a non-zero error code is
+ *	returned.
+ */
+struct device_mac_addr_provider {
+	struct list_head entry;
+	const char *prefix;
+	int (*lookup)(const char *key, u8 *mac);
+};
+
+void device_register_mac_addr_provider(struct device_mac_addr_provider *prov);
+void device_unregister_mac_addr_provider(struct device_mac_addr_provider *prov);
+
 void *device_get_mac_address(struct device *dev, char *addr, int alen);
 
 int fwnode_get_phy_mode(struct fwnode_handle *fwnode);
-- 
2.18.0.865.gffc8e1a3cd6-goog
