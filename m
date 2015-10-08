From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 02/13] arc: use common make variables for dtb builds
Date: Thu,  8 Oct 2015 12:53:36 -0500
Message-ID: <1444326827-3565-3-git-send-email-robh@kernel.org>
References: <1444326827-3565-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444326827-3565-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use dtb-y and always make variables to build dtbs instead of explicit
dtbs rule. This is in preparation to support building all dtbs.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 arch/arc/Makefile          | 2 +-
 arch/arc/boot/dts/Makefile | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 8a27a48..cf0cf34 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -121,7 +121,7 @@ $(boot_targets): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot)/dts $(boot)/dts/$@
 
 dtbs: scripts
-	$(Q)$(MAKE) $(build)=$(boot)/dts dtbs
+	$(Q)$(MAKE) $(build)=$(boot)/dts
 
 archclean:
 	$(Q)$(MAKE) $(clean)=$(boot)
diff --git a/arch/arc/boot/dts/Makefile b/arch/arc/boot/dts/Makefile
index b0e3f19..e8e46f9 100644
--- a/arch/arc/boot/dts/Makefile
+++ b/arch/arc/boot/dts/Makefile
@@ -6,10 +6,10 @@ ifneq ($(CONFIG_ARC_BUILTIN_DTB_NAME),"")
 endif
 
 obj-y   += $(builtindtb-y).dtb.o
-targets += $(builtindtb-y).dtb
+dtb-y := $(builtindtb-y).dtb
 
 .SECONDARY: $(obj)/$(builtindtb-y).dtb.S
 
-dtbs:  $(addprefix  $(obj)/, $(builtindtb-y).dtb)
 
+always := $(dtb-y)
 clean-files := *.dtb  *.dtb.S
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
