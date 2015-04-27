From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] misc: ti-st: use of_get_named_gpio_flags for
 nshutdown
Date: Mon, 27 Apr 2015 11:49:21 +0300
Message-ID: <20150427084921.GL16501@mwanda>
References: <1430000118-26386-1-git-send-email-eric.nelson@boundarydevices.com>
 <1430000118-26386-2-git-send-email-eric.nelson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430000118-26386-2-git-send-email-eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, der.herr-kA1LtwSENNE@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bvijay-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, gigi.joseph-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, eyalr-l0cyMroinI0@public.gmane.org, robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org


It's not obvious to me what the point of this patch is.  Why are we
making this change?  There is no changelog.

> @@ -482,9 +483,9 @@ long st_kim_start(void *kim_data)
>  			pdata->chip_enable(kim_gdata);
>  
>  		/* Configure BT nShutdown to HIGH state */

These comments are misleading now.

> -		gpio_set_value(kim_gdata->nshutdown, GPIO_LOW);
> +		gpio_set_value(kim_gdata->nshutdown, kim_gdata->shutdown_val);
>  		mdelay(5);	/* FIXME: a proper toggle */
> -		gpio_set_value(kim_gdata->nshutdown, GPIO_HIGH);
> +		gpio_set_value(kim_gdata->nshutdown, !kim_gdata->shutdown_val);
>  		mdelay(100);
>  		/* re-initialize the completion */
>  		reinit_completion(&kim_gdata->ldisc_installed);
> @@ -566,11 +567,11 @@ long st_kim_stop(void *kim_data)
>  	}
>  
>  	/* By default configure BT nShutdown to LOW state */

This as well.

> -	gpio_set_value(kim_gdata->nshutdown, GPIO_LOW);
> +	gpio_set_value(kim_gdata->nshutdown, kim_gdata->shutdown_val);
>  	mdelay(1);
> -	gpio_set_value(kim_gdata->nshutdown, GPIO_HIGH);
> +	gpio_set_value(kim_gdata->nshutdown, !kim_gdata->shutdown_val);
>  	mdelay(1);
> -	gpio_set_value(kim_gdata->nshutdown, GPIO_LOW);
> +	gpio_set_value(kim_gdata->nshutdown, kim_gdata->shutdown_val);
>  
>  	/* platform specific disable */
>  	if (pdata->chip_disable)
> @@ -749,6 +750,7 @@ static struct ti_st_plat_data *get_platform_data(struct device *dev)
> @@ -817,7 +821,8 @@ static int kim_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Configure nShutdown GPIO as output=0 */

This comment.

> -	err = gpio_direction_output(kim_gdata->nshutdown, GPIO_LOW);
> +	err = gpio_direction_output(kim_gdata->nshutdown,
> +				    kim_gdata->shutdown_val);
>  	if (unlikely(err)) {
>  		pr_err(" unable to configure gpio %d", kim_gdata->nshutdown);
>  		return err;

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
