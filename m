From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH] of_mtd: Add no-op stubs to support CONFIG_OF=n
Date: Mon,  2 Sep 2013 23:37:53 -0300
Message-ID: <1378175873-2763-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Cc: Josh Wu <josh.wu@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: devicetree@vger.kernel.org

Just like the rest of the subsystems, let's add the required no-op
functions to implement stubs when CONFIG_OF=n.

This prevents MTD drivers from having ugly ifdefs in their code,
and instead hide the ifdef monster in the header closet (far away
from people's sight).

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 include/linux/of_mtd.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
index ed7f267..66f173e 100644
--- a/include/linux/of_mtd.h
+++ b/include/linux/of_mtd.h
@@ -14,6 +14,21 @@
 int of_get_nand_ecc_mode(struct device_node *np);
 int of_get_nand_bus_width(struct device_node *np);
 bool of_get_nand_on_flash_bbt(struct device_node *np);
+#else
+static inline int of_get_nand_ecc_mode(struct device_node *np)
+{
+	return -ENOSYS;
+}
+
+static inline int of_get_nand_bus_width(struct device_node *np)
+{
+	return -ENOSYS;
+}
+
+static inline bool of_get_nand_on_flash_bbt(struct device_node *np)
+{
+	return false;
+}
 #endif
 
 #endif /* __LINUX_OF_MTD_H */
-- 
1.8.1.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
