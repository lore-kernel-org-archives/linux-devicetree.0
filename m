From: <Frank.Li@freescale.com>
Subject: [PATCH v4 08/11] ARM: imx: add gpt system timer support for imx7d
Date: Tue, 21 Apr 2015 05:05:30 +0800
Message-ID: <1429563933-3129-9-git-send-email-Frank.Li@freescale.com>
References: <1429563933-3129-1-git-send-email-Frank.Li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1429563933-3129-1-git-send-email-Frank.Li@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lznuaa@gmail.com, shawn.guo@linaro.org, linus.walleij@linaro.org, robh+dt@kernel.org
Cc: linux-gpio@vger.kernel.org, Anson Huang <b20788@freescale.com>, Frank Li <Frank.Li@freescale.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Li <Frank.Li@freescale.com>

Add GPT system timer support for i.MX7D, it has same hardware
as i.MX6DL.

Signed-off-by: Frank Li <Frank.Li@freescale.com>
Signed-off-by: Anson Huang <b20788@freescale.com>
---
 arch/arm/mach-imx/time.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/time.c b/arch/arm/mach-imx/time.c
index 15d18e1..7c1d8a3 100644
--- a/arch/arm/mach-imx/time.c
+++ b/arch/arm/mach-imx/time.c
@@ -321,7 +321,7 @@ static void __init _mxc_timer_init(int irq,
 		tctl_val = V2_TCTL_FRR | V2_TCTL_WAITEN | MXC_TCTL_TEN;
 		if (clk_get_rate(clk_per) == V2_TIMER_RATE_OSC_DIV8) {
 			tctl_val |= V2_TCTL_CLK_OSC_DIV8;
-			if (cpu_is_imx6dl() || cpu_is_imx6sx()) {
+			if (cpu_is_imx6dl() || cpu_is_imx6sx() || cpu_is_imx7d()) {
 				/* 24 / 8 = 3 MHz */
 				__raw_writel(7 << V2_TPRER_PRE24M,
 					timer_base + MXC_TPRER);
@@ -383,3 +383,4 @@ CLOCKSOURCE_OF_DECLARE(mx53_timer, "fsl,imx53-gpt", mxc_timer_init_dt);
 CLOCKSOURCE_OF_DECLARE(mx6q_timer, "fsl,imx6q-gpt", mxc_timer_init_dt);
 CLOCKSOURCE_OF_DECLARE(mx6sl_timer, "fsl,imx6sl-gpt", mxc_timer_init_dt);
 CLOCKSOURCE_OF_DECLARE(mx6sx_timer, "fsl,imx6sx-gpt", mxc_timer_init_dt);
+CLOCKSOURCE_OF_DECLARE(mx7d_timer, "fsl,imx7d-gpt", mxc_timer_init_dt);
-- 
1.9.1
