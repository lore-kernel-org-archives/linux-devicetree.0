From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 6/6] drm/panel: rpi-touchscreen: Set status to "fail"
 when ->probe() fails
Date: Fri, 4 May 2018 11:47:48 +0200
Message-ID: <20180504094748.GD13459@ulmo>
References: <20180503164009.14395-1-boris.brezillon@bootlin.com>
 <20180503164009.14395-7-boris.brezillon@bootlin.com>
 <CAL_JsqJMarPW6sdcF1ZFCEr6wGyPgi2yhYMCxgypUYYwN7ayfQ@mail.gmail.com>
 <20180504100653.6ee70802@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0777327946=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180504100653.6ee70802@bbrezillon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============0777327946==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GyRA7555PLgSTuth"
Content-Disposition: inline


--GyRA7555PLgSTuth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2018 at 10:06:53AM +0200, Boris Brezillon wrote:
> Hi Rob,
>=20
> On Thu, 3 May 2018 12:12:39 -0500
> Rob Herring <robh+dt@kernel.org> wrote:
>=20
> > On Thu, May 3, 2018 at 11:40 AM, Boris Brezillon
> > <boris.brezillon@bootlin.com> wrote:
> > > The device might be described in the device tree but not connected to
> > > the I2C bus. Update the status property so that the DRM panel logic
> > > returns -ENODEV when someone tries to get the panel attached to this
> > > DT node.
> > >
> > > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > > ---
> > >  .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  | 35 ++++++++++++=
++++++++++
> > >  1 file changed, 35 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/=
drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> > > index 2c9c9722734f..b8fcb1acef75 100644
> > > --- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> > > +++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> > > @@ -358,6 +358,39 @@ static const struct drm_panel_funcs rpi_touchscr=
een_funcs =3D {
> > >         .get_modes =3D rpi_touchscreen_get_modes,
> > >  };
> > >
> > > +static void rpi_touchscreen_set_status_fail(struct i2c_client *i2c)
> > > +{
> > > +       struct property *newprop;
> > > +
> > > +       newprop =3D kzalloc(sizeof(*newprop), GFP_KERNEL);
> > > +       if (!newprop)
> > > +               return;
> > > +
> > > +       newprop->name =3D kstrdup("status", GFP_KERNEL);
> > > +       if (!newprop->name)
> > > +               goto err;
> > > +
> > > +       newprop->value =3D kstrdup("fail", GFP_KERNEL);
> > > +       if (!newprop->value)
> > > +               goto err;
> > > +
> > > +       newprop->length =3D sizeof("fail");
> > > +
> > > +       if (of_update_property(i2c->dev.of_node, newprop))
> > > +               goto err;
> > > + =20
> >=20
> > As I mentioned on irc, can you make this a common DT function.
>=20
> Yep, will move that to drivers/of/base.c and make it generic.
>=20
> >=20
> > I'm not sure if it matters that we set status to fail vs. disabled. I
> > somewhat prefer the latter as we already have other cases and I'd
> > rather the api not pass a string in. I can't think of any reason to
> > distinguish the difference between fail and disabled.
>=20
> Well, I just read the ePAPR doc pointed by Thierry [1] (section 2.3.4),
> and "fail" seemed like a good match for what we are trying to express
> here: "we failed to communicate with the device in the probe function
> and want to mark it unusable", which is a bit different from "the
> device was explicitly disabled by the user".
>=20
> Anyway, if you think "disabled" is more appropriate, I'll use that.
>=20
> >=20
> > > +       /* We intentionally leak the memory we allocate here, because=
 the new
> > > +        * OF property might live longer than the underlying dev, so =
no way
> > > +        * we can use devm_kzalloc() here.
> > > +        */
> > > +       return;
> > > +
> > > +err:
> > > +       kfree(newprop->value);
> > > +       kfree(newprop->name);
> > > +       kfree(newprop);
> > > +}
> > > +
> > >  static int rpi_touchscreen_probe(struct i2c_client *i2c,
> > >                                  const struct i2c_device_id *id)
> > >  {
> > > @@ -382,6 +415,7 @@ static int rpi_touchscreen_probe(struct i2c_clien=
t *i2c,
> > >
> > >         ver =3D rpi_touchscreen_i2c_read(ts, REG_ID);
> > >         if (ver < 0) {
> > > +               rpi_touchscreen_set_status_fail(i2c); =20
> >=20
> > I've thought some more about this and I still think this should be
> > handled in the driver core or i2c core.
> >=20
> > The reason is simple. I think the state of the system should be the
> > same after this as if you booted with 'status =3D "disabled"' for this
> > node. And that means the device should be removed completely because
> > we don't create struct device's for disabled nodes.
>=20
> That was my feeling to when first discussing the issue with Daniel and
> Thierry on IRC, but after digging a bit in the code I'm no longer sure
> this is a good idea. At least, I don't think basing the decision to
> disable the device (or mark it unusable) based on the return value of
> the probe function is a good idea.

I'm not so sure about that. -ENODEV seems like a very suitable error
code to base that decision on. A random sampling of a handful of drivers
confirms that this is primarily used to report situations where it is
impossible for the device to ever be probed successfully, so might as
well just remove it.

At the very least I think it is worth proposing the patch and let Greg
and others weigh in.

Thierry

--GyRA7555PLgSTuth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsLEQACgkQ3SOs138+
s6HWbhAAnGwv4cgTC/B3li4UvmzkaLPk/KneKfU6ZJqpYoRFp6//cn7puJUGSHhn
AYq+046qX5hpEIAnltGXl9gG/95N6pGbzNt811wp2Mhh6pQAVvvITBB0g6R65BTb
xVM2oFJPvkk4AFnYCyJeXgWtlVzhZANBwNf2/50Ugvy+FmAhKRUSe/5GtHwMGuD/
IUB6dhcFGvUoe+/3f5zTKCj6ezouuGNTYngHcFB6MuLXAVv9LWdJybO9d2BersT6
S0CQkO9NKXHosNAG1mWyHHLXR9HECyNlkh+CnYcnawSJglct19KDHh8ZSR67Bn1J
cohs4Vx3kJ2wcjZJXgwOBVpZnAcnTH6vxMDMpMsOPzB3CCey0SGb9j6RGFNVmgGa
LNM+3a9NoSbf9cJ/zGAaKMLaDrQhvfyHzPu6RN9dWpXEDTdoHF4+iMKI/R1O80pP
TyTympHmi21fyNsli1huk/efM4Q/gVRJ6fz/zpZ2OSIldv5kKcTSyn3xWGZSz9Xb
sO2BXK9ZWFkql3Ghn1bAYejMhVN0yQ/Gs/6OBBu5zoCUM4VCf/gHHahXIx7J0s2+
rPaPq0xBBamlQKGg7AC7a00mqafqEXW2cZn5zW29qJwQNjUojWnsctvdu3HZd+af
PMgj30B6ssdE9DINNDf41MpohvQemgv/HY4jBcXyTny/uwLnw9M=
=Wl5b
-----END PGP SIGNATURE-----

--GyRA7555PLgSTuth--

--===============0777327946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0777327946==--
