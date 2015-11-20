From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] kbuild: Enable DT symbols when CONFIG_OF_OVERLAY is used
Date: Fri, 20 Nov 2015 14:47:50 +0100
Message-ID: <1448027270-25488-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
Replacement for "ARM: DT: Enable symbols when CONFIG_OF_OVERLAY is
used".
---
 scripts/Makefile.lib | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 79e86613712f2230..6efc8c2bcf3e8eba 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -281,6 +281,10 @@ cmd_dt_S_dtb=						\
 $(obj)/%.dtb.S: $(obj)/%.dtb
 	$(call cmd,dt_S_dtb)
 
+ifeq ($(CONFIG_OF_OVERLAY),y)
+DTC_FLAGS += -@
+endif
+
 quiet_cmd_dtc = DTC     $@
 cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
 	$(CPP) $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
