From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH 2/4] powerpc, mpc52xx: add a4m072 board support
Date: Wed, 22 Jun 2011 10:25:41 +0200
Message-ID: <20110622082541.GB16605@pengutronix.de>
References: <1308729311-15375-1-git-send-email-hs@denx.de>
	<1308729311-15375-3-git-send-email-hs@denx.de>
	<20110622080959.GA16605@pengutronix.de> <4E01A43F.6030801@denx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7678524107927896392=="
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <4E01A43F.6030801@denx.de>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Heiko Schocher <hs@denx.de>
Cc: devicetree-discuss@ozlabs.org, linuxppc-dev@lists.ozlabs.org, Wolfgang Denk <wd@denx.de>
List-Id: devicetree@vger.kernel.org


--===============7678524107927896392==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> >> Grant? Do you have some comments on that patch?
> >=20
> > Can you use the mpc5200-include?
>=20
> Sorry, cannot parse this ...

Check other mpc5200-boards, like pcm030:

/include/ "mpc5200b.dtsi"

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk4BpwUACgkQD27XaX1/VRtwCACdH53bo72MpdlQDnxQeGRY63Yp
w8IAoI9plaDGwCO15CkJft0atB87myv8
=SDR5
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--

--===============7678524107927896392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linuxppc-dev mailing list
Linuxppc-dev@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/linuxppc-dev
--===============7678524107927896392==--
