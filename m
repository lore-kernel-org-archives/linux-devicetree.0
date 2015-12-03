From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] of: fix build failure
Date: Thu,  3 Dec 2015 14:08:10 +0530
Message-ID: <1449131890-21675-1-git-send-email-sudipm.mukherjee@gmail.com>
References: <20151203011814.GC5727@sirena.org.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151203011814.GC5727@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
List-Id: devicetree@vger.kernel.org

We are having build failure with next-20151202 for sparc allmodconfig
with the error messages:
undefined reference to 'of_io_request_and_map'

CONFIG_OF is defined for sparc so it is expected that we have a
definition of of_io_request_and_map() but of/address.c is only compiled
if it is !SPARC.

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---

build log is at:
https://travis-ci.org/sudipm-mukherjee/parport/builds/94541627

patch has been build tested with sparc allmodconfig and x86_64
allmodconfig.

 include/linux/of_address.h | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 507daad..7bf4603 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -112,8 +112,6 @@ static inline bool of_dma_is_coherent(struct device_node *np)
 extern int of_address_to_resource(struct device_node *dev, int index,
 				  struct resource *r);
 void __iomem *of_iomap(struct device_node *node, int index);
-void __iomem *of_io_request_and_map(struct device_node *device,
-					int index, const char *name);
 #else
 
 #include <linux/io.h>
@@ -136,6 +134,19 @@ static inline void __iomem *of_io_request_and_map(struct device_node *device,
 }
 #endif
 
+#if defined(CONFIG_OF) && !defined(CONFIG_SPARC)
+void __iomem *of_io_request_and_map(struct device_node *device,
+					int index, const char *name);
+#else
+#include <linux/io.h>
+
+static inline void __iomem *of_io_request_and_map(struct device_node *device,
+					int index, const char *name)
+{
+	return IOMEM_ERR_PTR(-EINVAL);
+}
+#endif /* CONFIG_OF && !CONFIG_SPARC */
+
 #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_PCI)
 extern const __be32 *of_get_pci_address(struct device_node *dev, int bar_no,
 			       u64 *size, unsigned int *flags);
-- 
1.9.1
