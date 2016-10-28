From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 1/4] drivers: base: cacheinfo: fix x86 with CONFIG_OF enabled
Date: Fri, 28 Oct 2016 09:45:28 +0100
Message-ID: <1477644331-25559-2-git-send-email-sudeep.holla@arm.com>
References: <1477644331-25559-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477644331-25559-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

With CONFIG_OF enabled on x86, we get the following error on boot:
"
	Failed to find cpu0 device node
 	Unable to detect cache hierarchy from DT for CPU 0
"
and the cacheinfo fails to get populated in the corresponding sysfs
entries. This is because cache_setup_of_node looks for of_node for
setting up the shared cpu_map without checking that it's already
populated in the architecture specific callback.

In order to indicate that the shared cpu_map is already populated, this
patch introduces a boolean `cpu_map_populated` in struct cpu_cacheinfo
that can be used by the generic code to skip cache_shared_cpu_map_setup.

This patch also sets that boolean for x86.

Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 arch/x86/kernel/cpu/intel_cacheinfo.c | 2 ++
 drivers/base/cacheinfo.c              | 3 +++
 include/linux/cacheinfo.h             | 1 +
 3 files changed, 6 insertions(+)

diff --git a/arch/x86/kernel/cpu/intel_cacheinfo.c b/arch/x86/kernel/cpu/intel_cacheinfo.c
index de6626c18e42..be6337156502 100644
--- a/arch/x86/kernel/cpu/intel_cacheinfo.c
+++ b/arch/x86/kernel/cpu/intel_cacheinfo.c
@@ -934,6 +934,8 @@ static int __populate_cache_leaves(unsigned int cpu)
 		ci_leaf_init(this_leaf++, &id4_regs);
 		__cache_cpumap_setup(cpu, idx, &id4_regs);
 	}
+	this_cpu_ci->cpu_map_populated = true;
+
 	return 0;
 }
 
diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index e9fd32e91668..ecde8957835a 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -106,6 +106,9 @@ static int cache_shared_cpu_map_setup(unsigned int cpu)
 	unsigned int index;
 	int ret;
 
+	if (this_cpu_ci->cpu_map_populated)
+		return 0;
+
 	ret = cache_setup_of_node(cpu);
 	if (ret)
 		return ret;
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 2189935075b4..a951fd10aaaa 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -71,6 +71,7 @@ struct cpu_cacheinfo {
 	struct cacheinfo *info_list;
 	unsigned int num_levels;
 	unsigned int num_leaves;
+	bool cpu_map_populated;
 };
 
 /*
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
