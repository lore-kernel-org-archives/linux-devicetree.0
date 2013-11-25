From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mfd: cros ec: spi: Add delay for raising CS
Date: Mon, 25 Nov 2013 11:04:29 +0100
Message-ID: <20131125100428.GG22043@ulmo.nvidia.com>
References: <1385143550-31901-1-git-send-email-treding@nvidia.com>
 <20131125094503.GD17722@lee--X1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BzCohdixPhurzSK4"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131125094503.GD17722@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Bernie Thompson <bhthompson-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--BzCohdixPhurzSK4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2013 at 09:45:03AM +0000, Lee Jones wrote:
> On Fri, 22 Nov 2013, Thierry Reding wrote:
>=20
> > From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The EC has specific timing it requires. Add support for an optional del=
ay
> > after raising CS to fix timing issues. This is configurable based on
> > a DT property "google,cros-ec-spi-msg-delay".
> >=20
> > If this property isn't set, then no delay will be added. However, if set
> > it will cause a delay equal to the value passed to it to be inserted at
> > the end of a transaction.
> >=20
> > Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Reviewed-by: Bernie Thompson <bhthompson-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Reviewed-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Changes in v2:
> > - make property description more verbose
> >=20
> >  Documentation/devicetree/bindings/mfd/cros-ec.txt |  9 +++++++
>=20
> We need a DT dude to look over this.

I think Mark Rutland looked at this last week and I think I've addressed
all his comments. Hopefully he'll find the time to review this.

> >  drivers/mfd/cros_ec_spi.c                         | 30 +++++++++++++++=
++++++++
> >  2 files changed, 39 insertions(+)
>=20
> <snip>
>=20
> >  static void debug_packet(struct device *dev, const char *name, u8 *ptr,
> > @@ -238,6 +242,17 @@ static int cros_ec_command_spi_xfer(struct cros_ec=
_device *ec_dev,
> > =20
> >  	/* turn off CS */
> >  	spi_message_init(&msg);
> > +
> > +	if (ec_spi->end_of_msg_delay) {
> > +		/*
> > +		 * Add delay for last transaction, to ensure the rising edge
> > +		 * doesn't come too soon after the end of the data.
> > +		 */
> > +		memset(&trans, '\0', sizeof(trans));
>=20
> Just use the usual 0 for the third parameter.

Will fix.

> > +static void cros_ec_probe_spi_dt(struct cros_ec_spi *ec_spi, struct de=
vice *dev)
>=20
> Traditionally we have 'probe' as the last word in the function name.

Okay.

> > +{
> > +	struct device_node *np =3D dev->of_node;
> > +	u32 val;
> > +	int ret;
> > +
> > +	ret =3D of_property_read_u32(np, "google,cros-ec-spi-msg-delay", &val=
);
> > +	if (!ret)
> > +		ec_spi->end_of_msg_delay =3D val;
> > +}
> > +
> >  static int cros_ec_probe_spi(struct spi_device *spi)
>=20
> Can you send a pre-patch to fix this too please:
>   static int cros_ec_spi_probe(struct spi_device *spi)

Yes, I will.

> <snip>
>=20
> > +	/* Check for any DT properties */
> > +	if (IS_ENABLED(CONFIG_OF) && dev->of_node)
>=20
> No need for the first check.

Why not? While it is true that dev->of_node would be enough to determine
that the device was instantiated from a device tree, the IS_ENABLED()
will allow the compiler to throw away cros_ec_spi_dt_probe() if OF isn't
enabled. At the same time it's nicer than #ifdeffery sprinkled across
the file and it actually compile-tests all the code. Win-win-win, isn't
it?

Thierry

--BzCohdixPhurzSK4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSkyCsAAoJEN0jrNd/PrOhbAwP/A4IHr7DMWr+M/bmQ8PzG8sK
yB5lLE1hIs+tcWH5nG1ToIAQMcsm3//LSKYvA15v9BxfBsK+7P4MRJQ5lf4bM77W
4zD0wzGoRcn0nwZaVIjTICJSNtw748x4vsaPgXm4pHN33r0PbL1bmnUOaMLd9G2z
FQyrDQ7JcZha58atqHtYRDlfUaWLhcD+DB/qHfcm2yW4Xg66RlmDl34/4bJN9Soh
qM3Q4TjH4qMqkRgG8N2k3ljwkt1l6fPyBZuyly8OWjXH0nqNRbApSf7kkGnjnRx1
ZCca+puL6X4bdYkGc3UoyASxIMvrx5cogq+n2vPT1Gu5i2k+Y3WXpneQ/tdD2EvC
0Z9YFwPzXJF+Ob/CzviegF8U6qbhmwhsu8PFB3QWeKix4Ea5meRtLLtoruz17F2U
CttOOLIdZYKDq624LweD+QR/ri38Zx0YjJ2a7JNPpPByoNf6G0vt8TgoUiHS/7wY
FU57GY8541btdIPGH9FTUOd2/QoH7l6+3tgl/SSueuVO8axPPXqc86vDa+dLoTIm
aZa0iaEzsfuZHk7fI9oU4L7lOfKYy/h8S8EVMInnSRIx0wZnAEKJ91PzpSiTeoqU
s2k7ZGzaY10VctnPRshelRbrat3JbBgmi6FY5GLISJp7Fb2qAgZErlGewEUBFbKn
qbHQ8nhxRCkXDC4S531j
=3F46
-----END PGP SIGNATURE-----

--BzCohdixPhurzSK4--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
