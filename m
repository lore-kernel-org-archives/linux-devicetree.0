From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 5/9] usb: add phy connection by phy-mode
Date: Fri, 16 Nov 2012 15:41:16 +0200
Message-ID: <20121116134116.GA18527@arwen.pp.htv.fi>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de>
 <1352909950-32555-6-git-send-email-m.grzeschik@pengutronix.de>
 <20121116113149.GC17793@arwen.pp.htv.fi>
 <50A62713.5070407@pengutronix.de>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50A62713.5070407-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 16, 2012 at 12:44:19PM +0100, Marc Kleine-Budde wrote:
> >> diff --git a/drivers/of/of_usbphy.c b/drivers/of/of_usbphy.c
> >> new file mode 100644
> >> index 0000000..2e71f7b
> >> --- /dev/null
> >> +++ b/drivers/of/of_usbphy.c
> >> @@ -0,0 +1,49 @@
> >> +/*
> >> + * OF helpers for network devices.
> >> + *
> >> + * This file is released under the GPLv2
> >> + *
> >> + * Initially copied out of drivers/of/of_net.c
> >> + */
> >> +#include <linux/etherdevice.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/of_usbphy.h>
> >> +#include <linux/usb/phy.h>
> >> +#include <linux/export.h>
> >> +
> >> +/**
> >> + * It maps 'enum usb_phy_interface' found in include/linux/usb/phy.h
> >> + * into the device tree binding of 'phy-mode', so that USB
> >> + * device driver can get phy interface from device tree.
> >> + */
> >=20
> > provide proper kernel-doc
> >=20
> >> +static const char *usbphy_modes[] =3D {
> >> +	[USBPHY_INTERFACE_MODE_NA]	=3D "",
> >> +	[USBPHY_INTERFACE_MODE_UTMI]	=3D "utmi",
> >> +	[USBPHY_INTERFACE_MODE_UTMIW]	=3D "utmiw",
> >> +	[USBPHY_INTERFACE_MODE_ULPI]	=3D "ulpi",
> >> +	[USBPHY_INTERFACE_MODE_SERIAL]	=3D "fsls",
> >> +};
> >=20
> > In fact, these would be better off as constants:
> >=20
> > #define USBPHY_INTERFACE_MODE_UTMI	1
> > #define USBPHY_INTERFACE_MODE_UTMIW	2
> > ...
>=20
> Why are defines better than an enum? BTW: this code is a copy of the

because with enums can change value if you add another one in the middle
and it's really easy to miss that sort of thing during review and cause
regressions to many DTS files.

> ethernet phy of-helper code.

so ?

> >> +/**
> >> + * of_get_phy_mode - Get phy mode for given device_node
> >> + * @np:	Pointer to the given device_node
> >> + *
> >> + * The function gets phy interface string from property 'phy-mode',
> >> + * and return its index in phy_modes table, or errno in error case.
> >> + */
> >=20
> > why do you pass a string instead of passing an Integer ? This makes no
> > sense to me.
>=20
> This code returns an integer or rather an enum....see header file below.

I mean through DT, should've been more explicit. The dts files should
pass an integer, not a string. Then you don't need this silly conversion
helper.

--=20
balbi

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQpkJ8AAoJEIaOsuA1yqREgrAP/Aibcfk44noGQkXazfCOiqWI
52vOraeNGDf8Tfi4pwrMna2HPTgaKuvzsgiK+R2JdyQmuZhi4cdA7t6JB5uZoNZS
qHG5jFRvxXPEc72HLiT6sUKjJ3hT+E182el/vypTmnMSHqDzvL6fPrEAq0n3V/sY
K25Rjly4CBlOzkq1HZK6jAzm+7cTgJCP87uvlwF9sSpE4ViB/eoMbgQu//XKDqXA
0/8VVlIbdjh7/xYsOsMNjktD+tp/v615h0e1AFaNSTMHdvmLhHVL/Sq46P7T29EF
EfDQQnpBmvqUZ+DQM4B9GZLwBGr7i1vnMq2wOXJskkEqU9fdtqgzUfZdjO+HsDNG
7wIic5OROAngM8veS+t++cDhn9aTtC720mtejnwX/HwQnwilH0m8lgBtkepmJW/A
K7/VQuyep+bRQPstXvNgWNIGR4rwmCrJco+bX6b2qVDc9nIH5czPcf1sjtuuj0+M
ik6547kRlTZ11r5YsmUIPf+RX6pmZ/SzUd5m7DlkC2RvN0nKeoGQpmB22NIaA7lW
zL/4vBNH8cDh4HrqoJA746TxgQD0UYFUfhuCakgDwMhadMJy0yUiQ5sSts65ACdZ
dF0UCCYvkNP89hZFFe67pEEbxgaePst/Qgq9/XsQxiJH/fJwxBIiwUFtLJoDOTFL
lIbKfYWiAgyYiOZFqYUK
=+TP9
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
