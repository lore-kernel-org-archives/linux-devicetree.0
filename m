Return-Path: <SRS0=9zAw=QM=vger.kernel.org=devicetree-owner@kernel.org>
Received: from sauhun.de ([88.99.104.3]:57244 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbfBEMtp (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 5 Feb 2019 07:49:45 -0500
Date: Tue, 5 Feb 2019 13:49:43 +0100
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/2] i2c: Add DT bindings for Xscale I2C masters
Message-ID: <20190205124943.GG1045@kunai>
References: <20190128222534.32213-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3xoW37o/FfUZJwQG"
Content-Disposition: inline
In-Reply-To: <20190128222534.32213-1-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--3xoW37o/FfUZJwQG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2019 at 11:25:33PM +0100, Linus Walleij wrote:
> This adds a device tree binding for Intel XScale I2C
> masters. We define compatible strings for the iop3xx and
> ixp4xx chip families.
>=20
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to for-next, thanks!


--3xoW37o/FfUZJwQG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxZhmcACgkQFA3kzBSg
KbZEqg/+KLHXKiq+2geqemVKBV2rV6wqCj9TvHmFmoAVK8gDU/agEYC8H2MdOofh
F6DeJCnKOPyeD0NWiiqaYoNYaMh9swKG4BfJ+H19VnUQbR5yGZhft3zrIl+b0/iJ
Q8X/NBlyyPm7sFv3B2w/mFWF1AickDnC6m8IY6Ne88DrZBfXnK38zy0MnlYZlLMB
Wr0pUsCC4T0fitNqy97usRTHo+r5orRZZB0OT0zIYKHljI6mm9s/7jzOolVn3VFf
jWhX8zpepjAXaunzTR2+MDtl5xkzv5yg7ZGTUUoMvAZxK5DBD4/MBd7YZ6T5hCBN
cK32D00QknOVQtOHhTZ3HiuuJast2LKqMQ2+yLrxKStXoO5OA3GDAWr16bsktZC5
lHggFBRgVdx4/U4wJNQ7obJ9+gVMaFghKS3VAUthQ/c+JfXUDGGRN6WNjCUAOqYi
4rn0WPf/n5Mc13j+nndZbAT8UG871YB9vdYVnAU/F2+yaSxGbwCPoG0YdXjkJEa1
VYmq4qizwQxdX+IfvppLE7Mgj7C7mv8BxYNvt8am/Ck/irdkmGxkBssiokTvQ+ZK
v6mg2/38M7kZ3v345LI0B+iwdHPpT2UA/9B6qmt/08wwFPcJw5HFj5Fl7HteYX1Z
tXPdbQD9hPrjyjkiGt9DHm/OyvJkzYkj09cfbdj8KTPl7o/51uM=
=sNZZ
-----END PGP SIGNATURE-----

--3xoW37o/FfUZJwQG--
