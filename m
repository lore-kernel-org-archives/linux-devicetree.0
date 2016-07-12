From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 03/10] Clocksource: add nuc970 clocksource driver
Date: Tue, 12 Jul 2016 10:28:35 +0200
Message-ID: <26830152.1oBSpuVOM0@wuerfel>
References: <1468135649-19980-1-git-send-email-vw@iommu.org> <3277576.eNgdG7zPqq@wuerfel> <57849D2B.60305@iommu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <57849D2B.60305@iommu.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Wan Zongshun <vw@iommu.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, jason@lakedaemon.net, Wan Zongshun <mcuos.com@gmail.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, p.zabel@pengutronix.de, Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday, July 12, 2016 3:32:59 PM CEST Wan Zongshun wrote:
>=20
> On 2016=E5=B9=B407=E6=9C=8811=E6=97=A5 23:36, Arnd Bergmann wrote:
> > On Sunday, July 10, 2016 3:27:23 PM CEST Wan Zongshun wrote:
> >>
> >> +config NUC900_TIMER
> >> +        bool "Clocksource timer for nuc900 platform" if COMPILE_T=
EST
> >> +        depends on ARM
> >> +        select CLKSRC_OF if OF
> >> +        select CLKSRC_MMIO
> >> +        help
> >> +          Enables the clocksource for the NUC900 platform.
> >>
> >
> > I have put this patch into my randconfig build system and found tha=
t
> > it lacks a dependency:
> >
> >
> >
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kcon=
fig
> > index e18ef32776a3..59b9251eef37 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -523,7 +523,7 @@ config CLKSRC_ST_LPC
> >
> >   config NUC900_TIMER
> >           bool "Clocksource timer for nuc900 platform" if COMPILE_T=
EST
> > -        depends on ARM
> > +        depends on ARM && GENERIC_CLOCKEVENTS
> >           select CLKSRC_OF if OF
> >           select CLKSRC_MMIO
> >           help
> > =09
>=20
> So this patch, I still need submit or you have merged it?

Ideally the driver should get submitted through the clocksource
maintainer tree. I have not applied it to any git tree that I
plan to send anywhere.

> >
> > Also the init function has changed its return type in linux-next:
> >
> >> +static void __init nuc970_timer_of_init(struct device_node *node)
> >
> > This now needs to return an error code or we get:
> >
> > ../include/linux/of.h:1004:20: error: comparison of distinct pointe=
r types lacks a cast [-Werror]
> >          .data =3D (fn =3D=3D (fn_type)NULL) ? fn : fn  }
> >
> > Daniel Lezcano seems to have implemented a migration strategy, but =
I
> > can't see what you are supposed to do here, since the
> > CLOCKSOURCE_OF_DECLARE_RET macro is no longer part of linux-next.
>=20
> Wait for Daniel's comments? or what should I do now?

Yes, let's see what he says. I guess from the timing, this will probabl=
y
have to wait for linux-4.9 anyway, and then we have no problem because =
the
API change will make it into 4.8.

	Arnd
