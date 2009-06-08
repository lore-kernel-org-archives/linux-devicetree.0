From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Subject: Re: [PATCH V2 2/2] mtd/maps/mtd-ram: add an of-platform driver
Date: Mon, 08 Jun 2009 19:30:45 +0200
Message-ID: <1244482256.3278.0@antares>
References: <20090608163540.GA16384@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0590960577=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090608163540.GA16384-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> (from
	w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org on Mon Jun  8 18:35:40 2009)
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============0590960577==
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-97gFfBnOr0Mpi+yYBi41"

--=-97gFfBnOr0Mpi+yYBi41
Content-Type: text/plain; charset=ISO-8859-1; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 08.06.09 18:35 schrieb(en) Wolfram Sang:
>> Question: why is bank-width even relevant for a RAM device?
>=20
> The underlying map_ram-driver uses it once while erasing. The =20
> question remains if this is really needed?

Am 06.06.09 18:16 schrieb(en) Albrecht Dre=DF:
> At least if the RAM is attached to the 5200's Local Plus Bus in =20
> 16-bit mode, no byte write accesses are allowed (byte /reads/ work, =20
> though).  I have a tweak (which I will post next week) to address =20
> this case, which depends upon this setting.

To put this clearer: on '5200 based systems, the driver (more specific: =20
the function inline_map_copy_to()) *must* know whether the hardware is =20
connected in 8-bit or 16-bit mode to the Local Plus Bus, as byte writes =20
(issued by memcpy_toio()) will fail for the latter setup (probably the =20
same applies for byte and word writes in 32-bit mode).

IMHO, this information should be passed using the device tree.  The =20
"bank-width" seems to be an obvious choice for that.

Best, Albrecht.

--=-97gFfBnOr0Mpi+yYBi41
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iD8DBQBKLUrQn/9unNAn/9ERAlojAKCQcNeACQ0s+hriPt5oMQphSBrv2QCgquGu
2U7wswApUdESMZiYG64xdfk=
=ODlX
-----END PGP SIGNATURE-----

--=-97gFfBnOr0Mpi+yYBi41--

--===============0590960577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============0590960577==--
