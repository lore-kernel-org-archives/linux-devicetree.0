From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH] of: unittest: refactor Makefile
Date: Fri,  5 Jan 2018 20:55:30 +0900
Message-ID: <1515153330-11810-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some cleanups:
 - use obj-$(CONFIG_OF_OVERLAY) instead of ifdef ... endif
 - compute targets from obj-y

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 drivers/of/unittest-data/Makefile | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index 32389ac..df69797 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -2,19 +2,12 @@
 DTC_FLAGS_testcases := -Wno-interrupts_property
 obj-y += testcases.dtb.o
 
-targets += testcases.dtb testcases.dtb.S
+obj-$(CONFIG_OF_OVERLAY) += overlay.dtb.o \
+			    overlay_bad_phandle.dtb.o \
+			    overlay_bad_symbol.dtb.o \
+			    overlay_base.dtb.o
 
-ifdef CONFIG_OF_OVERLAY
-
-obj-y += overlay.dtb.o
-obj-y += overlay_bad_phandle.dtb.o
-obj-y += overlay_bad_symbol.dtb.o
-obj-y += overlay_base.dtb.o
-
-targets += overlay.dtb overlay.dtb.S
-targets += overlay_bad_phandle.dtb overlay_bad_phandle.dtb.S
-targets += overlay_bad_symbol.dtb overlay_bad_symbol.dtb.S
-targets += overlay_base.dtb overlay_base.dtb.S
+targets += $(foreach suffix, dtb dtb.S, $(patsubst %.dtb.o,%.$(suffix),$(obj-y)))
 
 # enable creation of __symbols__ node
 DTC_FLAGS_overlay := -@
@@ -22,8 +15,6 @@ DTC_FLAGS_overlay_bad_phandle := -@
 DTC_FLAGS_overlay_bad_symbol := -@
 DTC_FLAGS_overlay_base := -@
 
-endif
-
 .PRECIOUS: \
 	$(obj)/%.dtb.S \
 	$(obj)/%.dtb
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
