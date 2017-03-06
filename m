From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 3/3] phy: rockchip-inno-usb2: add support of usb2-phy
 for rk3328
Date: Mon, 06 Mar 2017 05:21:28 +0100
Message-ID: <1658444.PfTs9q7449@diego>
References: <1488763778-27499-1-git-send-email-daniel.meng@rock-chips.com>
 <1488763778-27499-4-git-send-email-daniel.meng@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1488763778-27499-4-git-send-email-daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Meng Dongyang <daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 6. M=E4rz 2017, 09:29:38 CET schrieb Meng Dongyang:
> Add usb2-phy config information in the data of match table for
> rk3328.
> =

> Changes in v2:
>  - add support of otg port
> Changes in v3:
>  - remove tuning function and id pin configs
> =

> Signed-off-by: Meng Dongyang <daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

I didn't double check every individual register value, but overall this loo=
ks =

correct, so

Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

> ---
>  drivers/phy/phy-rockchip-inno-usb2.c | 44
> ++++++++++++++++++++++++++++++++++++ 1 file changed, 44 insertions(+)
> =

> diff --git a/drivers/phy/phy-rockchip-inno-usb2.c
> b/drivers/phy/phy-rockchip-inno-usb2.c index 4ea95c2..257c5d9 100644
> --- a/drivers/phy/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/phy-rockchip-inno-usb2.c
> @@ -1141,6 +1141,49 @@ static int rockchip_usb2phy_probe(struct
> platform_device *pdev) return ret;
>  }
> =

> +static const struct rockchip_usb2phy_cfg rk3328_phy_cfgs[] =3D {
> +	{
> +		.reg =3D 0x100,
> +		.num_ports	=3D 2,
> +		.clkout_ctl	=3D { 0x108, 4, 4, 1, 0 },
> +		.port_cfgs	=3D {
> +			[USB2PHY_PORT_OTG] =3D {
> +				.phy_sus	=3D { 0x0100, 15, 0, 0, 0x1d1 },
> +				.bvalid_det_en	=3D { 0x0110, 2, 2, 0, 1 },
> +				.bvalid_det_st	=3D { 0x0114, 2, 2, 0, 1 },
> +				.bvalid_det_clr =3D { 0x0118, 2, 2, 0, 1 },
> +				.ls_det_en	=3D { 0x0110, 0, 0, 0, 1 },
> +				.ls_det_st	=3D { 0x0114, 0, 0, 0, 1 },
> +				.ls_det_clr	=3D { 0x0118, 0, 0, 0, 1 },
> +				.utmi_avalid	=3D { 0x0120, 10, 10, 0, 1 },
> +				.utmi_bvalid	=3D { 0x0120, 9, 9, 0, 1 },
> +				.utmi_ls	=3D { 0x0120, 5, 4, 0, 1 },
> +			},
> +			[USB2PHY_PORT_HOST] =3D {
> +				.phy_sus	=3D { 0x104, 15, 0, 0, 0x1d1 },
> +				.ls_det_en	=3D { 0x110, 1, 1, 0, 1 },
> +				.ls_det_st	=3D { 0x114, 1, 1, 0, 1 },
> +				.ls_det_clr	=3D { 0x118, 1, 1, 0, 1 },
> +				.utmi_ls	=3D { 0x120, 17, 16, 0, 1 },
> +				.utmi_hstdet	=3D { 0x120, 19, 19, 0, 1 }
> +			}
> +		},
> +		.chg_det =3D {
> +			.opmode		=3D { 0x0100, 3, 0, 5, 1 },
> +			.cp_det		=3D { 0x0120, 24, 24, 0, 1 },
> +			.dcp_det	=3D { 0x0120, 23, 23, 0, 1 },
> +			.dp_det		=3D { 0x0120, 25, 25, 0, 1 },
> +			.idm_sink_en	=3D { 0x0108, 8, 8, 0, 1 },
> +			.idp_sink_en	=3D { 0x0108, 7, 7, 0, 1 },
> +			.idp_src_en	=3D { 0x0108, 9, 9, 0, 1 },
> +			.rdm_pdwn_en	=3D { 0x0108, 10, 10, 0, 1 },
> +			.vdm_src_en	=3D { 0x0108, 12, 12, 0, 1 },
> +			.vdp_src_en	=3D { 0x0108, 11, 11, 0, 1 },
> +		},
> +	},
> +	{ /* sentinel */ }
> +};
> +
>  static const struct rockchip_usb2phy_cfg rk3366_phy_cfgs[] =3D {
>  	{
>  		.reg =3D 0x700,
> @@ -1223,6 +1266,7 @@ static int rockchip_usb2phy_probe(struct
> platform_device *pdev) };
> =

>  static const struct of_device_id rockchip_usb2phy_dt_match[] =3D {
> +	{ .compatible =3D "rockchip,rk3328-usb2phy", .data =3D &rk3328_phy_cfgs=
 },
>  	{ .compatible =3D "rockchip,rk3366-usb2phy", .data =3D &rk3366_phy_cfgs=
 },
>  	{ .compatible =3D "rockchip,rk3399-usb2phy", .data =3D &rk3399_phy_cfgs=
 },
>  	{}
