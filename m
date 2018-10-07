From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v2 03/29] clk: sunxi-ng: Use u64 for calculation
 of NM rate
Date: Sun,  7 Oct 2018 11:38:39 +0200
Message-ID: <20181007093905.11253-4-jernej.skrabec@siol.net>
References: <20181007093905.11253-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBTVI47OQKGQEEAUPJMQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181007093905.11253-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Allwinner H6 SoC has multiplier N range between 1 and 254. Since parent
rate is 24MHz, intermediate result when calculating final rate easily
overflows 32 bit variable.

Because of that, introduce function for calculating clock rate which
uses 64 bit variable for intermediate result.

Fixes: 6174a1e24b0d ("clk: sunxi-ng: Add N-M-factor clock support")
Fixes: ee28648cb2b4 ("clk: sunxi-ng: Remove the use of rational computations")

CC: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu_nm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_nm.c
index 6fe3c14f7b2d..424d8635b053 100644
--- a/drivers/clk/sunxi-ng/ccu_nm.c
+++ b/drivers/clk/sunxi-ng/ccu_nm.c
@@ -19,6 +19,17 @@ struct _ccu_nm {
 	unsigned long	m, min_m, max_m;
 };
 
+static unsigned long ccu_nm_calc_rate(unsigned long parent,
+				      unsigned long n, unsigned long m)
+{
+	u64 rate = parent;
+
+	rate *= n;
+	do_div(rate, m);
+
+	return rate;
+}
+
 static void ccu_nm_find_best(unsigned long parent, unsigned long rate,
 			     struct _ccu_nm *nm)
 {
@@ -28,7 +39,8 @@ static void ccu_nm_find_best(unsigned long parent, unsigned long rate,
 
 	for (_n = nm->min_n; _n <= nm->max_n; _n++) {
 		for (_m = nm->min_m; _m <= nm->max_m; _m++) {
-			unsigned long tmp_rate = parent * _n  / _m;
+			unsigned long tmp_rate = ccu_nm_calc_rate(parent,
+								  _n, _m);
 
 			if (tmp_rate > rate)
 				continue;
@@ -100,7 +112,7 @@ static unsigned long ccu_nm_recalc_rate(struct clk_hw *hw,
 	if (ccu_sdm_helper_is_enabled(&nm->common, &nm->sdm))
 		rate = ccu_sdm_helper_read_rate(&nm->common, &nm->sdm, m, n);
 	else
-		rate = parent_rate * n / m;
+		rate = ccu_nm_calc_rate(parent_rate, n, m);
 
 	if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate /= nm->fixed_post_div;
@@ -149,7 +161,7 @@ static long ccu_nm_round_rate(struct clk_hw *hw, unsigned long rate,
 	_nm.max_m = nm->m.max ?: 1 << nm->m.width;
 
 	ccu_nm_find_best(*parent_rate, rate, &_nm);
-	rate = *parent_rate * _nm.n / _nm.m;
+	rate = ccu_nm_calc_rate(*parent_rate, _nm.n, _nm.m);
 
 	if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate /= nm->fixed_post_div;
-- 
2.19.0
