From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v2 03/16] clk: sunxi-ng: h3: h5: Allow some
 clocks to set parent rate
Date: Tue, 27 Feb 2018 23:26:48 +0100
Message-ID: <20180227222701.9716-4-jernej.skrabec@siol.net>
References: <20180227222701.9716-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBVFW27KAKGQEFEVRJPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180227222701.9716-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: jernej.skrabec-gGgVlfcn5nU@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some units have to be able to set it's own clock precisely to work
correctly. Allow them to do so by adding CLK_SET_RATE_PARENT flag.

Add this flag to DE, TCON and HDMI clocks.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
index b9f39078c0b2..77ed0b0ba681 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
@@ -452,11 +452,13 @@ static SUNXI_CCU_GATE(dram_ts_clk,	"dram-ts",	"dram",
 
 static const char * const de_parents[] = { "pll-periph0-2x", "pll-de" };
 static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
-				 0x104, 0, 4, 24, 3, BIT(31), 0);
+				 0x104, 0, 4, 24, 3, BIT(31),
+				 CLK_SET_RATE_PARENT);
 
 static const char * const tcon_parents[] = { "pll-video" };
 static SUNXI_CCU_M_WITH_MUX_GATE(tcon_clk, "tcon", tcon_parents,
-				 0x118, 0, 4, 24, 3, BIT(31), 0);
+				 0x118, 0, 4, 24, 3, BIT(31),
+				 CLK_SET_RATE_PARENT);
 
 static const char * const tve_parents[] = { "pll-de", "pll-periph1" };
 static SUNXI_CCU_M_WITH_MUX_GATE(tve_clk, "tve", tve_parents,
@@ -487,7 +489,8 @@ static SUNXI_CCU_GATE(avs_clk,		"avs",		"osc24M",
 
 static const char * const hdmi_parents[] = { "pll-video" };
 static SUNXI_CCU_M_WITH_MUX_GATE(hdmi_clk, "hdmi", hdmi_parents,
-				 0x150, 0, 4, 24, 2, BIT(31), 0);
+				 0x150, 0, 4, 24, 2, BIT(31),
+				 CLK_SET_RATE_PARENT);
 
 static SUNXI_CCU_GATE(hdmi_ddc_clk,	"hdmi-ddc",	"osc24M",
 		      0x154, BIT(31), 0);
-- 
2.16.2
