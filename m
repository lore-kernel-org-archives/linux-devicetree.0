From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] uio/pdrv_genirq: Add OF support
Date: Mon, 4 Apr 2011 19:31:49 +0200
Message-ID: <20110404173149.GB12200@pengutronix.de>
References: <1301574600-4861-2-git-send-email-monstr@monstr.eu>
	<20110331124925.GA2202@pengutronix.de> <4D948189.9070606@monstr.eu>
	<20110331170321.GA2734@local> <4D94C09B.4070506@monstr.eu>
	<20110331192302.GD2734@local>
	<AANLkTin6iSVQtKo602hceod+4=cVUMG=GR7cCZvHg4nO@mail.gmail.com>
	<20110331203024.GE2734@local>
	<20110402103550.GA21760@pengutronix.de>
	<20110404170437.GA4830@local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8862882565245514306=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110404170437.GA4830@local>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, gregkh-l3A5Bk7waGM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============8862882565245514306==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

> > If the generic driver is not sufficent for a user and he
> > patches it, he can simply patch the version string, too?
>=20
> Or better write a dedicated driver. Patching a generic thing like uio_pdr=
v_genirq
> can only be done in specialized drivers in a project. That's hackery that=
 won't
> make it into mainline anyway.

I exactly meant that, maybe didn't make it clear enough. Of course, a seper=
ate
driver would be better, but guess what will happen in most projects.

> > Or can we use the notifiers to set up an individual version? That could=
 also be
> > the place to do special board-setup connected to the selected version.
>=20
> How could that look like? If you have an idea for a generic solution, you=
're
> welcome.

That was more a brainstorming question; there are notifiers which help
populating function-pointers which also can't be expressed in a device-tree.
I just wanted to make sure this approach doesn't get overlooked.

So, the solution for now is to simply add a default value and we can check
later if it can be modified at runtime?

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAk2aAIUACgkQD27XaX1/VRu0awCgnnzK4TUgwhEAe7Th3/bXgCsK
WX8An1NKfgL9LYBuF2x03RQdrlItgGzf
=05Sm
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--

--===============8862882565245514306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8862882565245514306==--
