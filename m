From: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>
Subject: Re: [PATCH v2 2/2] iio: adc: xilinx-xadc: Add label as an optional
 argument for aux channels
Date: Mon, 8 Jun 2015 08:49:14 -0500
Message-ID: <20150608134914.GF633@jcartwri.amer.corp.natinst.com>
References: <555B78A3.2030202@metafoo.de>
 <1432135352-29848-1-git-send-email-xander.huff@ni.com>
 <1432135352-29848-2-git-send-email-xander.huff@ni.com>
 <55747616.1010901@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55747616.1010901-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben.shelton-acOepvfBmUk@public.gmane.org, joe.hershberger-acOepvfBmUk@public.gmane.org
List-Id: devicetree@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 07, 2015 at 05:49:26PM +0100, Jonathan Cameron wrote:
> On 20/05/15 16:22, Xander Huff wrote:
> > To better facilitate user-mode access to optional aux channels, allow
> > device trees to specify a custom label for defined channels.
> >=20
> > Signed-off-by: Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
> > Reviewed-by: Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>
> > Reviewed-by: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>
> > ---
> >  drivers/iio/adc/xilinx-xadc-core.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilin=
x-xadc-core.c
> > index ce93bd8..bda4241 100644
> > --- a/drivers/iio/adc/xilinx-xadc-core.c
> > +++ b/drivers/iio/adc/xilinx-xadc-core.c
> > @@ -1119,6 +1119,9 @@ static int xadc_parse_dt(struct iio_dev *indio_de=
v, struct device_node *np,
> >  			if (ret || reg > 16)
> >  				continue;
> > =20
> > +			of_property_read_string(child, "label",
> > +						&chan->extend_name);
> > +
> >  			if (of_property_read_bool(child, "xlnx,bipolar"))
> >  				chan->scan_type.sign =3D 's';
> > =20
> >=20
> I think what Lars was suggesting was a change to the IIO side of this rat=
her than
> just changing the device tree binding.

I'm not so sure.  His observation was just that the typical name of
these properties is 'label', which I think makes sense and is commonly
used.

Naming things is hard.

Perhaps, though, an improvement may be made if we lifted this out of the
xadc driver and moved it into the IIO core (I can't imagine that this
driver is the only one representing each channel with a separate node in
DT).

> Perhaps an additional per channel attribute called _label which would
> allow for board specific labelling?

This would seem a bit odd in DT-land; if a user wanted a different label
name for their board, they would just rename it in their device tree for
that board.  Fortunately, with the structured dtsi include files, this
is pretty painless to do.

  Josh

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVdZ1WAAoJEKp7ZBKwQFAryccIAJXt1Z85xK+Yk85eNjzJbcxr
dDY9LlUmo8gmVdHQycMSUD2vPrZDtS95psBdzS0bNRoTmOaZCCXKn3sR/P4zKuVP
aJS3SX67ojF38mDT6SBxRXtF0YqPdKw2bhlhN9wmdLwp9lgUnfBcE3yOtrCNlE1s
D6C/+6IrI483gv6lCmyW2PYGxTps45rdGx7daNL6ea+HXkcyyg06XYCkhjZ3L+cQ
b8oszq+O1O74GrV+RbKtWWZ5fB5KXXzguPzcljjTnWf4RAu9ysYfmmSW5bjFRa0/
fXRYRWyqI87xCVDSPK3+xZAFetGh6pGwvDnYmqjxX8TwSeXVIuCCjZijwbJPRHI=
=MicM
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
