From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: at91: allow disabled gpio controllers
Date: Mon, 1 Dec 2014 14:59:34 +0100
Message-ID: <547C7446.1090909@atmel.com>
References: <1417193367-12422-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417193367-12422-1-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 28/11/2014 17:49, Ludovic Desroches a =E9crit :
> This patch allows to have gpio controller with status set to disabled=
=2E
>=20
> gpio_banks represents all the gpio banks available on the device wher=
eas
> nbanks represents the gpio banks used. Having a disabled gpio control=
ler
> involves that nbanks value is lower than gpio_banks and that some
> pointers in the gpio_chips array are NULL. This patch deals with thes=
e
> specific cases.
>=20
> Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Yes:

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Linus, is it too late for 3.18? Otherwise, we can add this tag:

Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v3.18+

Bye,

> ---
>=20
> Hi,
>=20
> Without this patch, pinctrl is broken on sama5d4 because pinctrl-at91=
 doesn't
> support unused gpio bank.
>=20
>=20
>  drivers/pinctrl/pinctrl-at91.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl=
-at91.c
> index 94643bb..95ae122 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -981,7 +981,8 @@ static void at91_pinctrl_child_count(struct at91_=
pinctrl *info,
> =20
>  	for_each_child_of_node(np, child) {
>  		if (of_device_is_compatible(child, gpio_compat)) {
> -			info->nbanks++;
> +			if (of_device_is_available(child))
> +				info->nbanks++;
>  		} else {
>  			info->nfunctions++;
>  			info->ngroups +=3D of_get_child_count(child);
> @@ -1003,11 +1004,11 @@ static int at91_pinctrl_mux_mask(struct at91_=
pinctrl *info,
>  	}
> =20
>  	size /=3D sizeof(*list);
> -	if (!size || size % info->nbanks) {
> +	if (!size || size % gpio_banks) {
>  		dev_err(info->dev, "wrong mux mask array should be by %d\n", info-=
>nbanks);
>  		return -EINVAL;
>  	}
> -	info->nmux =3D size / info->nbanks;
> +	info->nmux =3D size / gpio_banks;
> =20
>  	info->mux_mask =3D devm_kzalloc(info->dev, sizeof(u32) * size, GFP_=
KERNEL);
>  	if (!info->mux_mask) {
> @@ -1185,7 +1186,7 @@ static int at91_pinctrl_probe(struct platform_d=
evice *pdev)
>  {
>  	struct at91_pinctrl *info;
>  	struct pinctrl_pin_desc *pdesc;
> -	int ret, i, j, k;
> +	int ret, i, j, k, ngpio_chips_enabled =3D 0;
> =20
>  	info =3D devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
>  	if (!info)
> @@ -1200,12 +1201,14 @@ static int at91_pinctrl_probe(struct platform=
_device *pdev)
>  	 * to obtain references to the struct gpio_chip * for them, and we
>  	 * need this to proceed.
>  	 */
> -	for (i =3D 0; i < info->nbanks; i++) {
> -		if (!gpio_chips[i]) {
> -			dev_warn(&pdev->dev, "GPIO chip %d not registered yet\n", i);
> -			devm_kfree(&pdev->dev, info);
> -			return -EPROBE_DEFER;
> -		}
> +	for (i =3D 0; i < gpio_banks; i++) {
> +		if (gpio_chips[i])
> +			ngpio_chips_enabled++;
> +	}
> +	if (ngpio_chips_enabled < info->nbanks) {
> +		dev_warn(&pdev->dev, "All GPIO chips are not registered yet\n");
> +		devm_kfree(&pdev->dev, info);
> +		return -EPROBE_DEFER;
>  	}
> =20
>  	at91_pinctrl_desc.name =3D dev_name(&pdev->dev);
> @@ -1234,8 +1237,9 @@ static int at91_pinctrl_probe(struct platform_d=
evice *pdev)
>  	}
> =20
>  	/* We will handle a range of GPIO pins */
> -	for (i =3D 0; i < info->nbanks; i++)
> -		pinctrl_add_gpio_range(info->pctl, &gpio_chips[i]->range);
> +	for (i =3D 0; i < gpio_banks; i++)
> +		if (gpio_chips[i])
> +			pinctrl_add_gpio_range(info->pctl, &gpio_chips[i]->range);
> =20
>  	dev_info(&pdev->dev, "initialized AT91 pinctrl driver\n");
> =20
> @@ -1681,6 +1685,8 @@ static void at91_gpio_probe_fixup(void)
> =20
>  	for (i =3D 0; i < gpio_banks; i++) {
>  		at91_gpio =3D gpio_chips[i];
> +		if (!at91_gpio)
> +			continue;
> =20
>  		/*
>  		 * GPIO controller are grouped on some SoC:
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
