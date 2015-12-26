From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v2 8/8] ARM: bcm2835: Add Kconfig support for bcm2836
Date: Sat, 26 Dec 2015 14:38:05 -0800
Message-ID: <87y4cg96pe.fsf@eliezer.anholt.net>
References: <1450310115-22163-1-git-send-email-eric@anholt.net> <1450310115-22163-9-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450310115-22163-9-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Eric Anholt <eric@anholt.net> writes:

> This should be a complete port of bcm2835 functionality to bcm2836
> (Raspberry Pi 2).
>
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---
>
> v2: Implement Arnd's feedback to not split to ARCH_BCM2836, and
>     instead use more conditionals in ARCH_BCM2835.  Also reduce diff
>     between 2835 and 2836.
>
>  arch/arm/Kconfig.debug     | 10 ++++++++--
>  arch/arm/boot/dts/Makefile |  3 ++-
>  arch/arm/mach-bcm/Kconfig  |  8 ++++----
>  3 files changed, 14 insertions(+), 7 deletions(-)

I noticed a minor bug in this commit, that the dts/Makefile hunk should
be in the Pi2 DT patch, instead.  Otherwise the -soc branch for
submitting this doesn't build on its own before the merge of all the
branches together.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWfxbNAAoJELXWKTbR/J7o5YAP/jcJHwJX4D04/xD0CQRJ56M0
pLVOgGKd3W9Kf3pidOWyjmWWDu84i2561iupVWvtVC0f4N7RavR642zQM7sd5F2r
45ftKpiAkXIFL5BowHJlpKlcbCUp7X3KX+q2OchMAvazwZwct33FneJAD7IVMWUa
qShcFCf7BdN4uf4A2U9+YgweJCrLIhNkMKJKBYZ1+DTJ1L3Z70QJUGN3i4anYWZ4
ktRkTeyq7rSLOvKqL+a0TszPY1tEIzWuXfI1ah8Z/5h7Ck61vYbpiHGlhcHfqXP5
2yE8630mbkIqAS9Sd9qbHscHLHyUK35MwxGU4e6xeARv5IMIotHU4S08IPxAbtSG
NbbbJY6lMP0q6xhZQO5FqVAmQYThROZy1/iXwEiro4HAL1VpLzqP/NDXEJElFKPO
7HWuJvcLs6ZWAwXX3dNj1NJZjUIxjsBD71Jj9hiMuipPuXWr8NLw0Vlb+AY96ETj
tRsG5jYWHpFYZuLj/EcoZv6yIeUa3oeEpXROGLkb9O5+jixPHZkPgE1pUofN6bjd
Umqe2GaBJ46A1iSIox+QdDM0dcNerP1+NCDncIjVF08l+mltWDJ9UsHB7ab5FosO
/yunXRH1ot+P5GmmiBhbBOODXsqNR15nteG93EJoM8qbYBflQb9HbdG8E4lD01O4
AnX0exb0QItu++S6N0kV
=eiqj
-----END PGP SIGNATURE-----
--=-=-=--
