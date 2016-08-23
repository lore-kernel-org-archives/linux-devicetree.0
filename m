From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/5] powerpc: introduce arch_enable_default_of_probe()
Date: Tue, 23 Aug 2016 10:06:56 +0800
Message-ID: <1471918019-19472-3-git-send-email-haokexin@gmail.com>
References: <1471918019-19472-1-git-send-email-haokexin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471918019-19472-1-git-send-email-haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We can use this function to enable the default of probe for one
board.

Signed-off-by: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/powerpc/include/asm/setup.h  | 1 +
 arch/powerpc/kernel/of_platform.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index 654d64c9f3ac..213719882fe4 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -24,6 +24,7 @@ extern void reloc_got2(unsigned long);
 void check_for_initrd(void);
 void initmem_init(void);
 void setup_panic(void);
+extern void arch_enable_default_of_probe(void);
 #define ARCH_PANIC_TIMEOUT 180
 
 #ifdef CONFIG_PPC_PSERIES
diff --git a/arch/powerpc/kernel/of_platform.c b/arch/powerpc/kernel/of_platform.c
index ace7fe132b6f..77402a14e928 100644
--- a/arch/powerpc/kernel/of_platform.c
+++ b/arch/powerpc/kernel/of_platform.c
@@ -123,7 +123,14 @@ device_initcall(of_pci_phb_init);
 
 #endif /* CONFIG_PPC_OF_PLATFORM_PCI */
 
+static bool default_of_probe_enabled;
+
 bool __init arch_want_default_of_probe(void)
 {
-	return false;
+	return default_of_probe_enabled;
+}
+
+void __init arch_enable_default_of_probe(void)
+{
+	default_of_probe_enabled = true;
 }
-- 
2.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
