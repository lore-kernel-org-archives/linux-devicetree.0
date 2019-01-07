Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:49027 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727404AbfAGSpS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 7 Jan 2019 13:45:18 -0500
Date: Mon, 7 Jan 2019 19:45:15 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] ARM: dts: omap4-droid4: Fix typo in cpcap IRQ flags
Message-ID: <20190107184515.GF933@amd>
References: <20190107175907.45268-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7cm2iqirTL37Ot+N"
Content-Disposition: inline
In-Reply-To: <20190107175907.45268-1-tony@atomide.com>
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>, devicetree@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
List-ID: <devicetree@vger.kernel.org>


--7cm2iqirTL37Ot+N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-01-07 09:59:07, Tony Lindgren wrote:
> We're now getting the following error:
>=20
> genirq: Setting trigger mode 1 for irq 230 failed
> (regmap_irq_set_type+0x0/0x15c)
> cpcap-usb-phy cpcap-usb-phy.0: could not get irq dp: -524
>=20
> This is because of a typo in the irq flags. Really these interrupts
> are LEVEL, but before we change them we need to test them. So let's
> do a minimal fix first.
>=20
> Reported-by: Pavel Machek <pavel@ucw.cz>

Thanks for doing this.
									Pavel
Tested-by: Pavel Machek <pavel@ucw.cz>

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

--7cm2iqirTL37Ot+N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwznjsACgkQMOfwapXb+vIxtACfQpm5J1Ey0Aq8MBG4NY+I0vpm
wKoAn30Pz8bS+eD5G8kSMVgLe+ZdeqEo
=y0x0
-----END PGP SIGNATURE-----

--7cm2iqirTL37Ot+N--
