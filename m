From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 02/10] drm/sun4i: sun6i_mipi_dsi: Support instruction
 loop selection
Date: Tue, 6 Nov 2018 16:52:07 +0100
Message-ID: <20181106155207.kysq2crszzqv45ib@flea>
References: <20181103100900.30313-1-jagan@amarulasolutions.com>
 <20181103100900.30313-3-jagan@amarulasolutions.com>
 <20181105103857.lp7ayw3p6dbthehg@flea>
 <CAMty3ZBje8F4YEfWC4qoxADhgdFjbcwZBKJwak633pUAwKAftA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1742209865=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAMty3ZBje8F4YEfWC4qoxADhgdFjbcwZBKJwak633pUAwKAftA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, TL Lim <tllim@pine64.org>, Michael Trimarchi <michael@amarulasolutions.com>, Sean Paul <sean@poorly.run>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============1742209865==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iwk7rx7z5npid6ud"
Content-Disposition: inline


--iwk7rx7z5npid6ud
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 05, 2018 at 04:56:35PM +0530, Jagan Teki wrote:
> On Mon, Nov 5, 2018 at 4:09 PM Maxime Ripard <maxime.ripard@bootlin.com> =
wrote:
> >
> > On Sat, Nov 03, 2018 at 03:38:52PM +0530, Jagan Teki wrote:
> > > Instruction loop selection would require before writing
> > > loop number registers, so enable idle, LP11 bits on
> > > loop selection register.
> > >
> > > Reference code available in BSP
> > > (in drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
> > > (dsi_dev[sel]->dsi_inst_loop_sel.dwval =3D 2<<(4*DSI_INST_ID_LP11) |
> > >       3<<(4*DSI_INST_ID_DLY);
> > >
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm=
/sun4i/sun6i_mipi_dsi.c
> > > index da152c21ec62..077b57ec964c 100644
> > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > @@ -397,6 +397,10 @@ static void sun6i_dsi_setup_inst_loop(struct sun=
6i_dsi *dsi,
> > >       struct mipi_dsi_device *device =3D dsi->device;
> > >       u16 delay;
> > >
> > > +     regmap_write(dsi->regs, SUN6I_DSI_INST_LOOP_SEL_REG,
> > > +                  DSI_INST_ID_HSC  << (4 * DSI_INST_ID_LP11) |
> > > +                  DSI_INST_ID_HSD  << (4 * DSI_INST_ID_DLY));
> > > +
> >
> > Please put this with the other instructions settings below.
>=20
> Does that mean after computation delay code?

Yes

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--iwk7rx7z5npid6ud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCW+G4pwAKCRDj7w1vZxhR
xf5zAP9MQRhh1/DVKTUy1CqpnOzbp3XS5XFbEMEfhyXA3L304wD8Cd2d61VUgcPW
CDWVIgkkHip3nkRAC0rM4ZNrgH29zwA=
=Q/5+
-----END PGP SIGNATURE-----

--iwk7rx7z5npid6ud--

--===============1742209865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1742209865==--
