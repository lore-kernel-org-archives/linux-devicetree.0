From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [rtc-linux] [PATCH v3 2/3] rtc: Add APM X-Gene SoC RTC driver
Date: Thu, 3 Apr 2014 17:26:48 +0100
Message-ID: <20140403162648.GW14763@sirena.org.uk>
References: <1396505873-5507-1-git-send-email-lho@apm.com>
 <1396505873-5507-2-git-send-email-lho@apm.com>
 <1396505873-5507-3-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w1TwAseT95X423KH"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1396505873-5507-3-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--w1TwAseT95X423KH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 03, 2014 at 12:17:52AM -0600, Loc Ho wrote:

> +static int xgene_rtc_suspend(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct xgene_rtc_dev *pdata = platform_get_drvdata(pdev);
> +	int irq;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (device_may_wakeup(&pdev->dev)) {
> +		if (!enable_irq_wake(irq))
> +			pdata->irq_wake = 1;
> +	} else {
> +		xgene_rtc_alarm_irq_enable(dev, 0);
> +		clk_disable(pdata->clk);
> +	}

Why does the driver only disable the clock over suspend rather than also
unpreparing it?

> +	if (device_may_wakeup(&pdev->dev)) {
> +		if (pdata->irq_wake) {
> +			disable_irq_wake(irq);
> +			pdata->irq_wake = 0;
> +		}
> +	} else {
> +		clk_enable(pdata->clk);

It's also not checking for errors here.

> +		xgene_rtc_alarm_irq_enable(dev, 1);
> +	}

Won't this unconditionally enable the interrupt regardless of what the
setting was prior to suspend?

--w1TwAseT95X423KH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTPYvFAAoJELSic+t+oim9iscP/3kSyNrczAuScRgPz7oXWux3
Kca5fqQnf1vhE/Zd5XzSi339yjwn3Q/q8dqPQrkhLigu/cKN1cdKLGzVBY+oFeIR
qEbQafxJDzRgjgaXsDUCKa49+xAJDcOAnTIAIwCUtu95OrBwyL/lKeM/ZUtE/vM7
u30AUTNR9oHS3SwW1bW3vN9EU0WMqzIKkiE51AaB7wkN0YcaBXPcN+46VvPqOs69
Cq+I1uOiw4Z/LR0WHg98jR2umvhymXa22dGlB8l8rLqhNWTd+VnSMAj9HpzRbiKn
JAWoacnEel7+q7BgQ2yh8tyW+7DAdE3lK8MapWdlvhLQ9XZ8sv8N+c5/iDeQLDS2
YP57PKMFCh6l3PIBM/LYkJr/JF3nPXoEIMuKdLOhp+BHg0CydZ/+xUotySMc93sj
Y/EcqwacRu/cfG8Mwv8AxBm5Tmdeb2nZIPb4RLGIPkioGdPp/NvM1+QTJa5BbP/r
Arc5SKyrFq3gmK35z+khYeoBI/GeQFQKpp2aA8EmFkvJOZd3lcS0z9VvghLyI5RY
xHZcYdo6b9ONcB0cGm0XhieNrHRoRqb/v8CR2nunwQLm/7l97xhzhSpiUvON1FT0
JUOn9TBO8Wd1313xGbhxr5toyazbJ4nIIAOdYS2KCscrjRlo7FU4pj9/K6GkyVKI
n9xqK8ydkmECgjoOhKt2
=78fN
-----END PGP SIGNATURE-----

--w1TwAseT95X423KH--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
