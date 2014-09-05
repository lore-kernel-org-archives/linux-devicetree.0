From: Anson Huang <b20788@freescale.com>
Subject: [PATCH V2 3/3] ARM: imx: source gpt per clk from OSC for system timer
Date: Fri, 5 Sep 2014 11:26:46 +0800
Message-ID: <1409887606-22388-4-git-send-email-b20788@freescale.com>
References: <1409887606-22388-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1409887606-22388-1-git-send-email-b20788@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawn.guo@linaro.org, festevam@gmail.com, kernel@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On i.MX6Q TO > 1.0, i.MX6DL and i.MX6SX, gpt per clock
can be from OSC instead of ipg_per, as ipg_per's rate
may be scaled when system enter low bus mode, to keep
system timer NOT drift, better to make gpt per clock
at fixed rate, here add support for gpt per clock to
be from OSC which is at fixed rate always.

There are some difference on this implementation of
gpt per clock source, see below for details:

i.MX6Q TO > 1.0: GPT_CR_CLKSRC, 3b'101 selects fix clock
    of OSC / 8 for gpt per clk;
i.MX6DL and i.MX6SX: GPT_CR_CLKSRC, 3b'101 selects OSC
    for gpt per clk, and we must enable GPT_CR_24MEM to
    enable OSC clk source for gpt per, GPT_PR_PRESCALER24M
    is for pre-scaling of this OSC clk, here set it to 8
    to make gpt per clk is 3MHz;
i.MX6SL: ipg_per can be from OSC directly, so no need to
    implement this new clk source for gpt per.

Signed-off-by: Anson Huang <b20788@freescale.com>
---
change logs v1 -> v2:
	add gpt per clk rate check before setting gpt's clk
	source, this is to cover all i.MX6 SoCs and make it
	work with old dtb.

 arch/arm/mach-imx/time.c |   41 +++++++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-imx/time.c b/arch/arm/mach-imx/time.c
index bf92e5a..a3ecb4a 100644
--- a/arch/arm/mach-imx/time.c
+++ b/arch/arm/mach-imx/time.c
@@ -60,17 +60,23 @@
 #define MX2_TSTAT_CAPT		(1 << 1)
 #define MX2_TSTAT_COMP		(1 << 0)
 
-/* MX31, MX35, MX25, MX5 */
+/* MX31, MX35, MX25, MX5, MX6 */
 #define V2_TCTL_WAITEN		(1 << 3) /* Wait enable mode */
 #define V2_TCTL_CLK_IPG		(1 << 6)
 #define V2_TCTL_CLK_PER		(2 << 6)
+#define V2_TCTL_CLK_OSC_DIV8	(5 << 6)
+#define V2_TCTL_CLK_OSC		(7 << 6)
 #define V2_TCTL_FRR		(1 << 9)
+#define V2_TCTL_24MEN		(1 << 10)
+#define V2_TPRER_PRE24M		12
 #define V2_IR			0x0c
 #define V2_TSTAT		0x08
 #define V2_TSTAT_OF1		(1 << 0)
 #define V2_TCN			0x24
 #define V2_TCMP			0x10
 
+#define	V2_TIMER_RATE_OSC_DIV8	3000000
+
 #define timer_is_v1()	(cpu_is_mx1() || cpu_is_mx21() || cpu_is_mx27())
 #define timer_is_v2()	(!timer_is_v1())
 
@@ -293,7 +299,7 @@ static int __init mxc_clockevent_init(struct clk *timer_clk)
 static void __init _mxc_timer_init(int irq,
 				   struct clk *clk_per, struct clk *clk_ipg)
 {
-	uint32_t tctl_val;
+	uint32_t tctl_val, tprer_val;
 
 	if (IS_ERR(clk_per)) {
 		pr_err("i.MX timer: unable to get clk\n");
@@ -312,10 +318,26 @@ static void __init _mxc_timer_init(int irq,
 	__raw_writel(0, timer_base + MXC_TCTL);
 	__raw_writel(0, timer_base + MXC_TPRER); /* see datasheet note */
 
-	if (timer_is_v2())
-		tctl_val = V2_TCTL_CLK_PER | V2_TCTL_FRR | V2_TCTL_WAITEN | MXC_TCTL_TEN;
-	else
+	if (timer_is_v2()) {
+		if (((cpu_is_imx6q() && imx_get_soc_revision() >
+			IMX_CHIP_REVISION_1_0) || cpu_is_imx6dl() ||
+			cpu_is_imx6sx()) && (clk_get_rate(clk_per) ==
+			V2_TIMER_RATE_OSC_DIV8)) {
+			tctl_val = V2_TCTL_CLK_OSC_DIV8 | V2_TCTL_FRR |
+				V2_TCTL_WAITEN | MXC_TCTL_TEN;
+			if (cpu_is_imx6dl() || cpu_is_imx6sx()) {
+				/* 24 / 8 = 3 MHz */
+				tprer_val = 7 << V2_TPRER_PRE24M;
+				__raw_writel(tprer_val, timer_base + MXC_TPRER);
+				tctl_val |= V2_TCTL_24MEN;
+			}
+		} else {
+			tctl_val = V2_TCTL_CLK_PER | V2_TCTL_FRR |
+				V2_TCTL_WAITEN | MXC_TCTL_TEN;
+		}
+	} else {
 		tctl_val = MX1_2_TCTL_FRR | MX1_2_TCTL_CLK_PCLK1 | MXC_TCTL_TEN;
+	}
 
 	__raw_writel(tctl_val, timer_base + MXC_TCTL);
 
@@ -339,7 +361,7 @@ void __init mxc_timer_init(void __iomem *base, int irq)
 
 static void __init mxc_timer_init_dt(struct device_node *np)
 {
-	struct clk *clk_per, *clk_ipg;
+	struct clk *clk_per, *clk_ipg, *clk_osc_per;
 	int irq;
 
 	if (timer_base)
@@ -352,6 +374,13 @@ static void __init mxc_timer_init_dt(struct device_node *np)
 	clk_per = of_clk_get_by_name(np, "per");
 	clk_ipg = of_clk_get_by_name(np, "ipg");
 
+	if ((cpu_is_imx6q() && imx_get_soc_revision() >
+		IMX_CHIP_REVISION_1_0) || cpu_is_imx6dl()) {
+		clk_osc_per = of_clk_get_by_name(np, "osc_per");
+		if (!IS_ERR(clk_osc_per))
+			clk_per = clk_osc_per;
+	}
+
 	_mxc_timer_init(irq, clk_per, clk_ipg);
 }
 CLOCKSOURCE_OF_DECLARE(mx1_timer, "fsl,imx1-gpt", mxc_timer_init_dt);
-- 
1.7.9.5
