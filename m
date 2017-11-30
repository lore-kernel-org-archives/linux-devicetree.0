From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH v4 2/8] MIPS: Octeon: Enable LMTDMA/LMTST operations.
Date: Thu, 30 Nov 2017 22:56:15 +0000
Message-ID: <20171130225614.GJ27409@jhogan-linux.mipstec.com>
References: <20171129005540.28829-1-david.daney@cavium.com>
 <20171129005540.28829-3-david.daney@cavium.com>
 <20171130213635.GH27409@jhogan-linux.mipstec.com>
 <54c83e6b-35e2-be38-e4f1-87eb420938cb@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9iyR+p8Z2cn535Lj"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54c83e6b-35e2-be38-e4f1-87eb420938cb@caviumnetworks.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Carlos Munoz <cmunoz@cavium.com>
List-Id: devicetree@vger.kernel.org

--9iyR+p8Z2cn535Lj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2017 at 01:49:43PM -0800, David Daney wrote:
> On 11/30/2017 01:36 PM, James Hogan wrote:
> > On Tue, Nov 28, 2017 at 04:55:34PM -0800, David Daney wrote:
> >> Signed-off-by: Carlos Munoz <cmunoz@cavium.com>
> >> Signed-off-by: Steven J. Hill <Steven.Hill@cavium.com>
> >> Signed-off-by: David Daney <david.daney@cavium.com>
> >> ---
> >>   arch/mips/cavium-octeon/setup.c       |  6 ++++++
> >>   arch/mips/include/asm/octeon/octeon.h | 12 ++++++++++--
> >>   2 files changed, 16 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon=
/setup.c
> >> index a8034d0dcade..99e6a68bc652 100644
> >> --- a/arch/mips/cavium-octeon/setup.c
> >> +++ b/arch/mips/cavium-octeon/setup.c
> >> @@ -609,6 +609,12 @@ void octeon_user_io_init(void)
> >>   #else
> >>   	cvmmemctl.s.cvmsegenak =3D 0;
> >>   #endif
> >> +	if (OCTEON_IS_OCTEON3()) {
> >> +		/* Enable LMTDMA */
> >> +		cvmmemctl.s.lmtena =3D 1;
> >> +		/* Scratch line to use for LMT operation */
> >> +		cvmmemctl.s.lmtline =3D 2;
> >=20
> > Out of curiosity, is there significance to the value 2 and associated
> > virtual address 0xffffffffffff8100, or is it pretty arbitrary?
>=20
> Yes, there is significance.
>=20
> CPU local memory starts at 0xffffffffffff8000, each line is 0x80 bytes.=
=20
> so the 2nd line starts at 0xffffffffffff8100

What I mean is, why is 2 chosen instead of any other value?

Cheers
James

--9iyR+p8Z2cn535Lj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlogjI4ACgkQbAtpk944
dnpFwRAAvcdOoeuZmttJOSoZsf5ZGMk42m47eyYYXuo36qqZcyfjMbtA/98HbmvX
zHCrt/9ov5eNEjvxqT/9nrIqD3KoBN4veW6XiTu3gry38WF96yJRoxEMjuLllf8a
OTiIiP+Ls4Bskl2v1eL1uIVhRxaIC4AVlBQGnT4kD3f3rc+N3yjICHtacBXgxjOx
3+7LrD4Wu3INKwJp0V/LK4Lqnw3Mks39dYlu2JzJaCVOh018I9wOqSR9AGmhqQ7n
v+Od/nfHOahLRc7fE71X9Qnh3hY+U4Ohi9A7qb4ylxA7xd9UlJh9SohWtVtjm2vg
vvf21+dVqk+0XF/sh8paIhxbeFG9GoST0kQSh1huwF0UVHXI8moAG8t7VOMCw4le
TjvTNPrZqF11W2iUemdXF+Wy8OwK2EL8Ed1c2EZFjyli9cRv56Wlvrg4fi4qe2Bl
dc7G0Rm3b4oz3ohdBnJ34hc+TMK1EFTWXJ+Bpcif3ywJ7LgkWD0b+BuohItIteZi
VMJMM5hhYSv01/qWVcyhianytDX7L80ZHwql+H+ctfIRDxQWTUbgAlnqETFWn6Km
7eOpyEZJpmT1j11yqYleICjmTmL/0ju/AWrEVwEnEG5YeA0hhR67zeFZDmtLOFL5
AlGQvnuGtgAKe5Di404p2MYjDseJ57ROHg9HK1gRxFL2pp+7gE0=
=M4rc
-----END PGP SIGNATURE-----

--9iyR+p8Z2cn535Lj--
