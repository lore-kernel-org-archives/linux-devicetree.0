From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/9] mfd: axp20x: use correct platform
 device id for many PEK
Date: Mon, 7 Aug 2017 16:43:59 +0100
Message-ID: <20170807154359.434kux3urxhrt7ew@dell>
References: <20170726082832.16789-1-wens@csie.org>
 <20170726082832.16789-5-wens@csie.org>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBBQUVULGAKGQER3EHYOQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170726082832.16789-5-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 26 Jul 2017, Chen-Yu Tsai wrote:

> From: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> According to their datasheets, the AXP221, AXP223, AXP288, AXP803,
> AXP809 and AXP813 PEK have different values for startup time bits from
> the AXP20X, let's use the platform device id with the correct values.
>=20
> Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  drivers/mfd/axp20x.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index ec4271ca065c..336de66ca408 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -677,7 +677,7 @@ static struct mfd_cell axp20x_cells[] =3D {
> =20
>  static struct mfd_cell axp221_cells[] =3D {
>  	{
> -		.name		=3D "axp20x-pek",
> +		.name		=3D "axp221-pek",
>  		.num_resources	=3D ARRAY_SIZE(axp22x_pek_resources),
>  		.resources	=3D axp22x_pek_resources,
>  	}, {
> @@ -702,7 +702,7 @@ static struct mfd_cell axp221_cells[] =3D {
> =20
>  static struct mfd_cell axp223_cells[] =3D {
>  	{
> -		.name			=3D "axp20x-pek",
> +		.name			=3D "axp221-pek",
>  		.num_resources		=3D ARRAY_SIZE(axp22x_pek_resources),
>  		.resources		=3D axp22x_pek_resources,
>  	}, {
> @@ -835,7 +835,7 @@ static struct mfd_cell axp288_cells[] =3D {
>  		.resources =3D axp288_fuel_gauge_resources,
>  	},
>  	{
> -		.name =3D "axp20x-pek",
> +		.name =3D "axp221-pek",
>  		.num_resources =3D ARRAY_SIZE(axp288_power_button_resources),
>  		.resources =3D axp288_power_button_resources,
>  	},
> @@ -846,7 +846,7 @@ static struct mfd_cell axp288_cells[] =3D {
> =20
>  static struct mfd_cell axp803_cells[] =3D {
>  	{
> -		.name			=3D "axp20x-pek",
> +		.name			=3D "axp221-pek",
>  		.num_resources		=3D ARRAY_SIZE(axp803_pek_resources),
>  		.resources		=3D axp803_pek_resources,
>  	},
> @@ -862,7 +862,7 @@ static struct mfd_cell axp806_cells[] =3D {
> =20
>  static struct mfd_cell axp809_cells[] =3D {
>  	{
> -		.name			=3D "axp20x-pek",
> +		.name			=3D "axp221-pek",
>  		.num_resources		=3D ARRAY_SIZE(axp809_pek_resources),
>  		.resources		=3D axp809_pek_resources,
>  	}, {
> @@ -873,7 +873,7 @@ static struct mfd_cell axp809_cells[] =3D {
> =20
>  static struct mfd_cell axp813_cells[] =3D {
>  	{
> -		.name			=3D "axp20x-pek",
> +		.name			=3D "axp221-pek",
>  		.num_resources		=3D ARRAY_SIZE(axp803_pek_resources),
>  		.resources		=3D axp803_pek_resources,
>  	}

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
