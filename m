From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 2/3] clk: imx: imx7ulp: add arm hsrun mode clocks support
Date: Fri, 7 Dec 2018 10:03:34 +0000
Message-ID: <1544176659-32022-2-git-send-email-Anson.Huang@nxp.com>
References: <1544176659-32022-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544176659-32022-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

i.MX7ULP has a Cortex-A7 CPU which can run in RUN mode
or HSRUN mode, it is controlled in SMC1 module. The RUN
mode and HSRUN mode will use different clock source for
ARM, "divcore" for RUN mode and "hsrun_divcore" for HSRUN
mode, so the control bits in SMC1 module can be abstracted
as a HW clock mux, this patch adds HSRUN mode related
clocks in SCG1 module and adds "arm" clock in SMC1 module
to support RUN mode and HSRUN mode switch.

Latest clock tree in RUN mode as below:

 firc                                 0        0        0    48000000      =
    0     0  50000
    firc_bus_clk                      0        0        0    48000000      =
    0     0  50000
    hsrun_scs_sel                     0        0        0    48000000      =
    0     0  50000
       hsrun_divcore                  0        0        0    48000000      =
    0     0  50000

 sosc                                 3        3        3    24000000      =
    0     0  50000
    spll_pre_sel                      1        1        1    24000000      =
    0     0  50000
       spll_pre_div                   1        1        2    24000000      =
    0     0  50000
          spll                        1        1        2   528000000      =
    0     0  50000
             spll_pfd0                1        1        1   500210526      =
    0     0  50000
                spll_pfd_sel          1        1        0   500210526      =
    0     0  50000
                   spll_sel           1        1        0   500210526      =
    0     0  50000
                      scs_sel         1        1        0   500210526      =
    0     0  50000
                         divcore      1        1        0   500210526      =
    0     0  50000
                            arm       1        1        0   500210526      =
    0     0  50000

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/clk/imx/clk-imx7ulp.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx7ulp.c b/drivers/clk/imx/clk-imx7ulp.c
index 3b7507f..4e18f62 100644
--- a/drivers/clk/imx/clk-imx7ulp.c
+++ b/drivers/clk/imx/clk-imx7ulp.c
@@ -29,6 +29,7 @@ static const char * const ddr_sels[]		=3D { "apll_pfd_sel=
", "upll", };
 static const char * const nic_sels[]		=3D { "firc", "ddr_clk", };
 static const char * const periph_plat_sels[]	=3D { "dummy", "nic1_bus_clk"=
, "nic1_clk", "ddr_clk", "apll_pfd2", "apll_pfd1", "apll_pfd0", "upll", };
 static const char * const periph_bus_sels[]	=3D { "dummy", "sosc_bus_clk",=
 "mpll", "firc_bus_clk", "rosc", "nic1_bus_clk", "nic1_clk", "spll_bus_clk"=
, };
+static const char * const arm_sels[]		=3D { "divcore", "dummy", "dummy", "=
hsrun_divcore", };
=20
 /* used by sosc/sirc/firc/ddr/spll/apll dividers */
 static const struct clk_div_table ulp_div_table[] =3D {
@@ -102,10 +103,12 @@ static void __init imx7ulp_clk_scg1_init(struct devic=
e_node *np)
=20
 	/* scs/ddr/nic select different clock source requires that clock to be en=
abled first */
 	clks[IMX7ULP_CLK_SYS_SEL]	=3D imx_clk_hw_mux2("scs_sel", base + 0x14, 24,=
 4, scs_sels, ARRAY_SIZE(scs_sels));
+	clks[IMX7ULP_CLK_HSRUN_SYS_SEL] =3D imx_clk_hw_mux2("hsrun_scs_sel", base=
 + 0x1c, 24, 4, scs_sels, ARRAY_SIZE(scs_sels));
 	clks[IMX7ULP_CLK_NIC_SEL]	=3D imx_clk_hw_mux2("nic_sel", base + 0x40, 28,=
 1, nic_sels, ARRAY_SIZE(nic_sels));
 	clks[IMX7ULP_CLK_DDR_SEL]	=3D imx_clk_hw_mux_flags("ddr_sel", base + 0x30=
, 24, 1, ddr_sels, ARRAY_SIZE(ddr_sels), CLK_SET_RATE_PARENT | CLK_OPS_PARE=
NT_ENABLE);
=20
-	clks[IMX7ULP_CLK_CORE_DIV]	=3D imx_clk_hw_divider_flags("divcore",	"scs_s=
el",  base + 0x14, 16, 4, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
+	clks[IMX7ULP_CLK_CORE_DIV]	=3D imx_clk_hw_divider_flags("divcore",	"scs_s=
el",  base + 0x14, 16, 4, CLK_SET_RATE_PARENT);
+	clks[IMX7ULP_CLK_HSRUN_CORE_DIV] =3D imx_clk_hw_divider_flags("hsrun_divc=
ore", "hsrun_scs_sel", base + 0x1c, 16, 4, CLK_SET_RATE_PARENT);
=20
 	clks[IMX7ULP_CLK_DDR_DIV]	=3D imx_clk_divider_gate("ddr_clk", "ddr_sel", =
CLK_SET_RATE_PARENT | CLK_IS_CRITICAL, base + 0x30, 0, 3,
 							       0, ulp_div_table, &imx_ccm_lock);
@@ -218,3 +221,29 @@ static void __init imx7ulp_clk_pcc3_init(struct device=
_node *np)
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
 }
 CLK_OF_DECLARE(imx7ulp_clk_pcc3, "fsl,imx7ulp-pcc3", imx7ulp_clk_pcc3_init=
);
+
+static void __init imx7ulp_clk_smc1_init(struct device_node *np)
+{
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **clks;
+	void __iomem *base;
+
+	clk_data =3D kzalloc(sizeof(*clk_data) + sizeof(*clk_data->hws) *
+			   IMX7ULP_CLK_SMC1_END, GFP_KERNEL);
+	if (!clk_data)
+		return;
+
+	clk_data->num =3D IMX7ULP_CLK_SMC1_END;
+	clks =3D clk_data->hws;
+
+	/* SMC1 */
+	base =3D of_iomap(np, 0);
+	WARN_ON(!base);
+
+	clks[IMX7ULP_CLK_ARM] =3D imx_clk_hw_mux_flags("arm", base + 0x10, 8, 2, =
arm_sels, ARRAY_SIZE(arm_sels), CLK_IS_CRITICAL);
+
+	imx_check_clk_hws(clks, clk_data->num);
+
+	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
+}
+CLK_OF_DECLARE(imx7ulp_clk_smc1, "fsl,imx7ulp-smc1", imx7ulp_clk_smc1_init=
);
--=20
2.7.4
