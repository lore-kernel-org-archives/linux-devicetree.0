From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress@arcor.de>
Subject: Re: [PATCH V2 2/2] mtd/maps/mtd-ram: add an of-platform driver
Date: Fri, 05 Jun 2009 18:22:17 +0200
Message-ID: <1244218950.3395.0@antares>
References: <1244203514-12516-3-git-send-email-w.sang@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7557950217890526003=="
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1244203514-12516-3-git-send-email-w.sang@pengutronix.de> (from
	w.sang@pengutronix.de on Fri Jun  5 14:05:14 2009)
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Mime-version: 1.0
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Ben Dooks <ben-linux@fluff.org>
List-Id: devicetree@vger.kernel.org

--===============7557950217890526003==
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-5WRY8loPNa49glkSUlh4"

--=-5WRY8loPNa49glkSUlh4
Content-Type: text/plain; charset=ISO-8859-1; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 05.06.09 14:05 schrieb(en) Wolfram Sang:
> Create an of-aware driver using the now exported generic functions =20
> from plat-ram.c. Also add the documentation for the binding. =20
> Partitions are not yet supported. Tested on a phyCORE-MPC5200B-IO.
>=20
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Albrecht Dre=DF <albrecht.dress@arcor.de>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linuxppc-dev@ozlabs.org
> Cc: devicetree-discuss@ozlabs.org
> Cc: linux-mtd@lists.infradead.org

These patches work great for me on a self-designed, roughly Icecube =20
based, 5200B board, with a 512kB NV Ram.  As I use 16-bit accesses via =20
the Local Plus bus to the chip, I had to add some more tweaks to other =20
files, which I promise to post next week...

Thanks, Albrecht.

Acked-by: Albrecht Dre=DF <albrecht.dress@arcor.de>


--=-5WRY8loPNa49glkSUlh4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iD8DBQBKKUZGn/9unNAn/9ERArMwAKCrO9AxACiFXeYR1h7zh+ym1u83wQCbBpRX
ESXY3pLZW5k0tL6drvnMTJ8=
=4JMT
-----END PGP SIGNATURE-----

--=-5WRY8loPNa49glkSUlh4--

--===============7557950217890526003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linuxppc-dev mailing list
Linuxppc-dev@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/linuxppc-dev
--===============7557950217890526003==--
