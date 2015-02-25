From: Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH] of/address: Add of_io_release_and_unmap()
Date: Wed, 25 Feb 2015 11:20:42 -0800
Message-ID: <8d61268470b7d947e30241fc88d58d4e28d733c8.1424889345.git.stillcompiling@gmail.com>
References: <cover.1424889345.git.stillcompiling@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1424889345.git.stillcompiling@gmail.com>
In-Reply-To: <cover.1424889345.git.stillcompiling@gmail.com>
References: <cover.1424889345.git.stillcompiling@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joshua Clayton <stillcompiling@gmail.com>
List-Id: devicetree@vger.kernel.org

New Fumction of_io_release_an_unmap frees resources and io memory
allocated by io_request_and_map()

Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
---
 drivers/of/address.c       | 29 +++++++++++++++++++++++++++++
 include/linux/of_address.h |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index ad29069..d0f3b81 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -872,6 +872,7 @@ EXPORT_SYMBOL(of_iomap);
 /*
  * of_io_request_and_map - Requests a resource and maps the memory mapped IO
  *			   for a given device_node
+ *			   Call of_io_release_and_unmap() to free the memory
  * @device:	the device whose io range will be mapped
  * @index:	index of the io range
  * @name:	name of the resource
@@ -882,6 +883,10 @@ EXPORT_SYMBOL(of_iomap);
  *	base = of_io_request_and_map(node, 0, "foo");
  *	if (IS_ERR(base))
  *		return PTR_ERR(base);
+ *
+ * ...
+ *
+ *	return of_io_request_and_map(node, 0, base);
  */
 void __iomem *of_io_request_and_map(struct device_node *np, int index,
 					const char *name)
@@ -906,6 +911,30 @@ void __iomem *of_io_request_and_map(struct device_node *np, int index,
 EXPORT_SYMBOL(of_io_request_and_map);
 
 /**
+ * of_io_release_and_unmap - Unmap memory and release resource
+ *			   associated with a device node
+ * Use this function to free memory requested by of_io_request_and_map()
+ * See the Usage example for of_io_request_and_map
+ *
+ */
+int of_io_release_and_unmap(struct device_node *np, int index,
+				void __iomem *addr)
+{
+	struct resource res;
+	int ret = 0;
+
+	ret = of_address_to_resource(np, index, &res);
+	if (ret)
+		return ret;
+
+	iounmap(addr);
+	release_mem_region(res.start, resource_size(&res));
+
+	return ret;
+}
+EXPORT_SYMBOL(of_io_release_and_unmap);
+
+/**
  * of_dma_get_range - Get DMA range info
  * @np:		device node to get DMA range info
  * @dma_addr:	pointer to store initial DMA address of DMA range
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index d88e81b..f62eb9e 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -107,6 +107,8 @@ extern int of_address_to_resource(struct device_node *dev, int index,
 void __iomem *of_iomap(struct device_node *node, int index);
 void __iomem *of_io_request_and_map(struct device_node *device,
 					int index, const char *name);
+int of_io_release_and_unmap(struct device_node *np, int index,
+					void __iomem *addr);
 #else
 
 #include <linux/io.h>
-- 
2.1.0
