From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/4] iio: adc: at91-sama5d2_adc: ack DRDY irq in
 direct mode
Date: Sun, 19 Nov 2017 11:28:19 +0000
Message-ID: <20171119112819.5d128c3f@archlinux>
References: <1510750608-8697-1-git-send-email-eugen.hristev@microchip.com>
        <1510750608-8697-5-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510750608-8697-5-git-send-email-eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 15 Nov 2017 14:56:48 +0200
Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org> wrote:

> Need to acknowledge DRDY irq in direct mode/ software
> triggered mode. Otherwise, on the next conversion, overrun
> flag will be raised, which is not a correct state.
> This doesn't affect the functionality, but will generate
> possible incorrect overrun reports.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>

Applied. Thanks.
> ---
>  drivers/iio/adc/at91-sama5d2_adc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
> index 11d34a8..274cb5e 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -787,6 +787,9 @@ static int at91_adc_read_raw(struct iio_dev *indio_dev,
>  		at91_adc_writel(st, AT91_SAMA5D2_IDR, BIT(chan->channel));
>  		at91_adc_writel(st, AT91_SAMA5D2_CHDR, BIT(chan->channel));
>  
> +		/* Needed to ACK the DRDY interruption */
> +		at91_adc_readl(st, AT91_SAMA5D2_LCDR);
> +
>  		mutex_unlock(&st->lock);
>  
>  		iio_device_release_direct_mode(indio_dev);

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
