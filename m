From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 5/9] usb: add phy connection by phy-mode
Date: Fri, 16 Nov 2012 12:44:19 +0100
Message-ID: <50A62713.5070407@pengutronix.de>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de> <1352909950-32555-6-git-send-email-m.grzeschik@pengutronix.de> <20121116113149.GC17793@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig252C09172CF42039EC2A9ED6"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121116113149.GC17793-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig252C09172CF42039EC2A9ED6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11/16/2012 12:31 PM, Felipe Balbi wrote:
> Hi,
>=20
> On Wed, Nov 14, 2012 at 05:19:06PM +0100, Michael Grzeschik wrote:
>> This patch makes it possible to set the connection of the usbphy to th=
e
>> soc. It is derived from the oftree bindings for the ethernetphy and ad=
ds
>> similar helperfunctions.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> ---
>>  drivers/of/Kconfig        |    4 ++++
>>  drivers/of/Makefile       |    1 +
>>  drivers/of/of_usbphy.c    |   49 ++++++++++++++++++++++++++++++++++++=
+++++++++
>>  include/linux/of_usbphy.h |   15 ++++++++++++++
>>  include/linux/usb/phy.h   |    8 ++++++++
>>  5 files changed, 77 insertions(+)
>>  create mode 100644 drivers/of/of_usbphy.c
>>  create mode 100644 include/linux/of_usbphy.h
>>
>> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
>> index dfba3e6..28f99fb 100644
>> --- a/drivers/of/Kconfig
>> +++ b/drivers/of/Kconfig
>> @@ -67,6 +67,10 @@ config OF_MDIO
>>  	help
>>  	  OpenFirmware MDIO bus (Ethernet PHY) accessors
>> =20
>> +config OF_USBPHY
>> +	depends on USB
>> +	def_bool y
>> +
>>  config OF_PCI
>>  	def_tristate PCI
>>  	depends on PCI
>> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
>> index e027f44..fdcaf51 100644
>> --- a/drivers/of/Makefile
>> +++ b/drivers/of/Makefile
>> @@ -6,6 +6,7 @@ obj-$(CONFIG_OF_IRQ)    +=3D irq.o
>>  obj-$(CONFIG_OF_DEVICE) +=3D device.o platform.o
>>  obj-$(CONFIG_OF_I2C)	+=3D of_i2c.o
>>  obj-$(CONFIG_OF_NET)	+=3D of_net.o
>> +obj-$(CONFIG_OF_USBPHY)	+=3D of_usbphy.o
>>  obj-$(CONFIG_OF_SELFTEST) +=3D selftest.o
>>  obj-$(CONFIG_OF_MDIO)	+=3D of_mdio.o
>>  obj-$(CONFIG_OF_PCI)	+=3D of_pci.o
>> diff --git a/drivers/of/of_usbphy.c b/drivers/of/of_usbphy.c
>> new file mode 100644
>> index 0000000..2e71f7b
>> --- /dev/null
>> +++ b/drivers/of/of_usbphy.c
>> @@ -0,0 +1,49 @@
>> +/*
>> + * OF helpers for network devices.
>> + *
>> + * This file is released under the GPLv2
>> + *
>> + * Initially copied out of drivers/of/of_net.c
>> + */
>> +#include <linux/etherdevice.h>
>> +#include <linux/kernel.h>
>> +#include <linux/of_usbphy.h>
>> +#include <linux/usb/phy.h>
>> +#include <linux/export.h>
>> +
>> +/**
>> + * It maps 'enum usb_phy_interface' found in include/linux/usb/phy.h
>> + * into the device tree binding of 'phy-mode', so that USB
>> + * device driver can get phy interface from device tree.
>> + */
>=20
> provide proper kernel-doc
>=20
>> +static const char *usbphy_modes[] =3D {
>> +	[USBPHY_INTERFACE_MODE_NA]	=3D "",
>> +	[USBPHY_INTERFACE_MODE_UTMI]	=3D "utmi",
>> +	[USBPHY_INTERFACE_MODE_UTMIW]	=3D "utmiw",
>> +	[USBPHY_INTERFACE_MODE_ULPI]	=3D "ulpi",
>> +	[USBPHY_INTERFACE_MODE_SERIAL]	=3D "fsls",
>> +};
>=20
> In fact, these would be better off as constants:
>=20
> #define USBPHY_INTERFACE_MODE_UTMI	1
> #define USBPHY_INTERFACE_MODE_UTMIW	2
> ...

Why are defines better than an enum? BTW: this code is a copy of the
ethernet phy of-helper code.

>=20
>> +/**
>> + * of_get_phy_mode - Get phy mode for given device_node
>> + * @np:	Pointer to the given device_node
>> + *
>> + * The function gets phy interface string from property 'phy-mode',
>> + * and return its index in phy_modes table, or errno in error case.
>> + */
>=20
> why do you pass a string instead of passing an Integer ? This makes no
> sense to me.

This code returns an integer or rather an enum....see header file below.

>> +const int of_get_usbphy_mode(struct device_node *np)
>> +{
>> +	const char *pm;
>> +	int err, i;
>> +
>> +	err =3D of_property_read_string(np, "phy-mode", &pm);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(usbphy_modes); i++)
>> +		if (!strcasecmp(pm, usbphy_modes[i]))
>> +			return i;
>> +
>> +	return -ENODEV;
>> +}
>> +EXPORT_SYMBOL_GPL(of_get_usbphy_mode);
>> diff --git a/include/linux/of_usbphy.h b/include/linux/of_usbphy.h
>> new file mode 100644
>> index 0000000..9a4132d
>> --- /dev/null
>> +++ b/include/linux/of_usbphy.h
>> @@ -0,0 +1,15 @@
>> +/*
>> + * OF helpers for usb devices.
>> + *
>> + * This file is released under the GPLv2
>> + */
>> +
>> +#ifndef __LINUX_OF_USBPHY_H
>> +#define __LINUX_OF_USBPHY_H
>> +
>> +#ifdef CONFIG_OF_USBPHY
>> +#include <linux/of.h>
>> +extern const int of_get_usbphy_mode(struct device_node *np);
>> +#endif
>> +
>> +#endif /* __LINUX_OF_USBPHY_H */
>> diff --git a/include/linux/usb/phy.h b/include/linux/usb/phy.h
>> index a29ae1e..150eb69 100644
>> --- a/include/linux/usb/phy.h
>> +++ b/include/linux/usb/phy.h
>> @@ -12,6 +12,14 @@
>>  #include <linux/notifier.h>
>>  #include <linux/usb.h>
>> =20
>> +enum usb_phy_interface {
>> +	USBPHY_INTERFACE_MODE_NA,
>> +	USBPHY_INTERFACE_MODE_UTMI,
>> +	USBPHY_INTERFACE_MODE_UTMIW,
>> +	USBPHY_INTERFACE_MODE_ULPI,
>> +	USBPHY_INTERFACE_MODE_SERIAL,
>> +};
>=20
> no documentation at all here... What does UTMIW mean ? Why do you mean
> the NA mode ?
>=20

Good point, W means wide.

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig252C09172CF42039EC2A9ED6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iEYEARECAAYFAlCmJxMACgkQjTAFq1RaXHPyWwCeL9PjBWDrmyD6xWgMQpKlJOtL
rwIAnA4k9wVCmy6e6CcoKUbrLALeAq3/
=yF6h
-----END PGP SIGNATURE-----

--------------enig252C09172CF42039EC2A9ED6--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
