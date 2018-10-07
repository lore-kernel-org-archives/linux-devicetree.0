From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v2 02/29] clk: sunxi-ng: Adjust MP clock parent
 rate when allowed
Date: Sun,  7 Oct 2018 11:38:38 +0200
Message-ID: <20181007093905.11253-3-jernej.skrabec@siol.net>
References: <20181007093905.11253-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBSVI47OQKGQECF7NMUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181007093905.11253-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently MP clocks don't consider adjusting parent rate even if they
are allowed to do so. Such behaviour considerably lowers amount of
possible rates, which is very inconvenient when such clock is used for
pixel clock, for example.

In order to improve the situation, adjusting parent rate is considered
when allowed.

This code is inspired by clk_divider_bestdiv() function, which does
basically the same thing for different clock type.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu_mp.c | 64 +++++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.c
index 5d0af4051737..0357349eb767 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.c
+++ b/drivers/clk/sunxi-ng/ccu_mp.c
@@ -40,6 +40,61 @@ static void ccu_mp_find_best(unsigned long parent, unsigned long rate,
 	*p = best_p;
 }
 
+static unsigned long ccu_mp_find_best_with_parent_adj(struct clk_hw *hw,
+						      unsigned long *parent,
+						      unsigned long rate,
+						      unsigned int max_m,
+						      unsigned int max_p)
+{
+	unsigned long parent_rate_saved;
+	unsigned long parent_rate, now;
+	unsigned long best_rate = 0;
+	unsigned int _m, _p, div;
+	unsigned long maxdiv;
+
+	parent_rate_saved = *parent;
+
+	/*
+	 * The maximum divider we can use without overflowing
+	 * unsigned long in rate * m * p below
+	 */
+	maxdiv = max_m * max_p;
+	maxdiv = min(ULONG_MAX / rate, maxdiv);
+
+	for (_p = 1; _p <= max_p; _p <<= 1) {
+		for (_m = 1; _m <= max_m; _m++) {
+			div = _m * _p;
+
+			if (div > maxdiv)
+				break;
+
+			if (rate * div == parent_rate_saved) {
+				/*
+				 * It's the most ideal case if the requested
+				 * rate can be divided from parent clock without
+				 * needing to change parent rate, so return the
+				 * divider immediately.
+				 */
+				*parent = parent_rate_saved;
+				return rate;
+			}
+
+			parent_rate = clk_hw_round_rate(hw, rate * div);
+			now = parent_rate / div;
+
+			if (now <= rate && now > best_rate) {
+				best_rate = now;
+				*parent = parent_rate;
+
+				if (now == rate)
+					return rate;
+			}
+		}
+	}
+
+	return best_rate;
+}
+
 static unsigned long ccu_mp_round_rate(struct ccu_mux_internal *mux,
 				       struct clk_hw *hw,
 				       unsigned long *parent_rate,
@@ -56,8 +111,13 @@ static unsigned long ccu_mp_round_rate(struct ccu_mux_internal *mux,
 	max_m = cmp->m.max ?: 1 << cmp->m.width;
 	max_p = cmp->p.max ?: 1 << ((1 << cmp->p.width) - 1);
 
-	ccu_mp_find_best(*parent_rate, rate, max_m, max_p, &m, &p);
-	rate = *parent_rate / p / m;
+	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
+		ccu_mp_find_best(*parent_rate, rate, max_m, max_p, &m, &p);
+		rate = *parent_rate / p / m;
+	} else {
+		rate = ccu_mp_find_best_with_parent_adj(hw, parent_rate, rate,
+							max_m, max_p);
+	}
 
 	if (cmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate /= cmp->fixed_post_div;
-- 
2.19.0
