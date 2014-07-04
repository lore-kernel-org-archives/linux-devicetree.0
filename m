From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 05/18] power: reset: Add AT91 reset driver
Date: Fri, 4 Jul 2014 11:06:45 +0200
Message-ID: <20140704090645.GB13487@lukather>
References: <1404396906-25194-1-git-send-email-maxime.ripard@free-electrons.com>
 <1404396906-25194-8-git-send-email-maxime.ripard@free-electrons.com>
 <F9547E0F-AB97-47E6-BA09-135EE4E1BC73@jcrosoft.com>
 <20140703145957.GH31996@lukather>
 <B425B925-B75E-4761-8CE6-9B12C5AC0469@jcrosoft.com>
 <20140704091443.545d1e08@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140704091443.545d1e08@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Nicolas FERRE <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Petazzoni <thomas-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 04, 2014 at 09:14:43AM +0200, Boris BREZILLON wrote:
> On Fri, 4 Jul 2014 11:08:20 +0800
> Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
>=20
> >=20
> > On Jul 3, 2014, at 10:59 PM, Maxime Ripard <maxime.ripard@free-electron=
s.com> wrote:
> >=20
> > > On Thu, Jul 03, 2014 at 10:39:08PM +0800, Jean-Christophe PLAGNIOL-VI=
LLARD wrote:
> > >>> +++ b/drivers/power/reset/at91-reset.c
> > >>> @@ -0,0 +1,202 @@
> > >>> +/*
> > >>> + * Atmel AT91 SAM9 SoCs reset code
> > >>> + *
> > >>> + * Copyright (C) 2014 Maxime Ripard
> > >>> + *
> > >>> + * Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > >>=20
> > >> you can not own the copyright as it=E2=80=99s basically a copy of ot=
her
> > >> people code
> > >=20
> > > The previous names are missing, right.
> > >=20
> > >>> + *
> > >>> + * This file is licensed under the terms of the GNU General Public
> > >>> + * License version 2.  This program is licensed "as is" without any
> > >>> + * warranty of any kind, whether express or implied.
> > >>> + */
> > >>> +
> > >>> +#include <linux/io.h>
> > >>> +#include <linux/module.h>
> > >>> +#include <linux/of_address.h>
> > >>> +#include <linux/platform_device.h>
> > >>> +#include <linux/reboot.h>
> > >>> +
> > >>> +#include <asm/system_misc.h>
> > >>> +
> > >>> +#include <mach/at91sam9_ddrsdr.h>
> > >>> +#include <mach/at91sam9_sdramc.h>
> > >>> +
> > >>> +#define AT91_RSTC_CR	0x00		/* Reset Controller Control Register */
> > >>> +#define	AT91_RSTC_PROCRST	BIT(0)		/* Processor Reset */
> > >>> +#define	AT91_RSTC_PERRST	BIT(2)		/* Peripheral Reset */
> > >>> +#define	AT91_RSTC_EXTRST	BIT(3)		/* External Reset */
> > >>> +#define	AT91_RSTC_KEY		(0xa5 << 24)	/* KEY Password */
> > >>> +
> > >>> +#define AT91_RSTC_SR	0x04		/* Reset Controller Status Register */
> > >>> +#define	AT91_RSTC_URSTS		BIT(0)		/* User Reset Status */
> > >>> +#define	AT91_RSTC_RSTTYP	GENMASK(10, 8)	/* Reset Type */
> > >>> +#define	AT91_RSTC_NRSTL		BIT(16)		/* NRST Pin Level */
> > >>> +#define	AT91_RSTC_SRCMP		BIT(17)		/* Software Reset Command in Pro=
gress */
> > >>> +
> > >>> +#define AT91_RSTC_MR	0x08		/* Reset Controller Mode Register */
> > >>> +#define	AT91_RSTC_URSTEN	BIT(0)		/* User Reset Enable */
> > >>> +#define	AT91_RSTC_URSTIEN	BIT(4)		/* User Reset Interrupt Enable */
> > >>> +#define	AT91_RSTC_ERSTL		GENMASK(11, 8)	/* External Reset Length */
> > >>> +
> > >>> +enum reset_type {
> > >>> +	RESET_TYPE_GENERAL	=3D 0,
> > >>> +	RESET_TYPE_WAKEUP	=3D 1,
> > >>> +	RESET_TYPE_WATCHDOG	=3D 2,
> > >>> +	RESET_TYPE_SOFTWARE	=3D 3,
> > >>> +	RESET_TYPE_USER		=3D 4,
> > >>> +};
> > >>> +
> > >>> +static void __iomem *at91_ramc_base[2], *at91_rstc_base;
> > >>> +
> > >>> +static void at91sam9_restart(enum reboot_mode mode, const char *cm=
d)
> > >>> +{
> > >>> +	asm volatile(
> > >>> +		".balign 32\n\t"
> > >>> +
> > >>> +		"str	%2, [%0, #" __stringify(AT91_SDRAMC_TR) "]\n\t"
> > >>> +		"str	%3, [%0, #" __stringify(AT91_SDRAMC_LPR) "]\n\t"
> > >>> +		"str	%4, [%1, #" __stringify(AT91_RSTC_CR) "]\n\t"
> > >>> +
> > >>> +		"b	.\n\t"
> > >>> +		:
> > >>> +		: "r" (at91_ramc_base[0]),
> > >>> +		  "r" (at91_rstc_base),
> > >>> +		  "r" (1),
> > >>> +		  "r" (AT91_SDRAMC_LPCB_POWER_DOWN),
> > >>> +		  "r" (AT91_RSTC_KEY | AT91_RSTC_PERRST | AT91_RSTC_PROCRST));
> > >>> +}
> > >>> +
> > >>> +static void at91sam9g45_restart(enum reboot_mode mode, const char =
*cmd)
> > >>> +{
> > >>> +	asm volatile(
> > >>> +		"cmp	%1, #0\n\t"
> > >>> +		"beq	1f\n\t"
> > >>> +
> > >>> +		"ldr	r0, [%1]\n\t"
> > >>> +		"cmp	r0, #0\n\t"
> > >>> +
> > >>> +		".balign 32\n\t"
> > >>> +
> > >>> +		"1:	str	%3, [%0, #" __stringify(AT91_DDRSDRC_RTR) "]\n\t"
> > >>> +		"	str	%4, [%0, #" __stringify(AT91_DDRSDRC_RTR) "]\n\t"
> > >>> +		"	strne	%3, [%1, #" __stringify(AT91_DDRSDRC_RTR) "]\n\t"
> > >>> +		"	strne	%4, [%1, #" __stringify(AT91_DDRSDRC_RTR) "]\n\t"
> > >>> +		"	str	%5, [%2, #" __stringify(AT91_RSTC_CR) "]\n\t"
> > >>> +
> > >>> +		"	b	.\n\t"
> > >>> +		:
> > >>> +		: "r" (at91_ramc_base[0]),
> > >>> +		  "r" (at91_ramc_base[1]),
> > >>> +		  "r" (at91_rstc_base),
> > >>> +		  "r" (1),
> > >>> +		  "r" (AT91_DDRSDRC_LPCB_POWER_DOWN),
> > >>> +		  "r" (AT91_RSTC_KEY | AT91_RSTC_PERRST | AT91_RSTC_PROCRST)
> > >>> +		: "r0");
> > >>> +}
> > >>> +
> > >> move this to an assembly file more easy to read than a C code
> > >=20
> > > Nope. It's a pain to pass variable to an external assembly file, and
> > > this makes the use of global variable pretty much mandatory, which is
> > > definitely not great.
> >=20
> > Not at all I did for the PM slow clock code just write a function and p=
as it as a parameter
> > you have 3
> >=20
> > so basically you have to use the current and just pass at91_ramc_base[0=
], at91_ramc_base[1]
> > and at91_rstc_base
> > it=E2=80=99s 3 lignes of modification, if you have at91_ramc_base and a=
t91_ramc_base same
> >=20
>=20
> Yes, retrieving function parameters from assembly code is not that
> complicated (the first 4 pointer values are accessible through r0-r3),
> but then you'll have to store your assembly file somewhere.

