From: =?iso-8859-1?q?J=FCrgen_Beisert?= <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 7/7] Staging/iio/adc/touchscreen/MXS: provide devicetree adaption
Date: Mon, 23 Sep 2013 09:42:29 +0200
Message-ID: <201309230942.29417.jbe@pengutronix.de>
References: <1379593369-22010-1-git-send-email-jbe@pengutronix.de> <1379593369-22010-8-git-send-email-jbe@pengutronix.de> <523D943D.705@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <523D943D.705-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jonathan,

On Saturday 21 September 2013 14:42:37 Jonathan Cameron wrote:
> The device tree list has moved, so I've changed the cc.
>
> Few comments inline.  Basically I'd go for longer more
> descriptive names when the abreviation isn't a really
> well known common one.
>
> Note I'm not all that familiar with device tree conventions
> so may be barking up the wrong tree ;)
>
> > [...]
> > @@ -9,13 +10,38 @@ Optional properties:
> >  - fsl,lradc-touchscreen-wires: Number of wires used to connect the
> > touchscreen to LRADC. Valid value is either 4 or 5. If this propert=
y is
> > not present, then the touchscreen is -                             =
=20
> > disabled.
>
> Do we want that lradc prefix on these other properties?

The question is, if we want to keep it. This is the currently used bind=
ing.

> > +                               disabled. 5 wires is valid for i.MX=
28 SoC only.
> > +- fsl,ave-ctrl: number of samples per direction to calculate an av=
erage value.
> > +                Allowed value is 1 ... 31, default is 4=20
>
> This naming seems less than informative, what about fsl,average_num_s=
amples
> of average_count (ave isn't all that obvious an abrevaition of averag=
e).

I used already existing names from
"Documentation/devicetree/bindings/input/touchscreen/stmpe.txt".

> > +- fsl,ave-delay: delay between consecutive samples. Allowed value =
is
> > +                 1 ... 2047. It is used if 'fsl,ave-ctrl' > 1, cou=
nts at
> > +                 2 kHz and its default is 2 (=3D 1 ms)
>
> fsl,average_intersample_delay (I assume any limit of device tree prop=
erty
> names is longer than that?)

If the parameter description in "Documentation/devicetree/bindings" is =
useful,
we don't need long parameter names. If there is no useful parameter
description, we will need long names ;)

Regards,
Juergen

--=20
Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| Juergen Beisert =A0 =A0 =A0 =A0 =A0 =A0 |
Linux Solutions for Science and Industry =A0 =A0 =A0| http://www.pengut=
ronix.de/  |
