From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 04/10] util_version: new helper for displaying version info
Date: Mon, 22 Apr 2013 17:16:34 -0400
Message-ID: <201304221716.35762.vapier@gentoo.org>
References: <1366078397-14889-1-git-send-email-vapier@gentoo.org>
 <201304221154.08100.vapier@gentoo.org> <E1UUNba-0005oJ-Ur@jdl.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0080871519836855933=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <E1UUNba-0005oJ-Ur-CYoMK+44s/E@public.gmane.org>
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

--===============0080871519836855933==
Content-Type: multipart/signed;
  boundary="nextPart2098447.VkYVqsYdJU";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2098447.VkYVqsYdJU
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 22 April 2013 16:44:54 Jon Loeliger wrote:
> > On Monday 22 April 2013 11:37:12 Jon Loeliger wrote:
> > > > hmm, looks like patch #2 (utilfdt_read and handling of the len
> > > > argument) was taken from the first patch series rather than the 3rd
> > > > ?
> > > >=20
> > > > i'd suggest reverting it and applying instead the one from this
> > > > series ... Message-Id:
> > > > <1366078397-14889-3-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> > >=20
> > > Please send me the version you want applied.
> >=20
> > attached
>=20
> ...and re-applied.  Sorry about that.

np.  things look good now.
=2Dmike

--nextPart2098447.VkYVqsYdJU
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRdaizAAoJEEFjO5/oN/WBs6QP/3CgIZxJ3hIJyW446MGT11fW
nX7dQK0etr94zXiFVFpfLI7CfmWb+axnFl4CmqJwCv2GO91Fe44lpv1IwOns8s+E
DvM7yiWG/aDl4nNpuHRot8CmHaRAiGVVroXqsNyaTFBhpMK10vSK9E9Gxk8zjNq2
pABw3QpT+WCd2f9DVqizG8DP0COMvhTdCninZft5sOR2Met0fT0aBNqOwnUnp/Ug
5cVZ7Jx/Ysy5+AKASAvf/a2+J8SG8ukGXAXvymZ9ZDiSqDkJ2KNZZA1cbbZ8Ou1f
w/6FjLK6SuvjQ2kitkTG3EiqNg8nN6eF+4lgOsDptqJ0nqdLGtgQPsU3I88HiyAM
2w0j3g40lTfXDYx0vSSnY4q4HNXAOq1kTuGFqvmlJU57Q84fnRc/9pTs1XZWxApE
bX/3E4xKlSB0UBHL1T2mZaK+ecQL4XrMyOCJT+3DtplbDlT3KD31VcOf2a/IAz0N
iZKZKGA1VgIrFZAsqLxwUjOh7VCHUeeBe274nHBVoyINPE1CFEcMQloFsG30XEd4
buq6YVVwYSmLqOWBcClB/JoEIP2Zrj+tdYz/iT1Z7Om0kP10FXTYpJIllBikTTHi
xurCG+UZQ3AyvUq6NdSP+ici+e0CNn5c4F2vy9EhT1S2/iyC/9MSEN3EtoROCxm9
55ZBhq5WV1KAB5RdBWCW
=oxHK
-----END PGP SIGNATURE-----

--nextPart2098447.VkYVqsYdJU--

--===============0080871519836855933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0080871519836855933==--
