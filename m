From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH 1/6] clk: sunxi-ng: fix PLL_CPUX adjusting on A33
Date: Tue, 13 Dec 2016 23:22:47 +0800
Message-ID: <20161213152252.53749-2-icenowy@aosc.xyz>
References: <20161213152252.53749-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161213152252.53749-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Jorik Jonker <jorik@kippendief.biz>, Hans de Goede <hdegoede@redhat.com>, Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: devicetree@vger.kernel.org, Icenowy Zheng <icenowy@aosc.xyz>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When adjusting PLL_CPUX on A33, the PLL is temporarily driven too high,
and the system hangs.

Add a notifier to avoid this situation by temporarily switching to a
known stable 24 MHz oscillator.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
index 3cd4190ccd59..0f3e7d2dc19a 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
@@ -752,6 +752,13 @@ static const struct sunxi_ccu_desc sun8i_a33_ccu_desc = {
 	.num_resets	= ARRAY_SIZE(sun8i_a33_ccu_resets),
 };
 
+static struct ccu_mux_nb sun8i_a33_cpu_nb = {
+	.common		= &cpux_clk.common,
+	.cm		= &cpux_clk.mux,
+	.delay_us	= 1, /* > 8 clock cycles at 24 MHz */
+	.bypass_index	= 1, /* index of 24 MHz oscillator */
+};
+
 static void __init sun8i_a33_ccu_setup(struct device_node *node)
 {
 	void __iomem *reg;
@@ -775,6 +782,9 @@ static void __init sun8i_a33_ccu_setup(struct device_node *node)
 	writel(val, reg + SUN8I_A33_PLL_MIPI_REG);
 
 	sunxi_ccu_probe(node, reg, &sun8i_a33_ccu_desc);
+
+	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
+				  &sun8i_a33_cpu_nb);
 }
 CLK_OF_DECLARE(sun8i_a33_ccu, "allwinner,sun8i-a33-ccu",
 	       sun8i_a33_ccu_setup);
-- 
2.11.0
