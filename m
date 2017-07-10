From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] iio: dac: stm32: fix error message
Date: Mon, 10 Jul 2017 21:51:58 +0100
Message-ID: <20170710215158.5f1689ef@kernel.org>
References: <1499693040-12994-1-git-send-email-fabrice.gasnier@st.com>
        <1499693040-12994-3-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499693040-12994-3-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 10 Jul 2017 15:23:58 +0200
Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org> wrote:

> Fix error message, there's no 'st,dac-channel' property, but 'reg'
> (see https://lkml.org/lkml/2017/4/3/567).
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Applied.

Thanks,

Joanthan
> ---
>  drivers/iio/dac/stm32-dac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
> index 50f8ec0..c1864e8 100644
> --- a/drivers/iio/dac/stm32-dac.c
> +++ b/drivers/iio/dac/stm32-dac.c
> @@ -268,7 +268,7 @@ static int stm32_dac_chan_of_init(struct iio_dev *indio_dev)
>  			break;
>  	}
>  	if (i >= ARRAY_SIZE(stm32_dac_channels)) {
> -		dev_err(&indio_dev->dev, "Invalid st,dac-channel\n");
> +		dev_err(&indio_dev->dev, "Invalid reg property\n");
>  		return -EINVAL;
>  	}
>  

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
