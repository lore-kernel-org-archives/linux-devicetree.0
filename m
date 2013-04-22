From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 04/10] util_version: new helper for displaying version info
Date: Sun, 21 Apr 2013 20:25:46 -0400
Message-ID: <201304212025.47665.vapier@gentoo.org>
References: <1366078397-14889-1-git-send-email-vapier@gentoo.org>
 <20130419005046.GL16400@truffula.fritz.box> <E1UTztj-0006SA-F8@jdl.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3986083748496895432=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <E1UTztj-0006SA-F8-CYoMK+44s/E@public.gmane.org>
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
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============3986083748496895432==
Content-Type: multipart/signed;
  boundary="nextPart2623112.KsVrhO4pi1";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2623112.KsVrhO4pi1
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 21 April 2013 15:26:03 Jon Loeliger wrote:
> > On Mon, Apr 15, 2013 at 10:13:11PM -0400, Mike Frysinger wrote:
> > > This is so all utilities can have this flag and not just dtc.
> > >
> > >=3D20
> > >
> > > Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> > > Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> >=20
> > Jon,
> >=20
> > Please apply these first 4 patches, regardless of the rest of the
> > series.
>=20
> Done.

hmm, looks like patch #2 (utilfdt_read and handling of the len argument) wa=
s=20
taken from the first patch series rather than the 3rd ?

i'd suggest reverting it and applying instead the one from this series ...
Message-Id: <1366078397-14889-3-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
=2Dmike

--nextPart2623112.KsVrhO4pi1
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRdIOLAAoJEEFjO5/oN/WBMgAP/2E499NxK3xPPvaewUohulj9
/QmJR5iIZKyJ08Q9/CiCqeRii7yz8n821aE+yHy1Fzu/WuQmwtoMorG4XPhorT4h
CJNfK+oaoY2AmOq/sjHil4gvdOKJmPhUgAsmZZxNdkbiNbIp6GuIsIwkcC8LNHmw
igBslX6I6nxbb4RWCVPoP2VG0R/W6pbYtCHM61C2LikOfC5WbHPRtlEns8wr9NAw
ZsSq1C/WxJfO5mXIUIqV7b//sZAx0WZPQx45X4dSmZgW9FIp8phncQ+q2JyXoST7
2tU/BBoIPL2XJjPYqxksVJ0btni6vYCFvz98Qu4a/zR8OlGBRWg8sKsl4gltDvB2
sJjMaAuEIEdkv1ic8ZgTS4X/Kty/jMc21dSrVDroX2YJuFl2l4gGl300RItztiQ9
Y6B4iOsbMJAavJf52iYAIsMtMWU87B6Gr1hRWO3J6MuvZOmrZtc4c+Fr57F/H/FS
jH7lfOeED0nzvoRGKvJxlV3qtWw2PFNfhn1M1E9rvjFVAI96b7lDu6rUVi0xyEUY
t1irtZ0YyBrob+i67XMXa0qU1rXk7vTidqj/gkdrunQlIicFjGm222eh/dXuPqJW
ZyP9ZjCaFr028pG5bz9Ltvqs19y83I5GzFvmVFYNR2MJLvit9ddT7Cw1XGb6CvC2
OWSr5mzwti4jwGABx/Ps
=CCWG
-----END PGP SIGNATURE-----

--nextPart2623112.KsVrhO4pi1--

--===============3986083748496895432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3986083748496895432==--
