From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] mtd/maps: add mtd-ram support to physmap_of
Date: Mon, 10 Aug 2009 18:19:42 +0200
Message-ID: <20090810161942.GA27833@pengutronix.de>
References: <1247834363-28198-1-git-send-email-w.sang@pengutronix.de>
	<fa686aa40908072243x56d2160fk688149f4b7b912ae@mail.gmail.com>
	<1249795043.9157.37.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6576253778257116580=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1249795043.9157.37.camel@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Artem Bityutskiy <dedekind-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Vitaly Wool <vwool-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, Albrecht =?iso-8859-15?Q?Dre=DF?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ken MacLeod <ken-VbOJbV3qneKf+c8Povm/Gg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============6576253778257116580==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 09, 2009 at 08:17:23AM +0300, Artem Bityutskiy wrote:
> On Fri, 2009-08-07 at 23:43 -0600, Grant Likely wrote:
> > On Fri, Jul 17, 2009 at 6:39 AM, Wolfram Sang<w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wr=
ote:
> > > Use physmap_of to access RAMs as mtd and add documenation for it. Thi=
s approach
> > > is a lot less intrusive as adding an of-wrapper around plat-ram.c. As=
 most
> > > extensions of plat-ram.c (e.g. custom map-functions) can't be mapped =
to the
> > > device tree anyhow, extending physmap_of seems to be the cleanest app=
roach.
> > >
> > > Tested with a phyCORE-MPC5121e.
> > >
> > > Signed-off-by: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >=20
> > Looks good to me.
> >=20
> > Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>=20
> This patch is sitting in my l2-mtd-2.6.git tree.

Great, thanks a lot (and for your l2-tree in general!). One question: Are t=
he
additional Acked-bys added later? I could think they might be useful for
David's review...

Kind regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqASJ4ACgkQD27XaX1/VRtxLwCeKVSaOJ+BJhVWeZMsFQ17Mpqt
uWEAn3VzrFmKQpaJo8EcQPP1/DAgMgLr
=k6lN
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--

--===============6576253778257116580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6576253778257116580==--
