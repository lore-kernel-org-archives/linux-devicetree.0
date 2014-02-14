From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] mfd: twl4030-madc: Add devicetree support.
Date: Fri, 14 Feb 2014 15:28:38 +0000
Message-ID: <20140214152838.GA30687@lee--X1>
References: <1392383861-14169-1-git-send-email-marek@goldelico.com>
 <20140214134815.GD13293@lee--X1>
 <CAAfyv36FH364OPnktx_Qh6sUfwYe7hynqrc3Xs_tY4gPXqQWvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAfyv36FH364OPnktx_Qh6sUfwYe7hynqrc3Xs_tY4gPXqQWvA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Dr. H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> >> Signed-off-by: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
> >> ---
> >>  .../devicetree/bindings/mfd/twl4030-madc.txt       | 18 +++++++++=
++++
> >>  drivers/mfd/twl4030-madc.c                         | 31
> >> ++++++++++++++++++++--
> >
<snip>

> >> +static struct twl4030_madc_platform_data *
> >> +     twl4030_madc_of_parse(struct platform_device *pdev)
> >> +{
> >> +     struct twl4030_madc_platform_data *pdata;
> >> +
> >> +     pdata =3D devm_kzalloc(&pdev->dev,
> >> +                     sizeof(struct twl4030_madc_platform_data), G=
=46P_KERNEL);
> >
> > s/struct twl4030_madc_platform_data/*pdata/
> Right typo.

Sorry, my comment of ambiguous.

I mean do this:

  sizeof(*pdata)

=2E.. instead of this:

  sizeof(struct twl4030_madc_platform_data)

> >> +     if (!pdata)
> >> +             return ERR_PTR(-ENOMEM);
> >> +
> >> +     pdata->irq_line =3D platform_get_irq(pdev, 0);
> >
> > Why weren't 'resources' used in the original implementation?
> Not sure I'm not an author :). It's passed in platform data.

Yes, I saw that. It should be changed.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
