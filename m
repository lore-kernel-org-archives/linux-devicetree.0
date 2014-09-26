From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 3/4] Staging: iio: light: Added correct vendor-prefix
 with device name in compatible property
Date: Fri, 26 Sep 2014 15:04:33 +0100
Message-ID: <20140926140433.GJ7422@leverpostej>
References: <1411734292-10910-1-git-send-email-darshanapadmadas@gmail.com>
 <1411734292-10910-4-git-send-email-darshanapadmadas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411734292-10910-4-git-send-email-darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "opw-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <opw-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 26, 2014 at 01:24:51PM +0100, Darshana Padmadas wrote:
> This patch adds the correct vendor-prefix for the device isl29028 to fix
> following checkpatch warning:
> WARNING: DT compatible string "isil,isl29028" appears un-documented -- check ./Documentation/devicetree/bindings/
> 
> Signed-off-by: Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Overall, this looks fine to me, but you need to Cc the driver maintainer
(and others who might be intereested, e.g. the IIO list). You should be
able to find a list of relevant people using get_maintainer.pl.

Thanks,
Mark.

> ---
>  drivers/staging/iio/light/isl29028.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/light/isl29028.c b/drivers/staging/iio/light/isl29028.c
> index 6014625..7090708 100644
> --- a/drivers/staging/iio/light/isl29028.c
> +++ b/drivers/staging/iio/light/isl29028.c
> @@ -537,7 +537,8 @@ static const struct i2c_device_id isl29028_id[] = {
>  MODULE_DEVICE_TABLE(i2c, isl29028_id);
>  
>  static const struct of_device_id isl29028_of_match[] = {
> -	{ .compatible = "isil,isl29028", },
> +	{ .compatible = "isl,isl29028", },
> +	{ .compatible = "isil,isl29028", }, /* Deprecated, don't use */
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, isl29028_of_match);
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
