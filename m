From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/10] iio: at91_adc: Cocci spatch "noderef"
Date: Fri, 20 Sep 2013 09:26:22 +0200
Message-ID: <523BF89E.4000508@atmel.com>
References: <1379604755850-858421494-0-diffsplit-thomas@m3y3r.de> <1379604755852-604229709-3-diffsplit-thomas@m3y3r.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379604755852-604229709-3-diffsplit-thomas-VsYtu1Qij5c@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 19/09/2013 23:42, Thomas Meyer :
> sizeof when applied to a pointer typed expression gives the size of the
> pointer.
> Found by coccinelle spatch "misc/noderef.cocci"
>
> Signed-off-by: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

> ---
>
> diff -u -p a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
> --- a/drivers/iio/adc/at91_adc.c
> +++ b/drivers/iio/adc/at91_adc.c
> @@ -279,7 +279,7 @@ static int at91_adc_trigger_init(struct
>   	int i, ret;
>
>   	st->trig = devm_kzalloc(&idev->dev,
> -				st->trigger_number * sizeof(st->trig),
> +				st->trigger_number * sizeof(*st->trig),
>   				GFP_KERNEL);
>
>   	if (st->trig == NULL) {
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
Nicolas Ferre
