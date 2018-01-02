From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 08/15] MIPS: ingenic: Use common cmdline handling code
Date: Tue,  2 Jan 2018 16:08:41 +0100
Message-ID: <20180102150848.11314-8-paul@crapouillou.net>
References: <20180102150848.11314-1-paul@crapouillou.net>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20180102150848.11314-1-paul@crapouillou.net>
Sender: linux-clk-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>
List-Id: devicetree@vger.kernel.org

From: Paul Burton <paul.burton@imgtec.com>

jz4740_init_cmdline appends all arguments from argv (in fw_arg1) to
arcs_cmdline, up to argc (in fw_arg0). The common code in
fw_init_cmdline will do the exact same thing when run on a system where
fw_arg0 isn't a pointer to kseg0 (it'll also set _fw_envp but we don't
use it). Remove the custom implementation & use the generic code.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/jz4740/prom.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

 v2: No change
 v3: No change
 v4: No change
 v5: No change

diff --git a/arch/mips/jz4740/prom.c b/arch/mips/jz4740/prom.c
index 47e857194ce6..a62dd8e6ecf9 100644
--- a/arch/mips/jz4740/prom.c
+++ b/arch/mips/jz4740/prom.c
@@ -20,33 +20,13 @@
 #include <linux/serial_reg.h>
 
 #include <asm/bootinfo.h>
+#include <asm/fw/fw.h>
 #include <asm/mach-jz4740/base.h>
 
-static __init void jz4740_init_cmdline(int argc, char *argv[])
-{
-	unsigned int count = COMMAND_LINE_SIZE - 1;
-	int i;
-	char *dst = &(arcs_cmdline[0]);
-	char *src;
-
-	for (i = 1; i < argc && count; ++i) {
-		src = argv[i];
-		while (*src && count) {
-			*dst++ = *src++;
-			--count;
-		}
-		*dst++ = ' ';
-	}
-	if (i > 1)
-		--dst;
-
-	*dst = 0;
-}
-
 void __init prom_init(void)
 {
-	jz4740_init_cmdline((int)fw_arg0, (char **)fw_arg1);
 	mips_machtype = MACH_INGENIC_JZ4740;
+	fw_init_cmdline();
 }
 
 void __init prom_free_prom_memory(void)
-- 
2.11.0

