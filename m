From: bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org
Subject: [PATCH 4/8] clk: renesas: r8a7795: Add CMT clocks
Date: Fri,  9 Sep 2016 20:43:10 +0900
Message-ID: <1473421394-9745-5-git-send-email-bd-phuc@jinso.co.jp>
References: <1473421394-9745-1-git-send-email-bd-phuc@jinso.co.jp>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473421394-9745-1-git-send-email-bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, ryusuke.sakato.bx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, h-inayoshi-HEF513clHfp3+QwDJ9on6Q@public.gmane.org, cm-hiep-HEF513clHfp3+QwDJ9on6Q@public.gmane.org, nv-dung-HEF513clHfp3+QwDJ9on6Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Bui Duc Phuc <bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org>

This patch adds CMT module clocks for r8a7795 SoC.

Signed-off-by: Bui Duc Phuc <bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index e38bf60..86968ea 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -123,6 +123,10 @@ static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
 	DEF_MOD("sys-dmac2",		 217,	R8A7795_CLK_S3D1),
 	DEF_MOD("sys-dmac1",		 218,	R8A7795_CLK_S3D1),
 	DEF_MOD("sys-dmac0",		 219,	R8A7795_CLK_S3D1),
+	DEF_MOD("cmt3",		 	 300,	R8A7795_CLK_R),
+	DEF_MOD("cmt2",		 	 301,	R8A7795_CLK_R),
+	DEF_MOD("cmt1",		 	 302,	R8A7795_CLK_R),
+	DEF_MOD("cmt0",		 	 303,	R8A7795_CLK_R),
 	DEF_MOD("scif2",		 310,	R8A7795_CLK_S3D4),
 	DEF_MOD("sdif3",		 311,	R8A7795_CLK_SD3),
 	DEF_MOD("sdif2",		 312,	R8A7795_CLK_SD2),
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
