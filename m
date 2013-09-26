From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: new platform for Energy Micro's EFM32 Cortex-M3
 SoCs
Date: Thu, 26 Sep 2013 11:42:51 +0200
Message-ID: <20130926094251.GK16106@pengutronix.de>
References: <1379447884-14025-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <201309172245.25367.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201309172245.25367.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2013 at 10:45:25PM +0200, Arnd Bergmann wrote:
> On Tuesday 17 September 2013, Uwe Kleine-K=F6nig wrote:
> >  arch/arm/Kconfig                               |  16 +++-
> >  arch/arm/Kconfig.debug                         |  16 ++++
> >  arch/arm/Makefile                              |   1 +
> >  arch/arm/configs/efm32_defconfig               | 104 +++++++++++++=
++++++++++++
> >  arch/arm/mach-efm32/Makefile                   |   1 +
> >  arch/arm/mach-efm32/Makefile.boot              |   2 +
> >  arch/arm/mach-efm32/cmu.h                      |  15 ++++
> >  arch/arm/mach-efm32/common.c                   |  19 +++++
> >  arch/arm/mach-efm32/common.h                   |   1 +
> >  arch/arm/mach-efm32/dtmachine.c                |  31 ++++++++
> >  arch/arm/mach-efm32/include/mach/debug-macro.S |  48 ++++++++++++
> >  arch/arm/mach-efm32/include/mach/entry-macro.S |   5 ++
> >  arch/arm/mach-efm32/include/mach/io.h          |   6 ++
> >  arch/arm/mach-efm32/include/mach/irqs.h        |   6 ++
> >  arch/arm/mach-efm32/include/mach/timex.h       |   7 ++
>=20
> You should be able to add NOMMU platforms in combination with CONFIG_=
MULTIPLATFORM
> now, which gets rid of most of these files.
I made that work now and can prepare a patch. I had to drop "depends on
!ARCH_MULTIPLATFORM" from XIP_KERNEL. That's because my machine only
works with XIP_KERNEL as it only has 4 MiB of RAM.

Also note that for !MMU you need to specify the base address and size o=
f
your RAM (DRAM_BASE, DRAM_SIZE) and flash (FLASH_MEM_BASE, FLASH_SIZE).
So the resulting image is hardly runnable on different machines. (I
don't know off-hand why these are needed though, maybe this can be
discussed away.)

So ARCH_MULTIPLATFORM is only good as it allows to simplify a few
things, but the result isn't really multi-platform.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
