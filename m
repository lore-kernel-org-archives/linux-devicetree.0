From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 4/7] clk: sunxi-ng: Support fixed post-dividers
 on NKMP style clocks
Date: Sat,  6 Jan 2018 12:38:53 +0800
Message-ID: <20180106043856.46975-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBVFHYHJAKGQEKLBTKRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On the new Allwinner H6 SoC, multiple PLL's are NMP style clocks
(modelled as NKMP with no K) and have fixed post-dividers.

Add fixed post divider support to the NKMP style clocks.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu_nkmp.c | 20 +++++++++++++++++---
 drivers/clk/sunxi-ng/ccu_nkmp.h |  2 ++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_nkmp.c
index e58c95787f94..497ac20deb19 100644
--- a/drivers/clk/sunxi-ng/ccu_nkmp.c
+++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
@@ -81,7 +81,7 @@ static unsigned long ccu_nkmp_recalc_rate(struct clk_hw *hw,
 					unsigned long parent_rate)
 {
 	struct ccu_nkmp *nkmp = hw_to_ccu_nkmp(hw);
-	unsigned long n, m, k, p;
+	unsigned long n, m, k, p, rate;
 	u32 reg;
 
 	reg = readl(nkmp->common.base + nkmp->common.reg);
@@ -107,7 +107,11 @@ static unsigned long ccu_nkmp_recalc_rate(struct clk_hw *hw,
 	p = reg >> nkmp->p.shift;
 	p &= (1 << nkmp->p.width) - 1;
 
-	return (parent_rate * n * k >> p) / m;
+	rate = (parent_rate * n * k >> p) / m;
+	if (nkmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		rate /= nkmp->fixed_post_div;
+
+	return rate;
 }
 
 static long ccu_nkmp_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -116,6 +120,9 @@ static long ccu_nkmp_round_rate(struct clk_hw *hw, unsigned long rate,
 	struct ccu_nkmp *nkmp = hw_to_ccu_nkmp(hw);
 	struct _ccu_nkmp _nkmp;
 
+	if (nkmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		rate *= nkmp->fixed_post_div;
+
 	_nkmp.min_n = nkmp->n.min ?: 1;
 	_nkmp.max_n = nkmp->n.max ?: 1 << nkmp->n.width;
 	_nkmp.min_k = nkmp->k.min ?: 1;
@@ -127,7 +134,11 @@ static long ccu_nkmp_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	ccu_nkmp_find_best(*parent_rate, rate, &_nkmp);
 
-	return *parent_rate * _nkmp.n * _nkmp.k / (_nkmp.m * _nkmp.p);
+	rate = *parent_rate * _nkmp.n * _nkmp.k / (_nkmp.m * _nkmp.p);
+	if (nkmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		rate = rate / nkmp->fixed_post_div;
+
+	return rate;
 }
 
 static int ccu_nkmp_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -138,6 +149,9 @@ static int ccu_nkmp_set_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long flags;
 	u32 reg;
 
+	if (nkmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		rate = rate * nkmp->fixed_post_div;
+
 	_nkmp.min_n = nkmp->n.min ?: 1;
 	_nkmp.max_n = nkmp->n.max ?: 1 << nkmp->n.width;
 	_nkmp.min_k = nkmp->k.min ?: 1;
diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.h b/drivers/clk/sunxi-ng/ccu_nkmp.h
index a82facbc6144..6940503e7fc4 100644
--- a/drivers/clk/sunxi-ng/ccu_nkmp.h
+++ b/drivers/clk/sunxi-ng/ccu_nkmp.h
@@ -34,6 +34,8 @@ struct ccu_nkmp {
 	struct ccu_div_internal		m;
 	struct ccu_div_internal		p;
 
+	unsigned int		fixed_post_div;
+
 	struct ccu_common	common;
 };
 
-- 
2.14.2
