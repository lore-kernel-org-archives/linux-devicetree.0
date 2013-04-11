From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 06/10] fdtdump: add a --scan option
Date: Thu, 11 Apr 2013 14:11:30 +1000
Message-ID: <20130411041130.GB8165@truffula.fritz.box>
References: <1365618555-5893-1-git-send-email-vapier@gentoo.org>
 <1365618555-5893-7-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7921267503604826882=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365618555-5893-7-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
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
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============7921267503604826882==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ytgo/kJyDF3J5kSH"
Content-Disposition: inline


--Ytgo/kJyDF3J5kSH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2013 at 02:29:11PM -0400, Mike Frysinger wrote:
> Often times, fdts get embedded in other larger files.  Rather than force
> people to `dd` the blob out themselves, make the fdtdump file smarter.
>=20
> It can now scan the blob looking for the fdt magic.  Once locate, it does
> a little validation on the main struct to make sure we didn't hit random
> binary data.
>=20
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>

Hrm.  I have mixed feelings about this.  The scanning functionality is
certainly useful.  But on the other hand, fdtdump is not supposed to
be a general use tool.  It's basically a debugging aid: a quick and
dirty independent implementation of a dtb dump, for checking that dtc
is producing sane output.  The preferred way to dump dtbs "for real"
is to use dtc -I dtb -O dts

I think the way I'd prefer to see this functionality would be to add a
new input format to dtc which is a little wrapper around the dtb input
format which does the scan.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Ytgo/kJyDF3J5kSH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFmN/IACgkQaILKxv3ab8b49wCfTskIWVQNn9h3BZgsKSpsxowS
05IAoIfPatV5c0JxefvwkW56wc8MHWF/
=ukak
-----END PGP SIGNATURE-----

--Ytgo/kJyDF3J5kSH--

--===============7921267503604826882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7921267503604826882==--
