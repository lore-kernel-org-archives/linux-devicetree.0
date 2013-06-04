From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/7] USB: add devicetree helpers for determining dr_mode
 and phy_type
Date: Tue, 4 Jun 2013 23:25:22 +0300
Message-ID: <20130604202522.GE28302@arwen.pp.htv.fi>
References: <1370025529-7414-1-git-send-email-mgr@pengutronix.de>
 <1370025529-7414-2-git-send-email-mgr@pengutronix.de>
 <8761xvjrwt.fsf@ashishki-desk.ger.corp.intel.com>
 <20130604130140.GF28181@pengutronix.de>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3520857273996047599=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130604130140.GF28181-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============3520857273996047599==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BZaMRJmqxGScZ8Mx"
Content-Disposition: inline

--BZaMRJmqxGScZ8Mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

HI,

On Tue, Jun 04, 2013 at 03:01:40PM +0200, Michael Grzeschik wrote:
> On Mon, Jun 03, 2013 at 03:32:50PM +0300, Alexander Shishkin wrote:
> > Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
> >=20
> > > From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > >
> > > This adds two little devicetree helper functions for determining the
> > > dr_mode (host, peripheral, otg) and phy_type (utmi, ulpi,...) from
> > > the devicetree.
> >=20
> > This one needs an ack from Felipe.
>=20
> Right, we currently also wait for his answer in another thread.
>=20
> http://www.spinics.net/lists/linux-usb/msg86906.html

heh, it's so difficult to take vacations :-p

I think this patch is good to go.

Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>


> > > Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > ---
> > >  drivers/usb/phy/Makefile |  1 +
> > >  drivers/usb/phy/of.c     | 47 ++++++++++++++++++++++++++++++++++++++=
+++++++++
> > >  drivers/usb/usb-common.c | 35 +++++++++++++++++++++++++++++++++++
> > >  include/linux/usb/of.h   | 28 ++++++++++++++++++++++++++++
> > >  include/linux/usb/otg.h  |  7 +++++++
> > >  include/linux/usb/phy.h  |  9 +++++++++
> > >  6 files changed, 127 insertions(+)
> > >  create mode 100644 drivers/usb/phy/of.c
> > >  create mode 100644 include/linux/usb/of.h
> > >
> > > diff --git a/drivers/usb/phy/Makefile b/drivers/usb/phy/Makefile
> > > index a9169cb..070eca3 100644
> > > --- a/drivers/usb/phy/Makefile
> > > +++ b/drivers/usb/phy/Makefile
> > > @@ -5,6 +5,7 @@
> > >  ccflags-$(CONFIG_USB_DEBUG) :=3D -DDEBUG
> > > =20
> > >  obj-$(CONFIG_USB_PHY)			+=3D phy.o
> > > +obj-$(CONFIG_OF)			+=3D of.o
> > > =20
> > >  # transceiver drivers, keep the list sorted
> > > =20
> > > diff --git a/drivers/usb/phy/of.c b/drivers/usb/phy/of.c
> > > new file mode 100644
> > > index 0000000..e6f3b74
> > > --- /dev/null
> > > +++ b/drivers/usb/phy/of.c
> > > @@ -0,0 +1,47 @@
> > > +/*
> > > + * USB of helper code
> > > + *
> > > + * This program is free software; you can redistribute it and/or mod=
ify
> > > + * it under the terms of the GNU General Public License as published=
 by
> > > + * the Free Software Foundation; either version 2 of the License, or
> > > + * (at your option) any later version.
> > > + */
> > > +
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/usb/of.h>
> > > +#include <linux/usb/otg.h>
> > > +
> > > +static const char *usbphy_modes[] =3D {
> > > +	[USBPHY_INTERFACE_MODE_UNKNOWN]	=3D "",
> > > +	[USBPHY_INTERFACE_MODE_UTMI]	=3D "utmi",
> > > +	[USBPHY_INTERFACE_MODE_UTMIW]	=3D "utmi_wide",
> > > +	[USBPHY_INTERFACE_MODE_ULPI]	=3D "ulpi",
> > > +	[USBPHY_INTERFACE_MODE_SERIAL]	=3D "serial",
> > > +	[USBPHY_INTERFACE_MODE_HSIC]	=3D "hsic",
> > > +};
> > > +
> > > +/**
> > > + * of_usb_get_phy_mode - Get phy mode for given device_node
> > > + * @np:	Pointer to the given device_node
> > > + *
> > > + * The function gets phy interface string from property 'phy_type',
> > > + * and returns the correspondig enum usb_phy_interface
> > > + */
> > > +enum usb_phy_interface of_usb_get_phy_mode(struct device_node *np)
> > > +{
> > > +	const char *phy_type;
> > > +	int err, i;
> > > +
> > > +	err =3D of_property_read_string(np, "phy_type", &phy_type);
> > > +	if (err < 0)
> > > +		return USBPHY_INTERFACE_MODE_UNKNOWN;
> > > +
> > > +	for (i =3D 0; i < ARRAY_SIZE(usbphy_modes); i++)
> > > +		if (!strcmp(phy_type, usbphy_modes[i]))
> > > +			return i;
> > > +
> > > +	return USBPHY_INTERFACE_MODE_UNKNOWN;
> > > +}
> > > +EXPORT_SYMBOL_GPL(of_usb_get_phy_mode);
> > > diff --git a/drivers/usb/usb-common.c b/drivers/usb/usb-common.c
> > > index 0db0a91..027582d 100644
> > > --- a/drivers/usb/usb-common.c
> > > +++ b/drivers/usb/usb-common.c
> > > @@ -13,7 +13,9 @@
> > > =20
> > >  #include <linux/kernel.h>
> > >  #include <linux/module.h>
> > > +#include <linux/of.h>
> > >  #include <linux/usb/ch9.h>
> > > +#include <linux/usb/of.h>
> > >  #include <linux/usb/otg.h>
> > > =20
> > >  const char *usb_otg_state_string(enum usb_otg_state state)
> > > @@ -79,4 +81,37 @@ const char *usb_state_string(enum usb_device_state=
 state)
