From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] hwrng: iproc-rng200 - Add Broadcom IPROC RNG driver
Date: Mon, 09 Feb 2015 16:27:13 -0800
Message-ID: <1423528033.2933.29.camel@perches.com>
References: <Scott Branden <sbranden@broadcom.com>
	 <1423526830-29516-1-git-send-email-sbranden@broadcom.com>
	 <1423526830-29516-2-git-send-email-sbranden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423526830-29516-2-git-send-email-sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2015-02-09 at 16:07 -0800, Scott Branden wrote:
> This adds a driver for random number generator present on Broadcom
> IPROC devices.

trivia:

> diff --git a/drivers/char/hw_random/iproc-rng200.c b/drivers/char/hw_random/iproc-rng200.c
[]
> +static int iproc_rng200_probe(struct platform_device *pdev)
> +{
[]
> +	if (!res) {
> +		dev_err(dev, "failed to get rng resources");

Missing terminating newline:

		dev_err(dev, "failed to get rng resources\n");

> +	rng_base = devm_ioremap_resource(dev, res);
> +	if (!rng_base) {
> +		dev_err(dev, "failed to remap rng regs");

here too.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
