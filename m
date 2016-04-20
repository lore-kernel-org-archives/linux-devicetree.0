From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH] arm64: spin-table: add missing of_node_put()
Date: Wed, 20 Apr 2016 10:23:31 +0900
Message-ID: <1461115411-2843-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since of_get_cpu_node() increments refcount, the node should be put.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 arch/arm64/kernel/smp_spin_table.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/smp_spin_table.c b/arch/arm64/kernel/smp_spin_table.c
index aef3605..18a71bc 100644
--- a/arch/arm64/kernel/smp_spin_table.c
+++ b/arch/arm64/kernel/smp_spin_table.c
@@ -52,6 +52,7 @@ static void write_pen_release(u64 val)
 static int smp_spin_table_cpu_init(unsigned int cpu)
 {
 	struct device_node *dn;
+	int ret;
 
 	dn = of_get_cpu_node(cpu, NULL);
 	if (!dn)
@@ -60,15 +61,15 @@ static int smp_spin_table_cpu_init(unsigned int cpu)
 	/*
 	 * Determine the address from which the CPU is polling.
 	 */
-	if (of_property_read_u64(dn, "cpu-release-addr",
-				 &cpu_release_addr[cpu])) {
+	ret = of_property_read_u64(dn, "cpu-release-addr",
+				   &cpu_release_addr[cpu]);
+	if (ret)
 		pr_err("CPU %d: missing or invalid cpu-release-addr property\n",
 		       cpu);
 
-		return -1;
-	}
+	of_node_put(dn);
 
-	return 0;
+	return ret;
 }
 
 static int smp_spin_table_cpu_prepare(unsigned int cpu)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
