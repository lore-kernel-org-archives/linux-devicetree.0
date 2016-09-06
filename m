From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 4/7] dts: sun8i-h3: add UART1-3 to Orange Pi Plus
Date: Tue, 6 Sep 2016 22:01:08 +0200
Message-ID: <20160906200108.GK9040@lukather>
References: <1472671858-29220-1-git-send-email-jorik@kippendief.biz>
 <1472671858-29220-5-git-send-email-jorik@kippendief.biz>
 <20160902070425.GB6313@lukather>
 <20160903120932.GA6289@carbon.kippendief.biz>
 <20160905193111.GC4728@lukather>
 <CAGb2v67dnnxOp_yPyC8icu-m0WZ-Rs1STs1tnxJMOLfcRfRzUg@mail.gmail.com>
 <20160906085202.GA4854@carbon.kippendief.biz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="T4Djgzn3z2HSNnx0"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160906085202.GA4854@carbon.kippendief.biz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorik Jonker <jorik@kippendief.biz>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--T4Djgzn3z2HSNnx0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2016 at 10:52:02AM +0200, Jorik Jonker wrote:
> On Tue, Sep 06, 2016 at 11:04:38AM +0800, Chen-Yu Tsai wrote:
> >In short, I'm ok with it. But please put an explicit
> >
> >   status =3D "disabled";
> >
> >and probably a comment about how/where the peripheral can be
> >used in the board dts.
>=20
> Allright, I will do that in v3.
>=20
> >I intended to do this for the Banana Pis. Though my original plan
> >was to enable Raspberry Pi compatible peripherals by default, and
> >list the other peripherals that are defined by the vendor as
> >"disabled".
> >
> >"Defined by the vendor" means that the vendor has some sort of
> >document associating the gpio header pins with the peripherals,
> >as shown in:
> >
> >   http://www.orangepi.org/Docs/Pindefinition.html#CON3_Definition
> >
> >This should make it easier for the average user to enable the
> >peripherals. I'm not sure we should list _all_ possible ones
> >though. That would make the list very large, and some might
> >end up never being used.
>=20
> This is exactly what I was thinking, albeit I wanted to go a bit 'bigger':
> move all unambiguous pinmux/peripheral associations from the H3 DTS files=
 to
> the DTSI, complete them with known associations for which there are drive=
rs,
> and have all of these disabled. Reduce the existing blocks in the DTS fil=
es
> to just "status =3D okay".
>=20
> Peripherals requiring board-specific things (like emac, USB, voltage
> regulators, displays) stay put in the DTS.
>=20
> It will explodes the scope of my proposed change a bit, but if you are OK
> with this, I will gladly do it.
>=20
> Maxime, Chen-Yu: what do you think of this?

I'm not exactly sure what you have in mind. Please send a patch, and
we'll see then :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--T4Djgzn3z2HSNnx0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXzyCEAAoJEBx+YmzsjxAgJ+MP/iF/Y+B5bzHsCaT0YGdDRMc1
ssB8yC8kM7h5KMLPFEQJOHcZnWiFD824UPUvy1WZAL9uXtpekYbFsWP8ahbpNr15
TxyA0LOo4L5LIWezCS7k8gzN+UrSHzExHaOCGC581F0c+nPn0N+eiU62rCFPhkdv
KNf7nPALGACwZvsFFtWkf8nmTe+JMzwKiEoco8OTPvtr54HKmbmd7TvQcB3faVxq
HVP70c0+ZJ53u96urXrWyILUcVJdpBPuQwTjow5mkQaPA0EyIkxC9w1a/k9LTTcW
WSeq1SSmQawZCejneTrnaTIrBuRE623rcXyOEGxDJUBO0wp7+lbeBYID+MHs6LVX
m3+G2L66TpM2Ig2Gy9PzVv4qyCPmp62YDXvViafX4lMDnea3y4w2zfAP7lO9cypd
v2lv0/0ItpyHyuAk17JdNb8b3T/rT9Syq4QCfAcWJVPpTCi3CoJD4ILnar28fs08
7D0C4Ke/zzhmaEEGQzrBdT0KnA61gW57gXnIevFjWAsmFZzmBjAs91KGgta3PjEV
fWLUEoiSGfLjcz/CGBIpxLB4z7KrD8TQoSiSaOro8PPMKYrgq68slQkJ2t/UImOm
fZcp0yEJgVTk93Re675Gu2NSYr/QqABSSVhWKXYD7VDygx1jbw2ApfS3nNCmFEwF
xE8HWvt2N8cdfO80sf/Y
=2ZFi
-----END PGP SIGNATURE-----

--T4Djgzn3z2HSNnx0--
