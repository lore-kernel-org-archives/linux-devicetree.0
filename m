From: Gyungoh Yoo <gyungoh@gmail.com>
Subject: Re: [RESUBMIT PATCH v4 1/8] mfd: Add support for Skyworks SKY81452
 driver
Date: Thu, 23 Oct 2014 12:16:44 +0900
Message-ID: <20141023031644.GB3244@jack-ThinkPad-T520>
References: <1412657745-7812-1-git-send-email-jack.yoo@skyworksinc.com>
 <1413179262-27636-1-git-send-email-jack.yoo@skyworksinc.com>
 <1413179262-27636-2-git-send-email-jack.yoo@skyworksinc.com>
 <20141021123001.GA4939@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141021123001.GA4939@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: sameo@linux.intel.com, jg1.han@samsung.com, cooloney@gmail.com, broonie@kernel.org, lgirdwood@gmail.com, jack.yoo@skyworksinc.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, grant.likely@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, pawel.moll@arm.com, heiko@sntech.de, jason@lakedaemon.net, shawn.guo@freescale.com, treding@nvidia.com, florian.vaussard@epfl.ch, trivial@kernel.org, linux@roeck-us.net, andrew@lunn.ch, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 21, 2014 at 01:30:01PM +0100, Lee Jones wrote:
> On Mon, 13 Oct 2014, Gyungoh Yoo wrote:
>=20
> > Signed-off-by: Gyungoh Yoo <jack.yoo@skyworksinc.com>
> > ---
> > Changes v4:
> > Removed MODULE_VERSION()
> > Modified license to GPLv2
> >=20
> > Changes v3:
> > Fixed the backlight name from 'sky81452-bl' to 'sky81452-backlight'
> > Assigned mfd_cell.of_compatible for binding device node
> > Modified error messages
> >=20
> > Changes v2:
> > Renamed CONFIG_SKY81452 to CONFIG_MFD_SKY81452
> > Changed the dependency from I2C=3Dy to I2C, for CONFIG_MFD_SKY81452
> > Added message for exception or errors
> >=20
> >  drivers/mfd/Kconfig          |  12 +++++
> >  drivers/mfd/Makefile         |   1 +
> >  drivers/mfd/sky81452.c       | 110 +++++++++++++++++++++++++++++++=
++++++++++++
> >  include/linux/mfd/sky81452.h |  32 +++++++++++++
> >  4 files changed, 155 insertions(+)
> >  create mode 100644 drivers/mfd/sky81452.c
> >  create mode 100644 include/linux/mfd/sky81452.h
>=20
> [...]
>=20
> > +++ b/include/linux/mfd/sky81452.h
> > @@ -0,0 +1,32 @@
> > +/*
> > + * sky81452.h	SKY81452 MFD driver
> > + *
> > + * Copyright 2014 Skyworks Solutions Inc.
> > + * Author : Gyungoh Yoo <jack.yoo@skyworksinc.com>
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify it
> > + * under the terms of the GNU General Public License as published =
by the
> > + * Free Software Foundation; either version 2, or (at your option)=
 any
> > + * later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,=
 but
> > + * WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the G=
NU
> > + * General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public Licen=
se along
> > + * with this program; if not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#ifndef _SKY81452_H
> > +#define _SKY81452_H
> > +
> > +#include <linux/sky81452-backlight.h>
>=20
> Shouldn't this live in linux/platform_data?

I will change the location to linux/platform_data and resubmit it.
Thank you your review.

>=20
> > +#include <linux/regulator/machine.h>
> > +
> > +struct sky81452_platform_data {
> > +	struct sky81452_bl_platform_data *bl_pdata;
> > +	struct regulator_init_data *regulator_init_data;
> > +};
> > +
> > +#endif
>=20
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
