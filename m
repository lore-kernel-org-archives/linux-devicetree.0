From: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/10] allow mxc_nand to be probed via device tree
Date: Sun, 29 Apr 2012 14:10:20 +0300
Message-ID: <1335697820.1942.2.camel@koala>
References: <20120423092240.GA18013@pengutronix.de>
 <1335615654.1937.20.camel@koala> <20120429092701.GS20039@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6753891817352309752=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120429092701.GS20039-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============6753891817352309752==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-+kU6RklVPYNQrjavZbA6"


--=-+kU6RklVPYNQrjavZbA6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-04-29 at 11:27 +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello Artem,
>=20
> On Sat, Apr 28, 2012 at 03:20:54PM +0300, Artem Bityutskiy wrote:
> > On Mon, 2012-04-23 at 11:22 +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > Hello,
> > >=20
> > > this series aims to be able to probe mxc_nand devices via device tree=
.
> > > Most of its patches reorganize the driver to only use cpu_is_mxYZ for
> > > the case that the device is not probed via device tree.
> > >=20
> > > I split this conversion in several patches to allow easier review. IM=
HO
> > > it makes sense to keep this splitting for an eventual bisection.
> > >=20
> > > This is tested on an i.MX27 based machine and works fine including
> > > passing of partition data.
> >=20
> > Applied all 11 patches from your git tree to l2-mtd.git. Note, you have
> > one checkpatch.pl warning:
> >=20
> > WARNING:STATIC_CONST_CHAR_ARRAY: static const char * array should proba=
bly be static const char * const
> > #69: FILE: drivers/mtd/nand/mxc_nand.c:274:
> > +static const char *part_probes[] =3D { "RedBoot", "cmdlinepart", "ofpa=
rt", NULL };
> I noticed that, too. This is not new though and as
> mtd_device_parse_register takes a const char **types applying
> checkpatch's advice would yield another warning. But probably fixing
> both would work. I wouldn't address this as part of this series.
>=20
> > Also there are still several sparse warnings, e.g.
> >=20
> > +drivers/mtd/nand/mxc_nand.c:1249:26: warning: incorrect type in initia=
lizer (different modifiers) [sparse]
> > +drivers/mtd/nand/mxc_nand.c:1249:26:    expected void *data [sparse]
> > +drivers/mtd/nand/mxc_nand.c:1249:26:    got struct mxc_nand_devtype_da=
ta static const [toplevel] *<noident> [sparse]
> >=20
> > And you added few gcc warnings, e.g.:
> >=20
> > +drivers/mtd/nand/mxc_nand.c:1252:3: warning: initialization discards '=
const' qualifier from pointer target type [enabled by default]
> This is the same problem, i.e. casting away several consts. Hmm, and for
> me neither gcc nor sparse provide that warning but I wonder why. At some
> point I saw this warning, so I sent a patch:

Try to compile with gcc 4.6 - you can download it from here:
ftp://ftp.kernel.org/pub/tools/crosstool/files/bin/

I do not know whether it produces good binaries or not, but for
compile-testing it is much better than ancient gcc 4.3.

--=20
Best Regards,
Artem Bityutskiy

--=-+kU6RklVPYNQrjavZbA6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPnSGcAAoJECmIfjd9wqK0inIQAMy4w+/MGb3BpXJl2E4n1RIP
0JWSHZ3QIQIPDpoBZuqVOC85o5BkzGo6B9ua5KLFL4iWPg9h+Gc70Pob5hdw0+4k
Eazq0ofpWq0jpHsr52/EpPEa3jNXtplOgoDfzwuikv57LU33M1ec51ZQvwyAAqsg
jvexjJCTKkePidgrdMV6iuivvsr1yUAABLRF4DMYefQLa6guYOHuW1HdQBhVNsT5
uwaVKfyiSdhegm7SZlSN6oNCD9mrqYs5fVfU8WM5IV+YZQsm9SPMVSQfHQwfU+oS
bWOvZ8HvLHA9mSU3l3SfTcjUugxGWYdClyLjtIUnWQ4FVZlupB895Dc9H/yCiGca
724wpEtfVJ7v/Aduy1srOpV8JbjJwktuOduf5xP6XsrDtRejxzfDT4G3pQ+4Iiyc
pPPF+b62suctwksK20hjAphs+7mZ/Syqne6GSf/xOj5ovwzj9Ta49xOoKOg0rNd2
34WrnyNCPk2K1/eEtsoygOQl++lXhDbuZXp9vYK7r+cyjD3abEIKVv1kThkHYk/s
S1FNbcxR/zDNUU1Hnd8RrWhF6RQIHmdF8ygfni5vXBs0sESrAP+/TcgEO6wUdfRa
xEOMC5dwAGzvE53wS5FfNFaZ4SdRmx1WvIcfQXzOL7XcZkgfloXFoWkO27D8AGK+
hCBlB06UGCLZ0wsA7t3C
=r8cd
-----END PGP SIGNATURE-----

--=-+kU6RklVPYNQrjavZbA6--


--===============6753891817352309752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6753891817352309752==--
