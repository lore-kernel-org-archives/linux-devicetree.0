From: Rob Herring <robh@kernel.org>
Subject: [PATCH] base: Convert to using %pOF instead of full_name
Date: Tue, 18 Jul 2017 16:42:49 -0500
Message-ID: <20170718214339.7774-9-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that we have a custom printf format specifier, convert users of
full_name to use %pOF instead. This is preparation to remove storing
of the full path string for each node.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/base/arch_topology.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index d1c33a85059e..53f4f10fd9bb 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -144,12 +144,12 @@ int __init topology_parse_cpu_capacity(struct device_node *cpu_node, int cpu)
 		}
 		capacity_scale = max(cpu_capacity, capacity_scale);
 		raw_capacity[cpu] = cpu_capacity;
-		pr_debug("cpu_capacity: %s cpu_capacity=%u (raw)\n",
-			cpu_node->full_name, raw_capacity[cpu]);
+		pr_debug("cpu_capacity: %pOF cpu_capacity=%u (raw)\n",
+			cpu_node, raw_capacity[cpu]);
 	} else {
 		if (raw_capacity) {
-			pr_err("cpu_capacity: missing %s raw capacity\n",
-				cpu_node->full_name);
+			pr_err("cpu_capacity: missing %pOF raw capacity\n",
+				cpu_node);
 			pr_err("cpu_capacity: partial information: fallback to 1024 for all CPUs\n");
 		}
 		cap_parsing_failed = true;
--
2.11.0
