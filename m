From: Rob Herring <robh@kernel.org>
Subject: [PATCH 02/21] of: Support matching cpu nodes with no 'reg' property
Date: Wed,  5 Sep 2018 14:37:19 -0500
Message-ID: <20180905193738.19325-3-robh@kernel.org>
References: <20180905193738.19325-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905193738.19325-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

For some single core ARM systems, the DTs can have a single cpu node
without a reg property and #address-cells == 0. This case is valid and
should match on cpu #0.

Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 70609d5a2506..6389aeb2f48c 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -327,6 +327,8 @@ static bool __of_find_n_match_cpu_property(struct device_node *cpun,
 
 	ac = of_n_addr_cells(cpun);
 	cell = of_get_property(cpun, prop_name, &prop_len);
+	if (!cell && !ac && arch_match_cpu_phys_id(cpu, 0))
+		return true;
 	if (!cell || !ac)
 		return false;
 	prop_len /= sizeof(*cell) * ac;
-- 
2.17.1
