From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/3] Documentation: mfd: Add binding document for
 S2MPA01
Date: Wed, 12 Feb 2014 18:21:48 +0000
Message-ID: <20140212182148.GK28112@sirena.org.uk>
References: <1389266554-23463-1-git-send-email-sachin.kamat@linaro.org>
 <1389266554-23463-3-git-send-email-sachin.kamat@linaro.org>
 <20140212181043.GB23630@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nQ9468VQnrzpS1Lp"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140212181043.GB23630-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nQ9468VQnrzpS1Lp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2014 at 06:10:43PM +0000, Mark Rutland wrote:
> On Thu, Jan 09, 2014 at 11:22:34AM +0000, Sachin Kamat wrote:

> > +Required properties:
> > +- compatible: Should be "samsung,s2mpa01-pmic".
> > +- reg: Specifies the I2C slave address of the PMIC block. It should be 0x66.

> Is the slave address not per-instance in I2C? If not why must is be 0x66?

I2C devices tend to have a very limited selection of addresses they can
support, a small number selected by pin strapping is common but a single
fixed address is also common.  Each device on the bus will have a unique
address but there may not be any selectability.

--nQ9468VQnrzpS1Lp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS+7u5AAoJELSic+t+oim9DEoQAJrOnp/rr3kW+BpLaQej6o8J
Ln8SL2kE+C7usfCSDRJO3HM878J9OlT+dBGJ2BL5ZsS+57sCaJ29zBtbFeBHCH71
GRQjdI7j4ZaoS4IsmzfYM0h71JCQ5pY0eoa82eQejKNwW1O+5DHULHGYf7x65Buo
NYluP711QHSgzdMaPT4KxKBG6VVT7L5tGi0+6YxXMPVqYlTsJP6jqmmf1saREwwo
5Vz8h5I5Q2Wtrdb3/dHAtE+cA8Hk/lADmeVEkrK2W6vh4Y4H1ZabCtVFXnli7mka
1H+AruLZeGok53IZzZtOQ7wIZOdRSWJZCkS2ezmyYibqqIYQup137HDQhO3Ss5qm
VgBuQlZWtjsNXXgx62Tcq0u93sm75vkvCd3hkj2T6cC8kB+No64qGJKWPbi9d2Uh
GGcV1tYIXdu4c5Nizqw/WVyE2LHczVKc2Wj/10nfmZQyzp5/Pn17nnwg/bzVLFOf
CWbqNpE80FCfUUIJ1JtDjw7R0fQYT6FUPB39Za3xvPfF5MbQmN0WmXoIpqF4LUun
P0Yxghu1tX4wLeus769tMR7i6aUeRwxosVcr2yUJ6+Rq8+Y1Qoq7dBLUzbslcx4U
orZONue2aPB/f0jLt9PcioeaxJfGPYC8H/BVNp9rJvoeFaluuNfySr5bqhIwKatV
lJKSF4V7YOTEQX8mpqj3
=ZM50
-----END PGP SIGNATURE-----

--nQ9468VQnrzpS1Lp--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
