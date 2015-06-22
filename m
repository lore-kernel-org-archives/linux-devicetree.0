From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 0/2] add basic support to Marvell 88pm880/88pm886 PMIC
 chip
Date: Mon, 22 Jun 2015 09:36:01 +0100
Message-ID: <20150622083601.GB19061@x1>
References: <1434098601-3498-1-git-send-email-yizhang@marvell.com>
 <20150619083357.GA4502@yizhang>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150619083357.GA4502@yizhang>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhouqiao-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 19 Jun 2015, Yi Zhang wrote:

> On Fri, Jun 12, 2015 at 04:43:19PM +0800, Yi Zhang wrote:
>=20
> Hi, Samuel and Lee:
>=20
> Could you please share your comments on this patch?=20
> then I can modify accordingly;

Please don't ping.

There are two reasons why you haven't received a reply.  Firstly, we
are very late in the cycle.  Many Maintainers turn their hand from
reviewing to maintaining/testing during the very late stages.  Please
follow the cycles.  Secondly, I have been on vacation for a little
over a week and no amount of pinging will hurry me back to work.

If you think your set has been missed, please wait a while, think
about why that might be and if you can't think of a good reason then
resend the set.

> >   - 88pm880 and 88pm886 are PMIC chips which integrates regulator,
> >     gpadc, charger, fuelgauge, etc;
> > 	they share most of the functions and register mapping
> >   - this version removes the redundant EXPORT_SYMBOL_GPL, compared =
with the
> >     first version
> >=20
> >=20
> > Yi Zhang (2):
> >   mfd: add Marvell 88pm88x description
> >   mfd: 88pm88x: initialize 88pm886/88pm880 base support
> >=20
> >  Documentation/devicetree/bindings/mfd/88pm88x.txt |  33 ++
> >  drivers/mfd/88pm880-table.c                       | 173 +++++++
> >  drivers/mfd/88pm886-table.c                       | 173 +++++++
> >  drivers/mfd/88pm88x-core.c                        | 584 ++++++++++=
++++++++++++
> >  drivers/mfd/88pm88x-i2c.c                         | 167 +++++++
> >  drivers/mfd/88pm88x-irq.c                         | 171 +++++++
> >  drivers/mfd/88pm88x.h                             |  51 ++
> >  drivers/mfd/Kconfig                               |  12 +
> >  drivers/mfd/Makefile                              |   3 +
> >  include/linux/mfd/88pm880-reg.h                   |  98 ++++
> >  include/linux/mfd/88pm880.h                       |  59 +++
> >  include/linux/mfd/88pm886-reg.h                   |  59 +++
> >  include/linux/mfd/88pm886.h                       |  55 ++
> >  include/linux/mfd/88pm88x-reg.h                   | 118 +++++
> >  include/linux/mfd/88pm88x.h                       | 202 ++++++++
> >  15 files changed, 1958 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/88pm88x.t=
xt
> >  create mode 100644 drivers/mfd/88pm880-table.c
> >  create mode 100644 drivers/mfd/88pm886-table.c
> >  create mode 100644 drivers/mfd/88pm88x-core.c
> >  create mode 100644 drivers/mfd/88pm88x-i2c.c
> >  create mode 100644 drivers/mfd/88pm88x-irq.c
> >  create mode 100644 drivers/mfd/88pm88x.h
> >  create mode 100644 include/linux/mfd/88pm880-reg.h
> >  create mode 100644 include/linux/mfd/88pm880.h
> >  create mode 100644 include/linux/mfd/88pm886-reg.h
> >  create mode 100644 include/linux/mfd/88pm886.h
> >  create mode 100644 include/linux/mfd/88pm88x-reg.h
> >  create mode 100644 include/linux/mfd/88pm88x.h
> >=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
