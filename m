From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH V2 2/2] mtd/maps/mtd-ram: add an of-platform driver
Date: Sat, 6 Jun 2009 13:19:26 +0200
Message-ID: <20090606111926.GA3279@pengutronix.de>
References: <1244203514-12516-1-git-send-email-w.sang@pengutronix.de>
	<1244203514-12516-3-git-send-email-w.sang@pengutronix.de>
	<1244276049.3751.1176.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0780011346=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1244276049.3751.1176.camel-uXGAPMMVk8bAQYKIod7YupZV94DADvEd@public.gmane.org>
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
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, albrecht.dress-KvP5wT2u2U0@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============0780011346==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 06, 2009 at 09:14:08AM +0100, David Woodhouse wrote:

> On Fri, 2009-06-05 at 14:05 +0200, Wolfram Sang wrote:
> > Create an of-aware driver using the now exported generic functions from
> > plat-ram.c. Also add the documentation for the binding. Partitions are
> > not yet supported. Tested on a phyCORE-MPC5200B-IO.
>=20
> Do we have an ack for the device-tree bindings?=20
>=20
> It _would_ be possible to hook up RAM through the existing of_physmap
> driver, I think -- although it would be slightly less efficient that
> way.
>=20
> Maybe cleaner from the device-tree POV though. And if we want to put a
> special case in the _code_ to make it more efficient, we can do that.

During development, I also checked physmap_of.c and found this binding:

        {
                .type           =3D "rom",
                .compatible     =3D "direct-mapped"
        },

which made some sense to me and I thought about .type =3D "ram". However, I=
 then
found this in the code:

/* Helper function to handle probing of the obsolete "direct-mapped"
 * compatible binding, which has an extra "probe-type" property
 * describing the type of flash probe necessary. */
static struct mtd_info * __devinit obsolete_probe(struct of_device *dev,
                                                  struct map_info *map)
{
[...]

        dev_warn(&dev->dev, "Device tree uses obsolete \"direct-mapped\" "
                 "flash binding\n");

My conclusion was then that a mtd-ram binding wouldn't belong here, but I h=
ave
maybe misinterpreted things...

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoqUL4ACgkQD27XaX1/VRujcgCfaC0oE0HFX1XXmPmsivP0MN2s
WnIAniT/ONI9qNUFXF1wBUP9BtTVclh1
=9yH8
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--

--===============0780011346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============0780011346==--
