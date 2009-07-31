From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Subject: Re: [PATCH] mtd/maps: add mtd-ram support to physmap_of
Date: Fri, 31 Jul 2009 21:47:10 +0200
Message-ID: <1249069643.3687.0@antares>
References: <1247834363-28198-1-git-send-email-w.sang@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2459328791534495375=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1247834363-28198-1-git-send-email-w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> (from
	w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org on Fri Jul 17 14:39:23 2009)
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Vitaly Wool <vwool-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, Artem Bityutskiy <dedekind-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ken MacLeod <ken-VbOJbV3qneKf+c8Povm/Gg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============2459328791534495375==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=PGP-SHA1; boundary="=-6wC/KUIJ0WEPnkpS4mA1"

--=-6wC/KUIJ0WEPnkpS4mA1
Content-Type: text/plain; charset=ISO-8859-1; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 17.07.09 14:39 schrieb(en) Wolfram Sang:
> Use physmap_of to access RAMs as mtd and add documenation for it. =20
> This approach is a lot less intrusive as adding an of-wrapper around =20
> plat-ram.c. As most extensions of plat-ram.c (e.g. custom =20
> map-functions) can't be mapped to the device tree anyhow, extending =20
> physmap_of seems to be the cleanest approach.

The patch works nicely on a custom (roughly Icecube) based 5200B board, =20
with a Renesas static ram, no partitions and a jffs2 file system on =20
it.  I had to add some more tweaks to physmap_of.c as to work around =20
the 5200's limitations accessing chips in 16-bit mode through the local =20
bus, which is a lot easier and cleaner with this patch than with the =20
old one (of 05 June 09).

Acked-by: Albrecht Dre=DF <albrecht.dress-KvP5wT2u2U0@public.gmane.org>

--=-6wC/KUIJ0WEPnkpS4mA1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iD8DBQBKc0pLn/9unNAn/9ERAndaAJ46tL+3fxURYv2K1m+v4Z9UJ00B2QCcCv19
sk5JUodhOC7jIvauB43/ImU=
=kGsX
-----END PGP SIGNATURE-----

--=-6wC/KUIJ0WEPnkpS4mA1--

--===============2459328791534495375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2459328791534495375==--
