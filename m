From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH RESEND] ARM: dts: Fix Makefile target for
 sun4i-a10-itead-iteaduino-plus
Date: Tue, 6 Oct 2015 10:37:28 +0200
Message-ID: <20151006083728.GQ2696@lukather>
References: <20150904124934.GD464@hansolo.redhat.com>
 <20150906112046.GK31584@lukather>
 <1444085717.2956.0.camel@decadent.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TRkqPRiqIDKgfg/F"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444085717.2956.0.camel@decadent.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Josh Boyer <jwboyer@fedoraproject.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Josef Gajdusek <atx@atx.name>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--TRkqPRiqIDKgfg/F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2015 at 11:55:17PM +0100, Ben Hutchings wrote:
> On Sun, 2015-09-06 at 13:20 +0200, Maxime Ripard wrote:
> > On Fri, Sep 04, 2015 at 08:49:34AM -0400, Josh Boyer wrote:
> > > Commit 79ae3e66f8d (ARM: dts: sun4i: Add Iteaduino Plus A10) added a =
new
> > > make target for the sun4i-a10-itead-iteaduino-plus dts file, but mist=
akenly
> > > used .dts instead of the correct .dtb suffix.  This resulted in a bui=
ld error
> > > like:
> > >=20
> > >         scripts/Makefile.dtbinst:42: target 'sun4i-a10-itead-iteaduin=
o-plus.dts' doesn't match the target pattern
> > >=20
> > > when doing a make dtbs_install.
> > >=20
> > > Fix it to use the proper file name.
> > >=20
> > > Signed-off-by: Josh Boyer <jwboyer@fedoraproject.org>
> >=20
> > Queued, thanks!
>=20
> This still isn't in Linus's tree; please make sure it gets to him
> before 4.3.

The pull request has been sent on sunday to arm-soc.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--TRkqPRiqIDKgfg/F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWE4hIAAoJEBx+YmzsjxAgjUUQAJGlP2rGD9t7OQFZBLIE93d1
ESFDCV0u37YqT0VFKctoxRo5A4Sx3KVhLamWcULcF5rLPUo1p2PGzpjob3Dec2XB
llOT25JW3VVNi9Du+By3YBlPDOtyZiNxjWHCR9S/Gg32bc6DAnAwyCrSIC8gjuTC
Ew9DrB2BY+lL1Gpjm0W50id/mz13EY0HR5qs3OK9hFSTVbmut27I4rqtPMPseXEr
MzaxHQH2DxFAY2Ua4cPh8vCky8nv5ed0W8lrySIJSxihIWJ/7ozLJZ7wWfDaTZpf
+du1Moxal4GdmZvXAWfraDBfGc43hagmpuqG7FxY76O68/LN5b/hNfGyIF4KJKGb
z6OptT/cAkYgWmBFSF5oCkF6LawWeELA6aIh/sxhr9r4FQuPNwdyOg2qKiZKvJhj
43W8ZFmAtYZhXpXzxkhIHASaqKVLmeAaY4Rq7zxwCYuep0m8vKYguHdECacRxv5J
bkMzkx5DtgmbutaopCBUraKMTrdQp5LA7u4KDitKtXmy/J52Hj6Yzzos+SQ1xJYy
XYBJfqklfiwqnZy3KVOJEolpD52sDP0UpSrjI2dEhOfD1dUy2EHw5/H3N8+alIyg
W4A2uR0zL1CiOjRFV4VDwZsdA+GMDaS8nEcv6L0VRPXa1gvzhqKIrLvuu1NNa3tj
7f1I4Qr1C3LaSC8QuXnf
=kNZ2
-----END PGP SIGNATURE-----

--TRkqPRiqIDKgfg/F--
