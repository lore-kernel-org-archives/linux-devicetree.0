From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/2] arm64: dts: h6: Add watchdog node
Date: Fri, 5 Apr 2019 17:08:10 +0200
Message-ID: <20190405150810.zjwtu6crzaz6ufhx@flea>
References: <20190404135736.8491-1-peron.clem@gmail.com>
 <20190404135736.8491-2-peron.clem@gmail.com>
 <20190405090236.e7vnyjzxmzfke3d6@flea>
 <CAGb2v65wcEAUTwRhC42iRkPaWXLGX1CJeq+TSzHVTOrT+L=8vA@mail.gmail.com>
 <20190405145005.jmmwsvbateqssbyq@flea>
 <CAGb2v66cv7dVwj7oyRaHT5Q2XCbNqzuS-Uk9hdNJbVv57QOmUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="acvugxf46aqmch7g"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66cv7dVwj7oyRaHT5Q2XCbNqzuS-Uk9hdNJbVv57QOmUg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Samuel Holland <samuel@sholland.org>
List-Id: devicetree@vger.kernel.org


--acvugxf46aqmch7g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 05, 2019 at 10:59:35PM +0800, Chen-Yu Tsai wrote:
> On Fri, Apr 5, 2019 at 10:50 PM Maxime Ripard <maxime.ripard@bootlin.com>=
 wrote:
> >
> > On Fri, Apr 05, 2019 at 10:35:08PM +0800, Chen-Yu Tsai wrote:
> > > On Fri, Apr 5, 2019 at 5:02 PM Maxime Ripard <maxime.ripard@bootlin.c=
om> wrote:
> > > >
> > > > On Thu, Apr 04, 2019 at 03:57:36PM +0200, Cl=E9ment P=E9ron wrote:
> > > > > Allwinner H6 has a watchog compatible with A31.
> > > > >
> > > > > Declare it in the device tree.
> > > > >
> > > > > Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> > > >
> > > > Applied both, thanks!
> > > > Maxime
> > >
> > > IIRC there are 3 watchdogs on the H6. One is the trusted watchdog,
> > > which should be reserved for underlying firmware.
> > >
> > > The other two are the normal and R-block watchdog. Although they
> > > look the same, the "normal" one can't reset the system. :(
> > > That one is actually the one ATF currently uses. So reboot doesn't
> > > work on the H6.
> >
> > So that patch will not do anything then?
>
> I'm still on vacation, so I haven't checked the address of the new device.
> If it's the normal one, then yeah, it won't do anything. I've tried that.
> IIRC Samuel (or someone else) on IRC also mentioned this.

It's the one in the timer that we've used since pretty much day 1 on
older SoCs, so I guess it qualifies as the normal one :)

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--acvugxf46aqmch7g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKdvWgAKCRDj7w1vZxhR
xSteAQC9KPLiAJnkmPbI1WMuAw4jfQMmP2k2Xg5T0yI3MD6RYwEA0aEu0pn9e9hh
UaO80PdE7zbCruvBaw3TH5Fhb9dv+AI=
=jbMR
-----END PGP SIGNATURE-----

--acvugxf46aqmch7g--
