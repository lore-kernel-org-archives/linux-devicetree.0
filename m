From: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 10/15] [NOT FOR MERGE] clk: sunxi-ng: sun8i:
 Avoid turning off unused PRCM gates
Date: Fri,  1 Mar 2019 22:29:46 -0600
Message-ID: <20190302042951.53671-11-samuel@sholland.org>
References: <20190302042951.53671-1-samuel@sholland.org>
Reply-To: samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDA2PU6QWEARBR4N5DRQKGQEX3ILEKI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190302042951.53671-1-samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hardware attached to AHB0/APB0 and controlled in the PRCM is designed to
be used by firmware running on the ARISC core. However, some devices in
this block (specifically the I2C, RSB, PIO, and CIR-RX) have native
Linux drivers and are already in the device tree. In particular, the RSB
and I2C buses may have sound chips and display bridges hanging off of
them that cannot easily be driven from firmware.

To facilitate sharing this hardware block between Linux and system
firmware, avoid turning off PRCM clock gates that are unreferenced in
the device tree. We assume that firmware has already optimally
configured these clocks before booting Linux.

Signed-off-by: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-r.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r.c b/drivers/clk/sunxi-ng/ccu-sun8i-r.c
index 90b3530e2c18..603de1e853e9 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-r.c
@@ -92,19 +92,19 @@ static struct ccu_div apb0_clk = {
 static SUNXI_CCU_M(a83t_apb0_clk, "apb0", "ahb0", 0x0c, 0, 2, 0);
 
 static SUNXI_CCU_GATE(apb0_pio_clk,	"apb0-pio",	"apb0",
-		      0x28, BIT(0), 0);
+		      0x28, BIT(0), CLK_IGNORE_UNUSED);
 static SUNXI_CCU_GATE(apb0_ir_clk,	"apb0-ir",	"apb0",
-		      0x28, BIT(1), 0);
+		      0x28, BIT(1), CLK_IGNORE_UNUSED);
 static SUNXI_CCU_GATE(apb0_timer_clk,	"apb0-timer",	"apb0",
-		      0x28, BIT(2), 0);
+		      0x28, BIT(2), CLK_IGNORE_UNUSED);
 static SUNXI_CCU_GATE(apb0_rsb_clk,	"apb0-rsb",	"apb0",
-		      0x28, BIT(3), 0);
+		      0x28, BIT(3), CLK_IGNORE_UNUSED);
 static SUNXI_CCU_GATE(apb0_uart_clk,	"apb0-uart",	"apb0",
-		      0x28, BIT(4), 0);
+		      0x28, BIT(4), CLK_IGNORE_UNUSED);
 static SUNXI_CCU_GATE(apb0_i2c_clk,	"apb0-i2c",	"apb0",
-		      0x28, BIT(6), 0);
+		      0x28, BIT(6), CLK_IGNORE_UNUSED);
 static SUNXI_CCU_GATE(apb0_twd_clk,	"apb0-twd",	"apb0",
-		      0x28, BIT(7), 0);
+		      0x28, BIT(7), CLK_IGNORE_UNUSED);
 
 static const char * const r_mod0_default_parents[] = { "osc32k", "osc24M" };
 static SUNXI_CCU_MP_WITH_MUX_GATE(ir_clk, "ir",
@@ -113,7 +113,7 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(ir_clk, "ir",
 				  16, 2,	/* P */
 				  24, 2,	/* mux */
 				  BIT(31),	/* gate */
-				  0);
+				  CLK_IGNORE_UNUSED);
 
 static const char *const a83t_r_mod0_parents[] = { "osc16M", "osc24M" };
 static const struct ccu_mux_fixed_prediv a83t_ir_predivs[] = {
@@ -138,7 +138,7 @@ static struct ccu_mp a83t_ir_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS("ir",
 						      a83t_r_mod0_parents,
 						      &ccu_mp_ops,
-						      0),
+						      CLK_IGNORE_UNUSED),
 	},
 };
 
-- 
2.19.2
