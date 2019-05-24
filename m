From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v5 0/4] Allwinner H6 watchdog support
Date: Fri, 24 May 2019 15:07:42 +0200
Message-ID: <20190524130742.blyckr74erre3ekk@flea>
References: <20190523151050.27302-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kp5yz4xxxfd2wshh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190523151050.27302-1-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--kp5yz4xxxfd2wshh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2019 at 05:10:46PM +0200, Cl=E9ment P=E9ron wrote:
> Hi,
>
> Allwinner H6 SoC has two watchdogs.
>
> As we are not sure that both A64 and H6 are stricly identical, I have
> introduced the H6 bindings.
>
> After investigation it seems that on some boards the first watchdog doesn=
't
> make it properly reboot. Please see details in the commit log.
>
> I think it's proper to add it with a comment anyway.
>
> The r_watchdog is still available and usable on all the H6 boards.

Applied all 4, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--kp5yz4xxxfd2wshh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOfsngAKCRDj7w1vZxhR
xZhmAP9dNnhILxNK6etNTB+zKw2FWxx3f+hVuDnWL6dnrZudwwD8DkKLz0P5oKZC
vjDzU3AcRPlmS3ZNQi7CpQqMK2tE8wg=
=FvXk
-----END PGP SIGNATURE-----

--kp5yz4xxxfd2wshh--
