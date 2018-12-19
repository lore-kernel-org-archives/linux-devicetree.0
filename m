From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 0/6] media/sun6i: Allwinner A64 CSI support
Date: Wed, 19 Dec 2018 11:24:50 +0100
Message-ID: <20181219102450.picswsg3yevba23j@flea>
References: <20181218113320.4856-1-jagan@amarulasolutions.com>
 <20181218152122.4zj6wgbukhrl6ly6@flea>
 <CAMty3ZA4xXVLKx-yj+2_iJ700+yTLesjEAgS8Wu2i8otPScpaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gprmpvsw3todifnc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMty3ZA4xXVLKx-yj+2_iJ700+yTLesjEAgS8Wu2i8otPScpaw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-media <linux-media@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-amarula@amarulasolutions.com, Michael Trimarchi <michael@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org


--gprmpvsw3todifnc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 18, 2018 at 08:58:22PM +0530, Jagan Teki wrote:
> On Tue, Dec 18, 2018 at 8:51 PM Maxime Ripard <maxime.ripard@bootlin.com>=
 wrote:
> >
> > On Tue, Dec 18, 2018 at 05:03:14PM +0530, Jagan Teki wrote:
> > > This series support CSI on Allwinner A64.
> > >
> > > Tested 640x480, 320x240, 720p, 1080p resolutions UYVY8_2X8 format.
> > >
> > > Changes for v4:
> > > - update the compatible string order
> > > - add proper commit message
> > > - included BPI-M64 patch
> > > - skipped amarula-a64 patch
> > > Changes for v3:
> > > - update dt-bindings for A64
> > > - set mod clock via csi driver
> > > - remove assign clocks from dtsi
> > > - remove i2c-gpio opendrian
> > > - fix avdd and dovdd supplies
> > > - remove vcc-csi pin group supply
> > >
> > > Note: This series created on top of H3 changes [1]
> > >
> > > [1] https://patchwork.kernel.org/cover/10705905/
> >
> > You had memory corruption before, how was this fixed?
>=20
> Memory corruption observed with default 600MHz on 1080p. It worked
> fine on BPI-M64 (with 300MHz)

I don't get it. In the previous version of those patches, you were
mentionning you were still having this issue, even though you had the
clock running at 300MHz, and then you tried to convince us to merge
the patches nonetheless.

Why would you say that then if that issue was fixed?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--gprmpvsw3todifnc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXBoccgAKCRDj7w1vZxhR
xYbqAQCxVTXkyDdcJa6zDRqgmBiXZ3Jc9evGSylu/TcV1AimPQEA1z9bxZBj1MFo
yYU1xgy8xsWMXjylYcsY0PzFdEE33ww=
=wmSB
-----END PGP SIGNATURE-----

--gprmpvsw3todifnc--
