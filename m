Return-Path: <SRS0=cIVi=VA=bootlin.com=maxime.ripard@kernel.org>
Date: Wed, 3 Jul 2019 21:57:50 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 3/7] dt-bindings: net: mdio: Add child nodes
Message-ID: <20190703195750.vupb3r5xoujjw6pe@flea>
References: <20190703095513.12340-1-maxime.ripard@bootlin.com>
 <20190703095513.12340-3-maxime.ripard@bootlin.com>
 <CAL_JsqKgBXxbg_9ZKfmj6y0s_5Z5QZw3RmdJfSHEpjh84m9brg@mail.gmail.com>
 <20190703141300.duhk2qj3m5qpkp3h@flea>
 <CAL_JsqLr32VK=HSeY52NCkZj-gBfLhTWu5eheXWk--fL16zBYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="25ib7336ijmsjdbi"
Content-Disposition: inline
In-Reply-To: <CAL_JsqLr32VK=HSeY52NCkZj-gBfLhTWu5eheXWk--fL16zBYg@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--25ib7336ijmsjdbi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

On Wed, Jul 03, 2019 at 08:20:32AM -0600, Rob Herring wrote:
> On Wed, Jul 3, 2019 at 8:13 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > On Wed, Jul 03, 2019 at 07:53:43AM -0600, Rob Herring wrote:
> > > On Wed, Jul 3, 2019 at 3:55 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > >
> > > > The child nodes of a mdio bus are supposed to be ethernet PHYs, with a reg
> > > > property. Make sure that's validated as well.
> > >
> > > I don't think this is always true. I seem to recall there's some
> > > timestamping devices connected via mdio.
> > >
> > > In any case, it's not a long list of names, so we can probably just
> > > enumerate them as needed. Does this generate any warnings?
> >
> > I did a run on both arm and arm64 Allwinner DTS, and it doesn't.
> >
> > I can do one on multi_v7 / arm64's defconfig, but that's probably
> > going to be a bit hard to tell from the noise of warnings.
>
> I do allmodconfig because that will build all dtbs. You can run checks
> with a single schema like this:
>
> make dtbs_check DT_SCHEMA_FILES=a-single-schema.yaml

Right, of course :)

I just did it, and apart from a few arm32 broadcom boards that don't
have the right address-cells / size-cells (probably false positive due
to the fact they use mdio@something as node name), there's no other
warnings.

I'm not sure what you were on about though. If there's another node
than an ethernet phy, we won' have any warning since we don't have
additionalProperties to false.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--25ib7336ijmsjdbi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXR0IvgAKCRDj7w1vZxhR
xVMUAQCQCy0qGWX1fT3+VMSxXrsFCgBl0tUKQd7LZgRe/RuZgwEAkgTei2NisG9X
kGdN9aKhFE9NrPSPW3cnLh36AdQXUgQ=
=H5Ni
-----END PGP SIGNATURE-----

--25ib7336ijmsjdbi--
