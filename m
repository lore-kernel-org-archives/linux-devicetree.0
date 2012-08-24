From: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Subject: [PATCH 3.6.0-rc3 1/2] of/mdio: Add dummy functions in of_mdio.h.
Date: Fri, 24 Aug 2012 12:58:59 +0100
Message-ID: <1345809539-27684-1-git-send-email-srinivas.kandagatla@st.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, laurentp@cse-semaphore.com
Cc: srinivas.kandagatla@st.com, davem@davemloft.net, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla@st.com>

This patch adds dummy functions in of_mdio.h, so that driver need not
ifdef there code with CONFIG_OF.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@st.com>
---
 include/linux/of_mdio.h |   33 +++++++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/include/linux/of_mdio.h b/include/linux/of_mdio.h
index 912c27a..6ef49b8 100644
--- a/include/linux/of_mdio.h
+++ b/include/linux/of_mdio.h
@@ -12,6 +12,7 @@
 #include <linux/phy.h>
 #include <linux/of.h>
 
+#ifdef CONFIG_OF
 extern int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np);
 extern struct phy_device *of_phy_find_device(struct device_node *phy_np);
 extern struct phy_device *of_phy_connect(struct net_device *dev,
@@ -24,4 +25,36 @@ extern struct phy_device *of_phy_connect_fixed_link(struct net_device *dev,
 
 extern struct mii_bus *of_mdio_find_bus(struct device_node *mdio_np);
 
+#else /* CONFIG_OF */
+int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
+{
+	return -ENOSYS;
+}
+
+struct phy_device *of_phy_find_device(struct device_node *phy_np)
+{
+	return NULL;
+}
+
+struct phy_device *of_phy_connect(struct net_device *dev,
+					 struct device_node *phy_np,
+					 void (*hndlr)(struct net_device *),
+					 u32 flags, phy_interface_t iface)
+{
+	return NULL;
+}
+
+struct phy_device *of_phy_connect_fixed_link(struct net_device *dev,
+					 void (*hndlr)(struct net_device *),
+					 phy_interface_t iface)
+{
+	return NULL;
+}
+
+struct mii_bus *of_mdio_find_bus(struct device_node *mdio_np)
+{
+	return NULL;
+}
+#endif /* CONFIG_OF */
+
 #endif /* __LINUX_OF_MDIO_H */
-- 
1.7.0.4
