From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] of: Request and map make argument name constant
Date: Tue, 21 Oct 2014 18:27:25 +0200
Message-ID: <1413908845-11526-1-git-send-email-matthias.bgg@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@linaro.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux@rempel-privat.de, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch makes the name argument from of_io_request_and_map constant.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/of/address.c       | 2 +-
 include/linux/of_address.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index afdb782..e02828f 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -871,7 +871,7 @@ EXPORT_SYMBOL(of_iomap);
  *		return PTR_ERR(base);
  */
 void __iomem *of_io_request_and_map(struct device_node *np, int index,
-					char *name)
+					const char *name)
 {
 	struct resource res;
 	void __iomem *mem;
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 8cb14eb..d88e81b 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -106,7 +106,7 @@ extern int of_address_to_resource(struct device_node *dev, int index,
 				  struct resource *r);
 void __iomem *of_iomap(struct device_node *node, int index);
 void __iomem *of_io_request_and_map(struct device_node *device,
-					int index, char *name);
+					int index, const char *name);
 #else
 
 #include <linux/io.h>
@@ -123,7 +123,7 @@ static inline void __iomem *of_iomap(struct device_node *device, int index)
 }
 
 static inline void __iomem *of_io_request_and_map(struct device_node *device,
-					int index, char *name)
+					int index, const char *name)
 {
 	return IOMEM_ERR_PTR(-EINVAL);
 }
-- 
1.9.1
