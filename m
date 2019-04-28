From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH v2 1/4] of_net: Add NVMEM support to of_get_mac_address
Date: Sun, 28 Apr 2019 14:53:19 +0200
Message-ID: <1556456002-13430-2-git-send-email-ynezz@true.cz>
References: <1556456002-13430-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556456002-13430-1-git-send-email-ynezz@true.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Alban Bedel <albeu@free.fr>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>
List-Id: devicetree@vger.kernel.org

Many embedded devices have information such as MAC addresses stored
inside NVMEMs like EEPROMs and so on. Currently there are only two
drivers in the tree which benefit from NVMEM bindings.

Adding support for NVMEM into every other driver would mean adding a lot
of repetitive code. This patch allows us to configure MAC addresses in
various devices like ethernet and wireless adapters directly from
of_get_mac_address, which is already used by almost every driver in the
tree.

Predecessor of this patch which used directly MTD layer has originated
in OpenWrt some time ago and supports already about 497 use cases in 357
device tree files.

Cc: Alban Bedel <albeu@free.fr>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Petr Štetiar <ynezz@true.cz>
---

 Changes since v1:

  * moved handling of nvmem after mac-address and local-mac-address properties

 drivers/of/of_net.c | 42 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
index d820f3e..8ce4f47 100644
--- a/drivers/of/of_net.c
+++ b/drivers/of/of_net.c
@@ -8,6 +8,7 @@
 #include <linux/etherdevice.h>
 #include <linux/kernel.h>
 #include <linux/of_net.h>
+#include <linux/of_platform.h>
 #include <linux/phy.h>
 #include <linux/export.h>
 
@@ -47,12 +48,45 @@ static const void *of_get_mac_addr(struct device_node *np, const char *name)
 	return NULL;
 }
 
+static const void *of_get_mac_addr_nvmem(struct device_node *np)
+{
+	int r;
+	u8 mac[ETH_ALEN];
+	struct property *pp;
+	struct platform_device *pdev = of_find_device_by_node(np);
+
+	if (!pdev)
+		return NULL;
+
+	r = nvmem_get_mac_address(&pdev->dev, &mac);
+	if (r < 0)
+		return NULL;
+
+	pp = kzalloc(sizeof(*pp), GFP_KERNEL);
+	if (!pp)
+		return NULL;
+
+	pp->name = "nvmem-mac-address";
+	pp->length = ETH_ALEN;
+	pp->value = kmemdup(mac, ETH_ALEN, GFP_KERNEL);
+	if (!pp->value || of_add_property(np, pp))
+		goto free;
+
+	return pp->value;
+free:
+	kfree(pp->value);
+	kfree(pp);
+
+	return NULL;
+}
+
 /**
  * Search the device tree for the best MAC address to use.  'mac-address' is
  * checked first, because that is supposed to contain to "most recent" MAC
  * address. If that isn't set, then 'local-mac-address' is checked next,
- * because that is the default address.  If that isn't set, then the obsolete
- * 'address' is checked, just in case we're using an old device tree.
+ * because that is the default address.  If that isn't set, try to get MAC
+ * address from nvmem cell named 'mac-address'. If that isn't set, then the
+ * obsolete 'address' is checked, just in case we're using an old device tree.
  *
  * Note that the 'address' property is supposed to contain a virtual address of
  * the register set, but some DTS files have redefined that property to be the
@@ -77,6 +111,10 @@ const void *of_get_mac_address(struct device_node *np)
 	if (addr)
 		return addr;
 
+	addr = of_get_mac_addr_nvmem(np);
+	if (addr)
+		return addr;
+
 	return of_get_mac_addr(np, "address");
 }
 EXPORT_SYMBOL(of_get_mac_address);
-- 
1.9.1
