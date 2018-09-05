From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [linux-sunxi] [PATCH v8 3/8] dt-bindings: media: Document
 bindings for the Cedrus VPU driver
Date: Wed, 05 Sep 2018 17:43:54 +0200
Message-ID: <147d5b518dbcdcff7874526b2a2c9442fae6e0e8.camel@paulk.fr>
References: <20180828073424.30247-1-paul.kocialkowski@bootlin.com>
 <20180828073424.30247-4-paul.kocialkowski@bootlin.com>
 <20180828144727.GB25644@Red>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1807562995703617190=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180828144727.GB25644@Red>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Alexandre Courbot <acourbot@chromium.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-sunxi@googlegroups.com, Randy Li <ayaka@soulik.info>, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@collabora.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============1807562995703617190==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-hIHydUUELpGpazyQv9Km"


--=-hIHydUUELpGpazyQv9Km
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 28 ao=C3=BBt 2018 =C3=A0 16:47 +0200, Corentin Labbe a =C3=A9crit =
:
> On Tue, Aug 28, 2018 at 09:34:19AM +0200, Paul Kocialkowski wrote:
> > This adds a device-tree binding document that specifies the
> > properties
> > used by the Cedurs VPU driver, as well as examples.
>=20
> typo Cedurs=3D>Cedrus

Thanks, will be fixed in the next iteration.

Cheers,

Paul

> Regards
--=20
Developer of free digital technology and hardware support.

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/

--=-hIHydUUELpGpazyQv9Km
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAluP+boACgkQhP3B6o/u
lQzegA/+OCVPUy6X5scef1qw+eWYwnMXxcslOME6qOH8YBIV/ngUlSxDHYp12EIP
B8lD04FQ3soDCR7W2vKqLqt4R5k+AIu6im92xEZOWRyqP/uyHtCk1FtaN9m0fK/s
GXwmuXMZhxOcosCaArFSdOgedYrznH4UJ7kEQDMfHvtG3Ric2A1pUzN8HTeOIl2p
CtygPYXnXfb6tjWOOJwAZ4doQBC+48g9ocDo2nEWDMJKPA6mwUoQl216gXqygN3A
OYt34JNDW3qMfm9wHrXLsMEQZGAiYi1szrh2/WKJxTB2XIURK7suTWfDaWOGGRns
ZPX5QvEnCVImMwa7/7TOWbelbhnZUmAJIVhoPoaEaORwMLNVwNDbAanQhLfS/8Jd
SaXJpAdZQXJeEoAH/ez88VOkOHA+okd0aWCEnwyH9fC9KUnmSIBICHHqZ89Yq4eb
kcA+JkdDKene/IOux4HluUqznVYPhTL49yh+QvKS5Y7eRqlLbWZjQQlNsNki8UMt
JCTFbNvTkWgnCY6SkZiDIyG0+IYf4hzB8k5ahqzFQv70OWq95hBYrQdeEVly9O72
Yfn+v1+CaTBuXz22zZZERlIVLRow2uVjdMqV7xhEY9eH2JH2Hgj7N1jKHd0P1JGa
JWbH0/I0Qspw0x+kBT0CQaoFagy+XtXr71QnKvxK3s8aybVoDGM=
=72Rb
-----END PGP SIGNATURE-----

--=-hIHydUUELpGpazyQv9Km--


--===============1807562995703617190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============1807562995703617190==--
