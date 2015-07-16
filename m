From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v9 1/4] drm/layerscape: Add Freescale DCU DRM driver
Date: Thu, 16 Jul 2015 13:31:07 +0200
Message-ID: <20150716113106.GB4635@ulmo>
References: <1436784692-40560-1-git-send-email-jianwei.wang@freescale.com>
 <20150714104913.GI12465@ulmo.nvidia.com>
 <DM2PR0301MB12297B66D33EE9E26F011D9E9F990@DM2PR0301MB1229.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1335211709=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <DM2PR0301MB12297B66D33EE9E26F011D9E9F990@DM2PR0301MB1229.namprd03.prod.outlook.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Wang J.W." <Jianwei.Wang@freescale.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Xiubo Li <lixiubo@cmss.chinamobile.com>, Huan Wang <alison.wang@freescale.com>, "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Scott Wood <scottwood@freescale.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============1335211709==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 11:10:29AM +0000, Wang J.W. wrote:
[...]
> > -----Original Message-----
> > From: Thierry Reding [mailto:thierry.reding@gmail.com]
[...]
> > On Mon, Jul 13, 2015 at 06:51:29PM +0800, Jianwei Wang wrote:
[...]
> > >  DRM DRIVERS FOR NVIDIA TEGRA
> > >  M:	Thierry Reding <thierry.reding@gmail.com>
> > >  M:	Terje Bergstr=C3=B6m <tbergstrom@nvidia.com>
> > > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig index
> > > c46ca31..9cfd14e 100644
> > > --- a/drivers/gpu/drm/Kconfig
> > > +++ b/drivers/gpu/drm/Kconfig
> > > @@ -231,6 +231,8 @@ source "drivers/gpu/drm/virtio/Kconfig"
> > >
> > >  source "drivers/gpu/drm/msm/Kconfig"
> > >
> > > +source "drivers/gpu/drm/fsl-dcu/Kconfig"
> > > +
> >=20
> > As mentioned in a different email, I'm somewhat annoyed by the random
> > placement of these source statements. But we can probably clean that up=
 in
> > one go and insist on proper ordering when there is one.
> >=20
> =20
> Ok, I plan to move it to the last line. Is it ok?

It doesn't really matter, it will be inconsistent no matter what because
the current ordering isn't consistent. Keep it where it is for now. I'll
prepare a set of patches to get some consistency into this file.

