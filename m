From: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] mfd: bcm590xx: add support for secondary I2C
 slave address
Date: Tue, 20 May 2014 17:57:26 -0400
Message-ID: <20140520215726.GU32082@beef>
References: <1398295293-11033-1-git-send-email-mporter@linaro.org>
 <1398295293-11033-3-git-send-email-mporter@linaro.org>
 <20140428115627.GY21279@lee--X1>
 <20140428140910.GB7719@beef>
 <20140520161131.GB32025@lee--X1>
 <20140520190055.GQ12304@sirena.org.uk>
 <20140520202923.GT32082@beef>
 <20140520214439.GS12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140520214439.GS12304-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2014 at 10:44:39PM +0100, Mark Brown wrote:
> On Tue, May 20, 2014 at 04:29:23PM -0400, Matt Porter wrote:
>=20
> > Just resent the v2 series.
>=20
> I looked at that but it seems I already acked the regulator part of the
> series and nothing else looked immediately relevant?

The series has cross dependencies (shared header include) and thus needs
to have both the mfd and regulator portions merged together. You had
mentioned in the v1 version that you'd like to take it through the
regulator tree and so Lee's comments earlier were with regard to you
taking the mfd portions.

-Matt

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTe8/GAAoJEOfTILNwq7R4Y+gP/iSar8tfntM3jQEcDadottmq
k1/+QtHNKFPYvwUw2RM2NFE4VulRh1Pv1Qh6uNTeFgXN2514G+CxMKWY8RUoZ2LJ
9ZG1PInq+Xf82uiScy79ytb4jcuaPTIam6RUcMY/9n9mOnbfA01apKWfZT9IzEnl
4xzzjtJRxxAv840mvTyaPd4LcEpLtTsQBqU2YMDyQXgJCFl+AmjuxDfCvJVoxDIb
XQa+IzJhQ5aijLX2xaf7L602TnjizxazDNBh8CA/yY+V/8QfC6T82IF/VBGTsYam
EpUL8LYVVdT6qL0C5FY2naxm1YqxlbZccRtlnKRtgEdvLLzxiOgNhFMGECdt36DB
StuMIVGAD5Y5DnUt8TD24QRg/5BSM5WZ3ZN2UCMNxLeXIeUPKA1tBy+Dtodbxox2
p3GpTnA8C4G6exKNdwx9AIDzfVaEcx+My+V+rJWF8dcgp0yHhHb1DpgZLMqgt5HR
OxrWlnBLhnDifU4vrcRZzX1lYVDGK7XaRpOQ2daaqVkvrDnI6FvCYxhokKLL9kU6
Ch9PqJ8YABkwosteQUHC6wIRL0MxpKdSlOZHHTz4LBxrWYgqEJIIqmFjJsxwZEbE
2R43REgdN/ISFziSMhVmKRWLrMzXh7RMFkZJ8fKCVDTf6hfAJavb8dwQ7McqJ7Ht
JpXOWf7rb+LLa6W/Qcqw
=7p7q
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
