From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH] net: stmmac: dwmac-sun8i: sun8i_ccu_reg_field can be
 static
Date: Thu, 22 Mar 2018 16:41:52 +0800
Message-ID: <20180322084152.GA79138@ivytown2.lkp.intel.com>
References: <20180317092857.4396-10-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180317092857.4396-10-wens@csie.org>
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


Fixes: 0e59c15b2797 ("net: stmmac: dwmac-sun8i: Add support for GMAC on Allwinner R40 SoC")
Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 dwmac-sun8i.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index be6705e8..622fb2b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -98,7 +98,7 @@ const struct reg_field sun8i_syscon_reg_field = {
 };
 
 /* EMAC clock register @ 0x164 in the CCU address range */
-const struct reg_field sun8i_ccu_reg_field = {
+static const struct reg_field sun8i_ccu_reg_field = {
 	.reg = 0x164,
 	.lsb = 0,
 	.msb = 31,
