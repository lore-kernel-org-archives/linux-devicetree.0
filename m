From: Deepak Saxena <deepak_saxena-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/5] of/device: Create _of_get_next_child()
Date: Wed, 8 Dec 2010 11:29:22 -0800
Message-ID: <20101208192922.GC32473@mentor.com>
References: <cover.1291799069.git.deepak_saxena@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cover.1291799069.git.deepak_saxena-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

There aren't many, but some of_get_next_child() callers do need an unabridged
view of the device tree so we provide a wrapper that can be used by them.

Signed-off-by: Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Deepak Saxena <deepak_saxena-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
---
 drivers/of/base.c  |   26 ++++++++++++++++++++++++++
 include/linux/of.h |    2 ++
 2 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 81b2601..7bc1398 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -315,6 +315,32 @@ struct device_node *of_get_next_parent(struct device_node *node)
 }
 
 /**
+ *	_of_get_next_child - Iterate a node childs
+ *	@node:	parent node
+ *	@prev:	previous child of the parent node, or NULL to get first
+ *
+ *	Returns a node pointer with refcount incremented, use
+ *	of_node_put() on it when done.
+ *
+ *	Unlike most other node accessors, ignores status properties.
+ */
+struct device_node *_of_get_next_child(const struct device_node *node,
+	struct device_node *prev)
+{
+	struct device_node *next;
+
+	read_lock(&devtree_lock);
+	next = prev ? prev->sibling : node->child;
+	for (; next; next = next->sibling)
+		if (of_device_is_available(next) && of_node_get(next))
+			break;
+	of_node_put(prev);
+	read_unlock(&devtree_lock);
+	return next;
+}
+EXPORT_SYMBOL(_of_get_next_child);
+
+/**
  *	of_get_next_child - Iterate a node childs
  *	@node:	parent node
  *	@prev:	previous child of the parent node, or NULL to get first
diff --git a/include/linux/of.h b/include/linux/of.h
index cad7cf0..1fea01d 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -175,6 +175,8 @@ extern struct device_node *of_find_node_by_path(const char *path);
 extern struct device_node *of_find_node_by_phandle(phandle handle);
 extern struct device_node *of_get_parent(const struct device_node *node);
 extern struct device_node *of_get_next_parent(struct device_node *node);
+extern struct device_node *_of_get_next_child(const struct device_node *node,
+					     struct device_node *prev);
 extern struct device_node *of_get_next_child(const struct device_node *node,
 					     struct device_node *prev);
 #define for_each_child_of_node(parent, child) \
-- 
1.6.3.3
