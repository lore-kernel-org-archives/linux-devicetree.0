From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 2/4] drivers: of: add function to scan fdt nodes given by
 path
Date: Wed, 31 Jul 2013 14:51:57 +0200
Message-ID: <1375275119-12787-3-git-send-email-m.szyprowski@samsung.com>
References: <1375275119-12787-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1375275119-12787-1-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org, devicetree-discuss@lists.ozlabs.org
Cc: Laura Abbott <lauraa@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <t.figa@samsung.com>, Nishanth Peethambaran <nishanth.p@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, Grant Likely <grant.likely@secretlab.ca>, Marc <marc.ceeeee@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Olof Johansson <olof@lixom.net>, Sascha Hauer <s.hauer@pengutronix.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

Add a function to scan the flattened device-tree starting from the
node given by the path. It is used to extract information (like reserved
memory), which is required on ealy boot before we can unflatten the tree.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/of/fdt.c       |   76 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_fdt.h |    3 ++
 2 files changed, 79 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 6bb7cf2..8d6e7e8 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -543,6 +543,82 @@ int __init of_flat_dt_match(unsigned long node, const char *const *compat)
 	return of_fdt_match(initial_boot_params, node, compat);
 }
 
+struct fdt_scan_status {
+	const char *name;
+	int namelen;
+	int depth;
+	int found;
+	int (*iterator)(unsigned long node, const char *uname, int depth, void *data);
+	void *data;
+};
+
+/**
+ * fdt_scan_node_by_path - iterator for of_scan_flat_dt_by_path function
+ */
+static int __init fdt_scan_node_by_path(unsigned long node, const char *uname,
+					int depth, void *data)
+{
+	struct fdt_scan_status *st = data;
+
+	/*
+	 * if scan at the requested fdt node has been completed,
+	 * return -ENXIO to abort further scanning
+	 */
+	if (depth <= st->depth)
+		return -ENXIO;
+
+	/* requested fdt node has been found, so call iterator function */
+	if (st->found)
+		return st->iterator(node, uname, depth, st->data);
+
+	/* check if scanning automata is entering next level of fdt nodes */
+	if (depth == st->depth + 1 &&
+	    strncmp(st->name, uname, st->namelen) == 0) {
+		st->depth += 1;
+		if (st->name[st->namelen] == 0) {
+			st->found = 1;
+		} else {
+			const char *next = st->name + st->namelen + 1;
+			const char *p = next;
+			while (*p != '/' && *p != 0)
+				p++;
+			st->name = next;
+			st->namelen = p - next;
+		}
+		return 0;
+	}
+
+	/* scan next fdt node */
+	return 0;
+}
+
+/**
+ * of_scan_flat_dt_by_path - scan flattened tree blob and call callback on each
+ *			     child of the given path.
+ * @path: path to start searching for children
+ * @it: callback function
+ * @data: context data pointer
+ *
+ * This function is used to scan the flattened device-tree starting from the
+ * node given by path. It is used to extract information (like reserved
+ * memory), which is required on ealy boot before we can unflatten the tree.
+ */
+int __init of_scan_flat_dt_by_path(const char *path,
+	int (*it)(unsigned long node, const char *name, int depth, void *data),
+	void *data)
+{
+	struct fdt_scan_status st = {path, 0, -1, 0, it, data};
+	int ret = 0;
+
+	if (initial_boot_params)
+		ret = of_scan_flat_dt(fdt_scan_node_by_path, &st);
+
+	if (st.found && ret == -ENXIO)	/* scan has been completed */
+		return 0;
+	else
+		return -ENOENT;
+}
+
 #ifdef CONFIG_BLK_DEV_INITRD
 /**
  * early_init_dt_check_for_initrd - Decode initrd location from flat tree
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index ed136ad..1151a7f 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -90,6 +90,9 @@ extern void *of_get_flat_dt_prop(unsigned long node, const char *name,
 extern int of_flat_dt_is_compatible(unsigned long node, const char *name);
 extern int of_flat_dt_match(unsigned long node, const char *const *matches);
 extern unsigned long of_get_flat_dt_root(void);
+extern int __init of_scan_flat_dt_by_path(const char *path,
+	int (*it)(unsigned long node, const char *name, int depth, void *data),
+	void *data);
 
 extern int early_init_dt_scan_chosen(unsigned long node, const char *uname,
 				     int depth, void *data);
-- 
1.7.9.5
