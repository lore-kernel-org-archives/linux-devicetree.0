From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] arm64: dts: allwinner: Enable DDC regulator for Beelink
 GS1
Date: Mon, 12 Aug 2019 13:26:45 +0200
Message-ID: <20190812112645.avyyf5iexxatgrwe@flea>
References: <20190812102355.22586-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="myuur5a3gwhb4nbt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190812102355.22586-1-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--myuur5a3gwhb4nbt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2019 at 12:23:55PM +0200, Cl=E9ment P=E9ron wrote:
> Beelink GS1 has a DDC I2C bus voltage shifter. This is actually missing
> and video is limited to 1024x768 due to missing EDID information.
>
> Add the DDC regulator in the device-tree.
>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

Applied, thanks
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--myuur5a3gwhb4nbt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVFM9AAKCRDj7w1vZxhR
xXlfAQCzGoHNMF6inUbK/DxstBsOVMBjL9GAKYk4ftUwdU7LDQEAq6yMKoeAHhfX
FQiNLVXWJr+pVOrIPUOnWyLlp/Ocrgk=
=XUMj
-----END PGP SIGNATURE-----

--myuur5a3gwhb4nbt--
