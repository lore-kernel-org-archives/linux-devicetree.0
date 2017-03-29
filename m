From: "A.S. Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 2/2] soc/imx: add workaround for i.MX6QP to the GPC PD
 driver
Date: Wed, 29 Mar 2017 16:08:02 +0000
Message-ID: <DB5PR04MB1431A7CC91F55ECFE5BE31FB80350@DB5PR04MB1431.eurprd04.prod.outlook.com>
References: <20170323144418.30977-1-l.stach@pengutronix.de>
 <20170323144418.30977-3-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170323144418.30977-3-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lucas,

> -----Original Message-----
> From: Lucas Stach [mailto:l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org]
> Sent: Thursday, March 23, 2017 10:44 PM
> To: Shawn Guo
> Cc: Fabio Estevam; A.S. Dong; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; patchwork-
> lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
> Subject: [PATCH 2/2] soc/imx: add workaround for i.MX6QP to the GPC PD
> driver
>=20
> On i.MX6QP, due to hardware erratum ERR009619, the PRE clocks may be
> stalled during the power up sequencing of the PU power domain. As this ma=
y
> lead to a complete loss of display output, the recommended workaround is
> to keep the PU domain enabled during normal system operation.
>=20
> Implement this by rejecting the domain power down request on the affected
> SoC.
>=20
> Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  drivers/soc/imx/gpc.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/soc/imx/gpc.c b/drivers/soc/imx/gpc.c index
> 4294287e5f6c..599e1e46f694 100644
> --- a/drivers/soc/imx/gpc.c
> +++ b/drivers/soc/imx/gpc.c
> @@ -45,6 +45,7 @@ struct imx_pm_domain {
>  	unsigned int reg_offs;
>  	signed char cntr_pdn_bit;
>  	unsigned int ipg_rate_mhz;
> +	bool allow_dynamic_pd;
>  };
>=20
>  static inline struct imx_pm_domain *
> @@ -59,6 +60,9 @@ static int imx6_pm_domain_power_off(struct
> generic_pm_domain *genpd)
>  	int iso, iso2sw;
>  	u32 val;
>=20
> +	if (!pd->allow_dynamic_pd)
> +		return -EBUSY;
> +
>  	/* Read ISO and ISO2SW power down delays */
>  	regmap_read(pd->regmap, pd->reg_offs + GPC_PGC_PUPSCR_OFFS, &val);
>  	iso =3D val & 0x3f;
> @@ -255,6 +259,7 @@ static struct imx_pm_domain imx_gpc_domains[] =3D {
>  		},
>  		.reg_offs =3D 0x260,
>  		.cntr_pdn_bit =3D 0,
> +		.allow_dynamic_pd =3D true,
>  	}, {
>  		.base =3D {
>  			.name =3D "DISPLAY",
> @@ -263,23 +268,33 @@ static struct imx_pm_domain imx_gpc_domains[] =3D {
>  		},
>  		.reg_offs =3D 0x240,
>  		.cntr_pdn_bit =3D 4,
> +		.allow_dynamic_pd =3D true,

Just a Nitpick, besides shawn's comment in another mail,
if we use a domain flag like IMX_PD_ALWAYS_ON set by SoC errata flag,
then probably we can save all the default allow_dynamic_pd lines.
This also release the life when adding new domains.

Otherwise, the two patch seems good to me.

Regards
Dong Aisheng

>  	}
>  };
>=20
>  struct imx_gpc_dt_data {
>  	int num_domains;
> +	bool err009619_present;
>  };
>=20
>  static const struct imx_gpc_dt_data imx6q_dt_data =3D {
>  	.num_domains =3D 2,
> +	.err009619_present =3D false,
> +};
> +
> +static const struct imx_gpc_dt_data imx6qp_dt_data =3D {
> +	.num_domains =3D 2,
> +	.err009619_present =3D true,
>  };
>=20
>  static const struct imx_gpc_dt_data imx6sl_dt_data =3D {
>  	.num_domains =3D 3,
> +	.err009619_present =3D false,
>  };
>=20
>  static const struct of_device_id imx_gpc_dt_ids[] =3D {
>  	{ .compatible =3D "fsl,imx6q-gpc", .data =3D &imx6q_dt_data },
> +	{ .compatible =3D "fsl,imx6qp-gpc", .data =3D &imx6qp_dt_data },
>  	{ .compatible =3D "fsl,imx6sl-gpc", .data =3D &imx6sl_dt_data },
>  	{ }
>  };
> @@ -377,6 +392,10 @@ static int imx_gpc_probe(struct platform_device *pde=
v)
>  		return ret;
>  	}
>=20
> +	/* Disable PU power down in normal operation if ERR009619 is present
> */
> +	if (of_id_data->err009619_present)
> +		imx_gpc_domains[1].allow_dynamic_pd =3D false;
> +
>  	if (!pgc_node) {
>  		ret =3D imx_gpc_old_dt_init(&pdev->dev, regmap,
>  					  of_id_data->num_domains);
> --
> 2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
