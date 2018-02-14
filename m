From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v5 01/12] clk: sunxi-ng: Mask nkmp factors when
 setting register
Date: Wed, 14 Feb 2018 21:08:55 +0100
Message-ID: <20180214200906.31509-2-jernej.skrabec@siol.net>
References: <20180214200906.31509-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERB75OSLKAKGQEZ2N3ERI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180214200906.31509-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
Cc: jernej.skrabec-gGgVlfcn5nU@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently, if one of the factors isn't present, bit 0 gets always set to
1. For example, A83T has NMP PLLs modelled as NKMP PLL without K. Since
K is not specified, it's offset, width and shift is 0. Driver assumes
that lowest value possible is 1, otherwise we would get division by 0.
That situation causes that bit 0 is always set, which may change wanted
clock rate.

Fix that by masking every factor according to it's specified width.
Factors with width set to 0 won't have any influence to final register
value.

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu_nkmp.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_nkmp.c
index e58c95787f94..a99068a08315 100644
--- a/drivers/clk/sunxi-ng/ccu_nkmp.c
+++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
@@ -134,6 +134,7 @@ static int ccu_nkmp_set_rate(struct clk_hw *hw, unsigned long rate,
 			   unsigned long parent_rate)
 {
 	struct ccu_nkmp *nkmp = hw_to_ccu_nkmp(hw);
+	u32 n_mask, k_mask, m_mask, p_mask;
 	struct _ccu_nkmp _nkmp;
 	unsigned long flags;
 	u32 reg;
@@ -149,18 +150,20 @@ static int ccu_nkmp_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	ccu_nkmp_find_best(parent_rate, rate, &_nkmp);
 
+	n_mask = GENMASK(nkmp->n.width + nkmp->n.shift - 1, nkmp->n.shift);
+	k_mask = GENMASK(nkmp->k.width + nkmp->k.shift - 1, nkmp->k.shift);
+	m_mask = GENMASK(nkmp->m.width + nkmp->m.shift - 1, nkmp->m.shift);
+	p_mask = GENMASK(nkmp->p.width + nkmp->p.shift - 1, nkmp->p.shift);
+
 	spin_lock_irqsave(nkmp->common.lock, flags);
 
 	reg = readl(nkmp->common.base + nkmp->common.reg);
-	reg &= ~GENMASK(nkmp->n.width + nkmp->n.shift - 1, nkmp->n.shift);
-	reg &= ~GENMASK(nkmp->k.width + nkmp->k.shift - 1, nkmp->k.shift);
-	reg &= ~GENMASK(nkmp->m.width + nkmp->m.shift - 1, nkmp->m.shift);
-	reg &= ~GENMASK(nkmp->p.width + nkmp->p.shift - 1, nkmp->p.shift);
-
-	reg |= (_nkmp.n - nkmp->n.offset) << nkmp->n.shift;
-	reg |= (_nkmp.k - nkmp->k.offset) << nkmp->k.shift;
-	reg |= (_nkmp.m - nkmp->m.offset) << nkmp->m.shift;
-	reg |= ilog2(_nkmp.p) << nkmp->p.shift;
+	reg &= ~(n_mask | k_mask | m_mask | p_mask);
+
+	reg |= ((_nkmp.n - nkmp->n.offset) << nkmp->n.shift) & n_mask;
+	reg |= ((_nkmp.k - nkmp->k.offset) << nkmp->k.shift) & k_mask;
+	reg |= ((_nkmp.m - nkmp->m.offset) << nkmp->m.shift) & m_mask;
+	reg |= (ilog2(_nkmp.p) << nkmp->p.shift) & p_mask;
 
 	writel(reg, nkmp->common.base + nkmp->common.reg);
 
-- 
2.16.1
