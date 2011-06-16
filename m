From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 02/11] of/address: Add of_find_matching_node_by_address
	helper
Date: Wed, 15 Jun 2011 22:41:36 -0600
Message-ID: <20110616044130.29371.31242.stgit@ponder>
References: <20110616042653.29371.2052.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110616042653.29371.2052.stgit@ponder>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinu
List-Id: devicetree@vger.kernel.org

of_find_matching_node_by_address() can be used to find a device tree
node for a device at a specific address.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 drivers/of/address.c       |   18 ++++++++++++++++++
 include/linux/of_address.h |    4 ++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index b4559c5..da1f4b9 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -577,6 +577,24 @@ int of_address_to_resource(struct device_node *dev, int index,
 }
 EXPORT_SYMBOL_GPL(of_address_to_resource);
 
+struct device_node *of_find_matching_node_by_address(struct device_node *from,
+					const struct of_device_id *matches,
+					u64 base_address)
+{
+	struct device_node *dn = of_find_matching_node(from, matches);
+	struct resource res;
+
+	while (dn) {
+		if (of_address_to_resource(dn, 0, &res))
+			continue;
+		if (res.start == base_address)
+			return dn;
+		dn = of_find_matching_node(dn, matches);
+	}
+
+	return NULL;
+}
+
 
 /**
  * of_iomap - Maps the memory mapped IO for a given device_node
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 2feda6e..bdfc20d 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -6,6 +6,10 @@
 extern u64 of_translate_address(struct device_node *np, const __be32 *addr);
 extern int of_address_to_resource(struct device_node *dev, int index,
 				  struct resource *r);
+extern struct device_node *of_find_matching_node_by_address(
+					struct device_node *from,
+					const struct of_device_id *matches,
+					u64 base_address);
 extern void __iomem *of_iomap(struct device_node *device, int index);
 
 /* Extract an address from a device, returns the region size and
