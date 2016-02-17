From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v11 07/14] drm/mediatek: enable hdmi output control bit
Date: Wed, 17 Feb 2016 12:28:47 +0100
Message-ID: <1455708534-20274-8-git-send-email-p.zabel@pengutronix.de>
References: <1455708534-20274-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455708534-20274-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel@>
List-Id: devicetree@vger.kernel.org

From: Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

MT8173 HDMI hardware has a output control bit to enable/disable HDMI
output. Because of security reason, so this bit can ONLY be controlled
in ARM supervisor mode. Now the only way to enter ARM supervisor is the
ARM trusted firmware. So atf provides a API for HDMI driver to call to
setup this HDMI control bit to enable HDMI output in supervisor mode.

Signed-off-by: Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_hw.c   | 12 ++++++++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_regs.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_hw.c b/drivers/gpu/drm/mediatek/mtk_hdmi_hw.c
index 99c7ffc..ea4e35f 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_hw.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_hw.c
@@ -15,6 +15,7 @@
 #include "mtk_hdmi_regs.h"
 #include "mtk_hdmi.h"
 
+#include <linux/arm-smccc.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/hdmi.h>
@@ -50,6 +51,17 @@ void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi,
 
 void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool enable)
 {
+	struct arm_smccc_res res;
+
+	/*
+	 * MT8173 HDMI hardware has an output control bit to enable/disable HDMI
+	 * output. This bit can only be controlled in ARM supervisor mode.
+	 * The ARM trusted firmware provides an API for the HDMI driver to set
+	 * this control bit to enable HDMI output in supervisor mode.
+	 */
+	arm_smccc_smc(MTK_SIP_SET_AUTHORIZED_SECURE_REG, 0x14000904, 0x80000000,
+		      0, 0, 0, 0, 0, &res);
+
 	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG20,
 			   HDMI_PCLK_FREE_RUN, enable ? HDMI_PCLK_FREE_RUN : 0);
 	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG1C,
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
index 8c1d318..d88279f 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
@@ -218,4 +218,5 @@
 #define MHL_SYNC_AUTO_EN		BIT(30)
 #define HDMI_PCLK_FREE_RUN		BIT(31)
 
+#define MTK_SIP_SET_AUTHORIZED_SECURE_REG 0x82000001
 #endif
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
