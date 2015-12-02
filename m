From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: Add brcm,bcm63xx-regulator device tree
 binding
Date: Wed, 2 Dec 2015 12:53:25 +0000
Message-ID: <20151202125325.GI1929@sirena.org.uk>
References: <565A18DD.60108@simon.arlott.org.uk>
 <20151130121043.GX1929@sirena.org.uk>
 <565CB1CF.5040306@simon.arlott.org.uk>
 <20151201221615.GY1929@sirena.org.uk>
 <b7ecdc8ebcdf9582620c22b0e8a4a96d24ba67c1@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ow93IgaIpYwdfTq+"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b7ecdc8ebcdf9582620c22b0e8a4a96d24ba67c1@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org


--Ow93IgaIpYwdfTq+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 02, 2015 at 12:45:50PM -0000, Simon Arlott wrote:
> On Tue, December 1, 2015 22:16, Mark Brown wrote:

> > Why are these in the DT, I would expect that if this is a driver for a
> > specific SoC all these properties would be known as a result of that.

> This is a driver for multiple SoCs with the same regulator control in
> different places on different SoCs, so the location of it within the misc
> register needs to be provided in the DT:

> BCM6362:
>   #define MISC_BASE 0xb0001800 /* Miscellaneous Registers */
>   uint32 miscIddqCtrl; /* 0x48 */

This is the sort of thing you can pick up from the SoC compatible
strings.  As things stand there is zero content in this driver that
relates to this SoC.

> The mask is used as there's one bit per regulator in the register, but
> there's more than one way to express this in the DT:

I wouldn't expect to see it in the device tree at all for a device
specific driver.

--Ow93IgaIpYwdfTq+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWXunEAAoJECTWi3JdVIfQPIEH/iQfbWhDgPdUMEn+1OMOTvMq
o1oP8zrqdMlzSKHk/18uaKNjL1eS25rfLzROy6EcQPzpU2do2346oZm+87cEOOZI
OOvBOrdxjKuUpG1sCB1LpizkbTevSoC6UsbSq+axrkYeaK5Wyl+E90vD33cIL+Uz
a745hUogv/PL+rtKx3ic+Svenrwvr87QwC2wDcVYBFJU1elLGACnns1KBWEnjHkD
Ek2IEFrscG0ymsMHXQRvzoEBCy6kjdRYT4FyHFb5M5BHU6+odXC5cXnJGi+CIjI9
yFL6ltmASgAfr7OSwPOWKeiDuc+IzQ+3WbGoEytV7Ei4ELC/drpAFdg5pojlLZo=
=McOr
-----END PGP SIGNATURE-----

--Ow93IgaIpYwdfTq+--
