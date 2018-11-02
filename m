From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v4 03/10] phy: sun4i-usb: add support for H6
 USB2 PHY
Date: Fri, 02 Nov 2018 16:41:54 +0800
Message-ID: <9cca3453d646f38793df411c4471d062769b4f72.camel@aosc.io>
References: <20181004122855.22981-1-icenowy@aosc.io>
	 <20181004122855.22981-4-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBWU36DPAKGQE2RB5SZI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181004122855.22981-4-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2018-10-04=E5=9B=9B=E7=9A=84 20:28 +0800=EF=BC=8CIcenowy Zheng=E5=
=86=99=E9=81=93=EF=BC=9A
> The USB 2.0 PHY on Allwinner H6 SoC is similar to older Allwinner
> SoCs,
> with some USB0 quirk like A83T and PHY index 1/2 missing.
>=20
> Add support for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Excuse me.

Kishon, could you check PATCH 1~3 and queue them?

Even if USB3 support is pending, USB2 support will still be useful, and
they're independent.

> ---
> No changes in v4.
>=20
> Changes in v3:
> - Added Chen-Yu's Review tag.
>=20
>  drivers/phy/allwinner/phy-sun4i-usb.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c
> b/drivers/phy/allwinner/phy-sun4i-usb.c
> index 881078ff73f6..ae16854a770a 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -115,6 +115,7 @@ enum sun4i_usb_phy_type {
>  	sun8i_r40_phy,
>  	sun8i_v3s_phy,
>  	sun50i_a64_phy,
> +	sun50i_h6_phy,
>  };
> =20
>  struct sun4i_usb_phy_cfg {
> @@ -295,7 +296,8 @@ static int sun4i_usb_phy_init(struct phy *_phy)
>  		return ret;
>  	}
> =20
> -	if (data->cfg->type =3D=3D sun8i_a83t_phy) {
> +	if (data->cfg->type =3D=3D sun8i_a83t_phy ||
> +	    data->cfg->type =3D=3D sun50i_h6_phy) {
>  		if (phy->index =3D=3D 0) {
>  			val =3D readl(data->base + data->cfg-
> >phyctl_offset);
>  			val |=3D PHY_CTL_VBUSVLDEXT;
> @@ -344,7 +346,8 @@ static int sun4i_usb_phy_exit(struct phy *_phy)
>  	struct sun4i_usb_phy_data *data =3D to_sun4i_usb_phy_data(phy);
> =20
>  	if (phy->index =3D=3D 0) {
> -		if (data->cfg->type =3D=3D sun8i_a83t_phy) {
> +		if (data->cfg->type =3D=3D sun8i_a83t_phy ||
> +		    data->cfg->type =3D=3D sun50i_h6_phy) {
>  			void __iomem *phyctl =3D data->base +
>  				data->cfg->phyctl_offset;
> =20
> @@ -959,6 +962,17 @@ static const struct sun4i_usb_phy_cfg
> sun50i_a64_cfg =3D {
>  	.phy0_dual_route =3D true,
>  };
> =20
> +static const struct sun4i_usb_phy_cfg sun50i_h6_cfg =3D {
> +	.num_phys =3D 4,
> +	.type =3D sun50i_h6_phy,
> +	.disc_thresh =3D 3,
> +	.phyctl_offset =3D REG_PHYCTL_A33,
> +	.dedicated_clocks =3D true,
> +	.enable_pmu_unk1 =3D true,
> +	.phy0_dual_route =3D true,
> +	.missing_phys =3D BIT(1) | BIT(2),
> +};
> +
>  static const struct of_device_id sun4i_usb_phy_of_match[] =3D {
>  	{ .compatible =3D "allwinner,sun4i-a10-usb-phy", .data =3D
> &sun4i_a10_cfg },
>  	{ .compatible =3D "allwinner,sun5i-a13-usb-phy", .data =3D
> &sun5i_a13_cfg },
> @@ -972,6 +986,7 @@ static const struct of_device_id
> sun4i_usb_phy_of_match[] =3D {
>  	{ .compatible =3D "allwinner,sun8i-v3s-usb-phy", .data =3D
> &sun8i_v3s_cfg },
>  	{ .compatible =3D "allwinner,sun50i-a64-usb-phy",
>  	  .data =3D &sun50i_a64_cfg},
> +	{ .compatible =3D "allwinner,sun50i-h6-usb-phy", .data =3D
> &sun50i_h6_cfg },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, sun4i_usb_phy_of_match);

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
