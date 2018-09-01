Return-Path: <SRS0=CDSW=LP=the-dreams.de=wsa@kernel.org>
Date: Sat, 1 Sep 2018 14:53:50 +0200
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 2/2] i2c: imx-lpi2c: Remove mx8dv compatible entry
Message-ID: <20180901125350.GG1196@kunai>
References: <1535721855-5595-1-git-send-email-festevam@gmail.com>
 <1535721855-5595-2-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oOB74oR0WcNeq9Zb"
Content-Disposition: inline
In-Reply-To: <1535721855-5595-2-git-send-email-festevam@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-imx@nxp.com, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>


--oOB74oR0WcNeq9Zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 31, 2018 at 10:24:15AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
>=20
> mx8dv never entered into production and there is no other place
> in the kernel referring to this SoC, so remove it from the
> driver's compatible entry.
>=20
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Applied to for-current, thanks!


--oOB74oR0WcNeq9Zb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluKi94ACgkQFA3kzBSg
KbZoORAAglIPKYcO4hIeeTRbUIbioPqcUorxm24/4kVZsU/o+xaLyTZ2YjVKCCRw
3s3INfm4dFo9JHqe9/PDX0AHBSRqS+Ny8O8t/lhAZ+504PtsaBqW6n2+j5oSo0Rz
KRy6TVqRUIb4Luym3gqZRAHjcKcMUZbqasNbpnTs4nkgiuupShUyylLcVpxbgqKI
O0oUUc5YTzJHI15P2P97aPVi160a8Oh+MUhCVSK/J7VXJTZTn27F1jVpFYFCOnsg
dGa+AxrYDMAqANX4SYXzZ55Y9Q7XFhkvsOfykX4Jsx1rWYWXDUkUuvKJ52mLn/r+
ahhazayY9vTpP2tooMUBBf79XYxAg1J5Fi9LCoXrn1A+EnVkqEATr5Ndy1ksQEkW
HzxnWx7gZ9XwDQ4vlcGlfEGA59S13QaQFDxJ9vyHRTaV0a1y7KhAYgoGXIBJX37n
tCSM8HwBIbxVFs9jQUlRFRLupGm7fGgcwWJn58SyJ0Ypw3+xTTY5Ha26ybGuaLrQ
/3qKQq8V84KW0hDHeOUDaWZVBsG/44ctzWd+LQBzDX1qnoremFZNnTEVZtTeIfme
UXy4Xc+lbU34HInp+66VldohxOhPi5JNIdQajXiM5Vv/UblWuCfHLkPjHz7uzviQ
H5YnMUwb+QmlLrzWpNrdBt9kntOcEvbD2i/SA1kYz76EBFShD2I=
=Pr9f
-----END PGP SIGNATURE-----

--oOB74oR0WcNeq9Zb--
