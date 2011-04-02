From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] uio/pdrv_genirq: Add OF support
Date: Sat, 2 Apr 2011 12:35:50 +0200
Message-ID: <20110402103550.GA21760@pengutronix.de>
References: <1301574600-4861-1-git-send-email-monstr@monstr.eu>
	<1301574600-4861-2-git-send-email-monstr@monstr.eu>
	<20110331124925.GA2202@pengutronix.de> <4D948189.9070606@monstr.eu>
	<20110331170321.GA2734@local> <4D94C09B.4070506@monstr.eu>
	<20110331192302.GD2734@local>
	<AANLkTin6iSVQtKo602hceod+4=cVUMG=GR7cCZvHg4nO@mail.gmail.com>
	<20110331203024.GE2734@local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2320816601950994652=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110331203024.GE2734@local>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>
Cc: gregkh-l3A5Bk7waGM@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============2320816601950994652==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> For UIO, it is not enough to just know "we have this chip using that driv=
er",
> at least not for a generic driver like the one proposed in this patch.

So, what about setting this string to a default (e.g. '0' or 'generic' or
whatever). Then, userspace knows this is the unmodified upstream version of=
 the
generic driver. If the generic driver is not sufficent for a user and he
patches it, he can simply patch the version string, too?

Or can we use the notifiers to set up an individual version? That could als=
o be
the place to do special board-setup connected to the selected version.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAk2W/AYACgkQD27XaX1/VRuDygCgpTl0PepbmFDomLwo6mHFrVeJ
tbsAoLvL5Q4tc3hduZa4d7KkVrlUkxgt
=gUVi
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--

--===============2320816601950994652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2320816601950994652==--
