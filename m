From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [rtc-linux] [PATCH v3 2/3] rtc: Add APM X-Gene SoC RTC driver
Date: Wed, 9 Apr 2014 22:01:48 +0100
Message-ID: <20140409210148.GT6518@sirena.org.uk>
References: <1396505873-5507-1-git-send-email-lho@apm.com>
 <1396505873-5507-2-git-send-email-lho@apm.com>
 <1396505873-5507-3-git-send-email-lho@apm.com>
 <20140403162648.GW14763@sirena.org.uk>
 <CAPw-ZT=XRDbqN8CJLOyXauif25Yq0n9G+NANqUtvX63QsyNT1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pnDjx0H/VpusRTEI"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPw-ZT=XRDbqN8CJLOyXauif25Yq0n9G+NANqUtvX63QsyNT1g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--pnDjx0H/VpusRTEI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 09, 2014 at 10:16:11AM -0700, Loc Ho wrote:
> >> +static int xgene_rtc_suspend(struct device *dev)

> >> +     } else {
> >> +             xgene_rtc_alarm_irq_enable(dev, 0);
> >> +             clk_disable(pdata->clk);
> >> +     }

> > Why does the driver only disable the clock over suspend rather than also
> > unpreparing it?

> This was modeled after rtc-spear.c. Is this or rtc-spear in-correct?

They're both broken, looks like a bad conversion to prepare clocks.

> >> +     if (device_may_wakeup(&pdev->dev)) {
> >> +             if (pdata->irq_wake) {
> >> +                     disable_irq_wake(irq);
> >> +                     pdata->irq_wake = 0;
> >> +             }
> >> +     } else {
> >> +             clk_enable(pdata->clk);

> > It's also not checking for errors here.

> This was also modeled after rtc-spear. I guess I can check and print
> an warning but don't believe it matter.

You should return an error if the operation failed.

> >> +             xgene_rtc_alarm_irq_enable(dev, 1);
> >> +     }

> > Won't this unconditionally enable the interrupt regardless of what the
> > setting was prior to suspend?

> This was also modeled after rtc-spear.c. Is this or rtc-spear in-correct?

I would expct they're both broken here.

--pnDjx0H/VpusRTEI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTRbU5AAoJELSic+t+oim98gUP/3+MPBrXZPx0AxhkLx5Lxj9v
xktum56kwELnjPqaGpPWgIcglnya2rPx7iRGd7nitwvN3SpSJT7fyNCnxPsXno/5
IHMqwQXGwk4duuM3VbDLMVAHHQRLPwZMA5PA+g4kcNVv4Ze9hQLHZiFCbT71P1q8
YxjJqju2MfSYlESav/vDLlwZPkky+6Z/47CAEhW70gPTbASMNOOVhm7JLAV3sVKg
0I1TejZckdmFL/ZawHndPtteg14oqySubJCS4CIp4bPegZOOJGsProjUpHNxlanV
ERb5mOtsLt2e6Q3er6i9zrFwgtaDPv76777FwYXsRS83f/DWz8DyDRvuSWMx+ZCc
C38ioDnoVzT1InmoAZALI2xK66o5xIr/Y+CQw1hYSY1TFBniFwF9V5R8nDNqad9R
/9PLnGGAuuJ4VD8rzLyHKifzcoYdzlvMBQpt9uJqS5oFyJFts0gg8IkIL9//rAHP
HuO4HME/wzrbRhaBxbgIvHWFOH1CVosP/c3t/BBhISiPfSOarl1lYEJH3ftGZ6WZ
nvljaNmUS2p4lU9WMS+TQSaJwhGyHfW9VG7ub73F4k+gNlzIBwOWFz7k5lgogQSG
mgikiC8BM+D4dwnYu3FwUujj0HGVv4JRFdGS1ne/KmXvMGNmKAigNpmc8ofy6dlS
ho+GyOYgewVDxjyB5mG0
=N2Cr
-----END PGP SIGNATURE-----

--pnDjx0H/VpusRTEI--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