> > >  }
> > >  EXPORT_SYMBOL_GPL(usb_state_string);
> > > =20
> > > +#ifdef CONFIG_OF
> > > +static const char *usb_dr_modes[] =3D {
> > > +	[USB_DR_MODE_UNKNOWN]		=3D "",
> > > +	[USB_DR_MODE_HOST]		=3D "host",
> > > +	[USB_DR_MODE_PERIPHERAL]	=3D "peripheral",
> > > +	[USB_DR_MODE_OTG]		=3D "otg",
> > > +};
> > > +
> > > +/**
> > > + * of_usb_get_dr_mode - Get dual role mode for given device_node
> > > + * @np:	Pointer to the given device_node
> > > + *
> > > + * The function gets phy interface string from property 'dr_mode',
> > > + * and returns the correspondig enum usb_dr_mode
> > > + */
> > > +enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np)
> > > +{
> > > +	const char *dr_mode;
> > > +	int err, i;
> > > +
> > > +	err =3D of_property_read_string(np, "dr_mode", &dr_mode);
> > > +	if (err < 0)
> > > +		return USB_DR_MODE_UNKNOWN;
> > > +
> > > +	for (i =3D 0; i < ARRAY_SIZE(usb_dr_modes); i++)
> > > +		if (!strcmp(dr_mode, usb_dr_modes[i]))
> > > +			return i;
> > > +
> > > +	return USB_DR_MODE_UNKNOWN;
> > > +}
> > > +EXPORT_SYMBOL_GPL(of_usb_get_dr_mode);
> > > +#endif
> > > +
> > >  MODULE_LICENSE("GPL");
> > > diff --git a/include/linux/usb/of.h b/include/linux/usb/of.h
> > > new file mode 100644
> > > index 0000000..e460a24
> > > --- /dev/null
> > > +++ b/include/linux/usb/of.h
> > > @@ -0,0 +1,28 @@
> > > +/*
> > > + * OF helpers for usb devices.
> > > + *
> > > + * This file is released under the GPLv2
> > > + */
> > > +
> > > +#ifndef __LINUX_USB_OF_H
> > > +#define __LINUX_USB_OF_H
> > > +
> > > +#include <linux/usb/otg.h>
> > > +#include <linux/usb/phy.h>
> > > +
> > > +#ifdef CONFIG_OF
> > > +enum usb_phy_interface of_usb_get_phy_mode(struct device_node *np);
> > > +enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np);
> > > +#else
> > > +static inline enum usb_phy_interface of_usb_get_phy_mode(struct devi=
ce_node *np)
> > > +{
> > > +	return USBPHY_INTERFACE_MODE_UNKNOWN;
> > > +}
> > > +
> > > +static inline enum usb_dr_mode of_usb_get_dr_mode(struct device_node=
 *np)
