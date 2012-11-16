From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 5/9] usb: add phy connection by phy-mode
Date: Fri, 16 Nov 2012 15:32:21 +0100
Message-ID: <50A64E75.4060209@pengutronix.de>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de> <1352909950-32555-6-git-send-email-m.grzeschik@pengutronix.de> <20121116113149.GC17793@arwen.pp.htv.fi> <50A62713.5070407@pengutronix.de> <20121116134116.GA18527@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig9F82F5E4F905578F24866BE6"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121116134116.GA18527-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig9F82F5E4F905578F24866BE6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11/16/2012 02:41 PM, Felipe Balbi wrote:
> Hi,
>=20
> On Fri, Nov 16, 2012 at 12:44:19PM +0100, Marc Kleine-Budde wrote:
>>>> diff --git a/drivers/of/of_usbphy.c b/drivers/of/of_usbphy.c
>>>> new file mode 100644
>>>> index 0000000..2e71f7b
>>>> --- /dev/null
>>>> +++ b/drivers/of/of_usbphy.c
>>>> @@ -0,0 +1,49 @@
>>>> +/*
>>>> + * OF helpers for network devices.
>>>> + *
>>>> + * This file is released under the GPLv2
>>>> + *
>>>> + * Initially copied out of drivers/of/of_net.c
>>>> + */
>>>> +#include <linux/etherdevice.h>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/of_usbphy.h>
>>>> +#include <linux/usb/phy.h>
>>>> +#include <linux/export.h>
>>>> +
>>>> +/**
>>>> + * It maps 'enum usb_phy_interface' found in include/linux/usb/phy.=
h
>>>> + * into the device tree binding of 'phy-mode', so that USB
>>>> + * device driver can get phy interface from device tree.
>>>> + */
>>>
>>> provide proper kernel-doc
>>>
>>>> +static const char *usbphy_modes[] =3D {
>>>> +	[USBPHY_INTERFACE_MODE_NA]	=3D "",
>>>> +	[USBPHY_INTERFACE_MODE_UTMI]	=3D "utmi",
>>>> +	[USBPHY_INTERFACE_MODE_UTMIW]	=3D "utmiw",
>>>> +	[USBPHY_INTERFACE_MODE_ULPI]	=3D "ulpi",
>>>> +	[USBPHY_INTERFACE_MODE_SERIAL]	=3D "fsls",
>>>> +};
>>>
>>> In fact, these would be better off as constants:
>>>
>>> #define USBPHY_INTERFACE_MODE_UTMI	1
>>> #define USBPHY_INTERFACE_MODE_UTMIW	2
>>> ...
>>
>> Why are defines better than an enum? BTW: this code is a copy of the
>=20
> because with enums can change value if you add another one in the middl=
e
> and it's really easy to miss that sort of thing during review and cause=

> regressions to many DTS files.

Now I get it, you want to use integers instead of strings in the DT. Why
do you want to have Integers in the DT? It seems to work with strings
pretty well for the Ethernet phys, why invent a new concept here?

>> ethernet phy of-helper code.
>=20
> so ?

reviewed core, proven to work, if the concept works for Ethernet phys it
should work with USB phys, too.

>=20
>>>> +/**
>>>> + * of_get_phy_mode - Get phy mode for given device_node
>>>> + * @np:	Pointer to the given device_node
>>>> + *
>>>> + * The function gets phy interface string from property 'phy-mode',=

>>>> + * and return its index in phy_modes table, or errno in error case.=

>>>> + */
>>>
>>> why do you pass a string instead of passing an Integer ? This makes n=
o
>>> sense to me.
>>
>> This code returns an integer or rather an enum....see header file belo=
w.
>=20
> I mean through DT, should've been more explicit. The dts files should
> pass an integer, not a string. Then you don't need this silly conversio=
n
> helper.

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig9F82F5E4F905578F24866BE6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iEYEARECAAYFAlCmTngACgkQjTAFq1RaXHPuqgCfScm9BTVJReNPRFbnK+IcEeKb
/8UAoI5JRQtQfqinlDQlJs837cVMM3QD
=fiEV
-----END PGP SIGNATURE-----

--------------enig9F82F5E4F905578F24866BE6--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
