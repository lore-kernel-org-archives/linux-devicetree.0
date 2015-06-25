Return-Path: <sfr@canb.auug.org.au>
Date: Thu, 25 Jun 2015 10:33:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v7 00/14] crypto: add a new driver for Marvell's CESA
Message-ID: <20150625103359.34d26955@canb.auug.org.au>
In-Reply-To: <20150625000037.GK31584@windriver.com>
References: <1434635190-27733-1-git-send-email-boris.brezillon@free-electrons.com>
	<20150619142444.GA15234@gondor.apana.org.au>
	<CAP=VYLqQynCNRTpm4JnOxeO6DH_739fO2QNcDMxaXqCKCHiTtQ@mail.gmail.com>
	<CAP=VYLpSrTvXRovWo4G7AXWv1OKFQRpQR255hS5z+=h4+XOLhg@mail.gmail.com>
	<20150621102418.2ea74910@bbrezillon>
	<20150621082717.GA29128@gondor.apana.org.au>
	<20150622092336.5949e258@bbrezillon>
	<20150622075910.GA7659@gondor.apana.org.au>
	<20150625000037.GK31584@windriver.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/M8UwRpFYe0+s/MxyWtgfE5q"; protocol="application/pgp-signature"
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Boris Brezillon <boris.brezillon@free-electrons.com>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, Arnaud Ebalard <arno@natisbad.org>, Tawfik Bayouk <tawfik@marvell.com>, Lior Amsalem <alior@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Eran Ben-Avi <benavi@marvell.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, "linux-arm-kernel@lists.infradead.org\" " <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Imre Kaloz <kaloz@openwrt.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Andrew Morton <akpm@linux-foundation.org>
List-ID: <devicetree@vger.kernel.org>

--Sig_/M8UwRpFYe0+s/MxyWtgfE5q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Wed, 24 Jun 2015 20:00:38 -0400 Paul Gortmaker <paul.gortmaker@windriver=
.com> wrote:
>
> [Re: [PATCH v7 00/14] crypto: add a new driver for Marvell's CESA] On 22/=
06/2015 (Mon 15:59) Herbert Xu wrote:
>=20
> > On Mon, Jun 22, 2015 at 09:23:36AM +0200, Boris Brezillon wrote:
> > > Hi Herbert,
> > >=20
> > > On Sun, 21 Jun 2015 16:27:17 +0800
> > > Herbert Xu <herbert@gondor.apana.org.au> wrote:
> > >=20
> > > > On Sun, Jun 21, 2015 at 10:24:18AM +0200, Boris Brezillon wrote:
> > > > >=20
> > > > > Indeed. Here is a patch fixing that.
> > > >=20
> > > > I think you should just kill COMPILE_TEST instead of adding ARM.
> > >=20
> > > The following patch is killing the COMPILE_TEST dependency.
> >=20
> > Patch applied.
>=20
> Just a heads up, this driver is still killing a couple of linux-next
> builds today and for the past few days.
>=20
> drivers/crypto/mv_cesa.c:1037:2: error: implicit declaration of function
> 'of_get_named_gen_pool' [-Werror=3Dimplicit-function-declaration]
>=20
> http://kisskb.ellerman.id.au/kisskb/buildresult/12448851/
> http://kisskb.ellerman.id.au/kisskb/buildresult/12448776/
>=20
> Missing dependency on CONFIG_OF_<blah> presumably.

Actually this is caused by patch "genalloc: rename
of_get_named_gen_pool() to of_gen_pool_get()" from Andrew's series.  I
fixed one of the breakages, but clearly not all.

I will add this patch to today's linux-next (Andrew, you will need
this, obviously):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 25 Jun 2015 10:31:33 +1000
Subject: [PATCH] crypto: marvell/cesa - another fix up for of_get_named_gen=
_pool() rename

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/crypto/mv_cesa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/mv_cesa.c b/drivers/crypto/mv_cesa.c
index 5bcd575fa96f..e6b658faef63 100644
--- a/drivers/crypto/mv_cesa.c
+++ b/drivers/crypto/mv_cesa.c
@@ -1034,8 +1034,8 @@ static int mv_cesa_get_sram(struct platform_device *p=
dev,
 			     &sram_size);
=20
 	cp->sram_size =3D sram_size;
-	cp->sram_pool =3D of_get_named_gen_pool(pdev->dev.of_node,
-					      "marvell,crypto-srams", 0);
+	cp->sram_pool =3D of_gen_pool_get(pdev->dev.of_node,
+					"marvell,crypto-srams", 0);
 	if (cp->sram_pool) {
 		cp->sram =3D gen_pool_dma_alloc(cp->sram_pool, sram_size,
 					      &cp->sram_dma);
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/M8UwRpFYe0+s/MxyWtgfE5q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVi0x9AAoJEMDTa8Ir7ZwVgFYP+gPIFn4D7LlLG9SChItaAmek
0He6RtWATowgK7/h/utmYiiGvw1mFz7GzINH4a/UG1/lx+lkcd5ARS4CbpzAUh2h
YMzVAcVRKBBLMDeNZF4aj2MZ8x/h3M2iWTdieOlivjfwGUXMztMNq85CbGMT3dkX
7t1s8BYsjmbCvMBegQ3miDPNSfASKZinqWaEOtpLw979zfGHiWuiRsuk2tQ+w0SC
BOVg7Qpbwp7UBnR1pAzkTMdv+o0VnkwRs0D93lmj/Fv1PDP16lTbl5bJ7Mx4X948
FhOXZn0B3uim71FjPswwgxFy8ZRSAoDnopDRVY5gntR9Hl8s+6owRoiJ36ZphahN
cwCREcouXl2ivnl1IknMmPI/QPFJkBXDsoy8tY3Tqo4hlrN4Sc7vGDk6E8W3Hr1Q
iwtAZ5MLXc18KejpQQGvKWYRpmrwGsc+0U/DPA+Xk4i7v4I5U1Mrsatb5yngkeTM
NVJkH4DRHqSxpliLei1qqs/wRAAgjFgKZa+GEAEC2nz/z8D8WkzZrtPYdlQcItRp
9vyUZrSkFWZoHfcWEm7/UmLpqJNxP0IPgQa6WpupFkE3k7eetBIA8RPtadDzO+Ii
nsitikVotx+KrKz0o2TR+6iCfzO/wycPLCDGFP+fiS3m5vVyIrJC1x4cB5E/tJk6
cBkf68H03ff5yFwLL1Pd
=HaAb
-----END PGP SIGNATURE-----

--Sig_/M8UwRpFYe0+s/MxyWtgfE5q--
