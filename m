From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 7/8] dt-bindings: arm: sunxi: add binding for Lichee
 Zero Plus core board
Date: Mon, 22 Jul 2019 21:29:34 +0200
Message-ID: <20190722192934.3jaf3r4rnyeslqyw@flea>
References: <20190713034634.44585-1-icenowy@aosc.io>
 <20190713034634.44585-8-icenowy@aosc.io>
 <20190720101318.cwrvv5r42wxx5k4r@flea>
 <BDF0C9F6-DD0D-4343-8E24-06A07055004C@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vn42k7mlndfzfvev"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BDF0C9F6-DD0D-4343-8E24-06A07055004C@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--vn42k7mlndfzfvev
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 20, 2019 at 07:39:08PM +0800, Icenowy Zheng wrote:
>
>
> =E4=BA=8E 2019=E5=B9=B47=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
6:13:18, Maxime Ripard <maxime.ripard@bootlin.com> =E5=86=99=E5=88=B0:
> >On Sat, Jul 13, 2019 at 11:46:33AM +0800, Icenowy Zheng wrote:
> >> The Lichee Zero Plus is a core board made by Sipeed, with a microUSB
> >> connector on it, TF slot or WSON8 SD chip, optional eMMC or SPI
> >Flash.
> >> It has a gold finger connector for expansion, and UART is available
> >from
> >> reserved pins w/ 2.54mm pitch. The board can use either SoChip S3 or
> >> Allwinner V3L SoCs.
> >>
> >> Add the device tree binding of the basic version of the core board --
> >> w/o eMMC or SPI Flash, w/ TF slot or WSON8 SD, and use S3 SoC.
> >>
> >> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> >> ---
> >> No changes since v3.
> >>
> >> Patch introduced in v2.
> >>
> >>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml
> >b/Documentation/devicetree/bindings/arm/sunxi.yaml
> >> index 000a00d12d6a..48c126a7a848 100644
> >> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> >> @@ -353,6 +353,11 @@ properties:
> >>            - const: licheepi,licheepi-zero
> >>            - const: allwinner,sun8i-v3s
> >>
> >> +      - description: Lichee Zero Plus (with S3, without eMMC/SPI
> >Flash)
> >> +        items:
> >> +          - const: sipeed,lichee-zero-plus
> >> +          - const: allwinner,sun8i-s3
> >
> >If the S3 is just a rebranded V3, then we should have the v3 compatile
> >in that list too.
>
> S3 is V3 with copackaged DDR3 DRAM.
>
> It's pin incompatible w/ V3.

Does it matter though?

If the only thing that changes is the package, we're not manipulating
that, and any software that deals with the v3 can deal with the
s3. Which is what the compatible is about.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--vn42k7mlndfzfvev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTYOngAKCRDj7w1vZxhR
xd77AP9kxx/qXPETcP3fumpzmXSQrjjY9A81+Czl0ZPvauA4VQEA2qZwJBFD+6ml
86ahAeLa2qt1k3eZZlcXhgNVqkXxygs=
=9EZ6
-----END PGP SIGNATURE-----

--vn42k7mlndfzfvev--
