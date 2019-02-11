From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 2/2] clk: mmp2: separate LCDC peripheral clk form the display clock
Date: Mon, 11 Feb 2019 11:20:50 +0100
Message-ID: <20190211102050.24422-2-lkundrak@v3.sk>
References: <20190211102050.24422-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211102050.24422-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

These are in fact two clocks, they shouldn't be exposed as one. One is
required for accessing LCD controller registers (peripheral clock), while
other (AXI clock) can be optionally used as a pixel clock source for the
panel.

LCDC can alternatively use different clocks than the Display 1 AXI clock
for generating the pixel clock: the second AXI clock (fixed in this
commit too), the HDMI PLL, or the AXI bus clock.

They should really be controlled independently.

Link: https://lists.freedesktop.org/archives/dri-devel/2019-January/20397=
5.html
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/clk/mmp/clk-of-mmp2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mmp/clk-of-mmp2.c b/drivers/clk/mmp/clk-of-mmp2.=
c
index d083b860f083..a60a1be937ad 100644
--- a/drivers/clk/mmp/clk-of-mmp2.c
+++ b/drivers/clk/mmp/clk-of-mmp2.c
@@ -229,9 +229,10 @@ static struct mmp_param_gate_clk apmu_gate_clks[] =3D=
 {
 	{MMP2_CLK_SDH1, "sdh1_clk", "sdh_mix_clk", CLK_SET_RATE_PARENT, APMU_SD=
H1, 0x1b, 0x1b, 0x0, 0, &sdh_lock},
 	{MMP2_CLK_SDH2, "sdh2_clk", "sdh_mix_clk", CLK_SET_RATE_PARENT, APMU_SD=
H2, 0x1b, 0x1b, 0x0, 0, &sdh_lock},
 	{MMP2_CLK_SDH3, "sdh3_clk", "sdh_mix_clk", CLK_SET_RATE_PARENT, APMU_SD=
H3, 0x1b, 0x1b, 0x0, 0, &sdh_lock},
-	{MMP2_CLK_DISP0, "disp0_clk", "disp0_div", CLK_SET_RATE_PARENT, APMU_DI=
SP0, 0x1b, 0x1b, 0x0, 0, &disp0_lock},
+	{MMP2_CLK_DISP0, "disp0_clk", "disp0_div", CLK_SET_RATE_PARENT, APMU_DI=
SP0, 0x09, 0x09, 0x0, 0, &disp0_lock},
+	{MMP2_CLK_DISP0_LCDC, "disp0_lcdc_clk", "disp0_mux", CLK_SET_RATE_PAREN=
T, APMU_DISP0, 0x12, 0x12, 0x0, 0, &disp0_lock},
 	{MMP2_CLK_DISP0_SPHY, "disp0_sphy_clk", "disp0_sphy_div", CLK_SET_RATE_=
PARENT, APMU_DISP0, 0x1024, 0x1024, 0x0, 0, &disp0_lock},
-	{MMP2_CLK_DISP1, "disp1_clk", "disp1_div", CLK_SET_RATE_PARENT, APMU_DI=
SP1, 0x1b, 0x1b, 0x0, 0, &disp1_lock},
+	{MMP2_CLK_DISP1, "disp1_clk", "disp1_div", CLK_SET_RATE_PARENT, APMU_DI=
SP1, 0x09, 0x09, 0x0, 0, &disp1_lock},
 	{MMP2_CLK_CCIC_ARBITER, "ccic_arbiter", "vctcxo", CLK_SET_RATE_PARENT, =
APMU_CCIC0, 0x1800, 0x1800, 0x0, 0, &ccic0_lock},
 	{MMP2_CLK_CCIC0, "ccic0_clk", "ccic0_mix_clk", CLK_SET_RATE_PARENT, APM=
U_CCIC0, 0x1b, 0x1b, 0x0, 0, &ccic0_lock},
 	{MMP2_CLK_CCIC0_PHY, "ccic0_phy_clk", "ccic0_mix_clk", CLK_SET_RATE_PAR=
ENT, APMU_CCIC0, 0x24, 0x24, 0x0, 0, &ccic0_lock},
--=20
2.20.1
