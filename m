From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH 2/6] clk: sunxi-ng: set the parent rate when adjustin CPUX
 clock on A33
Date: Tue, 13 Dec 2016 23:22:48 +0800
Message-ID: <20161213152252.53749-3-icenowy@aosc.xyz>
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

The CPUX clock on A33, which is for the Cortex-A7 cores, is designed to
be changeable by changing the rate of PLL_CPUX.

Add CLK_SET_RATE_PARENT flag to this clock.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
index 0f3e7d2dc19a..0d513d2674cb 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
@@ -170,7 +170,7 @@ static SUNXI_CCU_N_WITH_GATE_LOCK(pll_ddr1_clk, "pll-ddr1",
 static const char * const cpux_parents[] = { "osc32k", "osc24M",
 					     "pll-cpux" , "pll-cpux" };
 static SUNXI_CCU_MUX(cpux_clk, "cpux", cpux_parents,
-		     0x050, 16, 2, CLK_IS_CRITICAL);
+		     0x050, 16, 2, CLK_IS_CRITICAL | CLK_SET_RATE_PARENT);
 
 static SUNXI_CCU_M(axi_clk, "axi", "cpux", 0x050, 0, 2, 0);
 
-- 
2.11.0
