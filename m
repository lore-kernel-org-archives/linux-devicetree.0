From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 07/13] mfd: sun6i-prcm: Add support for
 the ir-clk
Date: Thu, 18 Dec 2014 08:41:29 +0000
Message-ID: <20141218084129.GT13885@x1>
References: <1418836704-15689-1-git-send-email-hdegoede@redhat.com>
 <1418836704-15689-8-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBBPVGZKSAKGQEEHUDRDQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418836704-15689-8-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 17 Dec 2014, Hans de Goede wrote:

> Add support for the ir-clk which is part of the sun6i SoC prcm module.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/mfd/sun6i-prcm.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Pretty standard stuff (

> diff --git a/drivers/mfd/sun6i-prcm.c b/drivers/mfd/sun6i-prcm.c
> index 2f2e9f0..1911731 100644
> --- a/drivers/mfd/sun6i-prcm.c
> +++ b/drivers/mfd/sun6i-prcm.c
> @@ -41,6 +41,14 @@ static const struct resource sun6i_a31_apb0_gates_clk_=
res[] =3D {
>  	},
>  };
> =20
> +static const struct resource sun6i_a31_ir_clk_res[] =3D {
> +	{
> +		.start =3D 0x54,
> +		.end =3D 0x57,
> +		.flags =3D IORESOURCE_MEM,
> +	},
> +};

I'm still unkeen on this registers not being defined -- but whateveer!

>  static const struct resource sun6i_a31_apb0_rstc_res[] =3D {
>  	{
>  		.start =3D 0xb0,
> @@ -69,6 +77,12 @@ static const struct mfd_cell sun6i_a31_prcm_subdevs[] =
=3D {
>  		.resources =3D sun6i_a31_apb0_gates_clk_res,
>  	},
>  	{
> +		.name =3D "sun6i-a31-ir-clk",
> +		.of_compatible =3D "allwinner,sun4i-a10-mod0-clk",
> +		.num_resources =3D ARRAY_SIZE(sun6i_a31_ir_clk_res),
> +		.resources =3D sun6i_a31_ir_clk_res,
> +	},
> +	{
>  		.name =3D "sun6i-a31-apb0-clock-reset",
>  		.of_compatible =3D "allwinner,sun6i-a31-clock-reset",
>  		.num_resources =3D ARRAY_SIZE(sun6i_a31_apb0_rstc_res),

This is all pretty standard stuff:

For my own reference:

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Do you do  you expect this patch to be handled?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
