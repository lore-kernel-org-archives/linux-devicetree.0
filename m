From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] of: Provide static inline function for of_translate_address if needed
Date: Fri,  6 Nov 2015 19:28:22 -0800
Message-ID: <1446866902-31492-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

If OF_ADDRESS is not configured, builds can fail with errors such as

drivers/net/ethernet/hisilicon/hns_mdio.c:
	In function 'hns_mdio_bus_name':
drivers/net/ethernet/hisilicon/hns_mdio.c:411:3:
	error: implicit declaration of function 'of_translate_address'

as currently seen when building sparc:allmodconfig.

Introduce a static inline function if OF_ADDRESS is not configured to fix
the build failure. Return OF_BAD_ADDR in this case. For this to work, the
definition of OF_BAD_ADDR has to be moved outside CONFIG_OF conditional
code.

Fixes: 876133d3161d ("net: hisilicon: add OF dependency")
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 include/linux/of.h         | 4 ++--
 include/linux/of_address.h | 7 +++++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 2194b8ca41f9..dd10626a615f 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -126,6 +126,8 @@ extern raw_spinlock_t devtree_lock;
 #define OF_POPULATED	3 /* device already created for the node */
 #define OF_POPULATED_BUS	4 /* of_platform_populate recursed to children of this node */
 
+#define OF_BAD_ADDR	((u64)-1)
+
 #ifdef CONFIG_OF
 void of_core_init(void);
 
@@ -229,8 +231,6 @@ static inline unsigned long of_read_ulong(const __be32 *cell, int size)
 #define OF_IS_DYNAMIC(x) test_bit(OF_DYNAMIC, &x->_flags)
 #define OF_MARK_DYNAMIC(x) set_bit(OF_DYNAMIC, &x->_flags)
 
-#define OF_BAD_ADDR	((u64)-1)
-
 static inline const char *of_node_full_name(const struct device_node *np)
 {
 	return np ? np->full_name : "<no-node>";
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index d88e81be6368..507daad0bc8d 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -57,6 +57,13 @@ extern int of_dma_get_range(struct device_node *np, u64 *dma_addr,
 				u64 *paddr, u64 *size);
 extern bool of_dma_is_coherent(struct device_node *np);
 #else /* CONFIG_OF_ADDRESS */
+
+static inline u64 of_translate_address(struct device_node *np,
+				       const __be32 *addr)
+{
+	return OF_BAD_ADDR;
+}
+
 static inline struct device_node *of_find_matching_node_by_address(
 					struct device_node *from,
 					const struct of_device_id *matches,
-- 
2.1.4
