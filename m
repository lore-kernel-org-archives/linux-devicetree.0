From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH 1/3] .gitignore: sort normal pattern rules alphabetically
Date: Tue, 31 Oct 2017 00:33:45 +0900
Message-ID: <1509377627-11362-2-git-send-email-yamada.masahiro@socionext.com>
References: <1509377627-11362-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509377627-11362-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>, =?UTF-8?q?Vin=C3=ADcius=20Tinti?= <viniciustinti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We are having more and more ignore patterns.  Sort the list
alphabetically.  We will easily catch duplicated patterns if any.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 .gitignore | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/.gitignore b/.gitignore
index 4f034b8..1cc4b2e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -7,38 +7,38 @@
 # command after changing this file, to see if there are
 # any tracked files which get ignored after the change.
 #
-# Normal rules
+# Normal rules (sorted alphabetically)
 #
 .*
+*.a
+*.bin
+*.bz2
+*.c.[012]*.*
+*.dwo
+*.elf
+*.gcno
+*.gz
+*.i
+*.ko
+*.ll
+*.lst
+*.lz4
+*.lzma
+*.lzo
+*.mod.c
 *.o
 *.o.*
-*.a
+*.order
+*.patch
 *.s
-*.ko
 *.so
 *.so.dbg
-*.mod.c
-*.i
-*.lst
+*.su
 *.symtypes
-*.order
-*.elf
-*.bin
 *.tar
-*.gz
-*.bz2
-*.lzma
 *.xz
-*.lz4
-*.lzo
-*.patch
-*.gcno
-*.ll
-modules.builtin
 Module.symvers
-*.dwo
-*.su
-*.c.[012]*.*
+modules.builtin
 
 #
 # Top-level generic files
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
