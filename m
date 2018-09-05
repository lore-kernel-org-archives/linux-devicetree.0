From: Rob Herring <robh@kernel.org>
Subject: [PATCH 08/21] microblaze: get cpu node with of_get_cpu_node
Date: Wed,  5 Sep 2018 14:37:25 -0500
Message-ID: <20180905193738.19325-9-robh@kernel.org>
References: <20180905193738.19325-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905193738.19325-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Michal Simek <monstr@monstr.eu>
List-Id: devicetree@vger.kernel.org

"device_type" use is deprecated for FDT though it has continued to be used
for nodes like cpu nodes. Use of_get_cpu_node() instead which works using
node names by default. This will allow the eventually removal of cpu
device_type properties.

Also, fix a leaked reference by adding a missing of_node_put.

Cc: Michal Simek <monstr@monstr.eu>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take via the DT tree. This is dependent on the
first 2 patches.

 arch/microblaze/kernel/cpu/cpuinfo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/microblaze/kernel/cpu/cpuinfo.c b/arch/microblaze/kernel/cpu/cpuinfo.c
index 96b3f26d16be..0c52aca87478 100644
--- a/arch/microblaze/kernel/cpu/cpuinfo.c
+++ b/arch/microblaze/kernel/cpu/cpuinfo.c
@@ -89,7 +89,7 @@ static struct device_node *cpu;

 void __init setup_cpuinfo(void)
 {
-	cpu = (struct device_node *) of_find_node_by_type(NULL, "cpu");
+	cpu = of_get_cpu_node(0, NULL);
 	if (!cpu)
 		pr_err("You don't have cpu!!!\n");

@@ -117,6 +117,8 @@ void __init setup_cpuinfo(void)
 	if (cpuinfo.mmu_privins)
 		pr_warn("%s: Stream instructions enabled"
 			" - USERSPACE CAN LOCK THIS KERNEL!\n", __func__);
+
+	of_node_put(cpu);
 }

 void __init setup_cpuinfo_clk(void)
--
2.17.1
