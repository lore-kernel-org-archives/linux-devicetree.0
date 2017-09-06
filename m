From: Alban <albeu@free.fr>
Subject: Re: [PATCH] MIPS: ath79: support devicetree selection
Date: Wed, 6 Sep 2017 15:35:43 +0200
Message-ID: <20170906153543.412774d5@avionic-0141>
References: <b78cb3ef8df8531efdb7b011743ad3f38978015d.1503070362.git.rocco.folino@gmail.com>
        <20170906111435.GA1856@linux-mips.org>
        <20170906142005.67586253@avionic-0141>
        <20170906123200.GA21761@void>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jQU_dr4pSoNtL.jEuVZBYlU"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170906123200.GA21761@void>
Sender: linux-kernel-owner@vger.kernel.org
To: Rocco Folino <rocco.folino@gmail.com>
Cc: Alban <albeu@free.fr>, Ralf Baechle <ralf@linux-mips.org>, robh+dt@kernel.org, mark.rutland@arm.com, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Antony Pavlov <antonynpavlov@gmail.com>, John Crispin <john@phrozen.org>
List-Id: devicetree@vger.kernel.org

--Sig_/jQU_dr4pSoNtL.jEuVZBYlU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 6 Sep 2017 14:32:00 +0200
Rocco Folino <rocco.folino@gmail.com> wrote:

> On Wed, Sep 06, 2017 at 02:20:05PM +0200, Alban wrote:
> > On Wed, 6 Sep 2017 13:14:35 +0200
> > Ralf Baechle <ralf@linux-mips.org> wrote:
> >  =20
> > > On Fri, Aug 18, 2017 at 05:32:42PM +0200, Rocco Folino wrote:
> > >  =20
> > > > Allow to choose devicetrees from Kconfig.
> > > >=20
> > > > Signed-off-by: Rocco Folino <rocco.folino@gmail.com> =20
> >=20
> > I don't really see the point of this patch. Building the dtb doesn't
> > take any significant time, so why add this extra complexity? =20
>=20
> Because you need to select the SoC type in order to enable some
> drivers, for example on the AR9331 to use the serial you need the
> CONFIG_SERIAL_AR933X which depends on the CONFIG_SOC_AR933X.

Seeing as this driver is the only one that make use of CONFIG_SOC_AR933X
I would prefer removing this dependency. It would also open the way to have
the driver built in COMPILE_TEST. A few more fixes might be needed but that
would be better than such a workaround.

Alban

--Sig_/jQU_dr4pSoNtL.jEuVZBYlU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZr/mvAAoJEHSUmkuduC28kxgQAORFiqXKg1pw3+lEg+hDkq2C
Mrjn8RYda6beNv7MgoCsPPzUEj9D0cNF7KrkQW48FPmdLl0ffqXRXgljEYOxSk6m
M7aiEiT954SqtWpxkIkV18E+wWmsaIUFeiS6occwl2l6h1Sk9dORMiqgXigCYNXP
kJ7KQVBt2V3Xs8uv8gCL/8kXGaSTkvgFwu8Sp7SnbBIVBIXihkOD9CCaQtZmS4Tv
MGg1qGdBV+BGBTRLavPuh0jchJXtv4GdYw1/NJeFAgeFHvt45o2X2RAnSDa7RcQy
mhdVMiN3K5KksiWyKeucZYI06DzlVZON7Pw4ABPcX9HMZoa6BtzFaeuaaouBF1Dh
yanSrxug9Kj1T9BxKkHSn162u5Ku1s8CeAO4IlsErXP0JK4nIDEmgFkxbz/tlSiT
c/iHGRwGk3Hu3adzwb45yVREGat9HQgzbyhTi9laoDWmM5wlT17INhfm8J3ETrPd
3RVy1IbOIlmvKE6svwGZENXrSisscSdFFBn7WKGP7y5pOVCirreFxcqBjj1LjHtz
TZLKR8dKcecVsQnoroI0gl5fBLAw9jzg3pGdzgLoOVrF1MqgiS+HHFncb7CppdS8
DKv2J3FqjjYr+42keoBRXD37OdPoLCcdD7TsUN7wSHI+TCS81xPWc9ItglAvbRTd
I7It/C/KXTjHPkdTe/Ei
=NCtQ
-----END PGP SIGNATURE-----

--Sig_/jQU_dr4pSoNtL.jEuVZBYlU--
