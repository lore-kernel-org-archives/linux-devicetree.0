From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/9] usb: chipidea: pci: mark platformdata as static and
 __devinitdata
Date: Fri, 16 Nov 2012 11:17:49 +0100
Message-ID: <50A612CD.8040004@pengutronix.de>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de> <1352909950-32555-2-git-send-email-m.grzeschik@pengutronix.de> <87haop7tfi.fsf@ashishki-desk.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig5EFC72669AEDE5B21CBC6EC2"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87haop7tfi.fsf-qxRn5AmX6ZD9BXuAQUXR0fooFf0ArEBIu+b9c/7xato@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig5EFC72669AEDE5B21CBC6EC2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11/16/2012 11:06 AM, Alexander Shishkin wrote:
> Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
>=20
>> From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>
>> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>=20
> static yes, __devinitdata -- probably not. These structs are used
> everywhere throughout the driver currently, not only at initialization
> time.

Yes, but a copy of the platform_data is used:

The PCI driver calls ci13xxx_add_device():
http://lxr.free-electrons.com/source/drivers/usb/chipidea/ci13xxx_pci.c#L=
85

which calls  platform_device_add_data():
http://lxr.free-electrons.com/source/drivers/usb/chipidea/core.c#L364

which makes a copy of the platform_data:
http://lxr.free-electrons.com/source/drivers/base/platform.c#L246

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig5EFC72669AEDE5B21CBC6EC2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iEYEARECAAYFAlCmEs0ACgkQjTAFq1RaXHMXPwCbBZzCPKGjXLCH9LbqzpGxOIEo
BFEAn0GZlR9fRBvpOHIVn8VnObsxk7ky
=ySbj
-----END PGP SIGNATURE-----

--------------enig5EFC72669AEDE5B21CBC6EC2--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
