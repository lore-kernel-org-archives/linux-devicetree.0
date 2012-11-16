From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 5/9] usb: add phy connection by phy-mode
Date: Fri, 16 Nov 2012 13:28:46 +0200
Message-ID: <20121116112846.GB17793@arwen.pp.htv.fi>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de>
 <1352909950-32555-6-git-send-email-m.grzeschik@pengutronix.de>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0998631898238976997=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1352909950-32555-6-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============0998631898238976997==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline

--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 14, 2012 at 05:19:06PM +0100, Michael Grzeschik wrote:
> This patch makes it possible to set the connection of the usbphy to the
> soc. It is derived from the oftree bindings for the ethernetphy and adds
> similar helperfunctions.
>=20
> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

I think Kishon had sent some patches related to this. Kishon ?

> ---
>  drivers/of/Kconfig        |    4 ++++
>  drivers/of/Makefile       |    1 +
>  drivers/of/of_usbphy.c    |   49 +++++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/of_usbphy.h |   15 ++++++++++++++
>  include/linux/usb/phy.h   |    8 ++++++++
>  5 files changed, 77 insertions(+)
>  create mode 100644 drivers/of/of_usbphy.c
>  create mode 100644 include/linux/of_usbphy.h
>=20
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index dfba3e6..28f99fb 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -67,6 +67,10 @@ config OF_MDIO
>  	help
>  	  OpenFirmware MDIO bus (Ethernet PHY) accessors
> =20
> +config OF_USBPHY
> +	depends on USB
> +	def_bool y
> +
>  config OF_PCI
>  	def_tristate PCI
>  	depends on PCI
> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> index e027f44..fdcaf51 100644
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_OF_IRQ)    +=3D irq.o
>  obj-$(CONFIG_OF_DEVICE) +=3D device.o platform.o
>  obj-$(CONFIG_OF_I2C)	+=3D of_i2c.o
>  obj-$(CONFIG_OF_NET)	+=3D of_net.o
> +obj-$(CONFIG_OF_USBPHY)	+=3D of_usbphy.o
>  obj-$(CONFIG_OF_SELFTEST) +=3D selftest.o
>  obj-$(CONFIG_OF_MDIO)	+=3D of_mdio.o
>  obj-$(CONFIG_OF_PCI)	+=3D of_pci.o
> diff --git a/drivers/of/of_usbphy.c b/drivers/of/of_usbphy.c
> new file mode 100644
> index 0000000..2e71f7b
> --- /dev/null
> +++ b/drivers/of/of_usbphy.c
> @@ -0,0 +1,49 @@
> +/*
> + * OF helpers for network devices.
> + *
> + * This file is released under the GPLv2
> + *
> + * Initially copied out of drivers/of/of_net.c
> + */
> +#include <linux/etherdevice.h>
> +#include <linux/kernel.h>
> +#include <linux/of_usbphy.h>
> +#include <linux/usb/phy.h>
> +#include <linux/export.h>
> +
> +/**
> + * It maps 'enum usb_phy_interface' found in include/linux/usb/phy.h
> + * into the device tree binding of 'phy-mode', so that USB
> + * device driver can get phy interface from device tree.
> + */
> +static const char *usbphy_modes[] =3D {
> +	[USBPHY_INTERFACE_MODE_NA]	=3D "",
> +	[USBPHY_INTERFACE_MODE_UTMI]	=3D "utmi",
> +	[USBPHY_INTERFACE_MODE_UTMIW]	=3D "utmiw",
> +	[USBPHY_INTERFACE_MODE_ULPI]	=3D "ulpi",
> +	[USBPHY_INTERFACE_MODE_SERIAL]	=3D "fsls",
> +};
> +
> +/**
> + * of_get_phy_mode - Get phy mode for given device_node
> + * @np:	Pointer to the given device_node
> + *
> + * The function gets phy interface string from property 'phy-mode',
> + * and return its index in phy_modes table, or errno in error case.
> + */
> +const int of_get_usbphy_mode(struct device_node *np)
> +{
> +	const char *pm;
> +	int err, i;
> +
> +	err =3D of_property_read_string(np, "phy-mode", &pm);
> +	if (err < 0)
> +		return err;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(usbphy_modes); i++)
> +		if (!strcasecmp(pm, usbphy_modes[i]))
> +			return i;
> +
> +	return -ENODEV;
> +}
> +EXPORT_SYMBOL_GPL(of_get_usbphy_mode);
> diff --git a/include/linux/of_usbphy.h b/include/linux/of_usbphy.h
> new file mode 100644
> index 0000000..9a4132d
> --- /dev/null
> +++ b/include/linux/of_usbphy.h
> @@ -0,0 +1,15 @@
> +/*
> + * OF helpers for usb devices.
> + *
> + * This file is released under the GPLv2
> + */
> +
> +#ifndef __LINUX_OF_USBPHY_H
> +#define __LINUX_OF_USBPHY_H
> +
> +#ifdef CONFIG_OF_USBPHY
> +#include <linux/of.h>
> +extern const int of_get_usbphy_mode(struct device_node *np);
> +#endif
> +
> +#endif /* __LINUX_OF_USBPHY_H */
> diff --git a/include/linux/usb/phy.h b/include/linux/usb/phy.h
> index a29ae1e..150eb69 100644
> --- a/include/linux/usb/phy.h
> +++ b/include/linux/usb/phy.h
> @@ -12,6 +12,14 @@
>  #include <linux/notifier.h>
>  #include <linux/usb.h>
> =20
> +enum usb_phy_interface {
> +	USBPHY_INTERFACE_MODE_NA,
> +	USBPHY_INTERFACE_MODE_UTMI,
> +	USBPHY_INTERFACE_MODE_UTMIW,
> +	USBPHY_INTERFACE_MODE_ULPI,
> +	USBPHY_INTERFACE_MODE_SERIAL,
> +};
> +
>  enum usb_phy_events {
>  	USB_EVENT_NONE,         /* no events or cable disconnected */
>  	USB_EVENT_VBUS,         /* vbus valid event */
> --=20
> 1.7.10.4
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
balbi

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQpiNuAAoJEIaOsuA1yqREPSgP/3pSFv0QGm8Oo6g4tqAQ27vD
0i1csHeLWGX1VenEsllOtCMCK9i8GrGCGii6gZVM5xWGkNFz4XaazYs3GT2C/ZxD
olimzHbAZPrbuw/d+SWGZfqLrI43W/NldjAFqqsqhBOzPe2EnDRvLGvwPTIr0diT
14twV7NfXe31Yy42QLFFvo/3AA48CvqP/fFdUIru1YBkj0IbPdvnDLtNrTuA9DtA
uBRILADKfrj5MJaEwyT/KeTqtJE4ISqgrk0vbjWKZUKE0g2WjCNwrSX8tkRczKtq
KU48DAeglqA/FvpmHVBrLw9Z2MMm8fuzvxc9N02EY3PtSAEK75njB+mf6Utg5kn1
tOu+APcUfcaDZPBXkepZd46WvqiLGXyPZ6yDJkoqSTn8QI/Qd9g8E1gt64790bMo
ycwFUX0HlWErue0ijU9Ty/EGN8WLEsbN85XbF57VY73Cgsc8AUTuOTMhEwAtZpL6
+3yJQ6vhJKZnjsJ+hiwi+vA8DE0r6sOYwMzPz/RCyK0iV1Xkg4pkkFsNEeD4zHJm
IUp+i01mZgr98q6+Y3TvCnS5PJh6nzpPLQxuNceX5Sr+1Uy0Dzej8yIlp32kJv1Q
D6pSBpoMps3cBSKz0tAgFktjrhT/bqd3pugOAH/i9daMQ5vMexJTNkSzD4BIArxh
CVMZAiQ2Vc2b6VEBoWhI
=60/O
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--

--===============0998631898238976997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0998631898238976997==--
