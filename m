From: Rob Herring <robh@kernel.org>
Subject: [PATCH 07/21] c6x: use for_each_of_cpu_node iterator
Date: Wed,  5 Sep 2018 14:37:24 -0500
Message-ID: <20180905193738.19325-8-robh@kernel.org>
References: <20180905193738.19325-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905193738.19325-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Salter <msalter@redhat.com>, Aurelien Jacquiot <jacquiot.aurelien@gmail.com>, linux-c6x-dev@linux-c6x.org
List-Id: devicetree@vger.kernel.org

Use the for_each_of_cpu_node iterator to iterate over cpu nodes. This
has the side effect of defaulting to iterating using "cpu" node names
in preference to the deprecated (for FDT) device_type == "cpu".

Cc: Mark Salter <msalter@redhat.com>
Cc: Aurelien Jacquiot <jacquiot.aurelien@gmail.com>
Cc: linux-c6x-dev@linux-c6x.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take via the DT tree. This is dependent on the
first 2 patches.

 arch/c6x/kernel/setup.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/c6x/kernel/setup.c b/arch/c6x/kernel/setup.c
index 786e36e2f61d..2e97455ca0b7 100644
--- a/arch/c6x/kernel/setup.c
+++ b/arch/c6x/kernel/setup.c
@@ -96,7 +96,7 @@ static void __init get_cpuinfo(void)
 	unsigned long core_khz;
 	u64 tmp;
 	struct cpuinfo_c6x *p;
-	struct device_node *node, *np;
+	struct device_node *node;

 	p = &per_cpu(cpu_data, smp_processor_id());

@@ -190,13 +190,8 @@ static void __init get_cpuinfo(void)

 	p->core_id = get_coreid();

-	node = of_find_node_by_name(NULL, "cpus");
-	if (node) {
-		for_each_child_of_node(node, np)
-			if (!strcmp("cpu", np->name))
-				++c6x_num_cores;
-		of_node_put(node);
-	}
+	for_each_of_cpu_node(node)
+		++c6x_num_cores;

 	node = of_find_node_by_name(NULL, "soc");
 	if (node) {
--
2.17.1
