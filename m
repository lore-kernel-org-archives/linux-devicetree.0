From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: Add support for interrupt debouncing
Date: Tue, 8 Nov 2016 20:23:34 +0100
Message-ID: <20161108192334.4kxdpegimpppwiwh@lukather>
References: <cover.ed6c19bdf01ae70096f3d96af4805f59ef16f94a.1476868462.git-series.maxime.ripard@free-electrons.com>
 <fa022cca9917917ace4af7d5e852c9348ec5b553.1476868462.git-series.maxime.ripard@free-electrons.com>
 <CACRpkdaoEH7OixJDkjuZ0qqYVURLvXwn8b41-OvqjZGJ=neh+Q@mail.gmail.com>
 <20161020135625.vro5cxkf3rxevwyn@lukather>
 <20161102195106.eazrl5oevykltvzd@lukather>
 <CACRpkdZ40e03VV_ScKceahG-7jmFmbBmgCqxBv9bGcvS3TnrOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gbh2nohh6v7unzo2"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZ40e03VV_ScKceahG-7jmFmbBmgCqxBv9bGcvS3TnrOA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org


--gbh2nohh6v7unzo2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 10:40:04AM +0100, Linus Walleij wrote:
> On Wed, Nov 2, 2016 at 8:51 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Thu, Oct 20, 2016 at 03:56:25PM +0200, Maxime Ripard wrote:
> >> On Thu, Oct 20, 2016 at 03:04:46PM +0200, Linus Walleij wrote:
> >> > On Wed, Oct 19, 2016 at 11:15 AM, Maxime Ripard
> >> > <maxime.ripard@free-electrons.com> wrote:
> >> >
> >> > > The pin controller found in the Allwinner SoCs has support for int=
errupts
> >> > > debouncing.
> >> > >
> >> > > However, this is not done per-pin, preventing us from using the ge=
neric
> >> > > pinconf binding for that,
> >> >
> >> > How typical.
> >> >
> >> > > but per irq bank, which, depending on the SoC,
> >> > > ranges from one to five.
> >> > >
> >> > > Introduce a device-wide property to deal with this using a nanosec=
ond
> >> > > resolution.
> >> > >
> >> > > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> >> > (...)
> >> > > +Note: For backward compatibility reasons, the hosc and losc clock=
s are
> >> > > +only required if you need to use the optional
> >> > > +allwinner,debounce-time-ns property. Any new device tree should s=
et them.
> >> > > +
> >> > > +Optional properties:
> >> > > +  - allwinner,debounce-time-ns: Array of debouncing periods in
> >> > > +    nanoseconds. One period per irq bank found in the controller
> >> >
> >> > Do you really *need* to specify this with nanosecond resolution?
> >> >
> >> > Else I would suggest to use microsecond resolution and just use
> >> > the generic binding (input-debounce) but on the device node instead
> >> > of the specific handler.
> >>
> >> Theorically, the debouncing clock can be set at 24MHz, which means a
> >> 42ns resolution.
> >>
> >> I've seen that the other bindings usually use microseconds, but in our
> >> case, we can really go lower than that.
> >>
> >> I don't really know if it makes sense though.
> >
> > Any comments on this?
>=20
> My first thought: can you atleast support both?
>=20
> My preference would be to add the standard binding and use that,
> and the day you realize that "howli mackarowli, this thingofabob
> actually needs to specify with nanosecond precision" then we
> could add the nanosecond granularity binding?

That works for me. I'll resend the patch.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--gbh2nohh6v7unzo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYIiYtAAoJEBx+YmzsjxAgOFEP/ReIZMU03xOYhLor9fXT5Jlb
FHDRzi7IsIDXCa5C4gKlyfOQMGVr9kF4yfqAdGrkrtbSEcDjwNi8REbvRGWAtS45
YrAOzMJ760gqlq2mNnZ810hORHKCLZUFI91ASZlJ8vOTr7x+kexixNGxFCwc8A+i
UGShEDULzVkbysubsG2ypC4cckTHMYyDTXzGvKrYIyT6Qvr2OTZCnWWWFDK1Gdt9
EGUGl/gqaf9EEEzTJW6gENynEMb4bgoPm+JWUCuJAs7WPYa3E/DMPXiqTE6J6DlS
bOu9bcp/RcoTfPkpbCaliimL+ptdoPy1/mxyIC4aK1CtHkuYB6pp+vYtA2U4mJ5w
WpxknHQgaa28cCxQCSzHL6Gcrlzz7S++Tod4AJyxFsR54/BpzdUX1i2aUuHzNDMo
dWnjd1KO5gZJ/9+ZRroQUZSw5Y82/wreYGj/8bIGsKl/rYouX9zleblNJuQ/kpqW
/KlVsAB+6aB+mp8I4nNVgMdJTHO8z3ADheKcWD9GzKquLGZ1x4FQVyzzVZS2abi4
VH1sz4clhNkAmMs+a60QiH3rHwwq4l+GFn1J4ujfNJt/LlOWC3+YXTnKUfkqn5bb
q5TBFGaj0SqjTPO/3pqXwsPvi2oafzsaZINxmYVXMdLfSijuND8pNZJGbJmdJVyJ
EH5B5noqIF57FmOuCMJK
=O/Vh
-----END PGP SIGNATURE-----

--gbh2nohh6v7unzo2--
