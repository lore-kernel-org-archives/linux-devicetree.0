From: Zhou Zhu <zzhu3-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 1/4] arm: mmp: remove not used disp clk_name in ttc_dkb
Date: Tue, 14 Jan 2014 19:16:21 +0800
Message-ID: <1389698184-28761-2-git-send-email-zzhu3@marvell.com>
References: <1389698184-28761-1-git-send-email-zzhu3@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389698184-28761-1-git-send-email-zzhu3-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Chao Xie <chao.xie-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Guoqing Li <ligq-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Zhou Zhu <zzhu3-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

remove clk_name of mmp_disp mach_info in ttc_dkb.
This field is not used by driver now.

Signed-off-by: Zhou Zhu <zzhu3-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-mmp/ttc_dkb.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-mmp/ttc_dkb.c b/arch/arm/mach-mmp/ttc_dkb.c
index cfadd97..9437166 100644
--- a/arch/arm/mach-mmp/ttc_dkb.c
+++ b/arch/arm/mach-mmp/ttc_dkb.c
@@ -204,7 +204,6 @@ static struct mmp_mach_path_config dkb_disp_config[] = {
 
 static struct mmp_mach_plat_info dkb_disp_info = {
 	.name = "mmp-disp",
-	.clk_name = "disp0",
 	.path_num = 1,
 	.paths = dkb_disp_config,
 };
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
