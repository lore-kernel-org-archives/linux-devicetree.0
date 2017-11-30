From: James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>
Subject: Re: [PATCH v4 2/8] MIPS: Octeon: Enable LMTDMA/LMTST operations.
Date: Thu, 30 Nov 2017 23:12:01 +0000
Message-ID: <20171130231200.GJ5027@jhogan-linux.mipstec.com>
References: <20171129005540.28829-1-david.daney@cavium.com>
 <20171129005540.28829-3-david.daney@cavium.com>
 <20171130213635.GH27409@jhogan-linux.mipstec.com>
 <54c83e6b-35e2-be38-e4f1-87eb420938cb@caviumnetworks.com>
 <20171130225614.GJ27409@jhogan-linux.mipstec.com>
 <c90ac3a5-7230-38ff-691a-3d94a25702cd@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3FyYKcuUbgqNYeqV"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c90ac3a5-7230-38ff-691a-3d94a25702cd-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Steven J. Hill" <steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--3FyYKcuUbgqNYeqV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2017 at 03:09:33PM -0800, David Daney wrote:
> On 11/30/2017 02:56 PM, James Hogan wrote:
> > On Thu, Nov 30, 2017 at 01:49:43PM -0800, David Daney wrote:
> >> On 11/30/2017 01:36 PM, James Hogan wrote:
> >>> On Tue, Nov 28, 2017 at 04:55:34PM -0800, David Daney wrote:
> >>>> Signed-off-by: Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> >>>> Signed-off-by: Steven J. Hill <Steven.Hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> >>>> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> >>>> ---
> >>>>    arch/mips/cavium-octeon/setup.c       |  6 ++++++
> >>>>    arch/mips/include/asm/octeon/octeon.h | 12 ++++++++++--
> >>>>    2 files changed, 16 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octe=
on/setup.c
> >>>> index a8034d0dcade..99e6a68bc652 100644
> >>>> --- a/arch/mips/cavium-octeon/setup.c
> >>>> +++ b/arch/mips/cavium-octeon/setup.c
> >>>> @@ -609,6 +609,12 @@ void octeon_user_io_init(void)
> >>>>    #else
> >>>>    	cvmmemctl.s.cvmsegenak =3D 0;
> >>>>    #endif
> >>>> +	if (OCTEON_IS_OCTEON3()) {
> >>>> +		/* Enable LMTDMA */
> >>>> +		cvmmemctl.s.lmtena =3D 1;
> >>>> +		/* Scratch line to use for LMT operation */
> >>>> +		cvmmemctl.s.lmtline =3D 2;
> >>>
> >>> Out of curiosity, is there significance to the value 2 and associated
> >>> virtual address 0xffffffffffff8100, or is it pretty arbitrary?
> >>
> >> Yes, there is significance.
> >>
> >> CPU local memory starts at 0xffffffffffff8000, each line is 0x80 bytes.
> >> so the 2nd line starts at 0xffffffffffff8100
> >=20
> > What I mean is, why is 2 chosen instead of any other value?
>=20
> That is explained in the change log of patch 5/8:
>=20
>=20
>      1st 128-bytes: Use by IOBDMA
>      2nd 128-bytes: Reserved by kernel for scratch/TLS emulation.
>      3rd 128-bytes: OCTEON-III LMTLINE

Ah yes. Perhaps it deserves a brief comment in the code, or even an
enum.

Cheers
James

--3FyYKcuUbgqNYeqV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlogkEAACgkQbAtpk944
dno/VQ//R327DASVMh5v/eOdFcua6kZsgAaZYRV5Xn0MbQY6VHb/pvVWJBGEcpcS
1a784u62NaBzdoxR2D+nc+HnnmR1EgZZUl2B94+QKXWF1D+TfiXUreHUsAdrtJ4p
jN1e+jp0frTjzCxGNDUwiBgWrX45i0B2/J9YKP+dfk4AiGBpIKUXERNcdf/4B9gq
+0jKxzHfw/DiYvQuXwxT0KSGP83s1J3NYPfphOeUFTAEi53+HjOd76hLdgN+zP2t
WyhcMd8Wjh59daPG/PYwkaIhcIACiz8a+dhmjW4NxRIIx9siHFf6WVUdWR1mVg1A
92J5yp0mxP6h40yaZIs1fi61dqOqaUQ6wxOR0kT5VMz31YHG49Ic5/n1Q9O3/cTD
KrPsBR/Ax24V73pjDzrA8mt7KjomH+gx6E0ASVAWDnYW2dt66pxXRLrrWA4J7YqY
2EcoatS3U1ZOJFA/BsjgMEnZBdYnD/JxfJAgRiUdoTkXaUDz17xAbZCjzKYsm7df
4fB73hF/i5+tZc1uyPu+uUEMDpz7sYPzG5QqXCjfdAoHKlMKKVCFV3AaBD9X8DM/
1oxkkCaAe0R48jXmIhw3o4YFuBdC3kJSn36US6cvg2DF2StPb3eoI2Y/mt9bOwbh
LnOOB4Y2mcoV64QQJjKAKKBbItZ6nCMjx2nsIEO0pbLqM+LVacM=
=qtEc
-----END PGP SIGNATURE-----

--3FyYKcuUbgqNYeqV--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
