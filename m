From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 00/13] arm64: Allwinner A64 support based on sunxi-ng
Date: Tue, 23 Aug 2016 21:31:29 +0200
Message-ID: <20160823193129.GO2598@lukather>
References: <20160726203041.29366-1-maxime.ripard@free-electrons.com>
 <fb559224-561c-3476-1146-96f7aea427f0@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UOYwgDhKKQYesrzQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fb559224-561c-3476-1146-96f7aea427f0-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--UOYwgDhKKQYesrzQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

On Mon, Aug 01, 2016 at 02:43:06AM +0100, Andr=E9 Przywara wrote:
> Hi Maxime,
>=20
> On 26/07/16 21:30, Maxime Ripard wrote:
> > Hi,
> >=20
> > Here is the previous A64 patches made by Andre [1], reworked to use
> > the new sunxi-ng clock framework.
> >=20
> > This uses the current H3 clock code, as both are really similar. The
> > first patches are just meant to rework slightly the H3 code, before
> > introducing the A64-related patches.
> >=20
> > Some WiP stuff have been removed, such as the MMC part, but this serie
> > already has a decent amount of devices supported: uart, i2c, rsb, etc.
>=20
> Thanks very much for looking into this and compiling this series!
>=20
> In general this looks good to me - apart from the sunxi-ng clock usage.
> I think I have some small fixes to the DT (have to compare against my
> latest local branch), I will comment on this later.
>=20
> As I think I never officially expressed my concerns about the new sunxi
> clock system, so I use that opportunity here ;-)
>=20
> As this became quite a long read, here a TL;DR:
> - We consider using an SCPI based clock system for the A64, alongside
> allwinner,simple-gates and fixed clocks. We try to avoid any Allwinner
> specific clocks (apart from the simple-gates).
> - ARM Trusted Firmware provides the SCPI implementation - for now, later
> we may move this into a possible arisc firmware.
> - We upstream some basic DT first, possibly omitting any controversial
> clock parts at all.
>=20
> Let me know what you think!
>=20
>=20
> Now the long part ....
>=20
> Basically I see those issues with the new clocks:
> - sunxi-ng requires a complicated SoC specific source file in the
> kernel. Although that makes the DT pretty easy (and avoids breaking it
> the future), it ultimately requires an explicit code drop for every new
> SoC, even if they share 95% of the clocks (as H3 and A64 do, for instance=
).
> - This code file does not actually contain any code, instead it's just
> data and looks like it should really be presented in DT - which brings
> us back to something like the old sunxi clock scheme, which is
> apparently not considered good enough. I still wonder if we could create
> a generic sunxi-ng user, which explains the needed clocks in the DT
> instead of in code. I admit that looks like quite some work.
> - It makes it quite hard for any other DT user (*BSD, U-Boot) to use the
> clocks, since they would have to copy quite verbatim the Linux
> implementation choice. This is admittedly also true for the old clock
> framework, but still unfortunate.

3 - You never get a complete clock support for any SoC, requirining
    for pretty much every driver to create from scratch a new clock
    driver.

4 - You require for all these clocks drivers some Ack from both the DT
    and clocks maintainers, who both said they were fed up with this.

5 - If you realise some day down the road that the parenting
    relationship is not right, or that some clock is not doing what
    you thought it was, you can't really fix it properly because of
    the DT stability you wanted us to enforce.

> So as mentioned several times before, I am looking into a more firmware
> driven clock system using the SCPI[1] framework.
> The idea is:
> - The basic clocks (OSC24M, OSC32K, AHB1, APB1, APB2, PERIPH0) are
> expressed as fixed clocks. If I am not mistaken, Allwinner recommends
> certain frequencies for them anyway, so we just use that and set them up
> before booting Linux, for instance in ATF.
> - The gates clocks are expressed as before, but by defining a generic DT
> compatible fallback name. I have no idea why every SoC enters its name
> into the simple_gates.c source file, while just mentioning the
> compatible string in the DT bindings and using the SoC specific name
> together with a generic fallback like "allwinner,sunxi-simple-gates"
> would suffice. This means that we don't need to touch simple-gates.c
> anymore most of the time.
> - Any clock that can (and has to) be programmed with a variable
> frequency is expressed as an SCPI clock. This interface allows basically
> querying and setting a frequency - not very powerful, but sufficient for
> the clocks I checked. Firmware then takes the burden of programming the
> respective clock register - which is not rocket science if we lock the
> base clocks to a certain frequency.
>=20
> The advantage of this approach would be:
> - The impact to Linux code is minimized. Normally there would be no need
> to touch the kernel at all when we introduce a new SoC.

