From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 13/20] drm/bridge: Add RGB to VGA bridge support
Date: Thu, 26 May 2016 11:38:12 +0200
Message-ID: <20160526093812.GN9232@lukather>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-14-git-send-email-maxime.ripard@free-electrons.com>
 <CAL_JsqKMJ7X2MU7vF9n7_MmAUQJ2v+yKyazcmMurgbTxYGfw_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b1ERR0FXR0PvNIRE"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKMJ7X2MU7vF9n7_MmAUQJ2v+yKyazcmMurgbTxYGfw_Q@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Boris Brezillon <boris.brezillon@free-electrons.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--b1ERR0FXR0PvNIRE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Mon, May 16, 2016 at 09:07:18AM -0500, Rob Herring wrote:
> On Mon, May 16, 2016 at 7:47 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Some boards have an entirely passive RGB to VGA bridge, based on either
> > DACs or resistor ladders.
> >
> > Those might or might not have an i2c bus routed to the VGA connector in
> > order to access the screen EDIDs.
> >
> > Add a bridge that doesn't do anything but expose the modes available on=
 the
> > screen, either based on the EDIDs if available, or based on the XGA
> > standards.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  .../bindings/display/bridge/dumb-vga.txt           |  40 +++++
> >  drivers/gpu/drm/bridge/Kconfig                     |   6 +
> >  drivers/gpu/drm/bridge/Makefile                    |   1 +
> >  drivers/gpu/drm/bridge/dumb-vga.c                  | 186 +++++++++++++=
++++++++
> >  4 files changed, 233 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/du=
mb-vga.txt
> >  create mode 100644 drivers/gpu/drm/bridge/dumb-vga.c
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/dumb-vga.=
txt b/Documentation/devicetree/bindings/display/bridge/dumb-vga.txt
> > new file mode 100644
> > index 000000000000..757f04de97f3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/dumb-vga.txt
> > @@ -0,0 +1,40 @@
> > +Passive RGB to VGA bridge
> > +-------------------------
> > +
> > +This binding is aimed for entirely passive RGB to VGA bridges that do =
not
> > +require any configuration.
>=20
> No reset or enable lines or regulators?

On the three designs I've seen:
  - One doesn't need any of these
  - One has a GPIO enable pin but with it's resistor not populated
  - One has a regulator controlled by a GPIO

So I guess in most cases, we don't need anything, but we still might
to cover all cases.

> > +
> > +Required properties:
> > +
> > +- compatible: Should be "dumb-vga-bridge"
> > +
> > +Optional properties:
> > +
> > +- ddc-i2c-bus: phandle to the i2c bus used to communicate with the mon=
itor
>=20
> The i2c bus is a property of the connector, not the bridge chip, so it
> belongs in a VGA connector node (which we already have binding for).
>=20
> I think for the really "dumb" (or transparent case), you should only
> have a connector. For anything more complex, then you should have both
> a DAC and connector node.

So, in essence, something like:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/a=
rm/boot/dts/r8a7794-alt.dts#n37
=20
> On the driver side, I think we could handle multiple connectors with a
> single driver. Ideally, that would work with any DRM driver that has a
> connector node.

I'm not sure what you mean by that. I really think it should be a
separate driver in order to share the common code that so far the
current implementations put in some driver specific code (even though
it might be completely generic).

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--b1ERR0FXR0PvNIRE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRsQDAAoJEBx+YmzsjxAgkQAQAMMiUvyTRegGjb8uDeCtNdp/
6iArK2He6Kk6VKhw0kNb1V0mJVZnry/Ve4lcXhzzrADeWhXy+W9YgxUsRCzH0SR1
fkMue0IjXI7I2UwR0zGnNHl0mxFf1zsHCXtDidMaXpu/BI5oFePwpzxOct/913iG
a1ZL0DgAJorTrPhg2fqjwcbrQm7dXtaZDerw0v+pmnixmCTryo24W8LY8tbZFAEj
lhAftFisZxHV4o6tEKIPmjkE9NS+BHUXYNU2Otpq9jySPODT2m9bWRIUGUSddJop
1UN79/8ygNw1wP+jE+qzeUcgTwJlgT4hSu3hD4Mb4zPD31bPiO2WA7xZtj2RtC1r
UZu1cpLIFAHhMtO5GdVOMcR8gs+P/044kIQa1/4/Z1qltt95IwpLZ88jdqi0dsnJ
PoIkO1HN8ktnWr0CW4gltdYJO4h+SkTTDglDQPj+EVnvRM2nUS12MMx9xx5m86d1
u4XXigk78n1d5Geu1MBFBsR1qcD6kr9DHTKTQ1mxigb0pomufJXqWLJWcjE8c/sq
8ph/CTK1jvvEa383u0XDUrIrZbgXAwn9VsckKlFnSp5Fq9D4ZCsy/hVVOFUuTSmk
dWCH/gO/g0LJgN9a8GeNnubnLKBmRTi3cBon/ZIFgKJ06GM2JlNdyDxJIXNy5jhQ
FG7hZLnO6+hf5LioTalJ
=PIIh
-----END PGP SIGNATURE-----

--b1ERR0FXR0PvNIRE--
