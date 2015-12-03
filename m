From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: Add brcm,bcm63xx-regulator device tree
 binding
Date: Thu, 3 Dec 2015 00:06:31 +0000
Message-ID: <20151203000631.GM1929@sirena.org.uk>
References: <565A18DD.60108@simon.arlott.org.uk>
 <20151130121043.GX1929@sirena.org.uk>
 <565CB1CF.5040306@simon.arlott.org.uk>
 <20151201221615.GY1929@sirena.org.uk>
 <b7ecdc8ebcdf9582620c22b0e8a4a96d24ba67c1@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <20151202125325.GI1929@sirena.org.uk>
 <565F53FC.5080309@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iZbCgRUW+AWDD03y"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <565F53FC.5080309@simon.arlott.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org


--iZbCgRUW+AWDD03y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2015 at 08:26:36PM +0000, Simon Arlott wrote:
> On 02/12/15 12:53, Mark Brown wrote:

> > This is the sort of thing you can pick up from the SoC compatible
> > strings.  As things stand there is zero content in this driver that
> > relates to this SoC.

> There's always going to be very little content in the driver that
> relates to this SoC, given that a single bit flip enables/disables
> power.

> All other device tree drivers allow a register address to be specified
> for the device, how is an offset in the regmap any different?

It's not that it's an offset in regmap, it's that you're trying to make
a device driver with literally *no* content that is specific to the
actual device.  If you're making a driver for a specific device like
this it should know at least something about how to control the device
=66rom the compatible string.  If you're making a generic driver it should
not make reference to specific devices.

In general I would prefer to have a driver with a SoC specific
compatible string and the data tables in the kernel, that way we keep
the device trees stable and our ABI more robust.

> >> The mask is used as there's one bit per regulator in the register, but
> >> there's more than one way to express this in the DT:

> > I wouldn't expect to see it in the device tree at all for a device
> > specific driver.

> If there isn't an individual entry in DT for each regulator, how is it
> supposed to work? There's no #regulator-cells property.

There could be one if it would help, but we do normally manage to do
this without - look at how other regulator drivers work.

--iZbCgRUW+AWDD03y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWX4eGAAoJECTWi3JdVIfQpCAH/0J/ovtd52QiQgJeDjqsPc9B
VmWe2aEoe3WNseajWbIgqZJvbN6CH/xuDHkroz+mBIslJQTBbFqYogF4xrBS54i2
KhnTVJuw5dAXwxrCsGqHtEIbSb0x1L7pI9+PJnUiFWf3YcefMAKXoBBjaK/2le1t
toQoQvYkn5SiR6wKxLW4ZGD7lFdDy3tUwAEENH5oIGvH8EG+j86Nlz5gpaK23TjW
PuZJmdhKbH9wVDqeQn7BxgD4Uptfc1yzPAhkHcU+3HTWv1aoz2dsX+xNQBzOKgS6
tNaA+ck8H1Pkxw7idu1iAsY52XOtVweOrgH4K3FJYRZMkZIVz+Sb2iATyvIlnQU=
=emdl
-----END PGP SIGNATURE-----

--iZbCgRUW+AWDD03y--
