From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 12/15] MIPS: JZ4770: Work around config2 misreporting associativity
Date: Wed,  7 Jun 2017 22:04:36 +0200
Message-ID: <20170607200439.24450-13-paul@crapouillou.net>
References: <20170607200439.24450-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170607200439.24450-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Maarten ter Huurne <maarten@treewalker.org>

According to config2, the associativity would be 5-ways, but the
documentation states 4-ways, which also matches the documented
L2 cache size of 256 kB.

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
---
 arch/mips/mm/sc-mips.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index c909c3342729..67a3b4d88580 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -15,6 +15,7 @@
 #include <asm/mmu_context.h>
 #include <asm/r4kcache.h>
 #include <asm/mips-cm.h>
+#include <asm/bootinfo.h>
 
 /*
  * MIPS32/MIPS64 L2 cache handling
@@ -228,6 +229,14 @@ static inline int __init mips_sc_probe(void)
 	else
 		return 0;
 
+	/*
+	 * According to config2 it would be 5-ways, but that is contradicted
+	 * by all documentation.
+	 */
+	if (current_cpu_type() == CPU_JZRISC &&
+				mips_machtype == MACH_INGENIC_JZ4770)
+		c->scache.ways = 4;
+
 	c->scache.waysize = c->scache.sets * c->scache.linesz;
 	c->scache.waybit = __ffs(c->scache.waysize);
 
-- 
2.11.0
