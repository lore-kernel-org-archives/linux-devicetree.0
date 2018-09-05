From: Rob Herring <robh@kernel.org>
Subject: [PATCH 09/21] nios2: get cpu node with of_get_cpu_node
Date: Wed,  5 Sep 2018 14:37:26 -0500
Message-ID: <20180905193738.19325-10-robh@kernel.org>
References: <20180905193738.19325-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905193738.19325-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ley Foon Tan <lftan@altera.com>, nios2-dev@lists.rocketboards.org
List-Id: devicetree@vger.kernel.org

"device_type" use is deprecated for FDT though it has continued to be used
for nodes like cpu nodes. Use of_get_cpu_node() instead which works using
node names by default. This will allow the eventually removal of cpu
device_type properties.

Also, fix a leaked reference by adding a missing of_node_put.

Cc: Ley Foon Tan <lftan@altera.com>
Cc: nios2-dev@lists.rocketboards.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take via the DT tree. This is dependent on the
first 2 patches.

 arch/nios2/kernel/cpuinfo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/nios2/kernel/cpuinfo.c b/arch/nios2/kernel/cpuinfo.c
index 93207718bb22..ccc1d2a15a0a 100644
--- a/arch/nios2/kernel/cpuinfo.c
+++ b/arch/nios2/kernel/cpuinfo.c
@@ -47,7 +47,7 @@ void __init setup_cpuinfo(void)
 	const char *str;
 	int len;

-	cpu = of_find_node_by_type(NULL, "cpu");
+	cpu = of_get_cpu_node(0, NULL);
 	if (!cpu)
 		panic("%s: No CPU found in devicetree!\n", __func__);

@@ -120,6 +120,8 @@ void __init setup_cpuinfo(void)
 	cpuinfo.reset_addr = fcpu(cpu, "altr,reset-addr");
 	cpuinfo.exception_addr = fcpu(cpu, "altr,exception-addr");
 	cpuinfo.fast_tlb_miss_exc_addr = fcpu(cpu, "altr,fast-tlb-miss-addr");
+
+	of_node_put(cpu);
 }

 #ifdef CONFIG_PROC_FS
--
2.17.1
