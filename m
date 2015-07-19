From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH] MIPS: fix build with CONFIG_OF=y for non OF-enabled targets
Date: Sun, 19 Jul 2015 14:42:49 +0200
Message-ID: <1437309769-8382-1-git-send-email-jogo@openwrt.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Commit 01306aeadd75 ("MIPS: prepare for user enabling of CONFIG_OF")
changed the guards in asm/prom.h from CONFIG_OF to CONFIG_USE_OF, but
missed the actual function declarations in kernel/prom.c, which have
additional dependencies.

Fixes the following build error:

  CC      arch/mips/kernel/prom.o
arch/mips/kernel/prom.c: In function '__dt_setup_arch':
arch/mips/kernel/prom.c:54:2: error: implicit declaration of function 'early_init_dt_scan' [-Werror=implicit-function-declaration]
  if (!early_init_dt_scan(bph))
  ^

Fixes: 01306aeadd75 ("MIPS: prepare for user enabling of CONFIG_OF")
Signed-off-by: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
---
 arch/mips/kernel/prom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
index b130033..5fcec30 100644
--- a/arch/mips/kernel/prom.c
+++ b/arch/mips/kernel/prom.c
@@ -38,7 +38,7 @@ char *mips_get_machine_name(void)
 	return mips_machine_name;
 }
 
-#ifdef CONFIG_OF
+#ifdef CONFIG_USE_OF
 void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 {
 	return add_memory_region(base, size, BOOT_MEM_RAM);
-- 
2.1.4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
