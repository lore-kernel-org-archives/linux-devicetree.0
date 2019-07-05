From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH 5/6] clk: imx8mq: Remove CLK_IS_CRITICAL flag for
 IMX8MQ_CLK_TMU_ROOT
Date: Fri, 5 Jul 2019 07:01:08 +0000
Message-ID: <20190705070107.xsxvnh7b36w4q4c6@fsr-ub1664-175>
References: <20190705045612.27665-1-Anson.Huang@nxp.com>
 <20190705045612.27665-5-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705045612.27665-5-Anson.Huang@nxp.com>
Content-Language: en-US
Content-ID: <F7A714F4FD2FF54F9AF66368F4FEFA79@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "angus@akkea.ca" <angus@akkea.ca>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, Leonard Crestez <leonard.c>
List-Id: devicetree@vger.kernel.org

On 19-07-05 12:56:11, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
>=20
> IMX8MQ_CLK_TMU_ROOT is ONLY used for thermal module, the driver
> should manage this clock, so no need to have CLK_IS_CRITICAL flag
> set.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-imx8mq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
> index d407a07..91de69a 100644
> --- a/drivers/clk/imx/clk-imx8mq.c
> +++ b/drivers/clk/imx/clk-imx8mq.c
> @@ -539,7 +539,7 @@ static int imx8mq_clocks_probe(struct platform_device=
 *pdev)
>  	clks[IMX8MQ_CLK_DISP_AXI_ROOT]  =3D imx_clk_gate2_shared2("disp_axi_roo=
t_clk", "disp_axi", base + 0x45d0, 0, &share_count_dcss);
>  	clks[IMX8MQ_CLK_DISP_APB_ROOT]  =3D imx_clk_gate2_shared2("disp_apb_roo=
t_clk", "disp_apb", base + 0x45d0, 0, &share_count_dcss);
>  	clks[IMX8MQ_CLK_DISP_RTRM_ROOT] =3D imx_clk_gate2_shared2("disp_rtrm_ro=
ot_clk", "disp_rtrm", base + 0x45d0, 0, &share_count_dcss);
> -	clks[IMX8MQ_CLK_TMU_ROOT] =3D imx_clk_gate4_flags("tmu_root_clk", "ipg_=
root", base + 0x4620, 0, CLK_IS_CRITICAL);
> +	clks[IMX8MQ_CLK_TMU_ROOT] =3D imx_clk_gate4("tmu_root_clk", "ipg_root",=
 base + 0x4620, 0);
>  	clks[IMX8MQ_CLK_VPU_DEC_ROOT] =3D imx_clk_gate2_flags("vpu_dec_root_clk=
", "vpu_bus", base + 0x4630, 0, CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE=
);
>  	clks[IMX8MQ_CLK_CSI1_ROOT] =3D imx_clk_gate4("csi1_root_clk", "csi1_cor=
e", base + 0x4650, 0);
>  	clks[IMX8MQ_CLK_CSI2_ROOT] =3D imx_clk_gate4("csi2_root_clk", "csi2_cor=
e", base + 0x4660, 0);
> --=20
> 2.7.4
> =