But you duplicate the clock framework entirely, both the core code and
the data you were complaining about, with all the issues that arise
=66rom code duplication. You still have to create that big file you were
complaining about, with exactly the same constraints.

> - Any other DT user can quite easily make use of the clock system
> without adding tons of complicated Allwinner specific clock code. The
> simple-gates driver is almost trivial to implement, and chances are SCPI
> is already around anyway.
> - If there are any peculiarities with a certain clock (implementation),
> we can solve this in firmware. Fixes to code would immediately benefit
> all users - existing kernels (from distributions), newer kernels and
> other OSes.

But no-one would actually be able to use it, because no one upgrades
its firmware, including all the major distributions (Debian, Ubuntu,
Fedora, OpenWRT, Arch, Gento, you name it). So there's effectively no
way to fix a bug that was there.

> - Having SCPI gives us simple regulators and sensors (temperature,
> power) for free (in terms of no Linux code required). It also allows for
> DVFS support, though this may require more work on the firmware side.

And ignoring all the other features that the PMIC support, and the
board uses out there (GPIO, ADCs, Power supplies, battery charger, USB
VBUS monitoring)

> - This approach matches many of the more serious ARM64 machines out
> there, which refrain from exposing all of their clock framework to Linux.

$ git grep -l scpi arch/arm64/boot/dts/**.dtsi
arch/arm64/boot/dts/arm/juno-base.dtsi

Are you saying that only Juno is a serious ARM64 machine?

> Also this opens the door to much easier support for new SoCs - up to a
> point where any new chip would actually run out of the box on existing
> distributions (thinking of LTS releases here). The pinctrl driver is a
> nasty guy around here - but let's not make it worse and try to fix that
> guy later ;-)

That's not true and you know it.

What you actually suggest is to implement a minimal set of clocks in
ATF (the opposite being, the entire set of clocks, which would of
course be untested, so it basically falls down in the exact same
category).

What this means is that, since we will obviously not support all the
clocks client from day one, any user will be *required* for a new
kernel release to operate as it's expected to upgrade the ATF.

Without any help from the distribution (s)he's running, because no one
has that kind of scenario in mind. And let's be honest, I don't see
Ubuntu changing the dependencies for the kernel for the Allwinner SoCs
alone (let alone the fact that it's pretty much impossible in a
generic way to know where and how the ATF is installed).

Apart from being a major pain for any user, upgrading the bootloader
is also a showstopper for most industries.

So, no, we won't do that. The A64 support is something we actually
want to use in real-life products, and our users to be happy with the
support they have.

NAK.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--UOYwgDhKKQYesrzQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXvKSRAAoJEBx+YmzsjxAg2eIQAJ8Egs7Bv5u14FmWq0JrNJRW
t8JN3REYGQd2hdj/2cv+nXPUeUXOpu6cdiI9rXgyzLoUcf/uXV8IZ52yDoIJhNVo
3OU4WiajQCEhOOICBK67QsF+ofxpDAnXQCWVoLvqB2BzgT2Ck6ANPOx/Xi5hbXvL
2RGeV9poFOgUXb05OOO+oC2Twdb2/vEuAudmMlrmYZrKRkDUmJmbZMkN/mhkFMvY
gosr6GE3fjfCydUs/67DUXVugBtdNtBfwC6XaevKE6dwxPR84eNCK+a6wmZAN1uv
PmdIJsK0O8DoM9pB5v4YiGX/z8OVwH3hBO+PptGt8eWJXLlxpWHFM1IlgA44AQ+n
vjey8gu8FRKfTNF4RPNe5uFnPtAB2iMVDyD/17Y9Ub1cWqcW6+dl5SrRLZmAofhm
z0eKLydhrXBD+GA9BwAxkVCH6h8fTh/7j4WC5ebx6JRynA+qPO4PM+rGO7AE38cc
ap+3qV+6OmbBk7NUL+kk2hPO5+pgcJBw7mcWhR9hihSDk4r35RNe3PME7z/DfrLl
7dIxAcIhHKdtw9cL4BJp2x8IdyKtC63hXphJdm0AUlMKIXV6dw91vIW0rwrhfU9k
6eOfPoazxPVLkMcZKBvBEiBtwGXuKVmotGPqzoKNznR2QKALeMJtLLzWlnIFzf1Q
eMnEaieXIIRpo/2To7Ve
=EKui
-----END PGP SIGNATURE-----

--UOYwgDhKKQYesrzQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
