From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/2] arm64: dts: h6: Add watchdog node
Date: Mon, 8 Apr 2019 10:16:35 +0200
Message-ID: <20190408081635.dlcppclakavwip6v@flea>
References: <20190404135736.8491-1-peron.clem@gmail.com>
 <20190404135736.8491-2-peron.clem@gmail.com>
 <20190405090236.e7vnyjzxmzfke3d6@flea>
 <CAGb2v65wcEAUTwRhC42iRkPaWXLGX1CJeq+TSzHVTOrT+L=8vA@mail.gmail.com>
 <20190405145005.jmmwsvbateqssbyq@flea>
 <CAGb2v66cv7dVwj7oyRaHT5Q2XCbNqzuS-Uk9hdNJbVv57QOmUg@mail.gmail.com>
 <20190405150810.zjwtu6crzaz6ufhx@flea>
 <CAJiuCccfmwxAqK1mTJ3eLO0RggV8sZTTKRy=fxFFenxn1hATvQ@mail.gmail.com>
 <CAJiuCcc5_tkmSM8sV2enG7t5=eU21ZrzcCVLUzF+c=8MiZhdFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="edi4atnhmhlgs5sc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJiuCcc5_tkmSM8sV2enG7t5=eU21ZrzcCVLUzF+c=8MiZhdFA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Samuel Holland <samuel@sholland.org>
List-Id: devicetree@vger.kernel.org


--edi4atnhmhlgs5sc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 07, 2019 at 04:27:36PM +0200, Cl=E9ment P=E9ron wrote:
> Hi,
>
> On Fri, 5 Apr 2019 at 18:24, Cl=E9ment P=E9ron <peron.clem@gmail.com> wro=
te:
> >
> > Hi,
> >
> > On Fri, 5 Apr 2019 at 17:08, Maxime Ripard <maxime.ripard@bootlin.com> =
wrote:
> > >
> > > On Fri, Apr 05, 2019 at 10:59:35PM +0800, Chen-Yu Tsai wrote:
> > > > On Fri, Apr 5, 2019 at 10:50 PM Maxime Ripard <maxime.ripard@bootli=
n.com> wrote:
> > > > >
> > > > > On Fri, Apr 05, 2019 at 10:35:08PM +0800, Chen-Yu Tsai wrote:
> > > > > > On Fri, Apr 5, 2019 at 5:02 PM Maxime Ripard <maxime.ripard@boo=
tlin.com> wrote:
> > > > > > >
> > > > > > > On Thu, Apr 04, 2019 at 03:57:36PM +0200, Cl=E9ment P=E9ron w=
rote:
> > > > > > > > Allwinner H6 has a watchog compatible with A31.
> > > > > > > >
> > > > > > > > Declare it in the device tree.
> > > > > > > >
> > > > > > > > Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> > > > > > >
> > > > > > > Applied both, thanks!
> > > > > > > Maxime
> > > > > >
> > > > > > IIRC there are 3 watchdogs on the H6. One is the trusted watchd=
og,
> > > > > > which should be reserved for underlying firmware.
> > > > > >
> > > > > > The other two are the normal and R-block watchdog. Although they
> > > > > > look the same, the "normal" one can't reset the system. :(
> > > > > > That one is actually the one ATF currently uses. So reboot does=
n't
> > > > > > work on the H6.
> >
> > Some users report that the reboot on the PineH64 actually works.
> >
> > Clement
> >
> > > > >
> > > > > So that patch will not do anything then?
>
> Did some test and only interrupts are working right now. If the WDOG
> is configured to make the board reboot the system will be stuck :S
> Maybe better to disabled it for now and leave a comment.

I dropped the two patches

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--edi4atnhmhlgs5sc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKsDYwAKCRDj7w1vZxhR
xWp5AQDPPs8u0wNZkJigQ+lPhxDH918JqpCrMxBvWG6ts1pmYwD8D16hBPr1+iyd
OeB2s+TEuu/V+1JNW9S552JpkoKWTAs=
=t3fp
-----END PGP SIGNATURE-----

--edi4atnhmhlgs5sc--
