From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v5 02/12] clk: sunxi-ng: Use u64 for calculation
 of nkmp rate
Date: Wed, 14 Feb 2018 21:08:56 +0100
Message-ID: <20180214200906.31509-3-jernej.skrabec@siol.net>
References: <20180214200906.31509-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBAVPSLKAKGQEYC7BQ4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

When parent rate is 24MHz and multiplier N >= 180, intermediate clock
rate doesn't fit in 32 bit variable anymore.

Because of that, introduce function for calculating clock rate which
uses 64 bit variable for intermediate result.

Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu_nkmp.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_nkmp.c
index a99068a08315..c3f6fe7be565 100644
--- a/drivers/clk/sunxi-ng/ccu_nkmp.c
+++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
@@ -20,6 +20,18 @@ struct _ccu_nkmp {
 	unsigned long	p, min_p, max_p;
 };
 
+static unsigned long ccu_nkmp_calc_rate(unsigned long parent,
+					unsigned long n, unsigned long k,
+					unsigned long m, unsigned long p)
+{
+	u64 rate = parent;
+
+	rate *= n * k;
+	do_div(rate, m * p);
+
+	return rate;
+}
+
 static void ccu_nkmp_find_best(unsigned long parent, unsigned long rate,
 			       struct _ccu_nkmp *nkmp)
 {
@@ -33,7 +45,9 @@ static void ccu_nkmp_find_best(unsigned long parent, unsigned long rate,
 				for (_p = nkmp->min_p; _p <= nkmp->max_p; _p <<= 1) {
 					unsigned long tmp_rate;
 
-					tmp_rate = parent * _n * _k / (_m * _p);
+					tmp_rate = ccu_nkmp_calc_rate(parent,
+								      _n, _k,
+								      _m, _p);
 
 					if (tmp_rate > rate)
 						continue;
@@ -107,7 +121,7 @@ static unsigned long ccu_nkmp_recalc_rate(struct clk_hw *hw,
 	p = reg >> nkmp->p.shift;
 	p &= (1 << nkmp->p.width) - 1;
 
-	return (parent_rate * n * k >> p) / m;
+	return ccu_nkmp_calc_rate(parent_rate, n, k, m, 1 << p);
 }
 
 static long ccu_nkmp_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -127,7 +141,8 @@ static long ccu_nkmp_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	ccu_nkmp_find_best(*parent_rate, rate, &_nkmp);
 
-	return *parent_rate * _nkmp.n * _nkmp.k / (_nkmp.m * _nkmp.p);
+	return ccu_nkmp_calc_rate(*parent_rate, _nkmp.n, _nkmp.k,
+				  _nkmp.m, _nkmp.p);
 }
 
 static int ccu_nkmp_set_rate(struct clk_hw *hw, unsigned long rate,
-- 
2.16.1
