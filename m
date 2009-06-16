From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH V2 2/2] mtd/maps/mtd-ram: add an of-platform driver
Date: Tue, 16 Jun 2009 15:20:05 +0200
Message-ID: <20090616132005.GD21321@pengutronix.de>
References: <1244203514-12516-3-git-send-email-w.sang@pengutronix.de>
	<1245087807.3185.0@antares> <20090616091801.GC21321@pengutronix.de>
	<fa686aa40906160553m2f0e7cc4n644c3893573845f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0575948303=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40906160553m2f0e7cc4n644c3893573845f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Albrecht =?iso-8859-1?Q?Dre=DF?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============0575948303==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7DO5AaGCk89r4vaK"
Content-Disposition: inline


--7DO5AaGCk89r4vaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > Grant wondered if we need a bankwidth. IMHO it is needed for now, but I=
 don't
> > know if this is a common agreement.
>=20
> I'm not happy about the use case though.  It probably shouldn't appear
> in this binding, or if it does it should be tagged as an optional
> property.  It is only in the 5200 localplus case that bank-width is
> needed to figure out how to apply the workaround.

Maybe there is a misunderstanding here. I am not talking about Albrecht's c=
ase.
What I replied to your concern is that bankwidth is used(!) in the underlyi=
ng
map-ram-driver in mapram_erase() at the moment. Whether this is really need=
ed
could be discussed perhaps, but is beyond the scope of this patch series IM=
HO.
I'd think this can be addressed in a later series, if needed, although this
could mean that the binding will change (bank-width becoming optional).

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--7DO5AaGCk89r4vaK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko3nAUACgkQD27XaX1/VRtTkACfW0aUMJHrU3m4DCel0pm5fA6J
WaQAnjGo5fn6JvMHt3Ke/xFTGB1uYT6p
=V9t5
-----END PGP SIGNATURE-----

--7DO5AaGCk89r4vaK--

--===============0575948303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============0575948303==--
