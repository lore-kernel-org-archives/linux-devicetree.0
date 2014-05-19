From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 3/7] mfd: add support for sun6i PRCM
 (Power/Reset/Clock Management) unit
Date: Mon, 19 May 2014 10:21:59 +0100
Message-ID: <20140519092159.GE4978@lee--X1>
References: <1399633911-7094-1-git-send-email-boris.brezillon@free-electrons.com>
 <1399633911-7094-4-git-send-email-boris.brezillon@free-electrons.com>
 <20140509135251.GY5767@lee--X1>
 <20140515151756.GX29258@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140515151756.GX29258@lukather>
Sender: linux-doc-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>, Shuge <shuge@allwinnertech.com>, kevin@allwinnertech.com, Hans de Goede <hdegoede@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dev@linux-sunxi.org
List-Id: devicetree@vger.kernel.org

> > > The PRCM (Power/Reset/Clock Management) block exposes several sub=
devices
> > > in different subsystems (clk, reset ...)
> > >=20
> > > Add basic support for the PRCM unit with clk (AR100, AHB0, and AP=
B0 clks)
> > > and reset controller subdevices.
> > >=20
> > > Other subdevices might be added later (if needed).
> > >=20
> > > Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.co=
m>
> > > Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > > ---
> > >  drivers/mfd/Kconfig      |   8 +++
> > >  drivers/mfd/Makefile     |   1 +
> > >  drivers/mfd/sun6i-prcm.c | 134 +++++++++++++++++++++++++++++++++=
++++++++++++++
> > >  3 files changed, 143 insertions(+)
> > >  create mode 100644 drivers/mfd/sun6i-prcm.c
> >=20
> > [...]
> >=20
> > > +/*
> > > + * Copyright (C) 2014 Free Electrons
> > > + *
> > > + * License Terms: GNU General Public License v2
> > > + * Author: Boris BREZILLON <boris.brezillon@free-electrons.com>
> > > + *
> > > + * Allwinner PRCM (Power/Reset/Clock Management) driver
> > > + *
> > > + */
> > > +
> > > +#include <linux/mfd/core.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> >=20
> > Ah, now isn't that better?
> >=20
> > Acked-by: Lee Jones <lee.jones@linaro.org>
>=20
> How do you want to merge this? Do you want me to take it through
> mach-sunxi tree, or do you want to take it in your tree?

If Boris can tell me what needs to go in with this patch (or if it
can go in on its own), I will create a(n immutable) branch from which
you can pull into your tree.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
