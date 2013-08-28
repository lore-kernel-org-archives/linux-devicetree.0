From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH -next] iio: adc: twl6030-gpadc: fix error return code
 in twl6030_gpadc_read_raw()
Date: Wed, 28 Aug 2013 20:43:06 +0100
Message-ID: <521E52CA.5010108@kernel.org>
References: <CAPgLHd_cnp+Gm8vSwhB+dmV+bk7Wz8Qh7VbJmY=KdrmfS55fNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPgLHd_cnp+Gm8vSwhB+dmV+bk7Wz8Qh7VbJmY=KdrmfS55fNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, oleksandr.kozaruk-l0cyMroinI0@public.gmane.org, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, balajitk-l0cyMroinI0@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/23/13 03:47, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
> 
> Fix to return -EINTR in the error handling case instead
> of 0 (ret is assigned after goto, which has no effect),
> as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
Thanks. Applied to the togreg branch of
git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git

Given timing I might end up ripping this out to separate it from new
stuff.

Jonathan
> ---
>  drivers/iio/adc/twl6030-gpadc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/twl6030-gpadc.c b/drivers/iio/adc/twl6030-gpadc.c
> index a558516..0ea96c0 100644
> --- a/drivers/iio/adc/twl6030-gpadc.c
> +++ b/drivers/iio/adc/twl6030-gpadc.c
> @@ -537,8 +537,8 @@ static int twl6030_gpadc_read_raw(struct iio_dev *indio_dev,
>  		ret = -ETIMEDOUT;
>  		goto err;
>  	} else if (timeout < 0) {
> -		goto err;
>  		ret = -EINTR;
> +		goto err;
>  	}
>  
>  	switch (mask) {
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
