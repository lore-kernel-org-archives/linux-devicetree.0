From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 07/16] iio: adc: sun4i-gpadc-iio: rework: support
 nvmem calibration data
Date: Tue, 30 Jan 2018 09:36:43 +0100
Message-ID: <20180130083642.cdpd7jnthkdrrk5r@flea.lan>
References: <20180128232919.12639-1-embed3d@gmail.com>
 <20180128232919.12639-8-embed3d@gmail.com>
 <20180129094045.sagz2dnzvdadd4yx@flea.lan>
 <e319fde5-9ede-8be0-03ae-f0a22d50250c@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6u2ivkblyv2lastj"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e319fde5-9ede-8be0-03ae-f0a22d50250c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, edu.molinas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, singhalsimran0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--6u2ivkblyv2lastj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2018 at 01:33:12PM +0100, Philipp Rossak wrote:
> > >   static const struct gpadc_data sun4i_gpadc_data =3D {
> > > @@ -87,6 +89,7 @@ static const struct gpadc_data sun4i_gpadc_data =3D=
 {
> > >   	.sample_start =3D sun4i_gpadc_sample_start,
> > >   	.sample_end =3D sun4i_gpadc_sample_end,
> > >   	.sensor_count =3D 1,
> > > +	.supports_nvmem =3D false,
> >=20
> > That's already its value if you leave it out.
> >=20
> > >   };
> > >   static const struct gpadc_data sun5i_gpadc_data =3D {
> > > @@ -100,6 +103,7 @@ static const struct gpadc_data sun5i_gpadc_data =
=3D {
> > >   	.sample_start =3D sun4i_gpadc_sample_start,
> > >   	.sample_end =3D sun4i_gpadc_sample_end,
> > >   	.sensor_count =3D 1,
> > > +	.supports_nvmem =3D false,
> > >   };
> > >   static const struct gpadc_data sun6i_gpadc_data =3D {
> > > @@ -113,6 +117,7 @@ static const struct gpadc_data sun6i_gpadc_data =
=3D {
> > >   	.sample_start =3D sun4i_gpadc_sample_start,
> > >   	.sample_end =3D sun4i_gpadc_sample_end,
> > >   	.sensor_count =3D 1,
> > > +	.supports_nvmem =3D false,
> > >   };
> > >   static const struct gpadc_data sun8i_a33_gpadc_data =3D {
> > > @@ -123,6 +128,7 @@ static const struct gpadc_data sun8i_a33_gpadc_da=
ta =3D {
> > >   	.sample_start =3D sun4i_gpadc_sample_start,
> > >   	.sample_end =3D sun4i_gpadc_sample_end,
> > >   	.sensor_count =3D 1,
> > > +	.supports_nvmem =3D false,
> > >   };
> > >   struct sun4i_gpadc_iio {
> > > @@ -141,6 +147,8 @@ struct sun4i_gpadc_iio {
> > >   	struct clk			*mod_clk;
> > >   	struct reset_control		*reset;
> > >   	int				sensor_id;
> > > +	u32				calibration_data[2];
> > > +	bool				has_calibration_data[2];
> >=20
> > Why do you have two different values here?
>=20
> I think my idea was too complex! I thought it would be better to check if
> calibration data was read, and is able to be written to hardware. those
> information were split per register.
>=20
> I think a u64 should be fine for calibration_data. When I write the
> calibration data I can check on the sensor count and write only the lower=
 32
> bits if there are less than 3 sensors.
>=20
> Is this ok for you?

I'd need to see the implementation, but make sure that this is
documented in your driver :)

>=20
> > >   	/* prevents concurrent reads of temperature and ADC */
> > >   	struct mutex			mutex;
> > >   	struct thermal_zone_device	*tzd;
> > > @@ -561,6 +569,9 @@ static int sun4i_gpadc_probe_dt(struct platform_d=
evice *pdev,
> > >   	struct resource *mem;
> > >   	void __iomem *base;
> > >   	int ret;
> > > +	struct nvmem_cell *cell;
> > > +	ssize_t cell_size;
> > > +	u64 *cell_data;
> > >   	info->data =3D of_device_get_match_data(&pdev->dev);
> > >   	if (!info->data)
> > > @@ -575,6 +586,39 @@ static int sun4i_gpadc_probe_dt(struct platform_=
device *pdev,
> > >   	if (IS_ERR(base))
> > >   		return PTR_ERR(base);
> > > +	info->has_calibration_data[0] =3D false;
> > > +	info->has_calibration_data[1] =3D false;
> > > +
> > > +	if (!info->data->supports_nvmem)
> > > +		goto no_nvmem;
> > > +
> > > +	cell =3D nvmem_cell_get(&pdev->dev, "calibration");
> > > +	if (IS_ERR(cell)) {
> > > +		if (PTR_ERR(cell) =3D=3D -EPROBE_DEFER)
> > > +			return PTR_ERR(cell);
> > > +		goto no_nvmem;
> >=20
> > goto considered evil ? :)
>=20
> this was a suggestion from Jonatan in version one, to make the code better
> readable.

Isn't

if (info->data->supports_nvmem && IS_ERR(cell =3D nvmem_cell_get()))

pretty much the same thing?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6u2ivkblyv2lastj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpwLpoACgkQ0rTAlCFN
r3QLSBAAjLwO1WgXEafxyjZ1raD52wYT6bCKca9SN7NRbNNAmWedkHabwdrhTOMH
FJ8TrkYaZGYI7dK3cMCHrs6tNc1iaXCyGJsB1HYLO1quYLMI03qcSTJ88jI+gSFM
0EBtgsa+PWx7QrbCIfWt4UmVtF9c+MdQJSLFfiz3b2SaIf2Ut2lpnCKEPFRCYWID
CF2N60cUuxTcbUtUvuHyOsxTrWxCt8fq1L0OOdYL2vhsfUAgZaMI9q69cWxEbKK1
c6BnCfe+/Ld4P37J3ptPcpsK5sa5sP99Ek0nbABvxSQrHqx3WxWBqYsl3NaBzr6L
yyuPbjVH5Cd6pladYr2wohiuY4/0vMwSsC2y9GxhD6CgSJ7xVd+AoMES6KJUHZY0
okd+cwKF4xEOCJj55TORVUjiuYPO7xOXoy/w4YWJqXHUA8apueHonYpt4fe3bhgn
6/93z400uEgyjh246FOvehEz7aH+oX/ZPUa2MIOrBMUPSCtPuwQSNkpvaehl913r
JJJ5vY3kJMoWQtBJVe9big5Pln2PZYoztPS/UrXjVmTQBSPoCsdCWk7/wX/LtdAw
w39OVaWV4zL7HZFpYaOYBNJjlc/h3w9zzXmxQruuP10rp7yrSUnAw1XYYLVu0t4v
jlfjeyTlqPaz3LcKcOE0yn+MmgmXSt0OM13oTRu1O4sqVFGTTXQ=
=nsrh
-----END PGP SIGNATURE-----

--6u2ivkblyv2lastj--
