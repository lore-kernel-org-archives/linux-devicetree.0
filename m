From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH net-next v2 15/15] arm64: dts: allwinner: a64: add SRAM
 controller device tree node
Date: Mon, 14 May 2018 10:03:10 +0200
Message-ID: <20180514080310.ngev5h6cqe4taedl@flea>
References: <20180501161227.2110-1-wens@csie.org>
 <20180501161227.2110-16-wens@csie.org>
 <20180502095118.rqnfwy576xh6ercm@flea>
 <CAGb2v67pvL58Pes1ZFDZtPu_nL2+m6dgf_XOOymG9nVAkXVpEw@mail.gmail.com>
 <29E5670C-9D17-4EC1-AAAC-0CF33DD0534C@aosc.io>
 <20180502115437.zlu2rafrguufutvp@flea>
 <CAGb2v64xTNqQQSppw2NZoLn+ViQNQLytn1EukLqw+HJzf1=5ig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lywb4puwbhjfxjby"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64xTNqQQSppw2NZoLn+ViQNQLytn1EukLqw+HJzf1=5ig@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Icenowy Zheng <icenowy@aosc.io>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, netdev <netdev@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, Mark Brown <broonie@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--lywb4puwbhjfxjby
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

1;5201;0c
On Sun, May 13, 2018 at 12:37:49PM -0700, Chen-Yu Tsai wrote:
> On Wed, May 2, 2018 at 4:54 AM, Maxime Ripard <maxime.ripard@bootlin.com>=
 wrote:
> > On Wed, May 02, 2018 at 06:19:51PM +0800, Icenowy Zheng wrote:
> >>
> >>
> >> =E4=BA=8E 2018=E5=B9=B45=E6=9C=882=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=885:53:21, Chen-Yu Tsai <wens@csie.org> =E5=86=99=E5=88=B0:
> >> >On Wed, May 2, 2018 at 5:51 PM, Maxime Ripard
> >> ><maxime.ripard@bootlin.com> wrote:
> >> >> Hi,
> >> >>
> >> >> On Wed, May 02, 2018 at 12:12:27AM +0800, Chen-Yu Tsai wrote:
> >> >>> From: Icenowy Zheng <icenowy@aosc.io>
> >> >>>
> >> >>> Allwinner A64 has a SRAM controller, and in the device tree
> >> >currently
> >> >>> we have a syscon node to enable EMAC driver to access the EMAC clo=
ck
> >> >>> register. As SRAM controller driver can now export regmap for this
> >> >>> register, replace the syscon node to the SRAM controller device
> >> >node,
> >> >>> and let EMAC driver to acquire its EMAC clock regmap.
> >> >>>
> >> >>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> >> >>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >> >>> ---
> >> >>>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 23
> >> >+++++++++++++++----
> >> >>>  1 file changed, 19 insertions(+), 4 deletions(-)
> >> >>>
> >> >>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> >b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> >>> index 1b2ef28c42bd..1c37659d9d41 100644
> >> >>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> >>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> >>> @@ -168,10 +168,25 @@
> >> >>>               #size-cells =3D <1>;
> >> >>>               ranges;
> >> >>>
> >> >>> -             syscon: syscon@1c00000 {
> >> >>> -                     compatible =3D
> >> >"allwinner,sun50i-a64-system-controller",
> >> >>> -                             "syscon";
> >> >>> +             sram_controller: sram-controller@1c00000 {
> >> >>> +                     compatible =3D
> >> >"allwinner,sun50i-a64-sram-controller";
> >> >>
> >> >> I don't think there's anything preventing us from keeping the
> >> >> -system-controller compatible. It's what was in the DT before, and
> >> >> it's how it's called in the datasheet.
> >> >
> >> >I actually meant to ask you about this. The -system-controller
> >> >compatible matches the datasheet better. Maybe we should just
> >> >switch to that one?
> >>
> >> No, if we do the switch the system-controller compatible,
> >> the device will be probed on the same memory region with
> >> a syscon on old DTs.
> >
> > The device hasn't magically changed either. Maybe we just need to add
> > a check to make sure we don't have the syscon compatible in the SRAM
> > driver probe so that the double driver issue doesn't happen?
>=20
> The syscon interface (which is not even a full blown device driver)
> only looks at the "syscon" compatible. Either way we're removing that
> part from the device tree so things should be ok for new device trees.
> As Maxime mentioned we can do a check for the syscon compatible and
> either give a warning to the user asking them to update their device
> tree, or not register our custom regmap, or not probe the SRAM driver.
> Personally I prefer the first option. The system controller block is
> probed before any syscon users, so we should be fine, given the dwmac
> driver goes the custom regmap path first.
>=20
> BTW, I still might end up changing the compatible. The manual uses
> "system control", not "system controller", which I think makes sense,
> since it is just a bunch of register files, kind of like the GRF
> (General Register Files) block found in Rockchip SoCs [1], and not an
> actual "controller".

I'm not really fond of that, but we should at least make it consistent
on the other patches Paul sent then.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--lywb4puwbhjfxjby
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlr5Qr0ACgkQ0rTAlCFN
r3TUVw/8Cjrz+V7g4x+C3jJHO/10qrQRxixDyoOgejxLOlviTlbBSxs1d8zewB4g
6Vw+J4pQ61U9w2zosdAM1Z50ocMHjOrJvJH49G4+t/+eKgJz4+36J7NEEdkQv0ph
AI27QAn3if3BMCbtW2SqYDBf0kNEEHRx4oUw4pImA/2w+g0QZDf0VdzGypxam4jY
EUYGxeYwSosteFyP9qctmwYK6KCDkd3g0rRjaFFwKrTgRzdv5UFJegCThlnN3PWb
sPyOoCbkI7qsm1UdCI9G05dSDtt116H8/TFY/emq09J6gdzJsIWImrL0qkPPg+6m
VO54W20UT2P8hyQD6UYejpoeUFCekb5bpupJQukc/E41kuVF3DnmAkTJj/yMTqeb
23/tFACw6bTQn4y0GaJQ9jGvD1dYY7xKFFjz5Fu+yibYyh/gD9A89RuMbt58ykdO
hFpjse7Cholm4x72r3eOuvY1/ba15PFU0BII/Xo6a4gN9FePh7vmYaLdYdbg1qRa
sUf2Ye9Ug953X88fpdpDPwKpCb+1Lic9ErYV3cupi+aT5fGKWmA+x8K1yif3wvL4
wny1MeJYDAYhZAyB431oBAUCuvtBihq/zR6ib6A4lhwEJn5f64pVpqP2kQxSU8EH
GWQiqG6GrM5b0vUcBfMMHY1jtSmVl8RYjT8nMrhrAy38mASKjEw=
=3DUt
-----END PGP SIGNATURE-----

--lywb4puwbhjfxjby--
