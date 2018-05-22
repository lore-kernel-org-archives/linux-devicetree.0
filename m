From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 7/9] ARM: dts: gose: Drop MTD partitioning from DT
Date: Tue, 22 May 2018 14:34:46 +0200
Message-ID: <20180522123446.corqi6446lrq6rxq@ninjato>
References: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
 <20180522120257.13232-7-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1865705448793954304=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180522120257.13232-7-marek.vasut+renesas@gmail.com>
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


--===============1865705448793954304==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2hj4k7iqegtbf7e2"
Content-Disposition: inline


--2hj4k7iqegtbf7e2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 22, 2018 at 02:02:55PM +0200, Marek Vasut wrote:
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


--2hj4k7iqegtbf7e2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsEDmYACgkQFA3kzBSg
Kba3+w/+KuJigluxJJ6OqF2CFIGoNKcEKfpJFTDYu833nkfE4V9dBnc0HTC2X7i7
M3/4jV+UseuH/gQ8HYkdLl3XbYm/MuTlOwm7bjVSs+A/jGaUkniXR7D/kxEjAkOf
9AAdMR9LbHkDzltXwO88GqPyEdTJHeFsp+3lXXlRSMAs4h7ObHmfbmZAQtkokCT4
2J0sZKtnXkleHZWIQvR1Rh2Ro3h8fEdmHDdjqPIJRKqe8x4ua0e+xLhxFSV6hLHC
lmVQB1yH6BRdCBeFSIwNmpUcQOI+bqS07YHDm5AuIm71hhxlBWIYCYo0uCVD69Xd
HQWX++OIm2EfudhJYE13F2oxTMbkT6uf1oIHLg+AFqKntheo7kb52dcrsQKSxlef
adoJBKs3PRGo6SOerZNw4yvqPhP2lZFTAiiElV+TQajk7kjtLHRxHyRyYg2gAHVe
l+/lNdWH6O+np0579+qLbkjiAVnHU2ViEE6M1bHNB8OtllaR9Yoex8V/rRPieuH0
kXi/Xxbcuq1HtO4FQtsxL+U9HW9vFc3501k/4uIGhHVcTLJw5COp+GM349HOG16g
AkwWZcioSCFxAA0N3QI61i7qOTSZOCxTI4ip0Z5cu9lVuwhpAcBIYIzyjkprPbx0
T7zmFPywq36dBKfDs7RoUH17zi6SyW2deY5lEf8UrY9UxQ7KO7U=
=U8tH
-----END PGP SIGNATURE-----

--2hj4k7iqegtbf7e2--


--===============1865705448793954304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1865705448793954304==--
