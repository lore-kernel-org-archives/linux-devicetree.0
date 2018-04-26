From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: rockchip: Specify override mode for
 kevin panel
Date: Thu, 26 Apr 2018 14:05:28 +0200
Message-ID: <20180426120528.GA11985@ulmo>
References: <20180208174855.55620-1-seanpaul@chromium.org>
 <20180208174855.55620-7-seanpaul@chromium.org>
 <CAD=FV=WGU+s015DQbNeWHkpqpHLFz+9AjHKAd0N3HWag0p5FWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1867288994=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAD=FV=WGU+s015DQbNeWHkpqpHLFz+9AjHKAd0N3HWag0p5FWA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>, Arnd Bergmann <arnd@arndb.de>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jeffy Chen <jeffy.chen@rock-chips.com>, Will Deacon <will.deacon@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>, hoegsberg@chromium.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Emil Renner Berthing <kernel@esmil.dk>
List-Id: devicetree@vger.kernel.org


--===============1867288994==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2018 at 10:23:00AM -0800, Doug Anderson wrote:
> Hi,
>=20
> On Thu, Feb 8, 2018 at 9:48 AM, Sean Paul <seanpaul@chromium.org> wrote:
> > This patch adds an override mode for kevin devices. The mode increases
> > both back porches to allow a pixel clock of 26666kHz as opposed to the
> > 'typical' value of 252750kHz. This is needed to avoid interference with
> > the touch digitizer on these laptops.
> >
> > Changes in v2:
> >  - Wrap the timing in display-timings node to match binding (Rob/Thierr=
y)
> > Changes in v3:
> >  - Unwrap the timing from display-timings and rename panel-timing (Rob)
> >
> > Cc: Doug Anderson <dianders@chromium.org>
> > Cc: Eric Anholt <eric@anholt.net>
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: St=C3=A9phane Marchesin <marcheu@chromium.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-rockchip@lists.infradead.org
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts b/arch/a=
rm64/boot/dts/rockchip/rk3399-gru-kevin.dts
> > index 191a6bcb1704..658411ce37ea 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
> > @@ -98,6 +98,20 @@
> >                 backlight =3D <&backlight>;
> >                 power-supply =3D <&pp3300_disp>;
> >
> > +               panel-timing {
> > +                       clock-frequency =3D <266604720>;
> > +                       hactive =3D <2400>;
> > +                       hfront-porch =3D <48>;
> > +                       hback-porch =3D <84>;
> > +                       hsync-len =3D <32>;
> > +                       hsync-active =3D <0>;
> > +                       vactive =3D <1600>;
> > +                       vfront-porch =3D <3>;
> > +                       vback-porch =3D <120>;
> > +                       vsync-len =3D <10>;
> > +                       vsync-active =3D <0>;
> > +               };
> > +
> >                 ports {
> >                         panel_in_edp: endpoint {
> >                                 remote-endpoint =3D <&edp_out_panel>;
>=20
> Kristian brought an old bug to my attention
> <https://bugs.chromium.org/p/chromium/issues/detail?id=3D750354> and it
> made me think.  Should we somehow adjust the bindings here to account
> for the fact that a board may source several different panels?
>=20
> AKA: on some boards an ODM may want to second source (or third source,
> or ...) the panel.  They'll randomly connect several different panels
> to the board and ship the boards out.  The panels are all compatible
> electrically (same power sequencing) but might need slightly different
> timings.  In this particular case there's no board-level strappings
> for the different panels--it's assumed that the EDID on the panels can
> be used to distinguish them.
>=20
> In that case it seems like it would be nice to allow specifying more
> than one "panel-timing" nodes.  Maybe keyed off some type of ID that's
> present in the EDID?

If you've got an EDID you should be relying on the EDID to provide the
timings. No need to have any timings in the DT in that case.

Thierry

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrhwIUACgkQ3SOs138+
s6Ghug/+MQHOop2FeOTf/QoRYU3N6xU64zoFpm2ne/gzE9Jdn8bYXh4Dj7t8tOtp
Y4YLlg8zsEXO1k9Z2eYn2OGeAOGa9zEBtqtO18T4qE5/CJBFPr24zWBDX2aYl4l2
BeeY75NPLo9Zr2ttgjBd1Q14lstog1UFrJzH7SMDPWdjbxwnA0P0DO+Sz0v6SUA/
3kSzraQ2eeGgbAGy0W3F/9vlsT/w0VQ6V7h+mIfwNhT0b495kjA2zE0oTXD3fkcj
hR/zgrBmS9DUuZwgTUcSYa4fbYmN/HMHVFZWCrRozYQrFY24iBxp9gTy2DhhxEho
mcig1vsqx75FomfpJa70SYD1DYIJ3+pbWiGpYOFapcD/z0mHQpfJ0hfJXhFIGl8v
QN1yRaVZZtrbHTDqLp20GpNSCmngE3yz24hp0PX3g1XLqqsDP/hl/8drIyPKcZGL
v4rZ1ZSthTDeKS+m0NEqfMlc7tFfLDN9FJfYg+J7vfPD0NboLfB5BVrZRc7Ce24j
uJMhOX8bt5G7cD51tp7mYmZslECphMZTyRsLS8QqAcXuF+VLjTMZCxzstWnYSIq3
WbozCxfnyMstyIFsPKIQRNh/yb2t1yfgx1IJBUWeYNI/byJxhIgWIM97bKTWbqH7
DsEvVWrhFK9euTtl3sWzZL1xTHnmU20McWoWjdPPcJO48HPUnek=
=7oCj
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

--===============1867288994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1867288994==--
