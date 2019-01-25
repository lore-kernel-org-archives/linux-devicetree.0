Return-Path: <SRS0=ySGx=QB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:49132 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbfAYQ2P (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Jan 2019 11:28:15 -0500
Date: Fri, 25 Jan 2019 17:28:14 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] ARM: dts: omap4-droid4: Fix typo in cpcap IRQ flags
Message-ID: <20190125162814.GA7571@amd>
References: <20190107175907.45268-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <20190107175907.45268-1-tony@atomide.com>
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>, devicetree@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
List-ID: <devicetree@vger.kernel.org>


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> We're now getting the following error:
>=20
> genirq: Setting trigger mode 1 for irq 230 failed
> (regmap_irq_set_type+0x0/0x15c)
> cpcap-usb-phy cpcap-usb-phy.0: could not get irq dp: -524
>=20
> This is because of a typo in the irq flags. Really these interrupts
> are LEVEL, but before we change them we need to test them. So let's
> do a minimal fix first.

Could we get this one applied? It is regression fix for 5.0-rc1...

									Pavel

> Reported-by: Pavel Machek <pavel@ucw.cz>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi b/arch/arm/bo=
ot/dts/motorola-cpcap-mapphone.dtsi
> --- a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
> +++ b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
> @@ -105,7 +105,7 @@
>  			interrupts-extended =3D <
>  				&cpcap 15 0 &cpcap 14 0 &cpcap 28 0 &cpcap 19 0
>  				&cpcap 18 0 &cpcap 17 0 &cpcap 16 0 &cpcap 49 0
> -				&cpcap 48 1
> +				&cpcap 48 0
>  			>;
>  			interrupt-names =3D
>  				"id_ground", "id_float", "se0conn", "vbusvld",

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlxLOR4ACgkQMOfwapXb+vJxvQCeIbeJGiOClC9aC7MzTDQAiXP9
1tYAniboHcl1hlX3CqjvNaZUtUk4lEVG
=1Lha
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
