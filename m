From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: sunxi: Switch MMC nodes away from
 cd-inverted property
Date: Thu, 4 Jan 2018 16:03:52 +0100
Message-ID: <20180104150352.rsvtvviafxyuq2jp@flea.lan>
References: <20171222205738.2389-1-tuomas@tuxera.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="irjwcppc2xki6jjh"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171222205738.2389-1-tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--irjwcppc2xki6jjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2017 at 10:57:37PM +0200, Tuomas Tynkkynen wrote:
> Using the cd-inverted property is not useful when GPIOs are used as card
> detects since the polarity can be specified with the usual
> GPIO_ACTIVE_(HIGH|LOW) GPIO flags. It has also caused confusion for
> U-Boot developers, so migrate all sunxi boards away from cd-inverted.
>=20
> Signed-off-by: Tuomas Tynkkynen <tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--irjwcppc2xki6jjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpOQlcACgkQ0rTAlCFN
r3R4nw//WvxDMpPxdlVLga/EI9bvPZNYx5mlri2sDsp/SEstDw2zJJ4wDOl2yHhP
Z1Ef2hVMRlqUWyPhpKk/auO++bYxeZLEx1l4jjC2LFRP1dssT0SFTotYHAYQlCpQ
5sw7UrmpYo5aEJkcIdBe8V+0XOHpLu7Dj0+24qitvsAqhND8iig07uy5OSqa8J5U
tyu5gEFyyX4380/1l97ycU3JAGXJJ9fLByx1EBMOPMZl78n1yqzwHJW7narQPVJ0
vdyp0EEpJh2U2Bld5bIqW2G/c+SzaUXhEenlSzCTL+XOofnrr795cdxkyZtK75Kb
iSOl7vL+2vEt3U96jX3lIAB2XqoiPe6mrU7mUFl0PWl8vCcEQVwKPmwAHIBo+FU+
zX/lbwuIRSULSeloXNyo68C+jHE4wXFDsplo1jg5wWiikXBDiglpe0gzyE/neO91
fN09tqOOm1Imhp5IrH77hJHBZKA52SES1QPNvrGRdXhEvoQjBUfd8IqfcqImtseV
y+LUcqaEoUoluNzpxL7SOZLbFDrxtcFu+KIxppEU/D6Cp9LCulPrkQT1t4VkPDXr
H2IRrGNgkrG6+4E02oQloxSvKKjE+GISt0jp4wT0RsRd99KUAJHwEymELeRZ1Nxq
ajK4czNl61RcBZ2W5GF1jckc6zau3iIQiYv7FJtjEYvTcuK6+7k=
=pfwX
-----END PGP SIGNATURE-----

--irjwcppc2xki6jjh--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
