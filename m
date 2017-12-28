From: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Subject: [PATCH v4 08/15] MIPS: ingenic: Use common cmdline handling code
Date: Thu, 28 Dec 2017 14:56:27 +0100
Message-ID: <20171228135634.30000-9-paul@crapouillou.net>
References: <20170702163016.6714-2-paul@crapouillou.net>
 <20171228135634.30000-1-paul@crapouillou.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171228135634.30000-1-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

jz4740_init_cmdline appends all arguments from argv (in fw_arg1) to
arcs_cmdline, up to argc (in fw_arg0). The common code in
fw_init_cmdline will do the exact same thing when run on a system where
fw_arg0 isn't a pointer to kseg0 (it'll also set _fw_envp but we don't
use it). Remove the custom implementation & use the generic code.

Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
---
 arch/mips/jz4740/prom.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

 v2: No change
 v3: No change
 v4: No change

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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
