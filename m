From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 04/16] iio: adc: sun4i-gpadc-iio: rework: sampling
 start/end code readout reg
Date: Mon, 29 Jan 2018 10:27:39 +0100
Message-ID: <20180129092739.665yh3k7pb3ty33u@flea.lan>
References: <20180128232919.12639-1-embed3d@gmail.com>
 <20180128232919.12639-5-embed3d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jqu6ox75l5ldjemb"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180128232919.12639-5-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, edu.molinas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, singhalsimran0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jqu6ox75l5ldjemb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 29, 2018 at 12:29:07AM +0100, Philipp Rossak wrote:
> For adding newer sensor some basic rework of the code is necessary.
>=20
> This commit reworks the code and allows the sampling start/end code and
> the position of value readout register to be altered. Later the start/end
> functions will be used to configure the ths and start/stop the
> sampling.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

That signed-off-by chain doesn't really make much sense. If Icenowy is
the author, she should be reported as such in the commit, and if
you're the author, you shouldn't have her Signed-off-by.

> ---
>  drivers/iio/adc/sun4i-gpadc-iio.c | 44 +++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 39 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gp=
adc-iio.c
> index 03804ff9c006..db57d9fffe48 100644
> --- a/drivers/iio/adc/sun4i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun4i-gpadc-iio.c
> @@ -49,6 +49,15 @@ static unsigned int sun6i_gpadc_chan_select(unsigned i=
nt chan)
>  	return SUN6I_GPADC_CTRL1_ADC_CHAN_SELECT(chan);
>  }
> =20
> +struct sun4i_gpadc_iio;
> +
> +/*
> + * Prototypes for these functions, which enable these functions to be
> + * referenced in gpadc_data structures.
> + */
> +static int sun4i_gpadc_sample_start(struct sun4i_gpadc_iio *info);
> +static int sun4i_gpadc_sample_end(struct sun4i_gpadc_iio *info);
> +
>  struct gpadc_data {
>  	int		temp_offset;
>  	int		temp_scale;
> @@ -56,6 +65,9 @@ struct gpadc_data {
>  	unsigned int	tp_adc_select;
>  	unsigned int	(*adc_chan_select)(unsigned int chan);
>  	unsigned int	adc_chan_mask;
> +	unsigned int	temp_data;
> +	int		(*sample_start)(struct sun4i_gpadc_iio *info);
> +	int		(*sample_end)(struct sun4i_gpadc_iio *info);
>  };
> =20
>  static const struct gpadc_data sun4i_gpadc_data =3D {
> @@ -65,6 +77,9 @@ static const struct gpadc_data sun4i_gpadc_data =3D {
>  	.tp_adc_select =3D SUN4I_GPADC_CTRL1_TP_ADC_SELECT,
>  	.adc_chan_select =3D &sun4i_gpadc_chan_select,
>  	.adc_chan_mask =3D SUN4I_GPADC_CTRL1_ADC_CHAN_MASK,
> +	.temp_data =3D SUN4I_GPADC_TEMP_DATA,

You can use a regmap_field there.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jqu6ox75l5ldjemb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpu6QsACgkQ0rTAlCFN
r3TZKg/9HMOqsd8TyBWWysudAFjlZWVH5vlaPIV/6T4i+29PaX3Gz0JAR1yNDYlh
C3T3B9DWFaOtdeX0pPpWd+XguHQwRjvRtF03D5WuC9mnSzRIeNuzxPT92sAbzvqz
7WL/l1a6H8SqFM0ePYCiYwH8Hjs8L9awH1zYNDxP32E7r6Z5WoafQ7FYhOM9tlg+
06KIo1E+mQYEN0LtC5qwq35kP+gdLN+XV/St9giekyDLQtFU3AmLMUGcV+CJn4Sc
8Evq7lmFC/P0icQPSF6fgc+d/s+4QyavRV9GI5q0NdZOawWy6QDlewjO/x3o7qfL
R3RmIZrgldmyNcKwSg/F26qRYQAjJmBjCSzpywl6otcX8GdfyvfS7ok2BBpJSUN/
k9riR/7CdFk0yx85s6oIFpuSpEyGViZfKWtTllQcyKy8o2082SgpfdjhHXz3sWf6
kx+R9UNfupRnhWiiFkpPOWxyHj4IiFvlTJqN6HX3siBr+nuJ+VWN8NkWfElRp3Ae
YY5cs/E6oQpN2ayHgJqjZEhGEG9l2+WY+Q0PPo4KwB46rA9jSrodX4fyGns4qBUe
q+QBZHNEgx56BwNH31taP0zBQS0OISKlly4AWLLZEHFpdp2OpL0ZREbTukolFcD4
ga8sCsVD0u5aMyTR2IbqZH351cltLtDlbKaVcZWso/R49ejhExg=
=C5JJ
-----END PGP SIGNATURE-----

--jqu6ox75l5ldjemb--
