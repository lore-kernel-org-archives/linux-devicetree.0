From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH] net: stmmac: dwmac-sun8i: sun8i_syscon_reg_field can be
 static
Date: Thu, 22 Mar 2018 15:42:18 +0800
Message-ID: <20180322074217.GA7358@ivytown2.lkp.intel.com>
References: <20180317092857.4396-7-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180317092857.4396-7-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, kbuild-all@01.org, Corentin Labbe <clabbe.montjoie@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


Fixes: e3c10deef23c ("net: stmmac: dwmac-sun8i: Use regmap_field for syscon register access")
Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 dwmac-sun8i.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index de93f0f..bbc0514 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -79,7 +79,7 @@ struct sunxi_priv_data {
 };
 
 /* EMAC clock register @ 0x30 in the "system control" address range */
-const struct reg_field sun8i_syscon_reg_field = {
+static const struct reg_field sun8i_syscon_reg_field = {
 	.reg = 0x30,
 	.lsb = 0,
 	.msb = 31,
