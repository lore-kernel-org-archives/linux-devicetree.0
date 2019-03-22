Return-Path: <SRS0=rSv0=RZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:33295 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388202AbfCVMBU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 22 Mar 2019 08:01:20 -0400
Date: Fri, 22 Mar 2019 13:01:06 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 1/3] ARM: dts: i.MX50: Add i2c, mmc and spi aliases
Message-ID: <20190322120106.GC2095@latitude>
References: <20190315211423.11308-1-akurz@blala.de>
 <20190322014928.GU12513@dragon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline
In-Reply-To: <20190322014928.GU12513@dragon>
Sender: devicetree-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Alexander Kurz <akurz@blala.de>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2019 at 09:49:29AM +0800, Shawn Guo wrote:
> On Fri, Mar 15, 2019 at 09:14:21PM +0000, Alexander Kurz wrote:
> > Using aliases, the devices will be enumerated properly.
> >=20
> > Signed-off-by: Alexander Kurz <akurz@blala.de>
> > ---
> >  arch/arm/boot/dts/imx50.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/imx50.dtsi b/arch/arm/boot/dts/imx50.dtsi
> > index ee1e3e8bf4ec..82e7acd7fc2a 100644
> > --- a/arch/arm/boot/dts/imx50.dtsi
> > +++ b/arch/arm/boot/dts/imx50.dtsi
> > @@ -26,11 +26,20 @@
> >  		gpio3 =3D &gpio4;
> >  		gpio4 =3D &gpio5;
> >  		gpio5 =3D &gpio6;
> > +		i2c0 =3D &i2c1;
> > +		i2c1 =3D &i2c2;
>=20
> Reminded by Jonathan's patch, i2c3 is missing here.  I just fixed it up.
> Let's me know if you have a reason for not adding i2c3.
>=20
> Shawn

Thanks. With this addition, Alexander's patch looks good to me.


Jonathan Neusch=C3=A4fer

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAlyUzngACgkQCDBEmo7z
X9toCg/+O4zUJvkyPay1L24wIKZoQ/idZVTQ6hyaw6pO5NzvgaT3HsGad3m8evEE
JQ4KLJ5oNBYKKigEb7ugDlTb5WPup+mFAZDcHaTmhAa739/DcemdnSCap/umNMt0
jqHssq51I5kSRGlY2kqs0fm+Sk07VCaETh/4xhE05k6k3ttKtSAgKiAFmkyyR9NI
Cu9tX9acAAN3mZEkZWbkj6SdXOWF2Ifw+xcWKWY8LGGEyS0YubZ1mYzRrWjemZAK
AcJ657lLK93q6mVEZ+mZXefZ5Gsum/p+gWDtV3XgWESgarE4tmHlvtyVQ5okDr3D
PChIb3RDX+DzYr5kqvYFKCHcd8ImkQM++qfdU08QYmmhmW/cDCxaj71DK6JjOlip
V92IekHzamHqKKuG2Eg46NU6lqXM4jcEDaaww0+Tx6oz1YHb6fQP6AX1sy5V+D3N
8iQZ9bGJq4p/XFWpnU5A1QhABzezZkISR2x8aWP57cAAFJGmcVgFqdXrD8ICcPvo
zWHghSO8O2u4Gj22I3j9Gi0B9p/Q/xaNfbZIUSwuguQVyuv+Dg6b6f4/hBHRA49Q
ZHgtAcCNjCKuNDirIATbR8F53fnyTikf91o20/B1Rt6vBPbgozpFMhJOI3Sqpz9/
FhQXHF343UpB2T0cNRWGoSXXPL00mc6XKPCPfqiURRoXJQll3zo=
=N8UB
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--