> > > +int fsl_dcu_drm_connector_create(struct fsl_dcu_drm_device *fsl_dev,
> > > +				 struct drm_encoder *encoder)
> > > +{
> > > +	struct drm_connector *connector =3D &fsl_dev->connector.connector;
> > > +	struct device_node *panel_node;
> > > +	int ret;
> > > +
> > > +	fsl_dev->connector.encoder =3D encoder;
> >=20
> > Why do you need this? The DRM core should set this for you when setting
> > the initial configuration.
> >=20
>=20
> This connector is a private structure fsl_dcu_drm_connector. I set it
> for select best encoder.

That doesn't sound right. Technically the DRM core or userspace is going
to select the encoder for your connector, so it'd be better to derive
the pointer to your driver-private structure from struct drm_encoder *,
otherwise you'll end up getting you private copy of the assignment out
of sync with what the DRM core and/or userspace set up.

Note that you might not run into problems now because you only have a
single encoder. But if you ever add support for another you're going to
run into problems with this kind of static assignment.

> > > +	dev->irq_enabled =3D true;
> > > +	dev->vblank_disable_allowed =3D true;
> > > +
> > > +	ret =3D regmap_write(fsl_dev->regmap, DCU_INT_STATUS, 0);
> > > +	if (ret)
> > > +		dev_err(&pdev->dev, "set DCU_INT_STATUS failed\n");
> > > +	ret =3D regmap_read(fsl_dev->regmap, DCU_INT_MASK, &int_mask);
> > > +	if (ret)
> > > +		dev_err(&pdev->dev, "read DCU_INT_MASK failed\n");
> > > +	ret =3D regmap_write(fsl_dev->regmap, DCU_INT_MASK, int_mask &
> > > +			   ~DCU_INT_MASK_VBLANK);
> > > +	if (ret)
> > > +		dev_err(&pdev->dev, "set DCU_INT_MASK failed\n");
> > > +	ret =3D regmap_write(fsl_dev->regmap, DCU_UPDATE_MODE,
> > > +			   DCU_UPDATE_MODE_READREG);
> >=20
> > What's this DCU_UPDATE_MODE_READREG bit?
> >=20
>=20
> In fact, Only when setting DCU_UPDATE_MODE_READREG bit, it begin to
> transfer register values. So setting DCU_UPDATE_MODE_READREG bit is a
> must after registers updating.

Okay, I see. That's going to be convenient for atomic updates.

> > > diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> > > b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> > [...]
> > > +#define DCU_DISP_SIZE			0x0018
> > > +#define DCU_DISP_SIZE_DELTA_Y(x)	((x) << 16)
> > > +/*Regisiter value 1/16 of horizontal resolution*/
> > > +#define DCU_DISP_SIZE_DELTA_X(x)	((x) >> 4)
> >=20
> > Does this mean the display controller only supports horizontal resoluti=
ons
> > that are a multiple of 16?
> >=20
>=20
> Yes.=20

You may want to check for this explicitly in the driver and filter out
modes that you don't support.

> > > +#ifdef CONFIG_SOC_VF610
> > > +#define DCU_TOTAL_LAYER_NUM             64
> > > +#define DCU_LAYER_NUM_MAX               6
> > > +#else
> > > +#define DCU_TOTAL_LAYER_NUM             16
> > > +#define DCU_LAYER_NUM_MAX               4
> > > +#endif
> >=20
> > Should this not be a runtime decision so that the same driver can run on
> > VF610 and LS1021A platforms?
> >=20
>=20
> Yes, Both VF610 and LS1021A use DCU as video IP module.
> And there are a bit of differences on each SoCs.

Yes, I understand. This should be covered by SoC-specific parameters
(via the of_device_id table) so that you can run the same kernel on both
VF610 and LS1021A SoCs.

As it is, if you build this on a configuration where both VF610 and
LS1021A are enabled you're going to pick up the values for VF610 and
cause LS1021A to not work.

> > > +void fsl_dcu_drm_plane_destroy(struct drm_plane *plane) {
> > > +	fsl_dcu_drm_plane_disable(plane);
> >=20
> > Hmm? This function doesn't do anything, so why not just drop it?
> >=20
>=20
>=20
> I'll implement fsl_dcu_drm_plane_disable(plane)
>=20
>=20
>=20
> > > +	drm_plane_cleanup(plane);
> > > +}
> >=20
> > Also this function and ->atomic_update() should be static. Perhaps make=
 it
> > a habit of running your build tests with C=3D1 occasionally to get noti=
fied
> > of this kind of error.
> >=20
> > Thierry
>=20
>=20
>=20
> One question: How can I set C=3D1?

Just add it to the make command-line along with any other parameters,
like this for example:

	$ make ARCH=3Darm CROSS_COMPILE=3Darmv7l-unknown-linux-gnueabihf- \
		O=3Dbuild/vf610 C=3D1

Thierry

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVp5X4AAoJEN0jrNd/PrOhIdsQALvWRkzFMB7W7ETRheEjCLAX
EU2C+meKLi2Rwv9a9NeZE1T5FX8L2GbrsV3G/VaxG+U9XMNH7Eaaaen3DryeGmSt
EfBz05a3NVRFyURCxom43bp9XPtc5R+aSJC1CzfW51PK2QA74B+TSrk8FhNqWl8y
h32n4FaZWc26AJ6NvT5tyKL9lIQMGh67wD2NDMeTRTKxMHcFvATIe+gUyF0Acr8r
Zs1wGdU0Q96XTQ20oFIbt2odQJdqUGz1arbwVUcd3T3WnLfIcr7pERUAnQ+Cjlny
QPzh+9eL0Q80aGcELRO0DIjqVWIywurUb+sr1O5bG6kQzlh8+zoOL6xu6bUtMVfi
Qnz924hma2Bqj6ByUslMfmykYjfaYKBmzlARwLd2vWEUSUBX0KA51DfrRzrJChmh
mlNfkGG5qC+VxmGsD9wgg9QMp+ZRuAm5DT1ZbndX97qngfoW01OKhcc8Os94tThC
R0O/5ks0GxSFg4bcTGLe+v0d+lBabYCVWX3URlyDKNPgonhzFCubU4GVGQ9Waq6W
oFdylcSYFdsB5BBREzBgBn997XpLeWXNnrbBqyRRNirxCP7MmhzwuWaS0enrFAFq
b98sL5WQ/OSnLs5Gcitk3q+/3THqYo5Rz0jBC+wzyvqrhbRUUnnkL1kMUsn75/3d
e8Pe7Q1fNu8bNMibZwcl
=Pik+
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--

--===============1335211709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1335211709==--
