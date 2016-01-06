From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] regulator: max8973: add support for junction thermal
 warning
Date: Wed, 6 Jan 2016 16:28:30 +0000
Message-ID: <20160106162830.GZ6588@sirena.org.uk>
References: <1452060922-24426-1-git-send-email-ldewangan@nvidia.com>
 <20160106121857.GW6588@sirena.org.uk>
 <568D064A.8080609@nvidia.com>
 <20160106123735.GX6588@sirena.org.uk>
 <20160106142521.GA11188@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+mQruWSI2c46YBtV"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160106142521.GA11188@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--+mQruWSI2c46YBtV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 06, 2016 at 08:25:21AM -0600, Rob Herring wrote:
> On Wed, Jan 06, 2016 at 12:37:35PM +0000, Mark Brown wrote:

> > > I tried to roundoff to the next higher threshold when supported value (120
> > > or 140 degC) is not provided in driver. But it is fine to me to specify the
> > > possible value setting here and DT binding doc. Will do on next patch.

> > I don't really mind which you use so long as the documentation is clear.

> I prefer that degrees are used rather than register values.

The downside of that is that it does mean more validation code.

--+mQruWSI2c46YBtV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWjUCtAAoJECTWi3JdVIfQH64H/iF5mu8nnHDonrb8BByN0cwy
Cy+aREfyO2MyaCyzXoZ7yEC7pFLXlnRrwQ7tlT0wnc1xUPLGt3nt5dd9YZk4qS5A
Vdreh+S3QJhuR464o8KGlv/+othlJaEPpMQSbIoJL4FDFWDaF5IzsralPX9g6Imu
+ufNU8nG7NmU5LlxjnoZunm7MGUtV4CzB/nLIC5FL1YT1mBNYTCclR+QNuH4sVqN
ja56NJQXgkYyRMcFk74Eaflk4uoIxTTjiKFv23bOY7rzdAoivHs22BoKSiYw4qz1
7T2v0nOp02iLFyK2/f2FvKp6CoCxtv5DAq6f/qUBNgQ+MLYhltwqrM1d4kYRgjE=
=hW0A
-----END PGP SIGNATURE-----

--+mQruWSI2c46YBtV--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
