From: Reza Arbab <arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v7 2/5] mm: remove x86-only restriction of movable_node
Date: Mon, 14 Nov 2016 16:02:38 -0600
Message-ID: <1479160961-25840-3-git-send-email-arbab@linux.vnet.ibm.com>
References: <1479160961-25840-1-git-send-email-arbab@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479160961-25840-1-git-send-email-arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bharata B Rao <bharata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Nathan Fontenot <nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alistair Popple <apopple-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, Balbir Singh <bsingharora-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Aneesh Kumar K.V" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In commit c5320926e370 ("mem-hotplug: introduce movable_node boot
option"), the memblock allocation direction is changed to bottom-up and
then back to top-down like this:

1. memblock_set_bottom_up(true), called by cmdline_parse_movable_node().
2. memblock_set_bottom_up(false), called by x86's numa_init().

Even though (1) occurs in generic mm code, it is wrapped by #ifdef
CONFIG_MOVABLE_NODE, which depends on X86_64.

This means that when we extend CONFIG_MOVABLE_NODE to non-x86 arches,
things will be unbalanced. (1) will happen for them, but (2) will not.

This toggle was added in the first place because x86 has a delay between
adding memblocks and marking them as hotpluggable. Since other arches do
this marking either immediately or not at all, they do not require the
bottom-up toggle.

So, resolve things by moving (1) from cmdline_parse_movable_node() to
x86's setup_arch(), immediately after the movable_node parameter has
been parsed.

Signed-off-by: Reza Arbab <arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 Documentation/kernel-parameters.txt |  2 +-
 arch/x86/kernel/setup.c             | 24 ++++++++++++++++++++++++
 mm/memory_hotplug.c                 | 20 --------------------
 3 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-parameters.txt
index 37babf9..adcccd5 100644
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@ -2401,7 +2401,7 @@ bytes respectively. Such letter suffixes can also be entirely omitted.
 			that the amount of memory usable for all allocations
 			is not too small.
 
-	movable_node	[KNL,X86] Boot-time switch to enable the effects
+	movable_node	[KNL] Boot-time switch to enable the effects
 			of CONFIG_MOVABLE_NODE=y. See mm/Kconfig for details.
 
 	MTD_Partition=	[MTD]
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 9c337b0..4cfba94 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -985,6 +985,30 @@ void __init setup_arch(char **cmdline_p)
 
 	parse_early_param();
 
+#ifdef CONFIG_MEMORY_HOTPLUG
+	/*
+	 * Memory used by the kernel cannot be hot-removed because Linux
+	 * cannot migrate the kernel pages. When memory hotplug is
+	 * enabled, we should prevent memblock from allocating memory
+	 * for the kernel.
+	 *
+	 * ACPI SRAT records all hotpluggable memory ranges. But before
+	 * SRAT is parsed, we don't know about it.
+	 *
+	 * The kernel image is loaded into memory at very early time. We
+	 * cannot prevent this anyway. So on NUMA system, we set any
+	 * node the kernel resides in as un-hotpluggable.
+	 *
+	 * Since on modern servers, one node could have double-digit
+	 * gigabytes memory, we can assume the memory around the kernel
+	 * image is also un-hotpluggable. So before SRAT is parsed, just
+	 * allocate memory near the kernel image to try the best to keep
+	 * the kernel away from hotpluggable memory.
+	 */
+	if (movable_node_is_enabled())
+		memblock_set_bottom_up(true);
+#endif
+
 	x86_report_nx();
 
 	/* after early param, so could get panic from serial */
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index cad4b91..e43142c1 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1727,26 +1727,6 @@ static bool can_offline_normal(struct zone *zone, unsigned long nr_pages)
 static int __init cmdline_parse_movable_node(char *p)
 {
 #ifdef CONFIG_MOVABLE_NODE
-	/*
-	 * Memory used by the kernel cannot be hot-removed because Linux
-	 * cannot migrate the kernel pages. When memory hotplug is
-	 * enabled, we should prevent memblock from allocating memory
-	 * for the kernel.
-	 *
-	 * ACPI SRAT records all hotpluggable memory ranges. But before
-	 * SRAT is parsed, we don't know about it.
-	 *
-	 * The kernel image is loaded into memory at very early time. We
-	 * cannot prevent this anyway. So on NUMA system, we set any
-	 * node the kernel resides in as un-hotpluggable.
-	 *
-	 * Since on modern servers, one node could have double-digit
-	 * gigabytes memory, we can assume the memory around the kernel
-	 * image is also un-hotpluggable. So before SRAT is parsed, just
-	 * allocate memory near the kernel image to try the best to keep
-	 * the kernel away from hotpluggable memory.
-	 */
-	memblock_set_bottom_up(true);
 	movable_node_enabled = true;
 #else
 	pr_warn("movable_node option not supported\n");
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
