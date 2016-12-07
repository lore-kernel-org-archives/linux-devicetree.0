Return-Path: <SRS0=ZpUN=XW=vba.kernel.org=vba@kernel.org>
From: Volodymyr Bendiuga <volodymyr.bendiuga@westermo.se>
Subject: [PATCH net-next] of: add optional naming of interfaces
Date: Wed,  7 Dec 2016 14:12:29 +0100
Message-Id: <1481116349-20678-1-git-send-email-volodymyr.bendiuga@westermo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, frowand.list@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, volodymyr.bendiuga@gmail.com
Cc: Jonas Johansson <jonas.johansson@westermo.se>, =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
List-ID: <devicetree@vger.kernel.org>

From: Jonas Johansson <jonas.johansson@westermo.se>

Signed-off-by: Mattias Walström <lazzer@gmail.com>
Signed-off-by: Jonas Johansson <jonas.johansson@westermo.se>
---
 Documentation/devicetree/bindings/net/ethernet.txt |  1 +
 drivers/of/of_net.c                                | 19 +++++++++++++++++++
 include/linux/of_net.h                             |  1 +
 3 files changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet.txt b/Documentation/devicetree/bindings/net/ethernet.txt
index 0515095..fcfe6a3 100644
--- a/Documentation/devicetree/bindings/net/ethernet.txt
+++ b/Documentation/devicetree/bindings/net/ethernet.txt
@@ -6,6 +6,7 @@ The following properties are common to the Ethernet controllers:
   the boot program; should be used in cases where the MAC address assigned to
   the device by the boot program is different from the "local-mac-address"
   property;
+- linux,interface-name, optional name of the interface.
 - max-speed: number, specifies maximum speed in Mbit/s supported by the device;
 - max-frame-size: number, maximum transfer unit (IEEE defined MTU), rather than
   the maximum frame size (there's contradiction in ePAPR).
diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
index d820f3e..ebff92d 100644
--- a/drivers/of/of_net.c
+++ b/drivers/of/of_net.c
@@ -80,3 +80,22 @@ const void *of_get_mac_address(struct device_node *np)
 	return of_get_mac_addr(np, "address");
 }
 EXPORT_SYMBOL(of_get_mac_address);
+
+/**
+ * of_get_interface_name - Get interface name for given device_node
+ * @np:	Pointer to the given device_node
+ *
+ * The function gets the interface-name specified for np. It returns
+ * the name on success, NULL if not specified or on error.
+ */
+const char *of_get_interface_name(struct device_node *np)
+{
+	struct property *pp;
+
+	pp = of_find_property(np, "linux,interface-name", NULL);
+	if (pp && pp->length < IFNAMSIZ)
+		return pp->value;
+
+	return NULL;
+}
+EXPORT_SYMBOL(of_get_interface_name);
diff --git a/include/linux/of_net.h b/include/linux/of_net.h
index 9cd72aa..bcbc6cb 100644
--- a/include/linux/of_net.h
+++ b/include/linux/of_net.h
@@ -14,6 +14,7 @@ struct net_device;
 extern int of_get_phy_mode(struct device_node *np);
 extern const void *of_get_mac_address(struct device_node *np);
 extern struct net_device *of_find_net_device_by_node(struct device_node *np);
+extern const char *of_get_interface_name(struct device_node *np);
 #else
 static inline int of_get_phy_mode(struct device_node *np)
 {
-- 
2.7.4
