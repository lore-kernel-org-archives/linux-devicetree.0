From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/3] rtc: Add APM X-Gene SoC RTC driver
Date: Thu, 10 Apr 2014 23:42:44 +0100
Message-ID: <20140410224244.GH6518@sirena.org.uk>
References: <1397155678-26607-1-git-send-email-lho@apm.com>
 <1397155678-26607-2-git-send-email-lho@apm.com>
 <1397155678-26607-3-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/zLL6W406Aotuby1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1397155678-26607-3-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>, patches-qTEPVZfXA3Y@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--/zLL6W406Aotuby1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 10, 2014 at 12:47:57PM -0600, Loc Ho wrote:

> +	if (device_may_wakeup(&pdev->dev)) {
> +		if (!enable_irq_wake(irq))
> +			pdata->irq_wake = 1;
> +	} else {
> +		pdata->irq_enabled = xgene_rtc_alarm_irq_enabled(dev);
> +		xgene_rtc_alarm_irq_enable(dev, 0);
> +		clk_disable(pdata->clk);
> +	}
> +	clk_unprepare(pdata->clk);

This will unconditionally unprepare the clock even if it wasn't disabled
which looks like a bug - I would have expected the disable to be a
clk_disable_unprepare() instead?  Similarly for the resume path.

Otherwise this looks good to me.

--/zLL6W406Aotuby1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTRx5hAAoJELSic+t+oim99P4P/2M0w6wJ0jUgNjcehxek2wmu
bTvvV/tZxIg3VXKKOVEhLMs8xTULXWMr25FR32u7Fu7RKqtYrUFpx1grjnUFDg31
crSpcdmQBt+5mtmxuAi8Dhmd6xrrP5XN2al6KM3j41tXbNPz0mewal7WNWogCIvO
qRTnZWMxP6GnYQQsZfzyEcFLJ4ynwogH33avCrXYRuA+BEWxlTvJR5OaL/L4kZH+
m5dMxF2bgWNUzJM0Ih77bbR/tY/feojqpVVL7TCQqEh9AtqeikVVSLWCRkvQW2lb
6GF7CvOrOXYQqTtzE792V8fLFMbvgRNUUmqWPL9osQyFia8GdPlygbjdz40L0/HA
HQL257lwyqIj8Krfs3uOpJnNAZTnxJiiq1uKFLDFv6fHlifj6kGDknsTzrGAHpYc
hJOkhwIfGwVGfan9Mm4z4RbmYD6NTgEDh1fmrzTL4eXvm32PKhoUq+Q5rW1EL2Y2
upSh6eyfkZEdlTxIsGh1dqxbIWF+OJz4vnm/ltKKHK1u1kigFd9400O0oZD4DYtp
tphyToDpzqb1yAbLiydaXm+W9HK/Vgi6pTNvYqWo9yrLy9JRQzPfCSOtEjyJloTT
Y4loY2zx6GSmDA0DLvjtVGTo9OR7FHtMDg2Q8Qayq3sTpQ1CBcJiAEwU75xZoIS+
wU811lsizQp2wUsL4p3i
=9p2b
-----END PGP SIGNATURE-----

--/zLL6W406Aotuby1--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
