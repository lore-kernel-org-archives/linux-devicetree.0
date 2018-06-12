From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH] drivers/of: Make of_io_request_and_map() "name" argument
 optional
Date: Tue, 12 Jun 2018 10:01:07 +1000
Message-ID: <22064afa92ed2e4b33a93685aabb1d07c7c8846d.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

These days of_address_to_resource() puts a reasonable name
in the resource struct, thus make the "name" argument an
optional override.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---

Just something I noticed ... we should probably update the
callers to stop passing stupid names..

 drivers/of/address.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 580bbf6ca2b1..cf83c05f5650 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -774,7 +774,7 @@ EXPORT_SYMBOL(of_iomap);
  *			   for a given device_node
  * @device:	the device whose io range will be mapped
  * @index:	index of the io range
- * @name:	name of the resource
+ * @name:	name "override" for the memory region request or NULL
  *
  * Returns a pointer to the requested and mapped memory or an ERR_PTR() encoded
  * error code on failure. Usage example:
@@ -784,7 +784,7 @@ EXPORT_SYMBOL(of_iomap);
  *		return PTR_ERR(base);
  */
 void __iomem *of_io_request_and_map(struct device_node *np, int index,
-					const char *name)
+				    const char *name)
 {
 	struct resource res;
 	void __iomem *mem;
@@ -792,6 +792,8 @@ void __iomem *of_io_request_and_map(struct device_node *np, int index,
 	if (of_address_to_resource(np, index, &res))
 		return IOMEM_ERR_PTR(-EINVAL);
 
+	if (!name)
+		name = res.name;
 	if (!request_mem_region(res.start, resource_size(&res), name))
 		return IOMEM_ERR_PTR(-EBUSY);
 
