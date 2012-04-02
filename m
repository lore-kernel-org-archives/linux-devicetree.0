From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 02/23] fdt: Add function to return next
	compatible subnode
Date: Mon,  2 Apr 2012 16:18:42 -0700
Message-ID: <1333408743-28720-3-git-send-email-sjg@chromium.org>
References: <1333408743-28720-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1333408743-28720-1-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <twarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

We need to iterate through subnodes of a parent, looking only at
compatible nodes. Add a utility function to do this for us.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
Changes in v3:
- Add new fdtdec_next_compatible_subnode() patch

 include/fdtdec.h |   17 +++++++++++++++++
 lib/fdtdec.c     |   15 +++++++++++++++
 2 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index 84f0768..0351a25 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -117,6 +117,23 @@ int fdtdec_next_compatible(const void *blob, int node,
 		enum fdt_compat_id id);
 
 /**
+ * Find the next compatible subnode for a peripheral.
+ *
+ * Do the first call with node set to the parent and depth = 0. This
+ * function will return the offset of the next compatible node. Next time
+ * you call this function, pass the node value returned last time, with
+ * depth unchanged, and the next node will be provided.
+ *
+ * @param blob		FDT blob to use
+ * @param node		Start node for search
+ * @param id		Compatible ID to look for (enum fdt_compat_id)
+ * @param depthp	Current depth (set to 0 before first call)
+ * @return offset of next compatible node, or -FDT_ERR_NOTFOUND if no more
+ */
+int fdtdec_next_compatible_subnode(const void *blob, int node,
+		enum fdt_compat_id id, int *depthp);
+
+/**
  * Look up an address property in a node and return it as an address.
  * The property must hold either one address with no trailing data or
  * one address with a length. This is only tested on 32-bit machines.
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 4a5ab71..76d3808 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -133,6 +133,21 @@ int fdtdec_next_compatible(const void *blob, int node,
 	return fdt_node_offset_by_compatible(blob, node, compat_names[id]);
 }
 
+int fdtdec_next_compatible_subnode(const void *blob, int node,
+		enum fdt_compat_id id, int *depthp)
+{
+	do {
+		node = fdt_next_node(blob, node, depthp);
+	} while (*depthp > 1);
+
+	/* If this is a direct subnode, and compatible, return it */
+	if (*depthp == 1 && 0 == fdt_node_check_compatible(
+						blob, node, compat_names[id]))
+		return node;
+
+	return -FDT_ERR_NOTFOUND;
+}
+
 int fdtdec_next_alias(const void *blob, const char *name,
 		enum fdt_compat_id id, int *upto)
 {
-- 
1.7.7.3
