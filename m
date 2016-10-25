From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] of, numa: Add function to disable of_node_to_nid().
Date: Tue, 25 Oct 2016 14:31:00 -0700
Message-ID: <1477431061-7258-2-git-send-email-ddaney.cavm@gmail.com>
References: <1477431061-7258-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477431061-7258-1-git-send-email-ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Gilbert Netzer <noname-QVTQ4TwcpgDLoDKTGw+V6w@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

On arm64 NUMA kernels we can pass "numa=off" on the command line to
disable NUMA.  A side effect of this is that kmalloc_node() calls to
non-zero nodes will crash the system with an OOPS:

[    0.000000] [<fffffc00081bba84>] __alloc_pages_nodemask+0xa4/0xe68
[    0.000000] [<fffffc00082163a8>] new_slab+0xd0/0x57c
[    0.000000] [<fffffc000821879c>] ___slab_alloc+0x2e4/0x514
[    0.000000] [<fffffc000823882c>] __slab_alloc+0x48/0x58
[    0.000000] [<fffffc00082195a0>] __kmalloc_node+0xd0/0x2e0
[    0.000000] [<fffffc00081119b8>] __irq_domain_add+0x7c/0x164
[    0.000000] [<fffffc0008b75d30>] its_probe+0x784/0x81c
[    0.000000] [<fffffc0008b75e10>] its_init+0x48/0x1b0
.
.
.

This is caused by code like this in kernel/irq/irqdomain.c

    domain = kzalloc_node(sizeof(*domain) + (sizeof(unsigned int) * size),
                  GFP_KERNEL, of_node_to_nid(of_node));

When NUMA is disabled, the concept of a node is really undefined, so
of_node_to_nid() should unconditionally return NUMA_NO_NODE.

Add __of_force_no_numa() to allow of_node_to_nid() to be forced to
return NUMA_NO_NODE.

The follow on patch will call this new function from the arm64 numa
code.

Reported-by: Gilbert Netzer <noname-QVTQ4TwcpgDLoDKTGw+V6w@public.gmane.org>
Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
---
 drivers/of/of_numa.c | 15 +++++++++++++++
 include/linux/of.h   |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index f63d4b0d..2212299 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -150,12 +150,27 @@ static int __init of_numa_parse_distance_map(void)
 	return ret;
 }
 
+static bool of_force_no_numa;
+
+void __of_force_no_numa(void)
+{
+	of_force_no_numa = true;
+}
+
 int of_node_to_nid(struct device_node *device)
 {
 	struct device_node *np;
 	u32 nid;
 	int r = -ENODATA;
 
+	/*
+	 * If NUMA forced off, nodes are meaningless.  Return
+	 * NUMA_NO_NODE so that any node specific memory allocations
+	 * can succeed from the default pool.
+	 */
+	if (of_force_no_numa)
+		return NUMA_NO_NODE;
+
 	np = of_node_get(device);
 
 	while (np) {
diff --git a/include/linux/of.h b/include/linux/of.h
index 299aeb1..6f6244e 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -850,11 +850,13 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
 
 #if defined(CONFIG_OF) && defined(CONFIG_NUMA)
 extern int of_node_to_nid(struct device_node *np);
+extern void __of_force_no_numa(void);
 #else
 static inline int of_node_to_nid(struct device_node *device)
 {
 	return NUMA_NO_NODE;
 }
+static inline void __of_force_no_numa(void) { /* Empty */ }
 #endif
 
 #ifdef CONFIG_OF_NUMA
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
