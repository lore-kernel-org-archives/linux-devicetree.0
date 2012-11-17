From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: RFC: New release for DTC?
Date: Sat, 17 Nov 2012 12:50:07 -0500
Message-ID: <201211171250.08597.vapier@gentoo.org>
References: <201208232015.39613.yann.morin.1998@free.fr>
 <20120824013625.GA8067@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0983000935804960350=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120824013625.GA8067-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============0983000935804960350==
Content-Type: multipart/signed;
  boundary="nextPart8633822.OTPJloS4MA";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart8633822.OTPJloS4MA
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 23 August 2012 21:36:25 David Gibson wrote:
> On Thu, Aug 23, 2012 at 08:15:39PM +0200, Yann E. MORIN wrote:
> > Following advice from Jon Loeliger, I would suggest that a new release
> > of DTC be tagged and packaged.
> >=20
> > It is important for some projects to rely on a released version, rather
> > than use a random cset from the repository. Comes to mind, the automated
> > build-systems, such as buildroot.
> >=20
> > Of course, I can help, if need be! ;-)
> >=20
> > Are there any others who think that a release would make sense?
>=20
> This has been a bit of a perrenial problem.  dtc development has been
> sufficiently gradual that there haven't been many obvious points for
> making new releases.  dtc developers (i.e. Jon and my, mostly) don't
> feel much pain from the lack of releases, since the git snapshots
> generally work well (thanks to limited scope and a good testsuite).
>=20
> I wonder if we should move to a model of just making a release every 3
> or 6 months from whatever happens to be in the tree at the time
> (barring obvious known breakage, of course).

yes please.  even just a version that uses datestamps would be fine.
=2Dmike

--nextPart8633822.OTPJloS4MA
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJQp85QAAoJEEFjO5/oN/WBw9IP/AoCztahedyivDokyXBAUTeR
tvEMyAqLJ8P/S6rq5y/Xq9e2BbOVEq10dsVbTRsGpaMvD8X8OLF/shVWxLipLg82
+IpcsEfXxKTx8GGvo7YLBv3PI7jlFSoTEX8bDdWddCnV275Jc5VUmg7Ht8Xm9g6x
k+3FyMNq7mGRoDdDDK3iMd9QZ2nDGeC8J2k6FvPFlvp4BmmDsTHMtA6IR7QB/aCY
2t/s/pGpGgF1UlHYBMVzR3pJTkHkVc19fKGVn5q0QCbzA0TMbdWdF7wt9YSLqkgd
3xxA3pFp6sOgity2wTifdz8jFHG4mxY7u19MTv5Z7RzmkOOoxBuc9wpuTVXS5yWG
b4/hgFSKXjtdnDMHDu+/PqnkrRiV9BlEtjvLPYaSWqVqwSqAQDlrKNMk6saAUW/W
UVrKbFfjuLRWDKZilOqQjmKpy7T6ULVsoE5j4hguKnjeLU6op6ab5oDWcXvAJnDh
vIhgcLJELvX59S+v3QDNjhOqarZZvTmtOeVTioDCal9Ughn3BfycmlbCuOUP0HNb
p+hzc0UnN7G/EDX9NVfkiD/dm7c2gGXTUvIyBqE47sOnrUXowvi0xgnS8KH3IJV3
srC88Y50gImIZHtCMxtcciq1IUidzjxV5PkLLVzKEy3g6Tp79p9qWgegfB3xhti/
TCSPNtqsCBDgEwALmf8O
=jbGz
-----END PGP SIGNATURE-----

--nextPart8633822.OTPJloS4MA--

--===============0983000935804960350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0983000935804960350==--
