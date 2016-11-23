From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sunxi: Enable UEXT related nodes for Olimex
 A20 SOM EVB
Date: Wed, 23 Nov 2016 09:03:50 +0100
Message-ID: <20161123080350.fstwdfndghk7c5xx@lukather>
References: <20161121164911.76900-1-manu@bidouilliste.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0260327839155272626=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161121164911.76900-1-manu@bidouilliste.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Emmanuel Vadot <manu@bidouilliste.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0260327839155272626==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v3imamwgdfptvdfe"
Content-Disposition: inline


--v3imamwgdfptvdfe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2016 at 05:49:11PM +0100, Emmanuel Vadot wrote:
> UEXT are Universal EXTension connector from Olimex. They embed i2c, spi
> and uart pins along power in one connector and are found on most,
> if not all, Olimex boards.
> The Olimex A20 SOM EVB have two UEXT connector so enable the nodes found =
on
> those two connectors.
>=20
> Signed-off-by: Emmanuel Vadot <manu@bidouilliste.com>

Fixed the indentation of the spi pinctrl cells, and applied.

Please note that I'm note planning to send any new pull request, so
this will likely end up in 4.11.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--v3imamwgdfptvdfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYNU1mAAoJEBx+YmzsjxAglXsP/ikqHIKphuyfcEKuFBxfTmey
a9lH9UBv5fftuc5e2Ra1NN1R5hUQ88yerYuU40c/oypGjVtEQ6K3yU4YpVQ81kiV
/rHzTyk6oHwUCCoUWhTL+2nPva8hJH9ibc9FdyTlMz8hYNh+TjlsqikoFOEaPw5g
sMrPzIcPeFctHWBnCU/Drj1n1pX8AdmkbQ7nygTXAtbNH+ZPrHLCEHoP7Tvorpfh
cmySHkUtVKqkmUCUPnneVA7q7TwPATu6JFwKwUnKnh2Y03QSUNWfoD/EPTvA4TyI
qtp6DsbCNlb+LyDK/GX10A2S8mURPWNn4VidYZlE0fTXQcgl6BlnU478t+3EJjWb
7PTvMuMWBTRizJ9RxLU5OqGwjn20ZhqCF2IFOYWB6AD6qBM5251klcgDaV0OzDR9
XvVcrlCM9SJ0WzdUyh9Wxv8rJ6y2fFflPMZ6G42JXGi5c0nVToovGHnd6F4dwEnX
xGaCEwI/s/3RCP4AugckyyPAPQC/9mBX1MNNZS7pjyLxo35IjZ5ucWhGErJe3O2y
Y7I1N/2h9fpUy0QqWNXgJq/5kALvs+UeHWvKFngdv3aDskRvc2BbBt7YAbItC1AT
/iJ9/km0Lyxhzdnzc6bsdN1UptiVlc7U0iwI84QnVCExlJ1l3g5Qx5ETJWjWKZRB
ajXyEKg+tdYYqUzz7Hka
=PrJO
-----END PGP SIGNATURE-----

--v3imamwgdfptvdfe--


--===============0260327839155272626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0260327839155272626==--
