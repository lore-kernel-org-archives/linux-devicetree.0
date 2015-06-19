From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] mfd: flexcom: add a driver for Atmel Flexible
 Serial Communication Unit
Date: Fri, 19 Jun 2015 09:34:33 +0200
Message-ID: <1434699273.2385.139.camel@x220>
References: <cover.1434632230.git.cyrille.pitchen@atmel.com>
	 <bc25d9365ba31f987437ff4f0f2ee60c19639270.1434632230.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bc25d9365ba31f987437ff4f0f2ee60c19639270.1434632230.git.cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2015-06-18 at 15:05 +0200, Cyrille Pitchen wrote:
> --- /dev/null
> +++ b/drivers/mfd/atmel-flexcom.c

> +MODULE_ALIAS("platform:atmel_flexcom");

(The day before yesterday and yesterday I had a, well, lively
conversation regarding this macro. The interesting bits start at
https://lkml.org/lkml/2015/6/17/383 . Let's see how things go here.)

As I understand it, this alias is only useful if there's a corresponding
struct platform_device, somewhere. Ie, this alias implies a
platform_device that will fire of a "MODALIAS=platform:atmel_flexcom"
uevent when it's created. That would be a platform_device using a
"atmel_flexcom" name.

If that's correct, then I think this MODULE_ALIAS macro isn't needed
here, as I couldn't find a platform_device using that name. (But perhaps
a patch that adds it is pending, somewhere.)

Thanks,


Paul Bolle

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
