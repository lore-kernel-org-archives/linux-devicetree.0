From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: new platform for Energy Micro's EFM32 Cortex-M3
 SoCs
Date: Mon, 30 Sep 2013 17:49:12 +0200
Message-ID: <20130930154912.GE2548@pengutronix.de>
References: <1379447884-14025-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <201309272344.01386.arnd@arndb.de>
 <20130928191511.GA2548@pengutronix.de>
 <201309292100.41701.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201309292100.41701.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Jonathan Austin <jonathan.austin-5wv7dgnIgG8@public.gmane.org>, Marc Kleine-Budde <m.kleine-budde-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Arnd,

On Sun, Sep 29, 2013 at 09:00:41PM +0200, Arnd Bergmann wrote:
> On Saturday 28 September 2013, Uwe Kleine-K=F6nig wrote:
> > On Fri, Sep 27, 2013 at 11:44:01PM +0200, Arnd Bergmann wrote:
> > > On Thursday 26 September 2013, Uwe Kleine-K=F6nig wrote:
> > > > I made that work now and can prepare a patch. I had to drop "de=
pends on
> > > > !ARCH_MULTIPLATFORM" from XIP_KERNEL. That's because my machine=
 only
> > > > works with XIP_KERNEL as it only has 4 MiB of RAM.
> > >=20
> > > Ok, cool. We might run into a few problems with 'make randconfig'=
 and
> > > 'make allyesconfig' when it becomes possible to enable XIP_KERNEL=
 then.
> > > IIRC, there is no fundamental reason to disallow XIP_KERNEL with
> > > ARCH_MULTIPLATFORM, but I added the dependency because it causes
> > > build errors in combination with other options.
> > ah, OK. Do you have an idea to fix both?
>=20
> No, I don't actually remember what problems I ran into. It may be any=
where
> from trivial to impossible to fix.
I sent a patch series (without looking much for problems :-).

> > There is a BSP publically available at
> >=20
> > 	http://git-public.pengutronix.de/?p=3DOSELAS.BSP-EnergyMicro-Gecko=
=2Egit;a=3Dsummary
> >=20
> > which also includes a README file. For troubleshooting /join #efm32=
 on
> > freenode.
>=20
> I've never tried ptxdist, but if that is known to work fine with NOMM=
U,
> I might just try building the base distro and running it on mach-virt=
=2E
>=20
> Does this work with ELF FDPIC or do you need binfmt-flat?
I use binfmt-flat, but that's because Marc (on Cc: now) created the bas=
e
BSP for me that way. I don't know what ELF FDPIC is.

> > > Do you prevent building such a kernel in Kconfig?
> > I'm sure my Kconfig magic isn't waterproof. It took me a few tries =
to
> > expand the multiarch architecture selection to make v7-m selectable=
 at
> > all.
>=20
> Ok, I can have a look and give you suggestions for how it needs to be
> phrased if it currently allows broken (non-building) combinations.
You have the chance now to comment in the respective thread.

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
