From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 0/2] Add support to make output voltage determined by
 VSET2[] bits
Date: Fri, 2 Oct 2015 17:55:48 +0100
Message-ID: <20151002165548.GT12635@sirena.org.uk>
References: <1443597950-27849-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aEcIyhw0mmnxygNd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443597950-27849-1-git-send-email-wenyou.yang@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wenyou Yang <wenyou.yang@atmel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--aEcIyhw0mmnxygNd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 30, 2015 at 03:25:48PM +0800, Wenyou Yang wrote:
> The patch is to add support to make the output voltage of ACT8865
> DC/DC regulator determined by VSET2[] bits. The DT property
> "active-semi,vsel-high" is used to specify the VSEL pin at high
> on the board. When the VSEL pin is high, output voltage is programmed
> by VSET2[] bits.

I'll apply these but they'll probably need some rework when someone
needs to support a board where the pin is connected to a GPIO and
controllable for fast voltage switching.

--aEcIyhw0mmnxygNd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWDrcUAAoJECTWi3JdVIfQ2Y4H/2ENSOAmeZRYV+oDLpbDGTc1
6EGa8T5SkN/wWCR5qrbD5M/XTy7YEwo2hKI9IMd33TFFYUdZNXSUc4X9A6lq7ZnY
cEMayowZPxv2usOsB2B1JibUpO1N+NbOmGLSzTpu+BYPJWaGlw1vZEYUrjaxXMey
gD6vcxlE34fQmO1JCpoFvQE6pHSQBVh3exRkFAFNPj+B5xVXukh06JKtnasZaxxv
H+7Co1YtofCcz+jLgY7+YCCTtnmmiNkaqJOw7e/5pgVbTK4xMfrGlTgwOtUNBJ7G
xiIz1bp+Pp/ATbxiDt2hQuBrdd4fkOeCDEJCQgiSWlgF18eOHQ2/UdxLiB8ZLK4=
=+894
-----END PGP SIGNATURE-----

--aEcIyhw0mmnxygNd--
