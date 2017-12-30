From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH 01/11] clk: sunxi-ng: Don't set k if width is 0
 for nkmp plls
Date: Sat, 30 Dec 2017 22:01:53 +0100
Message-ID: <20171230210203.24115-2-jernej.skrabec@siol.net>
References: <20171230210203.24115-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBW75T7JAKGQE5NZA2EA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171230210203.24115-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jernej.skrabec-gGgVlfcn5nU@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

For example, A83T have nmp plls which are modelled as nkmp plls. Since k
is not specified, it has offset 0, shift 0 and lowest value 1. This
means that LSB bit is always set to 1, which may change clock rate.

Fix that by applying k factor only if k width is greater than 0.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu_nkmp.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_nkmp.c
index e58c95787f94..709f528af2b3 100644
--- a/drivers/clk/sunxi-ng/ccu_nkmp.c
+++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
@@ -81,7 +81,7 @@ static unsigned long ccu_nkmp_recalc_rate(struct clk_hw *hw,
 					unsigned long parent_rate)
 {
 	struct ccu_nkmp *nkmp = hw_to_ccu_nkmp(hw);
-	unsigned long n, m, k, p;
+	unsigned long n, m, k = 1, p;
 	u32 reg;
 
 	reg = readl(nkmp->common.base + nkmp->common.reg);
@@ -92,11 +92,13 @@ static unsigned long ccu_nkmp_recalc_rate(struct clk_hw *hw,
 	if (!n)
 		n++;
 
-	k = reg >> nkmp->k.shift;
-	k &= (1 << nkmp->k.width) - 1;
-	k += nkmp->k.offset;
-	if (!k)
-		k++;
+	if (nkmp->k.width) {
+		k = reg >> nkmp->k.shift;
+		k &= (1 << nkmp->k.width) - 1;
+		k += nkmp->k.offset;
+		if (!k)
+			k++;
+	}
 
 	m = reg >> nkmp->m.shift;
 	m &= (1 << nkmp->m.width) - 1;
@@ -153,12 +155,15 @@ static int ccu_nkmp_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	reg = readl(nkmp->common.base + nkmp->common.reg);
 	reg &= ~GENMASK(nkmp->n.width + nkmp->n.shift - 1, nkmp->n.shift);
-	reg &= ~GENMASK(nkmp->k.width + nkmp->k.shift - 1, nkmp->k.shift);
+	if (nkmp->k.width)
+		reg &= ~GENMASK(nkmp->k.width + nkmp->k.shift - 1,
+				nkmp->k.shift);
 	reg &= ~GENMASK(nkmp->m.width + nkmp->m.shift - 1, nkmp->m.shift);
 	reg &= ~GENMASK(nkmp->p.width + nkmp->p.shift - 1, nkmp->p.shift);
 
 	reg |= (_nkmp.n - nkmp->n.offset) << nkmp->n.shift;
-	reg |= (_nkmp.k - nkmp->k.offset) << nkmp->k.shift;
+	if (nkmp->k.width)
+		reg |= (_nkmp.k - nkmp->k.offset) << nkmp->k.shift;
 	reg |= (_nkmp.m - nkmp->m.offset) << nkmp->m.shift;
 	reg |= ilog2(_nkmp.p) << nkmp->p.shift;
 
-- 
2.15.1
