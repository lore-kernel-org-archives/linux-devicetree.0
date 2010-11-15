From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/2] powerpc: pcm030/032: add pagesize to dts
Date: Mon, 15 Nov 2010 23:11:56 +0100
Message-ID: <20101115221156.GA25167@pengutronix.de>
References: <1289841916-3825-1-git-send-email-w.sang@pengutronix.de>
	<1289841916-3825-2-git-send-email-w.sang@pengutronix.de>
	<20101115173250.GA22104@oksana.dev.rtsoft.ru>
	<4CE1A0E4.5030505@firmworks.com>
	<20101115212432.GA17754@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0368672539544521696=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101115212432.GA17754-wnGakbxT3iijyJ0x5qLZdcN33GVbZNy3@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============0368672539544521696==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > >I think you'd better drop the pagesize property altogether, and
> > >instead make the compatible string more specific (if needed at
> > >all. are there any 'catalyst,24c32' chips with pagesize !=3D 32?)
> >=20
> > Microchip makes a 24c32 part that looks pretty similar to the
> > catalyst part, but Microchip's has a 64-byte page size compared to
> > Catalyst's 32.
>=20
> Well, when using microchip part, the compatible string would be
> "microchip,24c32", correct? Then we have all the information
> already, no need for the pagesize.

Hmm, there are myriads of I2C eeproms out there, this table would be enourm=
ous.
Even worse, I seem to recall that I had once seen a manufacturer increasing=
 the
page-size from one charge to the next without changing the part-number, so I
got this feeling "you can't map pagesize to manufacturer/type" which I still
have. Sadly, this was long ago, so I can't proof it right now. Will try to =
dig
up some datasheets when in the office tomorrow. In general, I2C EEPROMs are
really a mess, the basic access method is the same, but except that everyth=
ing
else is possible :) Thus, this approach. Thus, this approach.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkzhsCwACgkQD27XaX1/VRsVpgCfayV57byIwB1sRCFYHeoqjlzM
UxwAoKB+TjuyyHnxjlizkg4emxzyghRM
=3/rs
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--

--===============0368672539544521696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0368672539544521696==--
