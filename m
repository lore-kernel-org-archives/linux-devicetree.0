From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: Support for LG lp120up1 panel with eDP
 input
Date: Tue, 23 Feb 2016 16:12:41 +0100
Message-ID: <20160223151241.GC27656@ulmo>
References: <1456138904-15258-1-git-send-email-jitao.shi@mediatek.com>
 <1456138904-15258-2-git-send-email-jitao.shi@mediatek.com>
 <CAGUYZuSsrneg8zQ0Ro8z5C469A2D-TOKpONECxWdoM6T+xNAeg@mail.gmail.com>
 <20160222114308.GA22505@ulmo>
 <CAGUYZuSVghfC75eWihA82WxC8pF67mWKQMJ-95F2ezqMssyxfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGUYZuSVghfC75eWihA82WxC8pF67mWKQMJ-95F2ezqMssyxfQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sanjeev sharma <sanjeevsharmaengg@gmail.com>
Cc: Jitao Shi <jitao.shi@mediatek.com>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, stonea168@163.com, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, cawa cheng <cawa.cheng@mediatek.com>, bibby.hsieh@mediatek.com, CK HU <ck.hu@mediatek.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, Sean Paul <seanpaul@chromium.org>, devicetree@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, "linux-arm-kernel@lists.infradead.org" <linux-arm>
List-Id: devicetree@vger.kernel.org


--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2016 at 10:45:01AM +0530, sanjeev sharma wrote:
> Hello Thierry,
>=20
> I am not agree here and how it would be redundant ?

The panel being a separate device means that it needs a compatible
value and the compatible value implies a specific video timing. It
would be redundant, therefore, to repeat the video timing in the
panel's device tree node that already has the compatible string.

> please see lvds interface, where panel timing parameter is defined in the
> Device Tree. If there are multiple display panel then we can create a
> separate dtsi file and include in main Board dts file. I believe that, It
> is simpler way to support multiple panel.

Two things: you can define a separate .dtsi file with the panel
definition with the current approach, too. But it would be a waste to do
so because really the only thing you need to change is the compatible
string.

The approach chosen in the DTS that you link to below might seem like a
simpler way, but it completely ignores aspects other than timings. What
if the panel requires a GPIO and or regulator to turn on. How are you
going to represent the power up sequence for that in DT? This was
attempted a long time ago and deemed too complicated to do in DT, hence
why we ended up with what we have now.

There are also panels on more complicated busses, such as DSI. These
panels often require additional register programming, so in addition to
the above you'd need some sort of register programming table in DT for
these to work.

> http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/arch/arm=
/boot/dts/imx6q-sabrelite.dts?h=3Dimx_3.14.38_6qp_beta#n225

That's not an upstream tree, so it isn't relevant to this discussion.
The decision to make the panel a separate device and put the video
timings into the driver was made a couple of years ago and we're not
going to change that. It's fine if you want to disagree, but I'm afraid
it won't change things.

Thierry

