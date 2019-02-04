From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH 1/2] drm/omap: panel-tpo-td028ttec1: add backlight
 support
Date: Mon, 4 Feb 2019 11:23:03 +0100
Message-ID: <20190204112222.5c988278@kemnade.info>
References: <20190119182131.9341-1-andreas@kemnade.info>
        <20190119182131.9341-2-andreas@kemnade.info>
        <9eb955aa-3a87-7f25-21ce-c177b67de522@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/op.iO1w_idDgiQjsMkvIqb1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9eb955aa-3a87-7f25-21ce-c177b67de522@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, sre@kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
List-Id: devicetree@vger.kernel.org

--Sig_/op.iO1w_idDgiQjsMkvIqb1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 4 Feb 2019 10:13:46 +0200
Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:

> Hi,
>=20
> On 19/01/2019 20:21, Andreas Kemnade wrote:
> > This panel has a backlight, so fetch it from devicetree using the
> > as documented in panel-common.txt. It is implemented the same way as in=
 =20
>=20
> Extra words above, or maybe some are missing...
>=20
oops,=20
This panel has a backlight, so fetch it from devicetree using the properties
as documented in panel-common.txt. It is implemented the same way as in=20
panel-dpi.c


> > panel-dpi.c
> > This ensures the backlight is also disabled when the display is
> > turned off like when doing xset dpms force off.
> >=20
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  .../gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c    | 18 ++++++++++=
+++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c b/=
drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c
> > index 7ddc8c574a61..f326ba9dcf62 100644
> > --- a/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c
> > +++ b/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c
> > @@ -35,6 +35,8 @@ struct panel_drv_data {
> > =20
> >  	struct videomode vm;
> > =20
> > +	struct backlight_device *backlight;
> > +
> >  	struct spi_device *spi_dev;
> >  };
> > =20
> > @@ -268,6 +270,8 @@ static int td028ttec1_panel_enable(struct omap_dss_=
device *dssdev)
> > =20
> >  	r |=3D jbt_ret_write_0(ddata, JBT_REG_DISPLAY_ON);
> > =20
> > +	backlight_enable(ddata->backlight);
> > +
> >  	dssdev->state =3D OMAP_DSS_DISPLAY_ACTIVE;
> > =20
> >  transfer_err:
> > @@ -283,6 +287,8 @@ static void td028ttec1_panel_disable(struct omap_ds=
s_device *dssdev)
> >  	if (!omapdss_device_is_enabled(dssdev))
> >  		return;
> > =20
> > +	backlight_disable(ddata->backlight);
> > +
> >  	dev_dbg(dssdev->dev, "td028ttec1_panel_disable()\n");
> > =20
> >  	jbt_ret_write_0(ddata, JBT_REG_DISPLAY_OFF);
> > @@ -321,6 +327,15 @@ static int td028ttec1_panel_probe(struct spi_devic=
e *spi)
> > =20
> >  	dev_dbg(&spi->dev, "%s\n", __func__);
> > =20
> > +	ddata =3D devm_kzalloc(&spi->dev, sizeof(*ddata), GFP_KERNEL);
> > +	if (ddata =3D=3D NULL)
> > +		return -ENOMEM;
> > +
> > +	ddata->backlight =3D devm_of_find_backlight(&spi->dev);
> > +
> > +	if (IS_ERR(ddata->backlight))
> > +		return PTR_ERR(ddata->backlight);
> > + =20
>=20
> Is there a reason for moving the ddata alloc here, instead of keeping it
> where it was?
>=20
Well, I was just unsure if the spi_setup needs to be undone on error, so I
moved things around. But the kzalloc() error check would face the same prob=
lem
and other error checks further on, too.

So I can rather keep it as is.

I will send a v2.

Regards,
Andreas

--Sig_/op.iO1w_idDgiQjsMkvIqb1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAlxYEocACgkQl4jFM1s/
ye+pqBAAjH6A2KEwJpPsiP9ewsTwodRrc8YaGq9vFjzepOrlip3si6Vqj/FdKg+w
eqIsh1JDjLL8NAJ4ytoj+rhV7dKpF+T7bHrN+BZ8JbeCrvQ/UnoILWWGGrd+6/2b
iYhI81yOgPswORZ9i5vU1HduRpYR2mG+1RTFzgemFAMH1tI8+r/S2LyEAhlca46s
PGKjAzmFXJJ9MDtACEfcT5gR6yLKX4AMtaW/eejnEN7OmVLPMdEV0HUKS+NNy7sI
ZsvDBttiBu4JpqNjoAoymd6X8tC4kaHJrOvmxFKs6iGs9KqndGCSWJicSOL9Sy11
aUoqJ3rnXPHBmMtu5tiPE5lORcj9SPP3btEA3pKbJ2v6LP5jzBBq4iKaayNK7hxk
3St9QzFQ7R+363L8Pc1uZPMUpdN9p6dfzrXT39lzr3TeajWxVlQiSA3qJyxQtypw
OaUo4WNFdx7Zy9Xq2qkzPy60jV4Y8w45u5UOU7hB3qa/K9EqCww/6Vtk2QgwBGJY
nAMXR1MR7bhZaNKRDyLwHL6WIWiHhg83J2b5psBczsjTe7qMMM5v/A89SdHHMNTj
VWqq5mYmWtnxehOl7++XoNpHZUpnOzPnG13px86F/EsSqi2BTbzjlDYyMOvEIZxF
WpQ0vwd7K6k4rjQREZEyc1j4yTW8zi2l2LGf2obTOrN7K8AjMQ4=
=WOAo
-----END PGP SIGNATURE-----

--Sig_/op.iO1w_idDgiQjsMkvIqb1--
