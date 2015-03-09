From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/8] irqchip: New driver for ST's SysCfg controlled
 IRQs
Date: Mon, 9 Mar 2015 07:48:51 +0000
Message-ID: <20150309074851.GJ3318@x1>
References: <1424272444-16230-1-git-send-email-lee.jones@linaro.org>
 <20150308040238.GC21207@io.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150308040238.GC21207-fahSIxCzskDQ+YiMSub0/l6hYfS7NtTn@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 08 Mar 2015, Jason Cooper wrote:

> Lee,
>=20
> On Wed, Feb 18, 2015 at 03:13:56PM +0000, Lee Jones wrote:
> > Rebased (again) and resending.
> > =20
> > This driver enables IRQs which are controlled using System Configur=
ation
> > registers.  Without it Performance Monitoring, Core Sight Tracing a=
nd some
> > L2 Caches will fail to function.
> > =20
> > v2 =3D> v3:
> >  - Removed filename from header as suggested by Thomas
> >=20
> > v1 =3D> v2:
> >  - Fixed up Jason's review comments
> >=20
> > Lee Jones (8):
> >   dt: bindings: Supply shared ST IRQ defines
> >   irqchip: Supply new driver for STi based devices
> >   irqchip: irq-st: Add documentation for STi based syscfg IRQs
> ...
> >  .../interrupt-controller/st,sti-irq-syscfg.txt     |  35 ++++
> ...
> >  drivers/irqchip/Kconfig                            |   7 +
> >  drivers/irqchip/Makefile                           |   1 +
> >  drivers/irqchip/irq-st.c                           | 206 +++++++++=
++++++++++++
> >  include/dt-bindings/interrupt-controller/irq-st.h  |  30 +++
> ...
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-con=
troller/st,sti-irq-syscfg.txt
> >  create mode 100644 drivers/irqchip/irq-st.c
> >  create mode 100644 include/dt-bindings/interrupt-controller/irq-st=
=2Eh
>=20
> Patches 1-3 applied to irqchip/st several days ago.  Sorry for not le=
tting you
> know earlier.  I'm just getting things back in order from hardware fa=
ilures in
> my build machine *and* my mailserver.  It's been a rough week.  :-/

Thanks Jason.

> Let me know if you'd like to use that branch as a stable base.

I do not wish to do that.  Rebase at will.

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
