From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 3/3] gpio: tps65086: Add GPO driver for the TPS65086
 PMIC
Date: Wed, 27 Jan 2016 07:29:55 +0000
Message-ID: <20160127072955.GH3368@x1>
References: <1453737012-3130-1-git-send-email-afd@ti.com>
 <1453737012-3130-4-git-send-email-afd@ti.com>
 <20160126140312.GB3368@x1>
 <56A784CC.4090902@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56A784CC.4090902-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 26 Jan 2016, Andrew F. Davis wrote:

> On 01/26/2016 08:03 AM, Lee Jones wrote:
> >On Mon, 25 Jan 2016, Andrew F. Davis wrote:
> >
> >>Add support for the TPS65086 PMIC GPOs.
> >>
> >>TPS65086 has four configurable GPOs that can be used for several
> >>purposes. These are output only.
> >>
> >>Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
> >>---
> >>  drivers/gpio/Kconfig         |   6 ++
> >>  drivers/gpio/Makefile        |   1 +
> >>  drivers/gpio/gpio-tps65086.c | 144 ++++++++++++++++++++++++++++++=
+++++++++++++
> >>  3 files changed, 151 insertions(+)
> >>  create mode 100644 drivers/gpio/gpio-tps65086.c
> >
> >Is this patch orthogonal to the other two in the set, or do they all
> >need to go in together?
>=20
> These can all go in separately, in fact Mark has already taken the re=
gulator
> component from a previous push of this series. It is only the TPS6591=
2
> driver I'm pushing that will need to go all at once due to conflicts =
with
> the driver it is replacing.

Very well.  MFD patches taken.

Linus should take this through his tree.

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
