From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 07/13] metag: use common make variables for dtb builds
Date: Thu,  8 Oct 2015 12:53:41 -0500
Message-ID: <1444326827-3565-8-git-send-email-robh@kernel.org>
References: <1444326827-3565-1-git-send-email-robh@kernel.org>
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444326827-3565-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Use dtb-y and always make variables to build dtbs instead of explicit
dtbs rule. This is in preparation to support building all dtbs.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/metag/Makefile          | 2 +-
 arch/metag/boot/dts/Makefile | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/metag/Makefile b/arch/metag/Makefile
index 9739857..033a582 100644
--- a/arch/metag/Makefile
+++ b/arch/metag/Makefile
@@ -72,7 +72,7 @@ $(boot_targets): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot)/dts $(boot)/dts/$@
 
 dtbs: scripts
-	$(Q)$(MAKE) $(build)=$(boot)/dts dtbs
+	$(Q)$(MAKE) $(build)=$(boot)/dts
 
 archclean:
 	$(Q)$(MAKE) $(clean)=$(boot)
diff --git a/arch/metag/boot/dts/Makefile b/arch/metag/boot/dts/Makefile
index 72c1218..2533c38 100644
--- a/arch/metag/boot/dts/Makefile
+++ b/arch/metag/boot/dts/Makefile
@@ -12,11 +12,7 @@ endif
 dtb-$(CONFIG_METAG_BUILTIN_DTB)	+= $(builtindtb-y).dtb
 obj-$(CONFIG_METAG_BUILTIN_DTB)	+= $(builtindtb-y).dtb.o
 
-targets	+= dtbs
-targets	+= $(dtb-y)
-
 .SECONDARY: $(obj)/$(builtindtb-y).dtb.S
 
-dtbs: $(addprefix $(obj)/, $(dtb-y))
-
+always += $(dtb-y)
 clean-files += *.dtb *.dtb.S
-- 
2.1.4
