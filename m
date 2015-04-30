From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 1/2] usb: phy: msm: Use extcon framework for VBUS and ID
 detection
Date: Thu, 30 Apr 2015 10:16:47 -0500
Message-ID: <20150430151647.GF1515@saruman.tx.rr.com>
References: <1428568462-20193-1-git-send-email-ivan.ivanov@linaro.org>
 <1429601312.15866.11.camel@mm-sol.com>
 <1430393402.2400.14.camel@mm-sol.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uTRFFR9qmiCqR05s"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430393402.2400.14.camel@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Felipe Balbi <balbi@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--uTRFFR9qmiCqR05s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2015 at 02:30:02PM +0300, Ivan T. Ivanov wrote:
>=20
> Ping.
>=20
> On Tue, 2015-04-21 at 10:28 +0300, Ivan T. Ivanov wrote:
> > On Thu, 2015-04-09 at 11:34 +0300, Ivan T. Ivanov wrote:
> > > On recent Qualcomm platforms VBUS and ID lines are not routed to
> > > USB PHY LINK controller. Use extcon framework to receive connect
> > > and disconnect ID and VBUS notification.
> > >=20
> > > Signed-off-by: Ivan T. Ivanov ivanov@linaro.org>
> >=20
> > Hi Felipe,
> >=20
> > Did you have any comments on this and/or following patches?

see testing/next

--=20
balbi

--uTRFFR9qmiCqR05s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVQkdfAAoJEIaOsuA1yqREbCsP/0iY83Y8uiT8kG95KnfOX04f
VAhwbttwAEeRGdkfv/wkVlKaPuhbYigem1LTlkHbRT3iZYhNaH+l8HIU5xIPFSny
z/VEw4oSJcyZtjzvjNp1aDaXmklJu+iZaw8HT4xyx3pqbgtokDQdj7aN/5MhfVji
ioJOJ0dlYr8kwJmqAQdPpHGfxPcu1mzLdPwSECML7nKl8mdaU+nFNpsu7XI1OfFM
z8ZuEKcf6ufkbSyXaKHzhSyyThioZxGUNFWjKF1/ibxtcLbVq89FSHpAAPFvQ+YB
udjPMX8R2jqtF+UFc7WrNrEWwtFfhNlYNyutlJP2QV4k/Gmg+ubPLw/HkPlHepN8
+3SzZsdh6plMZ/V7ckf2sTKzKImfVvriaoEm+QDr40ka+EQ5iXYpEqeloySADncG
uRGdcEMnKAjIc6NNEN50VZUBTLXxeYx+Gghwg8ZDb7FH5KhUZsDotats324X68c8
8MVEeGOoWsBRh8xvEbVJe4M2FrxXA2jcPUuRv+YSBfsNmjRTLws1OLh1w9pXj3Ij
a0p5nds2MzylPlWmh325cuIHtbAuISv57kBjQpfSda2su3jhau8cuKPjpb7a30Tp
iIu4UeC9MrUVSCevfgPjRgY/Ne0CiPP22bfE50m1EwhbzqJ1zGZMKi4Lh6PAKUAc
us2JR2aeCK7pFDjOepuk
=JWog
-----END PGP SIGNATURE-----

--uTRFFR9qmiCqR05s--
