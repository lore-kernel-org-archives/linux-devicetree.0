From: Rob Herring <robh@kernel.org>
Subject: [PATCH 04/21] ARM: topology: remove unneeded check for /cpus node
Date: Wed,  5 Sep 2018 14:37:21 -0500
Message-ID: <20180905193738.19325-5-robh@kernel.org>
References: <20180905193738.19325-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905193738.19325-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Checking for "/cpus" node is not necessary as of_get_cpu_node() will fail
later on anyways. The call to of_find_node_by_path() also leaks a
reference. So just remove the check.

Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take via the DT tree. This is dependent on the
first 2 patches.

 arch/arm/kernel/topology.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
index 24ac3cab411d..60e375ce1ab2 100644
--- a/arch/arm/kernel/topology.c
+++ b/arch/arm/kernel/topology.c
@@ -94,12 +94,6 @@ static void __init parse_dt_topology(void)
 	__cpu_capacity = kcalloc(nr_cpu_ids, sizeof(*__cpu_capacity),
 				 GFP_NOWAIT);

-	cn = of_find_node_by_path("/cpus");
-	if (!cn) {
-		pr_err("No CPU information found in DT\n");
-		return;
-	}
-
 	for_each_possible_cpu(cpu) {
 		const u32 *rate;
 		int len;
--
2.17.1
