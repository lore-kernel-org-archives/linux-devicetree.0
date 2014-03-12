From: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/9] at91: pinctrl: don't request GPIOs used for interrupts
 but lock them as IRQ
Date: Wed, 12 Mar 2014 13:59:50 +0100
Message-ID: <53205A46.6000304@gmail.com>
References: <1393841162-25339-1-git-send-email-jjhiblot@traphandler.com> <1393841162-25339-4-git-send-email-jjhiblot@traphandler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393841162-25339-4-git-send-email-jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
Cc: plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi JJ,

IIRC this patch was necessary for the DM9000 device, which is not defin=
ed
in this series anymore.
And, correct me if I'm wrong, but there's still a discussion about how
this should be fixed properly (https://lkml.org/lkml/2014/2/25/388).

As a result, shouldn't we remove this patch from this series ?

Best Regards,

Boris

Le 03/03/2014 11:05, Jean-Jacques Hiblot a =E9crit :
> During the xlate stage of the DT interrupt parsing, the at91 pinctrl =
driver
> requests the GPIOs that are described as interrupt sources. This prev=
ents a
> driver to request the gpio later to get its electrical value.
> This patch replaces the gpio_request with a gpio_lock_as_irq to preve=
nt the
> gpio to be set as an ouput while allowing a subsequent gpio_request t=
o succeed
>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>
> ---
>   drivers/pinctrl/pinctrl-at91.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl=
-at91.c
> index d990e33..db55b96 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -1478,18 +1478,17 @@ static int at91_gpio_irq_domain_xlate(struct =
irq_domain *d,
>   {
>   	struct at91_gpio_chip *at91_gpio =3D d->host_data;
>   	int ret;
> -	int pin =3D at91_gpio->chip.base + intspec[0];
>  =20
>   	if (WARN_ON(intsize < 2))
>   		return -EINVAL;
>   	*out_hwirq =3D intspec[0];
>   	*out_type =3D intspec[1] & IRQ_TYPE_SENSE_MASK;
>  =20
> -	ret =3D gpio_request(pin, ctrlr->full_name);
> +	ret =3D gpio_lock_as_irq(&at91_gpio->chip, intspec[0]);
>   	if (ret)
>   		return ret;
>  =20
> -	ret =3D gpio_direction_input(pin);
> +	ret =3D at91_gpio_direction_input(&at91_gpio->chip, intspec[0]);
>   	if (ret)
>   		return ret;
>  =20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
