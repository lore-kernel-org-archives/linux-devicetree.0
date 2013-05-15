From: Tom Rini <trini@ti.com>
Subject: Re: [PATCH v4 0/19] Allow images to work on sandbox
Date: Wed, 15 May 2013 08:48:36 -0400
Message-ID: <20130515124836.GX29196@bill-the-cat>
References: <1367943123-16013-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1432148313=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1367943123-16013-1-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, u-boot-review@google.com, Joe Hershberger <joe.hershberger@ni.com>
List-Id: devicetree@vger.kernel.org


--===============1432148313==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="McQJJYUzjTUqtsGv"
Content-Disposition: inline


--McQJJYUzjTUqtsGv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2013 at 09:11:44AM -0700, Simon Glass wrote:

> This series adjusts the image code to work with sandbox and prepares it f=
or
> verified boot to come later.
>=20
> The primary goal here is to get image loading to work on sandbox, which is
> mostly a set of fairly minor changes such as using map_sysmem() instead of
> just a cast when converting from a U-Boot address to a pointer. Since
> common/image.c runs to over 3000 lines and half of it is FIT-related code
> behind an #ifdef, this code is moved into a new image-fit.c file.
>=20
> Changes in v4:
> - Bring in upstream version of fdt_first/next_subnode()
> - Use new upstream fdt_first/next_subnode()

Applied to u-boot/master, thanks!

--=20
Tom

--McQJJYUzjTUqtsGv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJRk4QkAAoJENk4IS6UOR1WSEUQAK2rOIMjpxHituQJSIEt+HBS
6bBpbfE+1EhOHszbvKIKpYlfYfBi1Z2fMJKVh1jbF2bgrOsLs60OLUab7fweP68Q
ObLA8MSv3QY3PgRseKe2SN0OIkkYDlwATQCL0H5wdQ7xWXMBXgWi92+5GGo7vL0T
Vv83lLvlMpLigEsYV46cyU5VMrMt+MIesHMQakoFzK6o1Ek/lb6NGrM9g7Mxozj1
lYlIye1oieObcuOJGt37Dk0QburCv3fDXXNE3dSG9Qd3Qtrmwz8TWB7AJfzdei5l
sDMmGl5xAyUq5/TSIioFqobUGjxK+G/xcZ3IEXyP/i+/mf/YVFww/KYNiMEc1qJ2
iE2YEy8frpHNDZZJZL97jQiW6qdw6pCs17b6H/VC1msTjqu8R4yx9vjxS8bW9YxK
T7dAiemT3Zh4kW0X6gM0eR8/Socuwm+atr9iqxCSwCti48BR26UbYCgputLp3mN+
UkGtXY9z0Xa0Pv2Er2XSyeJUo0pX4fsbQpwb7CB5H9mRYmGLe8TiNEcJYCmK8F0r
zMqRwzKVLXJDwesKZRxg58CD/0IYNaQcmIwmuvOwRlt6rKjn7DC+movyCFPThSzT
FvNEuqIGlwOVZ1dUccZyrpa8XhqTDl3HZ/+yAfbcJW+W1qTdjB3i4rF+1K6RXm6K
XOYoiYNsNLGAMHes/q8r
=qXs6
-----END PGP SIGNATURE-----

--McQJJYUzjTUqtsGv--

--===============1432148313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============1432148313==--
