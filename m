From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH 02/11] clk: sunxi-ng: a83t: Add M divider to
 TCON1 clock
Date: Sat, 30 Dec 2017 22:01:54 +0100
Message-ID: <20171230210203.24115-3-jernej.skrabec@siol.net>
References: <20171230210203.24115-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBXP5T7JAKGQELWJWA3Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

TCON1 also has M divider, contrary to TCON0.

Fixes: 05359be1176b ("clk: sunxi-ng: Add driver for A83T CCU")

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
index 04a9c33f53f0..7d08015b980d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
@@ -504,8 +504,8 @@ static SUNXI_CCU_MUX_WITH_GATE(tcon0_clk, "tcon0", tcon0_parents,
 				 0x118, 24, 3, BIT(31), CLK_SET_RATE_PARENT);
 
 static const char * const tcon1_parents[] = { "pll-video1" };
-static SUNXI_CCU_MUX_WITH_GATE(tcon1_clk, "tcon1", tcon1_parents,
-				 0x11c, 24, 3, BIT(31), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_M_WITH_MUX_GATE(tcon1_clk, "tcon1", tcon1_parents,
+				 0x11c, 0, 4, 24, 2, BIT(31), CLK_SET_RATE_PARENT);
 
 static SUNXI_CCU_GATE(csi_misc_clk, "csi-misc", "osc24M", 0x130, BIT(16), 0);
 
-- 
2.15.1
