From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Add lradc node
Date: Mon, 3 Jun 2019 09:42:47 +0200
Message-ID: <20190603074247.hlayod2pxq55f6ci@flea>
References: <20190518170929.24789-1-luca@z3ntu.xyz>
 <4343071.IDWclfcoxo@g550jk>
 <20190524092001.ztf3kntaj4uiswnv@flea>
 <6901794.oDhxEVzEqc@g550jk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pck2udhpnuo5jdg4"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6901794.oDhxEVzEqc@g550jk>
Sender: linux-kernel-owner@vger.kernel.org
To: Luca Weiss <luca@z3ntu.xyz>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--pck2udhpnuo5jdg4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, May 31, 2019 at 12:27:55PM +0200, Luca Weiss wrote:
> On Freitag, 24. Mai 2019 11:20:01 CEST Maxime Ripard wrote:
> >
> > It would be great to drop the -keys from the compatible, and to
> > document the bindings
> >
> > Looks good otherwise
> >
> > Maxime
>
> So I should just document the "allwinner,sun50i-a64-lradc" string in
> Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt ? Don't I also
> have to add the compatible to the driver code then? Just adding the a64
> compatible to a dts wouldn't work without that.

What I meant was that you needed both, something like:

compatible = "allwinner,sun50i-a64-lradc", "allwinner,sun8i-a83t-lradc";

That way, the OS will try to match a driver for the A64 compatible if
any, and fallback to the A83's otherwise. And since we don't have any
quirk at the moment, there's no change needed to the driver.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--pck2udhpnuo5jdg4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPTPdwAKCRDj7w1vZxhR
xdBQAQCizjZAoJNebpV+1K7cJAfYCjktS+jc7qUnLh5ZXhZI3AEA46RCz7UuQmCi
CFyLUjFOAPabqusD+2Y5LmXDs76vYg4=
=CmYf
-----END PGP SIGNATURE-----

--pck2udhpnuo5jdg4--
