From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: userspace-consumer: add DT binding details
Date: Wed, 30 Jul 2014 17:40:14 +0100
Message-ID: <20140730164014.GY17528@sirena.org.uk>
References: <1406728440-17837-1-git-send-email-ldewangan@nvidia.com>
 <1406728440-17837-2-git-send-email-ldewangan@nvidia.com>
 <20140730155302.GE20162@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GZ7IEjvh/SgTPveO"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140730155302.GE20162@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--GZ7IEjvh/SgTPveO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 30, 2014 at 04:53:03PM +0100, Mark Rutland wrote:
> On Wed, Jul 30, 2014 at 02:54:00PM +0100, Laxman Dewangan wrote:

> > +Required properties:
> > +- compatible		: Must be "reg-userspace-consumer".

> I would never expect to see "userspace" in a DT beinding string; this is
> entirely a software abstraction description and has nothing to do with
> the interaction of HW components.

> Why do you think we need this in the DT?

Yes, this is test code - it is not intended to be used in production.
Any binding should be for the consumer using this, not for this
implementation detail.

--GZ7IEjvh/SgTPveO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIbBAEBAgAGBQJT2R/rAAoJELSic+t+oim91jwP+KsCYAJCp5Q84qu3Omi6J5Gv
98nf9V1Rshc/I2IaSdr9JYKMzbTN0ke5HJ81DK06bvXqw3Cz1ZIpoQrjJ5HOtBkf
NdVd2iSqKWP9bSZ2m04C3WUPXpqtONNchfOGun10GGWcV4Y8q4sknbSsE5dLYD5L
F45Lc2MnJt7VXCB7ISi3bGq7D6loOL8nkYzFK4AZSMAhEYklNCfaC2K+qZ3f7zvN
131dlaCNlKwf1B+XL8r9+007ZIaFWF6jsOOaWJlSGktupF2Qb5bMCVlqpUq5xsoH
qKq/HDE+TFXasO/oMjGtQB+Br23IlhgeAehGFdaukp4InHqfatBc3Y0/tLOn/1As
8YdphlqKP0kvVDfNKJaK+Awd0bxzUlAUShInVnRTslsyqXOywowi1y7P3Ob45Ny9
L3P0Dmty1mc7UEGB2lKlpFgqFBKgpharud1u0oOJ3PElucRPDKotiIH8U4HBcqOj
yVqWDhZJ3Sens9HQZGlGnUhau1nnuBEy9e1yz8EmGfL+xPg4xfe3r6XrRcyDsT7f
IQrVTVqjub5+hU/oe+HK/B1EwjwkmHrIwYeU8QmF+6qsVgrRqSbgsVtkSh5BaiQx
uPoc1AqIjNGpmXRCZXxj2Fm3J/1t8Jp17QLOJSoY9UbDDUV2UALh0mDCUqptPOA2
7/FNVjc1OVJ81UGgLAA=
=nb21
-----END PGP SIGNATURE-----

--GZ7IEjvh/SgTPveO--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
