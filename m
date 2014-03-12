From: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 3/9] of: mtd: add NAND timing mode retrieval support
Date: Wed, 12 Mar 2014 19:07:38 +0100
Message-ID: <1394647664-8258-4-git-send-email-b.brezillon.dev@gmail.com>
References: <1394647664-8258-1-git-send-email-b.brezillon.dev@gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDE6NB73YAMBBAWFQKMQKGQEERHUGZI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1394647664-8258-1-git-send-email-b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a function to retrieve NAND timing mode (ONFI timing mode) from a given
DT node.

Signed-off-by: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/of_mtd.c    |   19 +++++++++++++++++++
 include/linux/of_mtd.h |    8 ++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
index b7361ed..8bdaa0b 100644
--- a/drivers/of/of_mtd.c
+++ b/drivers/of/of_mtd.c
@@ -117,3 +117,22 @@ bool of_get_nand_on_flash_bbt(struct device_node *np)
 	return of_property_read_bool(np, "nand-on-flash-bbt");
 }
 EXPORT_SYMBOL_GPL(of_get_nand_on_flash_bbt);
+
+/**
+ * of_get_nand_timings - Get nand timings for the given device_node
+ * @np:	Pointer to the given device_node
+ *
+ * return 0 on success errno other wise
+ */
+int of_get_nand_onfi_timing_mode(struct device_node *np)
+{
+	int err;
+	u32 mode;
+
+	err = of_property_read_u32(np, "onfi,nand-timing-mode", &mode);
+	if (err)
+		return err;
+
+	return mode;
+}
+EXPORT_SYMBOL_GPL(of_get_nand_onfi_timing_mode);
diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
index e266caa..c8310ae 100644
--- a/include/linux/of_mtd.h
+++ b/include/linux/of_mtd.h
@@ -9,6 +9,8 @@
 #ifndef __LINUX_OF_MTD_H
 #define __LINUX_OF_MTD_H
 
+#include <linux/mtd/nand.h>
+
 #ifdef CONFIG_OF_MTD
 
 #include <linux/of.h>
@@ -17,6 +19,7 @@ int of_get_nand_ecc_step_size(struct device_node *np);
 int of_get_nand_ecc_strength(struct device_node *np);
 int of_get_nand_bus_width(struct device_node *np);
 bool of_get_nand_on_flash_bbt(struct device_node *np);
+int of_get_nand_onfi_timing_mode(struct device_node *np);
 
 #else /* CONFIG_OF_MTD */
 
@@ -45,6 +48,11 @@ static inline bool of_get_nand_on_flash_bbt(struct device_node *np)
 	return false;
 }
 
+static inline int of_get_nand_onfi_timing_mode(struct device_node *np)
+{
+	return -ENOSYS;
+}
+
 #endif /* CONFIG_OF_MTD */
 
 #endif /* __LINUX_OF_MTD_H */
-- 
1.7.9.5
