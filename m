From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] mfd: bcm590xx: add support for secondary I2C
 slave address
Date: Tue, 20 May 2014 17:11:31 +0100
Message-ID: <20140520161131.GB32025@lee--X1>
References: <1398295293-11033-1-git-send-email-mporter@linaro.org>
 <1398295293-11033-3-git-send-email-mporter@linaro.org>
 <20140428115627.GY21279@lee--X1>
 <20140428140910.GB7719@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140428140910.GB7719@beef>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > > BCM590xx utilizes a secondary I2C slave address to access additio=
nal
> > > register space. Add support for the secondary address space by
> > > instantiating a dummy I2C device with the appropriate secondary
> > > I2C slave address. Also expose a secondary regmap register space =
so
> > > that MFD drivers can access this secondary i2c slave address spac=
e.
> > >=20
> > > Signed-off-by: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > ---
> > >  drivers/mfd/bcm590xx.c       | 60 ++++++++++++++++++++++++++++++=
+++-----------
> > >  include/linux/mfd/bcm590xx.h |  9 ++++---
> > >  2 files changed, 52 insertions(+), 17 deletions(-)
> >=20
> > Nice, flows much better now.
> >=20
> > Can I just apply the two MFD patches, or are there cross-deps?
>=20
> There's cross-deps so the regulator driver will need to go with it.
> Mark mentioned earlier in the thread that he wanted to merge through
> the regulator tree though.

Still nothing.

Mark,
  Can I apply this set and supply you with a pull-request?

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
