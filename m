Return-Path: <SRS0=m5NJ=QZ=sirena.org.uk=broonie@kernel.org>
Date: Mon, 18 Feb 2019 17:56:35 +0000
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
Message-ID: <20190218175635.GD10794@sirena.org.uk>
References: <20190216174859.15738-1-marek.vasut@gmail.com>
 <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at>
 <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com>
 <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yudcn1FV7Hsu/q59"
Content-Disposition: inline
In-Reply-To: <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at>
To: Harald Geyer <harald@ccbib.org>
Cc: Marek Vasut <marek.vasut@gmail.com>, devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--yudcn1FV7Hsu/q59
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 17, 2019 at 03:26:39PM +0100, Harald Geyer wrote:

> If continuous operation of the regulator is important, I'd expect
> we don't touch whatever the firmware setup instead of by default
> setting all gpios to low.

> However as we can't change this now, there isn't much point in
> discussin this further.

The issue here is that the GPIO API does not allow us to read back the
state of output GPIOs (even though for almost all hardware this is
supported by the underlying hardware).  With the GPIO API as it stands
it is unfortunately not possible to preserve the state, if the API were
fixed we'd preserve state.

--yudcn1FV7Hsu/q59
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxq8dIACgkQJNaLcl1U
h9CpIAf/f8pzBd5oBLBsZakxXoEaleo81gFzm3v6aj8OBLlWpnEQEswOYCPCvWiw
vI3h82co77N2kqqEpBnWANBlw05sNUClhY8DzgkqQSgaIzeT2i8yEZhtIgYfKgwK
4RJgisnINyQJvoL0AQ2++23DeXRC5kpiFE1uMATqfxDH3F96XlCtdaKsYHd4t8Fk
L2Vf6ollMiMZIlVk7kmjuIfUkrsjn53y8P79sZEDVy0zsMkxP5ZZhf7ZNLl5TeMo
1KT5yQ2WbKrePrjbWsmouc2jVGyr4sFdbpoYiqDKVYCQGAbJNj5dRLaPaMUzYMHx
0wnhYd//FJFWexN2qWPXCNKn4I3c4g==
=QLbi
-----END PGP SIGNATURE-----

--yudcn1FV7Hsu/q59--