> On Mon, Feb 22, 2016 at 5:13 PM, Thierry Reding <thierry.reding@gmail.com>
> wrote:
>=20
> > On Mon, Feb 22, 2016 at 04:42:54PM +0530, sanjeev sharma wrote:
> > > Hello Jitao,
> > >
> > > Can't we add this panel information in device tree file instead inside
> > the
> > > device driver ?
> >
> > We could, but that would be redundant. Panels need to be represented by
> > a specific compatible string anyway, and that compatible string implies
> > the video timings, bits-per-color, width and height.
> >
> > Also there's more to panels than just the timings or dimensions. Power
> > up and power down sequences are also implied by the compatible stirng.
> > Describing all of that in the device tree was at some point attempted,
> > but in the end it turned out too complicated and we ended up with what
> > we have now.
> >
> > Thierry
> >
> > > On Mon, Feb 22, 2016 at 4:31 PM, Jitao Shi <jitao.shi@mediatek.com>
> > wrote:
> > >
> > > > The LG lp120up1 TFT LCD panel with eDP interface is a 12.0" 1920x12=
80
> > > > panel, which can be supported by the simple panel driver
> > > >
> > > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > > ---
> > > > Changes since v1:
> > > >  - Add eDP panel type in comment msg
> > > >  - Fixed comment msg with 72 characters width
> > > > ---
> > > >  drivers/gpu/drm/panel/panel-simple.c |   26 ++++++++++++++++++++++=
++++
> > > >  1 file changed, 26 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c
> > > > b/drivers/gpu/drm/panel/panel-simple.c
> > > > index f88a631..2030c37 100644
> > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > @@ -982,6 +982,29 @@ static const struct panel_desc lg_lb070wv8 =3D=
 {
> > > >         .bus_format =3D MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> > > >  };
> > > >
> > > > +static const struct drm_display_mode lg_lp120up1_mode =3D {
> > > > +       .clock =3D 162300,
> > > > +       .hdisplay =3D 1920,
> > > > +       .hsync_start =3D 1920 + 40,
> > > > +       .hsync_end =3D 1920 + 40 + 40,
> > > > +       .htotal =3D 1920 + 40 + 40+ 80,
> > > > +       .vdisplay =3D 1280,
> > > > +       .vsync_start =3D 1280 + 4,
> > > > +       .vsync_end =3D 1280 + 4 + 4,
> > > > +       .vtotal =3D 1280 + 4 + 4 + 12,
> > > > +       .vrefresh =3D 60,
> > > > +};
> > > > +
> > > > +static const struct panel_desc lg_lp120up1 =3D {
> > > > +       .modes =3D &lg_lp120up1_mode,
> > > > +       .num_modes =3D 1,
> > > > +       .bpc =3D 8,
> > > > +       .size =3D {
> > > > +               .width =3D 267,
> > > > +               .height =3D 183,
> > > > +       },
> > > > +};
> > > > +
> > > >  static const struct drm_display_mode lg_lp129qe_mode =3D {
> > > >         .clock =3D 285250,
> > > >         .hdisplay =3D 2560,
> > > > @@ -1256,6 +1279,9 @@ static const struct of_device_id
> > platform_of_match[]
> > > > =3D {
> > > >                 .compatible =3D "lg,lb070wv8",
> > > >                 .data =3D &lg_lb070wv8,
> > > >         }, {
> > > > +               .compatible =3D "lg,lp120up1",
> > > > +               .data =3D &lg_lp120up1,
> > > > +       }, {
> > > >                 .compatible =3D "lg,lp129qe",
> > > >                 .data =3D &lg_lp129qe,
> > > >         }, {
> > > > --
> > > > 1.7.9.5
> > > >
> > > >
> > > > _______________________________________________
> > > > linux-arm-kernel mailing list
> > > > linux-arm-kernel@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > > >
> >

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWzHbnAAoJEN0jrNd/PrOhF28P/0MWYL3p7D+aWcXAyuvdDlJF
elOhngwyjHUi8ZYrUT9hPjUTZS3tx8ZSwL0VbmrsDWFi5wyk/OwYJDx1Y/xs3WqE
NGaRC1ZCoh+xKhs66YtKOnfqp6nBbaam1sv9eJfelryHjjUS5bsYX4bhNIYYPISz
6NJ2gl5Quw2j1934hcnV2VymJFOkio5NckeAyV/TPOZuFIOynZHRc+GeokhejYee
XRsMcVZQ0CTTKOupQFzpQweSRL93xuCVhZpTiaOW7jdIk2oSdQVB/oEC61ivHS2l
5ZhQi2JDuuUaGAXU35UYootEt0qivpC/YMLC2zDPIfdflJFMzuWM4yN77ClJnKby
Mbi3HSDtAC3XdKD3XU1OWWRJI7BXShUo1M8R1iaaRmvDriL6kSTLNwctbV5+JmOK
vI8FIF9tWCnp3qY5dHzOGc/VLAxX6CELyDntkUjk10zpw8Cz2B1KQ3vbx5ASjDyI
pJi5WA1M+7DYilBiX8UTN8x/4jkHiCWKcEAQC7wFrqyFNkVwOB3tFsgQjWazWW99
Zdzk6S9H8up2puMPbshazztzXYE1elSGB87Bx70LgeT+Ygym1lFQaTRJ5x2uhl3R
b81t5IeIkjtLcsmblNj94phiNJqOlkhAx0bDX7o1m/HxOsta+dPoZ8zVvOqsqrSm
c9hUr4mrgX7vWbYDQyaJ
=tTh+
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--
