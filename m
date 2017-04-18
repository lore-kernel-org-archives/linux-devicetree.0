From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Subject: [PATCH 2/2] powerpc/sysfs: fix reference leak of cpu device_nodes present at boot
Date: Mon, 17 Apr 2017 20:24:39 -0400
Message-ID: <1492475079-10740-1-git-send-email-tyreld@linux.vnet.ibm.com>
References: <1492474900-10658-1-git-send-email-tyreld@linux.vnet.ibm.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1492474900-10658-1-git-send-email-tyreld@linux.vnet.ibm.com>
Sender: stable-owner@vger.kernel.org
To: mpe@ellerman.id.au
Cc: benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org, nfont@linux.vnet.ibm.com, bharata@linux.vnet.ibm.com, sachinp@linux.vnet.ibm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, sudeep.karkadanagesha@arm.com, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

For cpus present at boot each logical cpu acquires a reference to the
associated device node of the core. This happens in register_cpu() which
is called by topology_init(). The result of this is that we end up with
a reference held by each thread of the core. However, these references
are never freed if the cpu core is dlpar removed.

This patch fixes the reference leaks by acquiring and releasing the
references in the cpu hotplug callbacks un/register_cpu_online().
With this patch symmetric reference counting is observed with both cpus
present at boot, and those dlpar added after boot.

Cc: stable@vger.kernel.org
fixes: f86e4718f24b ("driver/core: cpu: initialize of_node in cpu's device struture")
Signed-off-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/sysfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index c1fb255..949957b 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -710,6 +710,10 @@ static int register_cpu_online(unsigned int cpu)
 	struct device_attribute *attrs, *pmc_attrs;
 	int i, nattrs;
 
+	/* For cpus present at boot a reference was already grabbed in register_cpu() */
+	if (!s->of_node)
+		s->of_node = of_get_cpu_node(cpu, NULL);
+
 #ifdef CONFIG_PPC64
 	if (cpu_has_feature(CPU_FTR_SMT))
 		device_create_file(s, &dev_attr_smt_snooze_delay);
@@ -864,6 +868,8 @@ static int unregister_cpu_online(unsigned int cpu)
 	}
 #endif
 	cacheinfo_cpu_offline(cpu);
+	of_node_put(s->of_node);
+	s->of_node = NULL;
 #endif /* CONFIG_HOTPLUG_CPU */
 	return 0;
 }
-- 
1.8.3.1