Like I was saying, there's a strong preference for the inline
assembly...

> Subsystem directories (drivers/xxx) are supposed to be architecture
> agnostics, and I'm not sure subsystem maintainers will accept these
> assembly files in their directory.

=2E.. and I've told that some maintainers don't even want assembly files
in their maintainance area.

> ITOH, leaving these assembly files in arch/arm/mach-at91 will just
> spread the code over linux src tree and will definitely not help other
> people find out the relationship between these files.

Given that the end-goal is to remove most (if not all) of mach-at91,
it seems a bit backward to me.

> Regarding the readability concern, I think some comments could help
> understanding what's being done here.

Yep, I have been a bit too eager to send the patches, and forgot to
reintroduce the comments that were there in the first place.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTtm6lAAoJEBx+YmzsjxAg1UgP/2WvBYdMJz6ycZF+6dlGUGzd
2M401/veeGxAiKEZOMbgDRCeMLF+hcMQggo7Ow55gY4S8fg1Lufma+8etQg3exii
qfTOqxDAI9Fm0/a3LUG0JMC8Fkxaf1JoTu4th2XiyAwbcuopsWy5dMBkxanGy5LX
gs9XRW3FzMr0Pm4jMCOcYgvSTR1fWaaMyy3FXw1U2HcIiOlFtonLZdlozy2IoWdn
dszfLWEKKS45E1FeT/eQo+l5YdcSYZ4J6nmbzVXry5xwLyoOCc7iWlnlj4SCAKmQ
zUUTd0SSotavPGhdkyU1SL4QV5eVhsH7oASi4UWqqC9sH4riGVWRtGs8t42W5rp1
dH3T0BHnqJ2m74gBgRXOyAa0lwdq/5LkJnsjCJufdc6pxNEI/6TdgEo9KgbYTdLs
L0zvgDv0UPvs4VzT4LSgMNThVwe68MWunZPshVGN9+zM8KJO+pwI7fDwyLGYPXZy
vSJOUPkk/9zbqwmdxPIv81cs6WiM6zzdh6miPfbqsNdtEpUJu2teQ4EOB3BpNu/M
rzR+fvPKo2qWhQiiZE1p4aBDKFd/RomBSOGoy+e31C2HY2/uzusnaGhevF38TeB0
QjL6LMaXYNGlu3YxPOp5BVJrDJ5j6ArCUKryEH7j1wV35M0V7HI7zTpTBNofkkp5
ow4YKCMXEFS9AQoelNRr
=QBSi
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
