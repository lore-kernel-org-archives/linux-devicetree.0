From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH net-next v2 15/15] arm64: dts: allwinner: a64: add SRAM
 controller device tree node
Date: Wed, 2 May 2018 13:54:37 +0200
Message-ID: <20180502115437.zlu2rafrguufutvp@flea>
References: <20180501161227.2110-1-wens@csie.org>
 <20180501161227.2110-16-wens@csie.org>
 <20180502095118.rqnfwy576xh6ercm@flea>
 <CAGb2v67pvL58Pes1ZFDZtPu_nL2+m6dgf_XOOymG9nVAkXVpEw@mail.gmail.com>
 <29E5670C-9D17-4EC1-AAAC-0CF33DD0534C@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="psuzaxnmxte5uamb"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <29E5670C-9D17-4EC1-AAAC-0CF33DD0534C@aosc.io>
Sender: netdev-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, netdev <netdev@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, Mark Brown <broonie@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--psuzaxnmxte5uamb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 02, 2018 at 06:19:51PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2018=E5=B9=B45=E6=9C=882=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=885=
:53:21, Chen-Yu Tsai <wens@csie.org> =E5=86=99=E5=88=B0:
> >On Wed, May 2, 2018 at 5:51 PM, Maxime Ripard
> ><maxime.ripard@bootlin.com> wrote:
> >> Hi,
> >>
> >> On Wed, May 02, 2018 at 12:12:27AM +0800, Chen-Yu Tsai wrote:
> >>> From: Icenowy Zheng <icenowy@aosc.io>
> >>>
> >>> Allwinner A64 has a SRAM controller, and in the device tree
> >currently
> >>> we have a syscon node to enable EMAC driver to access the EMAC clock
> >>> register. As SRAM controller driver can now export regmap for this
> >>> register, replace the syscon node to the SRAM controller device
> >node,
> >>> and let EMAC driver to acquire its EMAC clock regmap.
> >>>
> >>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> >>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >>> ---
> >>>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 23
> >+++++++++++++++----
> >>>  1 file changed, 19 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >>> index 1b2ef28c42bd..1c37659d9d41 100644
> >>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >>> @@ -168,10 +168,25 @@
> >>>               #size-cells =3D <1>;
> >>>               ranges;
> >>>
> >>> -             syscon: syscon@1c00000 {
> >>> -                     compatible =3D
> >"allwinner,sun50i-a64-system-controller",
> >>> -                             "syscon";
> >>> +             sram_controller: sram-controller@1c00000 {
> >>> +                     compatible =3D
> >"allwinner,sun50i-a64-sram-controller";
> >>
> >> I don't think there's anything preventing us from keeping the
> >> -system-controller compatible. It's what was in the DT before, and
> >> it's how it's called in the datasheet.
> >
> >I actually meant to ask you about this. The -system-controller
> >compatible matches the datasheet better. Maybe we should just
> >switch to that one?
>=20
> No, if we do the switch the system-controller compatible,
> the device will be probed on the same memory region with
> a syscon on old DTs.

The device hasn't magically changed either. Maybe we just need to add
a check to make sure we don't have the syscon compatible in the SRAM
driver probe so that the double driver issue doesn't happen?

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--psuzaxnmxte5uamb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrppvwACgkQ0rTAlCFN
r3QyzQ//S9u4EmsjmDeyVXJX1lMLvYsjPV3y2NdBHOFqBRpv5sNHoUsewYV/3P93
HvGaGNuq8HOTx4kZLolVDxC+y+NSCEOf/TNyEhHBABrQQHaScZo+YJ499fWf8rCj
26KFMksUY8QbaX6gJNdcpKLn53CnbtiZ2xj/aqbiBkNsTDBMvs5ss6z/3WqLlt6T
2MZUEDU4uWaM/cMKwi+xf2ALg1tmP3NVFGvNN4Tlw5f/Lo8Aec9MVv2jlfMTwMIH
5GvDz2nwE98KHfVqRh2ss+26jvxtFH9dmV1SJWy4IQyBp0OFNvMZrpTkCIaVkfrP
8EBuXR4MU+fJekpdxI+KsrXWOkKYoVcAPdDZmKF0Nv9SP9ny67RhC+TsXx8RWzwu
n1W2jr7raEBqsECvmOFDcUFl4Zo5ARsEpiqobuzF7EzCQO+4H5bJN5R3P7QM3Xoh
kLyXUb1afZCETZ/bc9zhnTlgjTtwPOTjBybCqPEU/jYVqchoOL13yWapRL9peWiA
1grfQwRF7PJ1BoBHrpKTjwpe2jCzSqdS98/Za6BRKa0aDWrpZKDuY4Qr1SUy4Ok3
h6isrD0tL+pGB8UrZxpa64W3XdagnhOdAS/isCieNt6t9e5dZOymiPGnMdKYs2fk
g/6zS2i1nFJ5U9pvDejL2OBBjUvcyAb/J8AspEbO1rSWjNl7eMA=
=hbOZ
-----END PGP SIGNATURE-----

--psuzaxnmxte5uamb--
