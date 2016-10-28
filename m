From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 4/4] drivers: base: cacheinfo: support DT overrides for cache properties
Date: Fri, 28 Oct 2016 09:45:31 +0100
Message-ID: <1477644331-25559-5-git-send-email-sudeep.holla@arm.com>
References: <1477644331-25559-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477644331-25559-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, x86@kernel.org, devicetree@vger.kernel.org, Alex Van Brunt <avanbrunt@nvidia.com>
List-Id: devicetree@vger.kernel.org

Few architectures like x86, ia64 and s390 derive the cache topology and
all the properties using a specific architected mechanism while some
other architectures like powerpc all those information id derived from
the device tree.

On ARM, both the mechanism is used. While all the cache properties can
be derived in a architected way, it needs to rely on device tree to get
the cache topology information.

However there are few platforms where this architected mechanism is
broken and the device tree properties can be used to override these
incorrect values.

This patch adds support for overriding the cache properties values to
the values specified in the device tree.

Cc: Alex Van Brunt <avanbrunt@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/cacheinfo.c | 121 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index f19d50bd8925..2376628c599c 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -88,7 +88,120 @@ static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
 {
 	return sib_leaf->of_node == this_leaf->of_node;
 }
+
+/* OF properties to query for a given cache type */
+struct cache_type_info {
+	const char *size_prop;
+	const char *line_size_props[2];
+	const char *nr_sets_prop;
+};
+
+static const struct cache_type_info cache_type_info[] = {
+	{
+		.size_prop       = "cache-size",
+		.line_size_props = { "cache-line-size",
+				     "cache-block-size", },
+		.nr_sets_prop    = "cache-sets",
+	}, {
+		.size_prop       = "i-cache-size",
+		.line_size_props = { "i-cache-line-size",
+				     "i-cache-block-size", },
+		.nr_sets_prop    = "i-cache-sets",
+	}, {
+		.size_prop       = "d-cache-size",
+		.line_size_props = { "d-cache-line-size",
+				     "d-cache-block-size", },
+		.nr_sets_prop    = "d-cache-sets",
+	},
+};
+
+static inline int get_cacheinfo_idx(enum cache_type type)
+{
+	if (type == CACHE_TYPE_UNIFIED)
+		return 0;
+	return type;
+}
+
+static void cache_size(struct cacheinfo *this_leaf)
+{
+	const char *propname;
+	const __be32 *cache_size;
+	int ct_idx;
+
+	ct_idx = get_cacheinfo_idx(this_leaf->type);
+	propname = cache_type_info[ct_idx].size_prop;
+
+	cache_size = of_get_property(this_leaf->of_node, propname, NULL);
+	if (cache_size)
+		this_leaf->size = of_read_number(cache_size, 1);
+}
+
+/* not cache_line_size() because that's a macro in include/linux/cache.h */
+static void cache_get_line_size(struct cacheinfo *this_leaf)
+{
+	const __be32 *line_size;
+	int i, lim, ct_idx;
+
+	ct_idx = get_cacheinfo_idx(this_leaf->type);
+	lim = ARRAY_SIZE(cache_type_info[ct_idx].line_size_props);
+
+	for (i = 0; i < lim; i++) {
+		const char *propname;
+
+		propname = cache_type_info[ct_idx].line_size_props[i];
+		line_size = of_get_property(this_leaf->of_node, propname, NULL);
+		if (line_size)
+			break;
+	}
+
+	if (line_size)
+		this_leaf->coherency_line_size = of_read_number(line_size, 1);
+}
+
+static void cache_nr_sets(struct cacheinfo *this_leaf)
+{
+	const char *propname;
+	const __be32 *nr_sets;
+	int ct_idx;
+
+	ct_idx = get_cacheinfo_idx(this_leaf->type);
+	propname = cache_type_info[ct_idx].nr_sets_prop;
+
+	nr_sets = of_get_property(this_leaf->of_node, propname, NULL);
+	if (nr_sets)
+		this_leaf->number_of_sets = of_read_number(nr_sets, 1);
+}
+
+static void cache_associativity(struct cacheinfo *this_leaf)
+{
+	unsigned int line_size = this_leaf->coherency_line_size;
+	unsigned int nr_sets = this_leaf->number_of_sets;
+	unsigned int size = this_leaf->size;
+
+	/*
+	 * If the cache is fully associative, there is no need to
+	 * check the other properties.
+	 */
+	if (!(nr_sets == 1) && (nr_sets > 0 && size > 0 && line_size > 0))
+		this_leaf->ways_of_associativity = (size / nr_sets) / line_size;
+}
+
+static void cache_of_override_properties(unsigned int cpu)
+{
+	int index;
+	struct cacheinfo *this_leaf;
+	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
+
+	for (index = 0; index < cache_leaves(cpu); index++) {
+		this_leaf = this_cpu_ci->info_list + index;
+		cache_size(this_leaf);
+		cache_get_line_size(this_leaf);
+		cache_nr_sets(this_leaf);
+		cache_associativity(this_leaf);
+	}
+}
 #else
+static void cache_of_override_properties(unsigned int cpu) { }
 static inline int cache_setup_of_node(unsigned int cpu) { return 0; }
 static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
 					   struct cacheinfo *sib_leaf)
@@ -171,6 +284,12 @@ static void cache_shared_cpu_map_remove(unsigned int cpu)
 	}
 }
 
+static void cache_override_properties(unsigned int cpu)
+{
+	if (of_have_populated_dt())
+		return cache_of_override_properties(cpu);
+}
+
 static void free_cache_attributes(unsigned int cpu)
 {
 	if (!per_cpu_cacheinfo(cpu))
@@ -216,6 +335,8 @@ static int detect_cache_attributes(unsigned int cpu)
 		pr_warn("Unable to detect cache hierarchy for CPU %d\n", cpu);
 		goto free_ci;
 	}
+
+	cache_override_properties(cpu);
 	return 0;
 
 free_ci:
-- 
2.7.4
