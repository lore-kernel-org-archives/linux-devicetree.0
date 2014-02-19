From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v5 4/5] ARM: Kirkwood: Fix qnap vendor prefix
Date: Wed, 19 Feb 2014 14:05:53 +0100
Message-ID: <20140219130553.GO17984@lunn.ch>
References: <1392814154-11284-1-git-send-email-klightspeed@killerwolves.net>
 <1392814154-11284-5-git-send-email-klightspeed@killerwolves.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392814154-11284-5-git-send-email-klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> diff --git a/drivers/power/reset/qnap-poweroff.c b/drivers/power/reset/qnap-poweroff.c
> index a75db7f..d350ece 100644
> --- a/drivers/power/reset/qnap-poweroff.c
> +++ b/drivers/power/reset/qnap-poweroff.c
> @@ -41,7 +41,7 @@ static const struct power_off_cfg synology_power_off_cfg = {
>  };
>  
>  static const struct of_device_id qnap_power_off_of_match_table[] = {
> -	{ .compatible = "qnap,power-off",
> +	{ .compatible = "qnapsz,power-off",
>  	  .data = &qnap_power_off_cfg,
>  	},

Hi Ben

This causes issues for devices using old DT blobs. You need to keep
the old entry as well as supporting the new vendor prefix.

We need to consider, is it worth the hassle of changing the prefix,
since it has been in use for a long time. I think using the stock
ticker is a "rule of thumb" and not a strict requirement.

      Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
