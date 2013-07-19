From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 3/5] iio: mxs-lradc: add scale attribute to channels
Date: Fri, 19 Jul 2013 19:06:09 +0200
Message-ID: <51E97201.4010508@free-electrons.com>
References: <1374225208-28940-1-git-send-email-hector.palacios@digi.com> <1374225208-28940-4-git-send-email-hector.palacios@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374225208-28940-4-git-send-email-hector.palacios-i7dp0qKlBMg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Hector,

On 19/07/2013 11:13, Hector Palacios wrote:
> Some LRADC channels have fixed pre-dividers and all have an optional
> divider by two which allows a maximum input voltage of VDDIO - 50mV.
>
> This patch
>  - adds the scaling info flag to all channels
>  - grabs the max reference voltage per channel from DT
>    (where the fixed pre-dividers apply)
>  - allows to read the scaling attribute (computed from the Vref)
>
> Signed-off-by: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>.
> ---
>  drivers/staging/iio/adc/mxs-lradc.c | 81 ++++++++++++++++++++++++-------------
>  1 file changed, 52 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/staging/iio/adc/mxs-lradc.c b/drivers/staging/iio/adc/mxs-lradc.c
> index 91282dc..99e5790 100644
> --- a/drivers/staging/iio/adc/mxs-lradc.c
> +++ b/drivers/staging/iio/adc/mxs-lradc.c
> @@ -141,6 +141,8 @@ struct mxs_lradc {
>  
>  	struct completion	completion;
>  
> +	uint32_t		vref_mv[LRADC_MAX_TOTAL_CHANS];
> +
>  	/*
>  	 * Touchscreen LRADC channels receives a private slot in the CTRL4
>  	 * register, the slot #7. Therefore only 7 slots instead of 8 in the
> @@ -228,39 +230,12 @@ struct mxs_lradc {
>  #define LRADC_RESOLUTION			12
>  #define LRADC_SINGLE_SAMPLE_MASK		((1 << LRADC_RESOLUTION) - 1)
>  
> -/*
> - * Raw I/O operations
> - */
> -static int mxs_lradc_read_raw(struct iio_dev *iio_dev,
> +static int mxs_lradc_read_single(struct iio_dev *iio_dev,
>  			const struct iio_chan_spec *chan,
>  			int *val, int *val2, long m)
You don't need val2 and m in that function, I woud suggest no passing
those. Also, in my patch, I was passing channel->chan as an int but I
don't see any drawbacks of passing a pointer to the struct iio_chan_spec.

As a note, I'm waiting for your patch to get included so that we won't
get any conflicts.

Regards,

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
