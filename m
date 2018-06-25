From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v3 01/24] clk: sunxi-ng: r40: Add minimal rate
 for video PLLs
Date: Mon, 25 Jun 2018 14:02:41 +0200
Message-ID: <20180625120304.7543-2-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBXFUYPMQKGQE5U26MTA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180625120304.7543-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

According to documentation and experience with other similar SoCs, video
PLLs don't work stable if their output frequency is set below 192 MHz.

Because of that, set minimal rate to both R40 video PLLs to 192 MHz.

Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c | 46 +++++++++++++++-------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
index 933f2e68f42a..c16a62a7bdbd 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
@@ -65,17 +65,18 @@ static SUNXI_CCU_NM_WITH_GATE_LOCK(pll_audio_base_clk, "pll-audio-base",
 				   CLK_SET_RATE_UNGATE);
 
 /* TODO: The result of N/M is required to be in [8, 25] range. */
-static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_video0_clk, "pll-video0",
-					"osc24M", 0x0010,
-					8, 7,		/* N */
-					0, 4,		/* M */
-					BIT(24),	/* frac enable */
-					BIT(25),	/* frac select */
-					270000000,	/* frac rate 0 */
-					297000000,	/* frac rate 1 */
-					BIT(31),	/* gate */
-					BIT(28),	/* lock */
-					CLK_SET_RATE_UNGATE);
+static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN(pll_video0_clk, "pll-video0",
+					    "osc24M", 0x0010,
+					    192000000,	/* Minimum rate */
+					    8, 7,	/* N */
+					    0, 4,	/* M */
+					    BIT(24),	/* frac enable */
+					    BIT(25),	/* frac select */
+					    270000000,	/* frac rate 0 */
+					    297000000,	/* frac rate 1 */
+					    BIT(31),	/* gate */
+					    BIT(28),	/* lock */
+					    CLK_SET_RATE_UNGATE);
 
 /* TODO: The result of N/M is required to be in [8, 25] range. */
 static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_ve_clk, "pll-ve",
@@ -151,17 +152,18 @@ static struct ccu_nk pll_periph1_clk = {
 };
 
 /* TODO: The result of N/M is required to be in [8, 25] range. */
-static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_video1_clk, "pll-video1",
-					"osc24M", 0x030,
-					8, 7,		/* N */
-					0, 4,		/* M */
-					BIT(24),	/* frac enable */
-					BIT(25),	/* frac select */
-					270000000,	/* frac rate 0 */
-					297000000,	/* frac rate 1 */
-					BIT(31),	/* gate */
-					BIT(28),	/* lock */
-					CLK_SET_RATE_UNGATE);
+static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN(pll_video1_clk, "pll-video1",
+					    "osc24M", 0x030,
+					    192000000,	/* Minimum rate */
+					    8, 7,	/* N */
+					    0, 4,	/* M */
+					    BIT(24),	/* frac enable */
+					    BIT(25),	/* frac select */
+					    270000000,	/* frac rate 0 */
+					    297000000,	/* frac rate 1 */
+					    BIT(31),	/* gate */
+					    BIT(28),	/* lock */
+					    CLK_SET_RATE_UNGATE);
 
 static struct ccu_nkm pll_sata_clk = {
 	.enable		= BIT(31),
-- 
2.18.0
