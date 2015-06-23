From: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
Subject: [PATCH 2/9] arm: do not place huge encoder tables on stack when it is too small
Date: Tue, 23 Jun 2015 23:19:40 +0200
Message-ID: <1435094387-20146-3-git-send-email-pawelo__21226.1816174307$1435096301$gmane$org@king.net.pl>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435094387-20146-1-git-send-email-pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nathan Lynch <nathan_lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Nicolas
Cc: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>, Yuri Tikhonov <yur-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Sergei Poselenov <sposelenov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Dmitry Cherkassov <d_cherkasov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Alexander Potashev <aspotashev-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since stack on Cortex-M3 is too small, we need configuration option
to avoid using it for huge encoder tables of zlib.

Signed-off-by: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
---
 arch/arm/Kconfig-nommu     | 4 ++++
 lib/zlib_inflate/inflate.c | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm/Kconfig-nommu b/arch/arm/Kconfig-nommu
index aed66d5..965ca97 100644
--- a/arch/arm/Kconfig-nommu
+++ b/arch/arm/Kconfig-nommu
@@ -62,3 +62,7 @@ config ARM_MPU
 
          If your CPU has an MPU then you should choose 'y' here unless you
          know that you do not want to use the MPU.
+
+config ZLIB_INFLATE_STACK_SAVING
+	bool 'Do not place huge encoder tables on stack' if ZLIB_INFLATE
+	depends on ZLIB_INFLATE
diff --git a/lib/zlib_inflate/inflate.c b/lib/zlib_inflate/inflate.c
index 58a733b..917b7cf 100644
--- a/lib/zlib_inflate/inflate.c
+++ b/lib/zlib_inflate/inflate.c
@@ -75,9 +75,14 @@ int zlib_inflateInit2(z_streamp strm, int windowBits)
    Return state with length and distance decoding tables and index sizes set to
    fixed code decoding.  This returns fixed tables from inffixed.h.
  */
+#ifdef CONFIG_ZLIB_INFLATE_STACK_SAVING
+#   include "inffixed.h"
+#endif
 static void zlib_fixedtables(struct inflate_state *state)
 {
+#ifndef CONFIG_ZLIB_INFLATE_STACK_SAVING
 #   include "inffixed.h"
+#endif
     state->lencode = lenfix;
     state->lenbits = 9;
     state->distcode = distfix;
-- 
2.3.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
