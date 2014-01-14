From: Zhou Zhu <zzhu3-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 2/4] video: mmp: no need to get clk_name from mach_info
Date: Tue, 14 Jan 2014 19:16:22 +0800
Message-ID: <1389698184-28761-3-git-send-email-zzhu3@marvell.com>
References: <1389698184-28761-1-git-send-email-zzhu3@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389698184-28761-1-git-send-email-zzhu3-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Chao Xie <chao.xie-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Guoqing Li <ligq-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Zhou Zhu <zzhu3-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As the display controller has only one clock, no need to
get clk_name from mach_info

Signed-off-by: Zhou Zhu <zzhu3-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 drivers/video/mmp/hw/mmp_ctrl.c |    4 ++--
 include/video/mmp_disp.h        |    1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/mmp/hw/mmp_ctrl.c b/drivers/video/mmp/hw/mmp_ctrl.c
index 8621a9f..b65913e 100644
--- a/drivers/video/mmp/hw/mmp_ctrl.c
+++ b/drivers/video/mmp/hw/mmp_ctrl.c
@@ -521,9 +521,9 @@ static int mmphw_probe(struct platform_device *pdev)
 	}
 
 	/* get clock */
-	ctrl->clk = devm_clk_get(ctrl->dev, mi->clk_name);
+	ctrl->clk = devm_clk_get(ctrl->dev, NULL);
 	if (IS_ERR(ctrl->clk)) {
-		dev_err(ctrl->dev, "unable to get clk %s\n", mi->clk_name);
+		dev_err(ctrl->dev, "unable to get clk for %s\n", ctrl->name);
 		ret = -ENOENT;
 		goto failed;
 	}
diff --git a/include/video/mmp_disp.h b/include/video/mmp_disp.h
index 9fd9398..05a3a60 100644
--- a/include/video/mmp_disp.h
+++ b/include/video/mmp_disp.h
@@ -344,7 +344,6 @@ struct mmp_mach_path_config {
 
 struct mmp_mach_plat_info {
 	const char *name;
-	const char *clk_name;
 	int path_num;
 	struct mmp_mach_path_config *paths;
 };
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
