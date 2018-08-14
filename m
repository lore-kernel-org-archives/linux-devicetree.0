From: Brian Norris <computersforpeace@gmail.com>
Subject: [RFC PATCH v1 3/3] firmware: vpd: add MAC address parser
Date: Tue, 14 Aug 2018 15:37:58 -0700
Message-ID: <20180814223758.117433-4-briannorris@chromium.org>
References: <20180814223758.117433-1-briannorris@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180814223758.117433-1-briannorris@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

Device trees can now specify their MAC address via something like:

	mac-address-lookup = "vpd:wifi_mac0";

instead of requiring boot firmware to parse and splice the FDT itself.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/firmware/google/vpd.c | 67 +++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/google/vpd.c
index e9db895916c3..b2b08497db32 100644
--- a/drivers/firmware/google/vpd.c
+++ b/drivers/firmware/google/vpd.c
@@ -16,6 +16,7 @@
  */
 
 #include <linux/ctype.h>
+#include <linux/if_ether.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -24,6 +25,7 @@
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 
@@ -173,6 +175,36 @@ static ssize_t vpd_section_read(struct file *filp, struct kobject *kobp,
 				       sec->bin_attr.size);
 }
 
+static const char *__vpd_get_entry(struct vpd_section *sec, const char *key)
+{
+	struct vpd_attrib_info *info;
+
+	list_for_each_entry(info, &sec->attribs, list)
+		if (!strcmp(info->key, key))
+			return info->value;
+
+	return NULL;
+}
+
+static const char *vpd_get_entry(const char *key)
+{
+	const char *value;
+
+	if (rw_vpd.enabled) {
+		value = __vpd_get_entry(&rw_vpd, key);
+		if (value)
+			return value;
+	}
+
+	if (ro_vpd.enabled) {
+		value = __vpd_get_entry(&ro_vpd, key);
+		if (value)
+			return value;
+	}
+
+	return NULL;
+}
+
 static int vpd_section_create_attribs(struct vpd_section *sec)
 {
 	s32 consumed;
@@ -286,6 +318,37 @@ static int vpd_sections_init(phys_addr_t physaddr)
 	return 0;
 }
 
+/*
+ * 'key' is typically something like 'wifi_mac0' or 'ether_mac1'. Values are 12
+ * character strings of MAC address digits, in hex.
+ */
+static int vpd_lookup_mac_address(const char *key, u8 *mac)
+{
+	const char *entry;
+	int ret;
+
+	if (!key)
+		return -EINVAL;
+
+	entry = vpd_get_entry(key);
+	if (!entry)
+		return -ENOENT;
+
+	if (strlen(entry) != ETH_ALEN * 2)
+		return -EINVAL;
+
+	ret = hex2bin(mac, entry, ETH_ALEN);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static struct device_mac_addr_provider vpd_mac_addr_provider = {
+	.prefix		= "google-vpd",
+	.lookup		= &vpd_lookup_mac_address,
+};
+
 static int vpd_probe(struct coreboot_device *dev)
 {
 	int ret;
@@ -300,11 +363,15 @@ static int vpd_probe(struct coreboot_device *dev)
 		return ret;
 	}
 
+	device_register_mac_addr_provider(&vpd_mac_addr_provider);
+
 	return 0;
 }
 
 static int vpd_remove(struct coreboot_device *dev)
 {
+	device_unregister_mac_addr_provider(&vpd_mac_addr_provider);
+
 	vpd_section_destroy(&ro_vpd);
 	vpd_section_destroy(&rw_vpd);
 
-- 
2.18.0.865.gffc8e1a3cd6-goog
