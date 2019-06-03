From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH V2 2/3] clk: imx: Add support for i.MX8MN clock driver
Date: Mon, 3 Jun 2019 07:30:20 +0000
Message-ID: <20190603073018.j236j57ooc7t5hp6@fsr-ub1664-175>
References: <20190603013503.40626-1-Anson.Huang@nxp.com>
 <20190603013503.40626-2-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603013503.40626-2-Anson.Huang@nxp.com>
Content-Language: en-US
Content-ID: <051749EE44B0A8469CD620AEC45CD774@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "olof@lixom.net" <olof@lixom.net>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, Leonard Crestez <leonard.crestez@nxp.co>
List-Id: devicetree@vger.kernel.org

On 19-06-03 09:35:02, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
>=20
> This patch adds i.MX8MN clock driver support.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V1:
> 	- add GPIOx clocks.

...

> +static struct imx_pll14xx_clk imx8mn_sys_pll __initdata =3D {
> +		.type =3D PLL_1416X,
> +		.rate_table =3D imx8mn_pll1416x_tbl,
> +};
> +
> +static const char *pll_ref_sels[] =3D { "osc_24m", "dummy", "dummy", "du=
mmy", };

All of these should be "static const char * const ".

> +static const char *audio_pll1_bypass_sels[] =3D {"audio_pll1", "audio_pl=
l1_ref_sel", };
> +static const char *audio_pll2_bypass_sels[] =3D {"audio_pll2", "audio_pl=
l2_ref_sel", };

...

> +	clk_data.clks =3D clks;
> +	clk_data.clk_num =3D ARRAY_SIZE(clks);
> +	ret =3D of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> +	if (ret < 0) {
> +		pr_err("failed to register clks for i.MX8MN\n");
> +		return -EINVAL;
> +	}
> +
> +	imx_register_uart_clocks(uart_clks);
> +
> +	return 0;
> +}
> +CLK_OF_DECLARE_DRIVER(imx8mn, "fsl,imx8mn-ccm", imx8mn_clocks_init);

Any reason why this cannot be a platform driver ?

> --=20
> 2.7.4
> =
