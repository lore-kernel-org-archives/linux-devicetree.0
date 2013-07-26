Return-Path: <devicetree-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:46687 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751780Ab3GZTQU (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Fri, 26 Jul 2013 15:16:20 -0400
Date: Fri, 26 Jul 2013 22:16:10 +0300
From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH] arm: dts: omap5: Add status parameter for i2c/spi/uart.
Message-ID: <20130726191610.GD13228@radagast>
Reply-To: <balbi@ti.com>
References: <1374837937-19677-1-git-send-email-sourav.poddar@ti.com>
 <51F25D3B.9030306@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x4pBfXISqBoDm8sr"
Content-Disposition: inline
In-Reply-To: <51F25D3B.9030306@ti.com>
Sender: devicetree-owner@vger.kernel.org
To: Sourav Poddar <sourav.poddar@ti.com>
Cc: devicetree@vger.kernel.org, benoit.cousson@linaro.org, tony@atomide.com, balbi@ti.com
List-ID: <devicetree@vger.kernel.org>

--x4pBfXISqBoDm8sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 26, 2013 at 04:57:55PM +0530, Sourav Poddar wrote:
> On Friday 26 July 2013 04:55 PM, Sourav Poddar wrote:
> >This patch disabled I2C/SPI/UART device initially(status =3D "disabled").
> >This devices will only be probed, if the devices are
> >present in the dts file(status =3D "okay").
> >
> >Signed-off-by: Sourav Poddar<sourav.poddar@ti.com>

please re-send with linux-omap also in Cc.

--=20
balbi

--x4pBfXISqBoDm8sr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJR8sr6AAoJEIaOsuA1yqREkKsP/3torVikkK7lLhsqDxKXBt3J
4oAPsNc+O32YlZvDKlY4lO/1S34rVrDAx2UvFjxqtpij/Mp2PxTfa/wx4cI3l7Ao
WfcnNgTC9DuWCYJEu4RzMBJQBaEEAtED8F41BCFSPFVEBUJc+N6JMOgH20NcRolr
EHtGwL3NxR6RmiQ+Mv/GvpyPRazKyrbKo6zFlPlRrYkEzJ/iaOtnfYLXSYBxURU3
tLk+98YuovowCvkcZhnr95VkCtL3R3Iu3oW6CEaWGSraXeUb6XiuvrkYcNOavIlB
zJUlFTP3t+Rf8LLjPHnOL5d0veaPY2YOcmbipbKtWohon/UAMrEmk0solDDpqyAW
h6wJe6GvQBx+f8pZQ+2GHFDkFos+yfGIBYIube5XJM3yiFYtOip9o5uuDXTHn3v8
G7jHRX1xs1cPkmwphKbtfwlY4tg05VG2thveeGPWN4o/cYmVYGc9Hi1830NG6p64
OcJzSFDiw5ZX2xcz2wHai95IyaBSXMqXiQILdCwV5JJCMa15cnLCZR1OXAjvYlj0
ZCTIp5AYWj1l1sLjMvVGi6JAvGtVxdfNqAhHxgh0WuzIuoxG7d0tQWFpuLDvcYI4
Vo8nMfqKIW2yx4T5zavFXP8+LKjI93FiyUkO/YKLHV6k71OJ92SyXJOFRZgsfJ/k
OnbcqCph4cFYpLnn3dvY
=NAY7
-----END PGP SIGNATURE-----

--x4pBfXISqBoDm8sr--
