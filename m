From: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/10] allow mxc_nand to be probed via device tree
Date: Sat, 28 Apr 2012 15:20:54 +0300
Message-ID: <1335615654.1937.20.camel@koala>
References: <20120423092240.GA18013@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6523279351339195459=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120423092240.GA18013-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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


--===============6523279351339195459==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-gieM17TaIEmZVuVWqcds"


--=-gieM17TaIEmZVuVWqcds
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-04-23 at 11:22 +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> this series aims to be able to probe mxc_nand devices via device tree.
> Most of its patches reorganize the driver to only use cpu_is_mxYZ for
> the case that the device is not probed via device tree.
>=20
> I split this conversion in several patches to allow easier review. IMHO
> it makes sense to keep this splitting for an eventual bisection.
>=20
> This is tested on an i.MX27 based machine and works fine including
> passing of partition data.

Applied all 11 patches from your git tree to l2-mtd.git. Note, you have
one checkpatch.pl warning:

WARNING:STATIC_CONST_CHAR_ARRAY: static const char * array should probably =
be static const char * const
#69: FILE: drivers/mtd/nand/mxc_nand.c:274:
+static const char *part_probes[] =3D { "RedBoot", "cmdlinepart", "ofpart",=
 NULL };

Also there are still several sparse warnings, e.g.

+drivers/mtd/nand/mxc_nand.c:1249:26: warning: incorrect type in initialize=
r (different modifiers) [sparse]
+drivers/mtd/nand/mxc_nand.c:1249:26:    expected void *data [sparse]
+drivers/mtd/nand/mxc_nand.c:1249:26:    got struct mxc_nand_devtype_data s=
tatic const [toplevel] *<noident> [sparse]

And you added few gcc warnings, e.g.:

+drivers/mtd/nand/mxc_nand.c:1252:3: warning: initialization discards 'cons=
t' qualifier from pointer target type [enabled by default]

Would you take a look and _possibly_ (if makes sense, I did not verify)
send incremental fixes?

--=20
Best Regards,
Artem Bityutskiy

--=-gieM17TaIEmZVuVWqcds
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPm+CmAAoJECmIfjd9wqK0upkP/je55PTSV5V4zOYiAcO8aIkY
z8wfVlLpqJMg+WSN1WNQ/0ghgsKcFXKIWO1Hb+ZA+jXr5oBGdu60/P4fNh1fCfWc
JPtjEA3CZwL/Ar2BfLkqbBhAivy6n0FFLn0sM4NsFQUofd74V+VlvtyP9gQuZchI
oMjtn5QFF09jFJN5JbAfLrT1khBpXcJFWVbc1SwN0BOdLDpeON9T0c7a6CgfzVS3
obx9CslJ6z214/7ej1lrXOmgHbwZmKrX2FLFXtkd8EI6N2llhhzwleMDc/8m2hHW
SdX6WPBM+GvUpov4sgjvdBTfnRrw54zGB1VFdIvDbjEQGd1ki+z3a2l/j2H2SLRz
TeuJL7OywLBFejm/DhAwTYh+EpSVkg2eO7a3vLe6TGObCupENAk4BzgHggBZ9Mst
2v/MnxZhdVwmY2gybHxXvMj6Zze3Vor+N/ouSn9hAZY2i2The6AWvu/8OFI0oz+e
qlJT8swhj3Vo6mZqPfNdeN+qn9UagSzq/iCe6i7N/3W/dAw0obuK/NV3hZ9VKciz
j0jbj6uOwJQkRhaW9TYnYyzAikbw+C/lPchtR1e0W3J6fncUpadE8opxDInFh6sy
CsjD0TucleIRCf9xD9h6SZbQxozf74L429JP/9LOvZjIgtdP9Vp22QeKNKVcPtzb
gfbCT9WWryasWHBbTZ83
=bjnO
-----END PGP SIGNATURE-----

--=-gieM17TaIEmZVuVWqcds--


--===============6523279351339195459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6523279351339195459==--
