From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH 1/3] clk: imx8mq: initialize clock tree earlier
Date: Fri, 22 Feb 2019 10:04:16 +0000
Message-ID: <VI1PR04MB42229593C69A7AE3D6469E8F807F0@VI1PR04MB4222.eurprd04.prod.outlook.com>
References: <1550828264-9962-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550828264-9962-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.o>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

> From: Anson Huang
> Sent: Friday, February 22, 2019 5:42 PM
>=20
> Currently on i.MX8MQ platform, clock driver is probed later than GPIO dri=
ver,
> and GPIO driver does NOT have defer probe mechanism since the GPIO clock =
is
> optional, some platforms have GPIO clocks and some are NOT. So it is an i=
ssue
> that on i.MX8MQ platform, there are GPIO clocks defined, but due to clock
> tree is NOT ready during GPIO driver probe, the GPIO clock management wil=
l
> fail and cause system hang if GPIO clocks are OFF by default.
>=20
> This patch changes the i.MX8MQ clock tree initialization using
> CLK_OF_DECLARE instead of platform driver model to make clock tree ready
> earlier than GPIO driver.

Please double check why GPIO driver can't handle PROBE_DEFER well.
Maintainers suggested us to use platform driver unless there is strong reas=
on.

Regards
Dong Aisheng

>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/clk/imx/clk-imx8mq.c | 33 +++++++--------------------------
>  1 file changed, 7 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c =
index
> 26b57f4..2df1575 100644
> --- a/drivers/clk/imx/clk-imx8mq.c
> +++ b/drivers/clk/imx/clk-imx8mq.c
> @@ -269,10 +269,9 @@ static const char *imx8mq_clko2_sels[] =3D {"osc_25m=
",
> "sys2_pll_200m", "sys1_pll_
>=20
>  static struct clk_onecell_data clk_data;
>=20
> -static int imx8mq_clocks_probe(struct platform_device *pdev)
> +static void __init imx8mq_clocks_init(struct device_node *np)
>  {
> -	struct device *dev =3D &pdev->dev;
> -	struct device_node *np =3D dev->of_node;
> +	struct device_node *anatop_np;
>  	void __iomem *base;
>  	int err;
>  	int i;
> @@ -286,10 +285,10 @@ static int imx8mq_clocks_probe(struct
> platform_device *pdev)
>  	clks[IMX8MQ_CLK_EXT3] =3D of_clk_get_by_name(np, "clk_ext3");
>  	clks[IMX8MQ_CLK_EXT4] =3D of_clk_get_by_name(np, "clk_ext4");
>=20
> -	np =3D of_find_compatible_node(NULL, NULL, "fsl,imx8mq-anatop");
> -	base =3D of_iomap(np, 0);
> +	anatop_np =3D of_find_compatible_node(NULL, NULL,
> "fsl,imx8mq-anatop");
> +	base =3D of_iomap(anatop_np, 0);
>  	if (WARN_ON(!base))
> -		return -ENOMEM;
> +		return;
>=20
>  	clks[IMX8MQ_ARM_PLL_REF_SEL] =3D imx_clk_mux("arm_pll_ref_sel", base
> + 0x28, 16, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
>  	clks[IMX8MQ_GPU_PLL_REF_SEL] =3D imx_clk_mux("gpu_pll_ref_sel", base
> + 0x18, 16, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels)); @@ -389,10 +388,9=
 @@
> static int imx8mq_clocks_probe(struct platform_device *pdev)
>  	clks[IMX8MQ_SYS2_PLL_500M] =3D imx_clk_fixed_factor("sys2_pll_500m",
> "sys2_pll_out", 1, 2);
>  	clks[IMX8MQ_SYS2_PLL_1000M] =3D
> imx_clk_fixed_factor("sys2_pll_1000m", "sys2_pll_out", 1, 1);
>=20
> -	np =3D dev->of_node;
>  	base =3D of_iomap(np, 0);
>  	if (WARN_ON(!base))
> -		return -ENOMEM;
> +		return;
>=20
>  	/* CORE */
>  	clks[IMX8MQ_CLK_A53_SRC] =3D imx_clk_mux2("arm_a53_src", base +
> 0x8000, 24, 3, imx8mq_a53_sels, ARRAY_SIZE(imx8mq_a53_sels)); @@
> -568,22 +566,5 @@ static int imx8mq_clocks_probe(struct platform_device
> *pdev)
>=20
>  	err =3D of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
>  	WARN_ON(err);
> -
> -	return err;
>  }
> -
> -static const struct of_device_id imx8mq_clk_of_match[] =3D {
> -	{ .compatible =3D "fsl,imx8mq-ccm" },
> -	{ /* Sentinel */ },
> -};
> -MODULE_DEVICE_TABLE(of, imx8mq_clk_of_match);
> -
> -
> -static struct platform_driver imx8mq_clk_driver =3D {
> -	.probe =3D imx8mq_clocks_probe,
> -	.driver =3D {
> -		.name =3D "imx8mq-ccm",
> -		.of_match_table =3D of_match_ptr(imx8mq_clk_of_match),
> -	},
> -};
> -module_platform_driver(imx8mq_clk_driver);
> +CLK_OF_DECLARE(imx8mq, "fsl,imx8mq-ccm", imx8mq_clocks_init);
> --
> 2.7.4
