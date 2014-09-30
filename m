From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V3] bcma: use device from DT (brcm, bus-chipcommon) for SoC GPIO chip
Date: Tue, 30 Sep 2014 12:36:28 +0200
Message-ID: <3484902.1UVy7lmJAD@wuerfel>
References: <1411892641-5662-1-git-send-email-zajec5@gmail.com> <1412072546-3529-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412072546-3529-1-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 30 September 2014 12:22:26 Rafa=C5=82 Mi=C5=82ecki wrote:
>=20
> +The top-level axi bus may contain children representing attached cor=
es
> +(devices). This is needed since some hardware details can't be auto
> +detected (e.g. IRQ numbers). Also some of the cores may be responsib=
le
> +for extra things, e.g. ChipCommon providing access to the GPIO chip.
> +
>  Example:
> =20
>         axi@18000000 {
> @@ -17,4 +22,12 @@ Example:
>                 ranges =3D <0x00000000 0x18000000 0x00100000>;
>                 #address-cells =3D <1>;
>                 #size-cells =3D <1>;
> +
> +               chipcommon {
> +                       compatible =3D "brcm,bus-chipcommon";
> +                       reg =3D <0x00000000 0x1000>;
> +
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +               };
>         };

Looks good.


> diff --git a/drivers/bcma/driver_gpio.c b/drivers/bcma/driver_gpio.c
> index 8ea497c..28bdbe5 100644
> --- a/drivers/bcma/driver_gpio.c
> +++ b/drivers/bcma/driver_gpio.c
> @@ -218,6 +218,12 @@ int bcma_gpio_init(struct bcma_drv_cc *cc)
>  #if IS_BUILTIN(CONFIG_BCM47XX)
>         chip->to_irq            =3D bcma_gpio_to_irq;
>  #endif
> +#if IS_BUILTIN(CONFIG_OF)
> +       if (cc->core->bus->hosttype =3D=3D BCMA_HOSTTYPE_SOC)
> +               chip->of_node   =3D of_find_compatible_node(
> +                                       bus->host_pdev->dev.of_node, =
NULL,
> +                                       "brcm,bus-chipcommon");
> +#endif
>         switch (cc->core->bus->chipinfo.id) {

This doesn't: you are now searching through all nodes starting at the
axi node rather than searching just through the children.

I think it would be better with the first change in place to set
chip->of_node to cc->core->dev.of_node, and set that pointer in
bcma_bus_scan by matching the 'reg' number. I think that is what
an earlier version of the bcma DT support did in order to find the
IRQs. We no longer need it for that purpose, but it seems like a
good idea anyway, as I expect other bcma_devices to have similar
requirements to add additional properties.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
