From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH] of_net: add mtd-mac-address support to of_get_mac_address()
Date: Tue, 16 Apr 2019 22:05:00 +0200
Message-ID: <1555445100-30936-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
List-Id: devicetree@vger.kernel.org

From: John Crispin <john@phrozen.org>

Many embedded devices have information such as MAC addresses stored
inside MTD devices. This patch allows us to add a property inside a node
describing a network interface. The new property points at a MTD
partition with an offset where the MAC address can be found.

This patch has originated in OpenWrt some time ago, so in order to
consider usefulness of this patch, here are some real-world numbers
which hopefully speak for themselves:

 * mtd-mac-address                used 497 times in 357 device tree files
 * mtd-mac-address-increment      used  74 times in  58 device tree files
 * mtd-mac-address-increment-byte used   1 time  in   1 device tree file

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
[cleanup of the patch for upstream submission]
Signed-off-by: Petr Štetiar <ynezz@true.cz>
---
 Documentation/devicetree/bindings/net/ethernet.txt |  5 ++
 drivers/of/of_net.c                                | 82 +++++++++++++++++++++-
 2 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet.txt b/Documentation/devicetree/bindings/net/ethernet.txt
index cfc376b..8a7891e 100644
--- a/Documentation/devicetree/bindings/net/ethernet.txt
+++ b/Documentation/devicetree/bindings/net/ethernet.txt
@@ -10,6 +10,11 @@ Documentation/devicetree/bindings/phy/phy-bindings.txt.
   the boot program; should be used in cases where the MAC address assigned to
   the device by the boot program is different from the "local-mac-address"
   property;
+- mtd-mac-address: specify a MTD partition + offset containing array of 6 bytes
+- mtd-mac-address-increment: specify number by which we should increment the
+  MAC address stored in the MTD partition
+- mtd-mac-address-increment-byte: specify octet/byte(0-5) in the MAC address,
+  where we should increment the value, defaults to octet 5 (the last one)
 - nvmem-cells: phandle, reference to an nvmem node for the MAC address;
 - nvmem-cell-names: string, should be "mac-address" if nvmem is to be used;
 - max-speed: number, specifies maximum speed in Mbit/s supported by the device;
diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
index 810ab0f..01b24d6 100644
--- a/drivers/of/of_net.c
+++ b/drivers/of/of_net.c
@@ -11,6 +11,7 @@
 #include <linux/of_net.h>
 #include <linux/phy.h>
 #include <linux/export.h>
+#include <linux/mtd/mtd.h>
 
 /**
  * of_get_phy_mode - Get phy mode for given device_node
@@ -39,7 +40,7 @@ int of_get_phy_mode(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_get_phy_mode);
 
-static const void *of_get_mac_addr(struct device_node *np, const char *name)
+static void *of_get_mac_addr(struct device_node *np, const char *name)
 {
 	struct property *pp = of_find_property(np, name, NULL);
 
@@ -48,6 +49,78 @@ static const void *of_get_mac_addr(struct device_node *np, const char *name)
 	return NULL;
 }
 
+static const void *of_get_mac_address_mtd(struct device_node *np)
+{
+#ifdef CONFIG_MTD
+	void *addr;
+	size_t retlen;
+	int size, ret;
+	u8 mac[ETH_ALEN];
+	phandle phandle;
+	const char *part;
+	const __be32 *list;
+	struct mtd_info *mtd;
+	struct property *prop;
+	u32 mac_inc = 0;
+	u32 inc_idx = ETH_ALEN-1;
+	struct device_node *mtd_np = NULL;
+
+	list = of_get_property(np, "mtd-mac-address", &size);
+	if (!list || (size != (2 * sizeof(*list))))
+		return NULL;
+
+	phandle = be32_to_cpup(list++);
+	if (phandle)
+		mtd_np = of_find_node_by_phandle(phandle);
+
+	if (!mtd_np)
+		return NULL;
+
+	part = of_get_property(mtd_np, "label", NULL);
+	if (!part)
+		part = mtd_np->name;
+
+	mtd = get_mtd_device_nm(part);
+	if (IS_ERR(mtd))
+		return NULL;
+
+	ret = mtd_read(mtd, be32_to_cpup(list), ETH_ALEN, &retlen, mac);
+	put_mtd_device(mtd);
+
+	of_property_read_u32(np, "mtd-mac-address-increment-byte", &inc_idx);
+	if (inc_idx > ETH_ALEN-1)
+		return NULL;
+
+	if (!of_property_read_u32(np, "mtd-mac-address-increment", &mac_inc))
+		mac[inc_idx] += mac_inc;
+
+	if (!is_valid_ether_addr(mac))
+		return NULL;
+
+	addr = of_get_mac_addr(np, "mac-address");
+	if (addr) {
+		memcpy(addr, mac, ETH_ALEN);
+		return addr;
+	}
+
+	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
+	if (!prop)
+		return NULL;
+
+	prop->name = "mac-address";
+	prop->length = ETH_ALEN;
+	prop->value = kmemdup(mac, ETH_ALEN, GFP_KERNEL);
+	if (!prop->value || of_add_property(np, prop))
+		goto free;
+
+	return prop->value;
+free:
+	kfree(prop->value);
+	kfree(prop);
+#endif
+	return NULL;
+}
+
 /**
  * Search the device tree for the best MAC address to use.  'mac-address' is
  * checked first, because that is supposed to contain to "most recent" MAC
@@ -65,11 +138,18 @@ static const void *of_get_mac_addr(struct device_node *np, const char *name)
  * addresses.  Some older U-Boots only initialized 'local-mac-address'.  In
  * this case, the real MAC is in 'local-mac-address', and 'mac-address' exists
  * but is all zeros.
+ *
+ * If a mtd-mac-address property exists, try to fetch the MAC address from the
+ * specified MTD device, and store it as a 'mac-address' property.
 */
 const void *of_get_mac_address(struct device_node *np)
 {
 	const void *addr;
 
+	addr = of_get_mac_address_mtd(np);
+	if (addr)
+		return addr;
+
 	addr = of_get_mac_addr(np, "mac-address");
 	if (addr)
 		return addr;
-- 
1.9.1
