From: Dan Robertson <dan@dlrobertson.com>
Subject: Re: [PATCH v2 2/2] iio: (bma400) add driver for the BMA400
Date: Sat, 12 Oct 2019 16:38:39 +0000
Message-ID: <20191012163839.GB15972@nessie>
References: <20191012035420.13904-1-dan@dlrobertson.com>
 <20191012035420.13904-3-dan@dlrobertson.com>
 <20191012104033.006b33f9@archlinux>
 <20191012153556.GA15972@nessie>
 <20191012173344.7d25fd02@archlinux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191012173344.7d25fd02@archlinux>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, devicetree@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: devicetree@vger.kernel.org


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 12, 2019 at 05:33:44PM +0100, Jonathan Cameron wrote:
> On Sat, 12 Oct 2019 15:35:56 +0000
> Dan Robertson <dan@dlrobertson.com> wrote:
> > On Sat, Oct 12, 2019 at 10:40:33AM +0100, Jonathan Cameron wrote:
> > >
> > > Silly question.  Why is soft_reset preferred to sleep mode? =20
> >=20
> > Not a silly question. I actually debated this when initially implementi=
ng the
> > driver. The datasheet describes soft-reset behavior in section 4.9, the
> > following snippet from the datasheet is particularly relevant:
> >=20
> > > The softreset performs a fundamental reset to the device which is lar=
gely
> > > equivalent to a power cycle. Following a delay, all user configuration
> > > settings are overwritten with their default state... =20
> >=20
> > Sleep mode is the default power-mode, so the only real difference would=
 be that
> > the oversampling ratio, sampling frequency, and scale would all be rese=
t to
> > their defaults with a soft-reset. If we just set the power-mode to slee=
p mode,
> > the user configuration registers would be preserved.
> >=20
> > I can add a comment about the behavior of a softreset in bma400_remove.
> I'd just not do it.  That way there is only the putting it to sleep path.
> We normally assume that we don't know the state during startup and aren't
> as careful on remove to make sure things are in a default state.
>=20
> That way you only need a single path in the remove function. If sleep mode
> fails you are probably broken anyway.

Sounds good. That does make remove much easier if the device is not ready f=
or a
command. I'll remove this in the next patchset version.

Cheers,

 - Dan

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEF5dO2RaKc5C+SCJ9RcSmUsR+QqUFAl2iAYYACgkQRcSmUsR+
QqWfehAApr+GUxN8hPr6rvlGNCYOUAsH0xR5O1yDbOBeJ+KNTRu4yqOci19XXRvu
oZh7eexWE+Jg3cqomkO4MBTqFbcE8fSMVsRS1g/dBSmIjP8t7elUXkyo0+u8BKhM
BrPP/W9WnGQmj0m9crH9GYmAUh00KG1eG8JfPV/iO4Nj25FzyjidDgVdUb7+pieK
EE85HRYLxc4EjbgiR5aFfHrHS7gFv0k/JZYGpTseL93VmHkRWEXYGemvEMJeu/GY
+ZdHTL5kSyrQDsWOsc12B3uWxDbaVT0t6afEiaS0wHC5FeWg/axvldCO/SXaMSVy
FUUH9+kIbS1CofTosjTsEopz8gEvmfM+Gn2n4PoP3R8GPzQJYDB1JSanJBwJlUKX
70+27TdX1HQq7iapt5QvjeQfarCGCrcWX7fQs3Z8uJxeGX2+WgElE1K58Cy1pe+c
Z9DgLY1Baqb+njAWe5WAuLXaIBMsrbuJyu4jmanYdLD5OEkokbSdhht0Gcm2rRnp
jErnlJHmQNZ9U9fv87nM6hAbHorj1ABasLvc2nyCAlQyGUaYnzXvYEXMLqBGAmie
7Cjv2gd53aoLyfFq1F4Yy6ETWmo/0lzRPS9+Lv/jgPyr4z7Lch3tZEFAmQMRHz8P
WEza1Op588Do/vFarcCzQgHlPNfY1HS7P3J6ae2oFIB33cil8hc=
=0oSI
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
