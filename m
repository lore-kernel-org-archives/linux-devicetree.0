From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 6/9] ARM: dts: wheat: Drop MTD partitioning from DT
Date: Tue, 22 May 2018 14:34:42 +0200
Message-ID: <20180522123442.wd3khrub6jxknvgi@ninjato>
References: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
 <20180522120257.13232-6-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0764681771686424383=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180522120257.13232-6-marek.vasut+renesas@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms+renesas@verge.net.au>, linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org


--===============0764681771686424383==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q2xxampfbtehszut"
Content-Disposition: inline


--q2xxampfbtehszut
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 22, 2018 at 02:02:54PM +0200, Marek Vasut wrote:
> Drop the MTD partitioning from DT, since it does not describe HW
> and to give way to a more flexible kernel command line partition
> passing.
>=20
> To retain the original partitioning, assure you have enabled
> CONFIG_MTD_CMDLINE_PARTS in your kernel config and add the
> following to your kernel command line:
>=20
>   mtdparts=3Dspi0.0:256k@0(loader),4096k(user),-(flash)
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-renesas-soc@vger.kernel.org

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--q2xxampfbtehszut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsEDmIACgkQFA3kzBSg
Kba5Jw/+LBT1sG6BDnqu5+ZMwd/TMl/uGPLfPVwsuKw4y3XqR5PJ4vzB7XEYRXO+
P9bjW7lvlTE12a2vmmtlMD5j80mVBOR+WY8MU8jeBrzNY31n26Ah4S3PO3ZYzCH4
q7QVjMpHS7C88jmw+YXaYwVzy8gKQaeW2fTWoWF+IXiTQR721h4NShuPMjdPMg5w
LuE/zc1LIBsUjPjHNdjD3C5nKqu2n81GJbj+5QLcd2y9+G6ndrjhYqEWSabNck86
Ml5xHoeLhEfH6j8w4OXt+aEVHNpl3Q6mdGtcrvE7WEKRbcPzH+8Xe64UM4Ucqfbn
hngIJzUOuaSrqj1J0vwl8WokK6tdb6TxzqCd3LQE3ei9cvgdSQU9wW849nj/zlVv
gHknA0eOB6FPrTzvpT3jc86AWYl/6usA+lsXOt+ZGi+CCaB+3l+ts5GleYZwNWE2
tet6cwSYzbd023Cxxt38JU99RfbK6u6AIrQ6Lwk9M/f/5Sj/4oh8PdRzhib6rpZl
nCAblM3TDVf6yN3qNo6Nd3EMWvRNp1FCz/e4snirsZ0eFx74xKYjKnaataPn0snn
yWlrYzGetd3c7RCV32duKqXgyMVywsBeN51MHGdEgZ/gsKm8cPbMxnmAHyeDqi26
JFl+4aAG1N3prBXlG/jdUHWvBgnqQvGNuTpEqJ5jYf+WyRMLEF4=
=fVzW
-----END PGP SIGNATURE-----

--q2xxampfbtehszut--


--===============0764681771686424383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0764681771686424383==--
