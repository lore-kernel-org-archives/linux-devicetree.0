From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 2/3] clk: sunxi-ng: a33: Set CLK_SET_RATE_PARENT
 for all audio module clocks
Date: Wed,  5 Dec 2018 18:11:51 +0800
Message-ID: <20181205101152.22983-3-wens@csie.org>
References: <20181205101152.22983-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB3WIT3QAKGQEECCAVRY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181205101152.22983-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

All the audio interfaces on Allwinner SoCs need to change their module
clocks during operation, to switch between support for 44.1 kHz and 48
kHz family sample rates. The clock rate for the module clocks is
governed by their upstream audio PLL. The module clocks themselves only
have a gate, and sometimes a divider or mux. Thus any rate changes need
to be propagated upstream.

Set the CLK_SET_RATE_PARENT flag for all audio module clocks to achieve
this.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
index f763648a5f20..c7bf814dfd2b 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
@@ -377,10 +377,10 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(spi1_clk, "spi1", mod0_default_parents, 0x0a4,
 static const char * const i2s_parents[] = { "pll-audio-8x", "pll-audio-4x",
 					    "pll-audio-2x", "pll-audio" };
 static SUNXI_CCU_MUX_WITH_GATE(i2s0_clk, "i2s0", i2s_parents,
-			       0x0b0, 16, 2, BIT(31), 0);
+			       0x0b0, 16, 2, BIT(31), CLK_SET_RATE_PARENT);
 
 static SUNXI_CCU_MUX_WITH_GATE(i2s1_clk, "i2s1", i2s_parents,
-			       0x0b4, 16, 2, BIT(31), 0);
+			       0x0b4, 16, 2, BIT(31), CLK_SET_RATE_PARENT);
 
 /* TODO: the parent for most of the USB clocks is not known */
 static SUNXI_CCU_GATE(usb_phy0_clk,	"usb-phy0",	"osc24M",
@@ -457,7 +457,7 @@ static SUNXI_CCU_M_WITH_GATE(ve_clk, "ve", "pll-ve",
 static SUNXI_CCU_GATE(ac_dig_clk,	"ac-dig",	"pll-audio",
 		      0x140, BIT(31), CLK_SET_RATE_PARENT);
 static SUNXI_CCU_GATE(ac_dig_4x_clk,	"ac-dig-4x",	"pll-audio-4x",
-		      0x140, BIT(30), 0);
+		      0x140, BIT(30), CLK_SET_RATE_PARENT);
 static SUNXI_CCU_GATE(avs_clk,		"avs",		"osc24M",
 		      0x144, BIT(31), 0);
 
-- 
2.20.0.rc1
