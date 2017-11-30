From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH v4 2/8] MIPS: Octeon: Enable LMTDMA/LMTST operations.
Date: Thu, 30 Nov 2017 21:36:35 +0000
Message-ID: <20171130213635.GH27409@jhogan-linux.mipstec.com>
References: <20171129005540.28829-1-david.daney@cavium.com>
 <20171129005540.28829-3-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7012386805921380208=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20171129005540.28829-3-david.daney@cavium.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: David Daney <david.daney@cavium.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-mips@linux-mips.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, Carlos Munoz <cmunoz@cavium.com>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, "Steven J.
 Hill" <steven.hill@cavium.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

--===============7012386805921380208==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RMedoP2+Pr6Rq0N2"
Content-Disposition: inline

--RMedoP2+Pr6Rq0N2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2017 at 04:55:34PM -0800, David Daney wrote:
> From: Carlos Munoz <cmunoz@cavium.com>
>=20
> LMTDMA/LMTST operations move data between cores and I/O devices:
>=20
> * LMTST operations can send an address and a variable length
>   (up to 128 bytes) of data to an I/O device.
> * LMTDMA operations can send an address and a variable length
>   (up to 128) of data to the I/O device and then return a
>   variable length (up to 128 bytes) response from the IOI device.

Should that be "I/O"?

>=20
> Signed-off-by: Carlos Munoz <cmunoz@cavium.com>
> Signed-off-by: Steven J. Hill <Steven.Hill@cavium.com>
> Signed-off-by: David Daney <david.daney@cavium.com>
> ---
>  arch/mips/cavium-octeon/setup.c       |  6 ++++++
>  arch/mips/include/asm/octeon/octeon.h | 12 ++++++++++--
>  2 files changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/se=
tup.c
> index a8034d0dcade..99e6a68bc652 100644
> --- a/arch/mips/cavium-octeon/setup.c
> +++ b/arch/mips/cavium-octeon/setup.c
> @@ -609,6 +609,12 @@ void octeon_user_io_init(void)
>  #else
>  	cvmmemctl.s.cvmsegenak =3D 0;
>  #endif
> +	if (OCTEON_IS_OCTEON3()) {
> +		/* Enable LMTDMA */
> +		cvmmemctl.s.lmtena =3D 1;
> +		/* Scratch line to use for LMT operation */
> +		cvmmemctl.s.lmtline =3D 2;

Out of curiosity, is there significance to the value 2 and associated
virtual address 0xffffffffffff8100, or is it pretty arbitrary?

> +	}
>  	/* R/W If set, CVMSEG is available for loads/stores in
>  	 * supervisor mode. */
>  	cvmmemctl.s.cvmsegenas =3D 0;
> diff --git a/arch/mips/include/asm/octeon/octeon.h b/arch/mips/include/as=
m/octeon/octeon.h
> index c99c4b6a79f4..92a17d67c1fa 100644
> --- a/arch/mips/include/asm/octeon/octeon.h
> +++ b/arch/mips/include/asm/octeon/octeon.h
> @@ -179,7 +179,15 @@ union octeon_cvmemctl {
>  		/* RO 1 =3D BIST fail, 0 =3D BIST pass */
>  		__BITFIELD_FIELD(uint64_t wbfbist:1,
>  		/* Reserved */
> -		__BITFIELD_FIELD(uint64_t reserved:17,
> +		__BITFIELD_FIELD(uint64_t reserved_52_57:6,
> +		/* When set, LMTDMA/LMTST operations are permitted */
> +		__BITFIELD_FIELD(uint64_t lmtena:1,
> +		/* Selects the CVMSEG LM cacheline used by LMTDMA
> +		 * LMTST and wide atomic store operations.
> +		 */
> +		__BITFIELD_FIELD(uint64_t lmtline:6,
> +		/* Reserved */
> +		__BITFIELD_FIELD(uint64_t reserved_41_44:4,
>  		/* OCTEON II - TLB replacement policy: 0 =3D bitmask LRU; 1 =3D NLU.
>  		 * This field selects between the TLB replacement policies:
>  		 * bitmask LRU or NLU. Bitmask LRU maintains a mask of
> @@ -275,7 +283,7 @@ union octeon_cvmemctl {
>  		/* R/W Size of local memory in cache blocks, 54 (6912
>  		 * bytes) is max legal value. */
>  		__BITFIELD_FIELD(uint64_t lmemsz:6,
> -		;)))))))))))))))))))))))))))))))))
> +		;))))))))))))))))))))))))))))))))))))
>  	} s;
>  };

Regardless, the patch looks good to me.

Reviewed-by: James Hogan <jhogan@kernel.org>

Cheers
James

--RMedoP2+Pr6Rq0N2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlogedsACgkQbAtpk944
dno6TQ//cBKLiMBKY1ej+YMEs/mD2KqI7SzAGM+p4kd4W9vyupZAqoykaKI0jyE2
/8vcfhs6bbRzZKqKZCzacbiLMGHFuz5XKHhCyA07AfCmjucHjhle9uwJlSNp3Aha
QYLV3raX9lH4p06zXfaDpjLqa5PCvNakHeOl7M+2M5pcBFFAskopfjeQW6d8/+WS
8QSSLRqvcTMcpqne0d/6fv5njqH26zkTZ8tFt9hNbLsGAQfmFuLD9Rr2Wv+4hHez
caYKzlTyCvDc7qqYbGCO5nfptG93lR4dxCEPgO36Yx38uRo5ZfZd2fk0gDAuHnrN
SkFbHlJMav0VPsK7T8NlrUmDsxCxzU6BmaIc5eV2j0w2jL5XL34PbPpCRpzJucoC
LxPJJijHy/N7rt9mluU9UwV4y1hgUNWGiXcTGTTSOzxzvJ/rgHpHDgA59TIw5+5L
SaD0Vo44ugn/SkP3WX8mUuILD7+rgv21tJ0ZcZK4Fdve3FF1zdxwxwdF51tWB8+q
Yov/c9oFbE3/q2ubItGTDOVseMPV70m1aqzNyC4u7UNjVvgL23E7makXaGp++Yij
WNTtOsOTULu0tH1IDf6UvVh0WYe9MmDrmqzvHTrBSAOZTGVuUMFTjtyPNLtzPtoa
6cQzY7dfSZxwtMePx8TrmHqDuGgQIechnbJyaKy6ffVWE2oAp3o=
=cKI+
-----END PGP SIGNATURE-----

--RMedoP2+Pr6Rq0N2--

--===============7012386805921380208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============7012386805921380208==--