> > > +{
> > > +	return USB_DR_MODE_UNKNOWN;
> > > +}
> > > +#endif
> > > +
> > > +#endif /* __LINUX_USB_OF_H */
> > > diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
> > > index 291e01b..154332b 100644
> > > --- a/include/linux/usb/otg.h
> > > +++ b/include/linux/usb/otg.h
> > > @@ -92,4 +92,11 @@ otg_start_srp(struct usb_otg *otg)
> > >  /* for OTG controller drivers (and maybe other stuff) */
> > >  extern int usb_bus_start_enum(struct usb_bus *bus, unsigned port_num=
);
> > > =20
> > > +enum usb_dr_mode {
> > > +	USB_DR_MODE_UNKNOWN,
> > > +	USB_DR_MODE_HOST,
> > > +	USB_DR_MODE_PERIPHERAL,
> > > +	USB_DR_MODE_OTG,
> > > +};
> > > +
> >=20
> > I would suggest turning this into a bitmask, so that further tests look
> > like
> >=20
> >   if (dr_mode & USB_DR_MODE_HOST) {...}
> >
> > instead of how they currently look like in the other patch.
>=20
> You mean 32 modes will be enough? :)
>=20
> These helpers are derived from drivers/of/of_net.c. Its enums are
> commonly used all over the kernel. We should align to already used
> coding patterns. I also prefer to switch over an enum than compare bits.

I will agree with you Michael here. Besides, bitmasks would make OTG
mode useless. Matter of taste, I guess.

--=20
balbi

--BZaMRJmqxGScZ8Mx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRrk0yAAoJEIaOsuA1yqRE3KEP/i48rCq5ddlL7XMfytaOWfCu
kitneEppiS+sPgNvPIwaezbFonzFLCF5jbffTgKsGLpkdQu2oHo7mU19hiytCovO
8mORjvdRQnhDtz7XfQemxe0/qEsEqnR7Tg3fIB4wRj8mFfbhAsdclHc4J+dUfZPN
ElmWRto049o/IfuQZ0Fkp/xInlAPlonch+U/10Ua/hGP6jkRyBi4Ux4N8AhfTcFN
IK+5v8T9bIUlp/lEchomT4RXKaW3tq9Bun1CVTlnR3kS6zAVCCHVqIVYFoB50obw
TmpJ5HTskBjl4xcJt/51N4OLPYh5PItNeqLVX9tlWFgpAfGbOdmOHeRincU2N/Eq
YIp8M/HfzA5K8r5modYft0sKzjZYeSrgfzvcitTZtej8CXgvSmpgvPU5FWx4bEap
XJ4dEMyGKsVaRtSuftogp1SMN7TeNqarYW58LXtHhNm/hSfMrkbKmSnlDJGw3+6X
e7OcRuqMAFGMRF6o5OonhwiKxtLFathiiBO4YwCOjId3Cqe+TiRlj1W/+Las8bOS
HNvWqesoGD9fcjHaN3sFALVOjjxS1mRRqt3vV6r9jpTpXtGkl94I9Fvrl1B6epu2
QD1IxMxSaoOlxzRw4N7lB50vozWUfVgiXW7Y369etMQ2lRArJKbieGhJTAUnt199
KPzddIf5B8Ok4+MdW+eF
=CTyk
-----END PGP SIGNATURE-----

--BZaMRJmqxGScZ8Mx--

--===============3520857273996047599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3520857273996047599==--
