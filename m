From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 05/10] fdtdump: make usage a bit more friendly
Date: Thu, 11 Apr 2013 12:31:36 -0400
Message-ID: <201304111231.37564.vapier@gentoo.org>
References: <1365618555-5893-1-git-send-email-vapier@gentoo.org>
 <1365618555-5893-6-git-send-email-vapier@gentoo.org>
 <20130411040014.GA8165@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4394918581893979209=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130411040014.GA8165-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============4394918581893979209==
Content-Type: multipart/signed;
  boundary="nextPart2074992.Ox9zSEfhvI";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2074992.Ox9zSEfhvI
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 11 April 2013 00:00:14 David Gibson wrote:
> On Wed, Apr 10, 2013 at 02:29:10PM -0400, Mike Frysinger wrote:
> > This starts a new usage framework and then cuts fdtdump over to it.
> > Now we can do `fdtdump -h` and get something useful back.
>=20
> Hrm.  The problem is that the new scheme relies on getopt_long(),
> which is a GNU extension.  I'd like to have dtc and associated tools
> compilable on FreeBSD as well as Linux.

i don't run FreeBSD myself, but according to their own website, it looks li=
ke
getopt_long() is available ?
http://www.freebsd.org/cgi/man.cgi?query=3Dgetopt_long&apropos=3D0&sektion=
=3D3&manpath=3DFreeBSD+9.1-
RELEASE&arch=3Ddefault&format=3Dhtml

HISTORY
     The getopt_long() and getopt_long_only() functions first appeared in t=
he
     GNU libiberty library.  The first BSD implementation of getopt_long()
     appeared in NetBSD 1.5, the first BSD implementation of
     getopt_long_only() in OpenBSD 3.3.  FreeBSD first included getopt_long=
()
     in FreeBSD 5.0, getopt_long_only() in FreeBSD 5.2.

i'm assuming you don't need to support <FreeBSD 5.0 :)
=2Dmike

--nextPart2074992.Ox9zSEfhvI
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRZuVpAAoJEEFjO5/oN/WB4pIQAK1g6Mjyh1ijyTdtRshfRsiv
01FtS+1tN0eMAilcWWQzhnb4ohOi1xAjGjEeJTesJpSY5TXed+3M/vlq0tD8oSmL
NiqrBOSjsBxZVQds17XnEy4JTp+2EqVwASMQCeOGtFSDkGOl5f+VSSGfw8FHap/n
mWjR1Gl9fzNXQDz60t1E7OdSloJwrsZYxs2q9a3X11WSjaZLIjyeEbsGgK/y1/G6
q2CATVwAg0Gm8koyI+TtB1bGSivOVyDBuc14Mt1mlHPack2/skiEtzuvju1chO3l
QRlEy4RNu5fz8Ez3oO20zkuq2h6Tg0++K9ZpFuhGAJ7JyG7MBHLT+1DzHXnuy3Zo
YoeUvVOLE/0HbhDEv04UvTe4hlBA+ljo2Zvad7+P3HhTR0Lu6HjOhE5DqOCJFF4J
1GOS/NQ2mnu29rEvGR6gRKh68yi8fJj86A+FdJJNQ+q7gbcEdy3Q/M4u22T8al61
G3fHR0RfWPERW3I4qbCE5DtXYB/gzNJkE5qUTTK4howDoNn2GKn/Y680l6c5Vq2r
1eDZ9MCXwLBz7UoUXnzzXuOeE+sYUBTP+uFZEcVSW+4T5b9k3OeMXKZsDphqDc0x
F3o+GGE74PE2gE99tyv0FDkunujG+ahVQSPopMUqhwxDjUj+hn0WzmhDrMJFlPC6
Kjo3kHadJXVQ9OjVgUsH
=f4BX
-----END PGP SIGNATURE-----

--nextPart2074992.Ox9zSEfhvI--

--===============4394918581893979209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4394918581893979209==--
