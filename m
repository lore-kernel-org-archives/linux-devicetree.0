From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v4 02/11] clk: sunxi-ng: a64: Add max. rate
 constraint to video PLLs
Date: Tue,  4 Sep 2018 12:40:44 +0800
Message-ID: <20180904044053.15425-3-icenowy@aosc.io>
References: <20180904044053.15425-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBCM2XDOAKGQEQSBD22A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180904044053.15425-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Video PLLs on A64 can be set to higher rate that it is actually
supported by HW.

Limit maximum rate to 1008 MHz. This is the maximum allowed rate by BSP
clock driver. Interestengly, user manual specifies maximum frequency to
be 600 MHz. Historically, this data was wrong in some user manuals for
other SoCs, so more faith is put in BSP clock driver.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
New patch in v4.

 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 50 ++++++++++++++-------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index d0e30192f0cf..5f80eb018014 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -64,18 +64,19 @@ static SUNXI_CCU_NM_WITH_GATE_LOCK(pll_audio_base_clk, "pll-audio-base",
 				   BIT(28),	/* lock */
 				   CLK_SET_RATE_UNGATE);
 
-static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN(pll_video0_clk, "pll-video0",
-					    "osc24M", 0x010,
-					    192000000,	/* Minimum rate */
-					    8, 7,		/* N */
-					    0, 4,		/* M */
-					    BIT(24),	/* frac enable */
-					    BIT(25),	/* frac select */
-					    270000000,	/* frac rate 0 */
-					    297000000,	/* frac rate 1 */
-					    BIT(31),	/* gate */
-					    BIT(28),	/* lock */
-					    CLK_SET_RATE_UNGATE);
+static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX(pll_video0_clk, "pll-video0",
+						"osc24M", 0x010,
+						192000000,	/* Minimum rate */
+						1008000000,	/* Maximum rate */
+						8, 7,		/* N */
+						0, 4,		/* M */
+						BIT(24),	/* frac enable */
+						BIT(25),	/* frac select */
+						270000000,	/* frac rate 0 */
+						297000000,	/* frac rate 1 */
+						BIT(31),	/* gate */
+						BIT(28),	/* lock */
+						CLK_SET_RATE_UNGATE);
 
 static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_ve_clk, "pll-ve",
 					"osc24M", 0x018,
@@ -126,18 +127,19 @@ static struct ccu_nk pll_periph1_clk = {
 	},
 };
 
-static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN(pll_video1_clk, "pll-video1",
-					    "osc24M", 0x030,
-					    192000000,	/* Minimum rate */
-					    8, 7,		/* N */
-					    0, 4,		/* M */
-					    BIT(24),	/* frac enable */
-					    BIT(25),	/* frac select */
-					    270000000,	/* frac rate 0 */
-					    297000000,	/* frac rate 1 */
-					    BIT(31),	/* gate */
-					    BIT(28),	/* lock */
-					    CLK_SET_RATE_UNGATE);
+static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX(pll_video1_clk, "pll-video1",
+						"osc24M", 0x030,
+						192000000,	/* Minimum rate */
+						1008000000,	/* Maximum rate */
+						8, 7,		/* N */
+						0, 4,		/* M */
+						BIT(24),	/* frac enable */
+						BIT(25),	/* frac select */
+						270000000,	/* frac rate 0 */
+						297000000,	/* frac rate 1 */
+						BIT(31),	/* gate */
+						BIT(28),	/* lock */
+						CLK_SET_RATE_UNGATE);
 
 static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_gpu_clk, "pll-gpu",
 					"osc24M", 0x038,
-- 
2.18.0
