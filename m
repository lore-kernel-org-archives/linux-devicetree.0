From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [RFC v4 10/11] clk: mediatek: make dpi0_sel and hdmi_sel not propagate rate changes
Date: Fri, 16 Oct 2015 22:12:12 +0200
Message-ID: <1445026333-17013-11-git-send-email-p.zabel@pengutronix.de>
References: <1445026333-17013-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445026333-17013-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These muxes are supposed to select a fitting divider after the PLL
is already set to the correct rate.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/clk/mediatek/clk-mt8173.c | 4 ++--
 drivers/clk/mediatek/clk-mtk.h    | 7 +++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 01f7365..e7b3997 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -550,7 +550,7 @@ static const struct mtk_composite top_muxes[] __initconst = {
 	MUX_GATE(CLK_TOP_ATB_SEL, "atb_sel", atb_parents, 0x0090, 16, 2, 23),
 	MUX_GATE(CLK_TOP_VENC_LT_SEL, "venclt_sel", venc_lt_parents, 0x0090, 24, 4, 31),
 	/* CLK_CFG_6 */
-	MUX_GATE(CLK_TOP_DPI0_SEL, "dpi0_sel", dpi0_parents, 0x00a0, 0, 3, 7),
+	MUX_GATE_FLAGS(CLK_TOP_DPI0_SEL, "dpi0_sel", dpi0_parents, 0x00a0, 0, 3, 7, 0),
 	MUX_GATE(CLK_TOP_IRDA_SEL, "irda_sel", irda_parents, 0x00a0, 8, 2, 15),
 	MUX_GATE(CLK_TOP_CCI400_SEL, "cci400_sel", cci400_parents, 0x00a0, 16, 3, 23),
 	MUX_GATE(CLK_TOP_AUD_1_SEL, "aud_1_sel", aud_1_parents, 0x00a0, 24, 2, 31),
@@ -561,7 +561,7 @@ static const struct mtk_composite top_muxes[] __initconst = {
 	MUX_GATE(CLK_TOP_SCAM_SEL, "scam_sel", scam_parents, 0x00b0, 24, 2, 31),
 	/* CLK_CFG_12 */
 	MUX_GATE(CLK_TOP_SPINFI_IFR_SEL, "spinfi_ifr_sel", spinfi_ifr_parents, 0x00c0, 0, 3, 7),
-	MUX_GATE(CLK_TOP_HDMI_SEL, "hdmi_sel", hdmi_parents, 0x00c0, 8, 2, 15),
+	MUX_GATE_FLAGS(CLK_TOP_HDMI_SEL, "hdmi_sel", hdmi_parents, 0x00c0, 8, 2, 15, 0),
 	MUX_GATE(CLK_TOP_DPILVDS_SEL, "dpilvds_sel", dpilvds_parents, 0x00c0, 24, 3, 31),
 	/* CLK_CFG_13 */
 	MUX_GATE(CLK_TOP_MSDC50_2_H_SEL, "msdc50_2_h_sel", msdc50_2_h_parents, 0x00d0, 0, 3, 7),
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index f390cb0..1acb046 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -66,7 +66,7 @@ struct mtk_composite {
 	signed char num_parents;
 };
 
-#define MUX_GATE(_id, _name, _parents, _reg, _shift, _width, _gate) {	\
+#define MUX_GATE_FLAGS(_id, _name, _parents, _reg, _shift, _width, _gate, _flags) {	\
 		.id = _id,						\
 		.name = _name,						\
 		.mux_reg = _reg,					\
@@ -77,9 +77,12 @@ struct mtk_composite {
 		.divider_shift = -1,					\
 		.parent_names = _parents,				\
 		.num_parents = ARRAY_SIZE(_parents),			\
-		.flags = CLK_SET_RATE_PARENT,				\
+		.flags = _flags,					\
 	}
 
+#define MUX_GATE(_id, _name, _parents, _reg, _shift, _width, _gate)	\
+	MUX_GATE_FLAGS(_id, _name, _parents, _reg, _shift, _width, _gate, CLK_SET_RATE_PARENT)
+
 #define MUX(_id, _name, _parents, _reg, _shift, _width) {		\
 		.id = _id,						\
 		.name = _name,						\
-- 
2.6.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
