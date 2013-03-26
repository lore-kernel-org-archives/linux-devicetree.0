From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 05/11] ARM i.MX6q: set the LDB serial clock parent to the
 video PLL
Date: Tue, 26 Mar 2013 15:14:00 +0100
Message-ID: <1364307246-9017-6-git-send-email-p.zabel@pengutronix.de>
References: <1364307246-9017-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <1364307246-9017-1-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel/>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: "devel" <devel-bounces@linuxdriverproject.org>
To: linux-arm-kernel@lists.infradead.org
Cc: devel@driverdev.osuosl.org, Fabio Estevam <fabio.estevam@freescale.com>, Philipp Zabel <p.zabel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, kernel@pengutronix.de, Martin Fuzzey <mfuzzey@parkeon.com>, Sean Cross <xobs@kosagi.com>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On i.MX6q revision 1.1 and later, set the video PLL as parent for
the LDB clock branch. On revision 1.0, the video PLL is useless
due to missing dividers, so keep the default parent (mmdc_ch1_axi).

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 arch/arm/mach-imx/clk-imx6q.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/mach-imx/clk-imx6q.c b/arch/arm/mach-imx/clk-imx6q.c
index fbab4a9..5528656 100644
--- a/arch/arm/mach-imx/clk-imx6q.c
+++ b/arch/arm/mach-imx/clk-imx6q.c
@@ -465,6 +465,11 @@ int __init mx6q_clocks_init(void)
 	clk_register_clkdev(clk[cko1], "cko1", NULL);
 	clk_register_clkdev(clk[arm], NULL, "cpu0");
 
+	if (imx6q_revision() != IMX_CHIP_REVISION_1_0) {
+		clk_set_parent(clk[ldb_di0_sel], clk[pll5_control3]);
+		clk_set_parent(clk[ldb_di1_sel], clk[pll5_control3]);
+	}
+
 	/*
 	 * The gpmi needs 100MHz frequency in the EDO/Sync mode,
 	 * We can not get the 100MHz from the pll2_pfd0_352m.
-- 
1.8.2.rc2
