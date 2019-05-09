Return-Path: <SRS0=cxpq=TJ=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 06/10] usb: renesas_usbhs: Add support for RZ/A2
Date: Thu, 9 May 2019 07:04:12 +0000
Message-ID: 
 <OSBPR01MB317436B70E57E04964BDDECED8330@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-7-chris.brandt@renesas.com>
In-Reply-To: <20190506234631.113226-7-chris.brandt@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris=1B$B$5$s=1B(B

Thank you for the patch!

> From: Chris Brandt, Sent: Tuesday, May 7, 2019 8:46 AM
>=20
> The RZ/A2 is similar to the R-Car Gen3 with some small differences.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/usb/renesas_usbhs/Makefile |  2 +-
>  drivers/usb/renesas_usbhs/common.c | 27 +++++++++----
>  drivers/usb/renesas_usbhs/common.h | 13 ++++++
>  drivers/usb/renesas_usbhs/fifo.c   |  8 +++-
>  drivers/usb/renesas_usbhs/rza.h    |  1 +
>  drivers/usb/renesas_usbhs/rza2.c   | 82 ++++++++++++++++++++++++++++++++=
++++++
>  include/linux/usb/renesas_usbhs.h  |  1 +
>  7 files changed, 124 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/usb/renesas_usbhs/rza2.c
>=20
> diff --git a/drivers/usb/renesas_usbhs/Makefile b/drivers/usb/renesas_usb=
hs/Makefile
> index 5c5b51bb48ef..a1fed56b0957 100644
> --- a/drivers/usb/renesas_usbhs/Makefile
> +++ b/drivers/usb/renesas_usbhs/Makefile
> @@ -5,7 +5,7 @@
>=20
>  obj-$(CONFIG_USB_RENESAS_USBHS)	+=3D renesas_usbhs.o
>=20
> -renesas_usbhs-y			:=3D common.o mod.o pipe.o fifo.o rcar2.o rcar3.o rza.=
o
> +renesas_usbhs-y			:=3D common.o mod.o pipe.o fifo.o rcar2.o rcar3.o rza.=
o rza2.o
>=20
>  ifneq ($(CONFIG_USB_RENESAS_USBHS_HCD),)
>  	renesas_usbhs-y		+=3D mod_host.o
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usb=
hs/common.c
> index 249fbee97f3f..8293f34b964a 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -44,13 +44,6 @@
>   */
>=20
>=20
> -#define USBHSF_RUNTIME_PWCTRL	(1 << 0)
> -
> -/* status */
> -#define usbhsc_flags_init(p)   do {(p)->flags =3D 0; } while (0)
> -#define usbhsc_flags_set(p, b) ((p)->flags |=3D  (b))
> -#define usbhsc_flags_clr(p, b) ((p)->flags &=3D ~(b))
> -#define usbhsc_flags_has(p, b) ((p)->flags &   (b))

I would like to separate this patch to some patches like below to review th=
e patch(es) easily:

1. Just move these definitions to common.h.
2. Add USBHSF_HAS_CNEN and related code.
3. Add USBHSF_CFIFO_BYTE_ADDR and related code.
4. Add RZ/A2 support.

<snip>
> @@ -620,6 +623,11 @@ static struct renesas_usbhs_platform_info *usbhs_par=
se_dt(struct device *dev)
>  		dparam->pipe_size =3D ARRAY_SIZE(usbhsc_new_pipe);
>  	}
>=20
> +	if (dparam->type =3D=3D USBHS_TYPE_RZA2) {
> +		dparam->pipe_configs =3D usbhsc_new_pipe;
> +		dparam->pipe_size =3D ARRAY_SIZE(usbhsc_new_pipe);
> +	}
> +

It's the same with RZA1. So, I think we can reuse the code like below. What=
 do you think?
+	if (dparam->type =3D=3D USBHS_TYPE_RZA1 ||
+	    dparam->type =3D=3D USBHS_TYPE_RZA2) {
		dparam->pipe_configs =3D usbhsc_new_pipe;
		dparam->pipe_size =3D ARRAY_SIZE(usbhsc_new_pipe);
	}

<snip>
> diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs=
/fifo.c
> index 39fa2fc1b8b7..9b8220c2c9cc 100644
> --- a/drivers/usb/renesas_usbhs/fifo.c
> +++ b/drivers/usb/renesas_usbhs/fifo.c
> @@ -543,8 +543,12 @@ static int usbhsf_pio_try_push(struct usbhs_pkt *pkt=
, int *is_done)
>  	}
>=20
>  	/* the rest operation */
> -	for (i =3D 0; i < len; i++)
> -		iowrite8(buf[i], addr + (0x03 - (i & 0x03)));
> +	if (usbhsc_flags_has(priv, USBHSF_CFIFO_BYTE_ADDR))
> +		for (i =3D 0; i < len; i++)
> +			iowrite8(buf[i], addr + (i & 0x03));
> +	else
> +		for (i =3D 0; i < len; i++)
> +			iowrite8(buf[i], addr + (0x03 - (i & 0x03)));

I prefer to add "{ }" on "if" and "else" like below.

	if (usbhsc_flags_has(priv, USBHSF_CFIFO_BYTE_ADDR)) {
		for (i =3D 0; i < len; i++)
			iowrite8(buf[i], addr + (i & 0x03));
	} else {
		for (i =3D 0; i < len; i++)
			iowrite8(buf[i], addr + (0x03 - (i & 0x03)));
	}

>  	/*
>  	 * variable update
> diff --git a/drivers/usb/renesas_usbhs/rza.h b/drivers/usb/renesas_usbhs/=
rza.h
> index ca917ca54f6d..073a53d1d442 100644
> --- a/drivers/usb/renesas_usbhs/rza.h
> +++ b/drivers/usb/renesas_usbhs/rza.h
> @@ -2,3 +2,4 @@
>  #include "common.h"
>=20
>  extern const struct renesas_usbhs_platform_callback usbhs_rza1_ops;
> +extern const struct renesas_usbhs_platform_callback usbhs_rza2_ops;
> diff --git a/drivers/usb/renesas_usbhs/rza2.c b/drivers/usb/renesas_usbhs=
/rza2.c
> new file mode 100644
> index 000000000000..c0b5dfa4b85d
> --- /dev/null
> +++ b/drivers/usb/renesas_usbhs/rza2.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas USB driver RZ/A2 initialization and power control
> + *
> + * Copyright (C) 2019 Chris Brandt
> + * Copyright (C) 2019 Renesas Electronics Corporation
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/of_device.h>
> +#include <linux/phy/phy.h>
> +#include "common.h"
> +#include "rza.h"
> +
> +
> +static int usbhs_rza2_hardware_init(struct platform_device *pdev)
> +{
> +	struct usbhs_priv *priv =3D usbhs_pdev_to_priv(pdev);
> +
> +	if (IS_ENABLED(CONFIG_GENERIC_PHY)) {
> +		struct phy *phy =3D phy_get(&pdev->dev, "usb");
> +
> +		if (IS_ERR(phy))
> +			return PTR_ERR(phy);
> +
> +		priv->phy =3D phy;
> +		return 0;
> +	}
> +	return -ENXIO;
> +}
> +
> +static int usbhs_rza2_hardware_exit(struct platform_device *pdev)
> +{
> +	struct usbhs_priv *priv =3D usbhs_pdev_to_priv(pdev);
> +
> +	if (priv->phy) {
> +		phy_put(priv->phy);
> +		priv->phy =3D NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int usbhs_rza2_power_ctrl(struct platform_device *pdev,
> +				void __iomem *base, int enable)
> +{
> +	struct usbhs_priv *priv =3D usbhs_pdev_to_priv(pdev);
> +	int retval =3D -ENODEV;
> +
> +	if (priv->phy) {
> +		if (enable) {
> +			retval =3D phy_init(priv->phy);
> +			if (enable) {
> +				usbhs_bset(priv, SUSPMODE, SUSPM, SUSPM);
> +				/* Wait 100 usec for PLL to become stable */
> +				udelay(100);
> +			} else {

This else code never runs. So,

> +				usbhs_bset(priv, SUSPMODE, SUSPM, 0);

this code should be on the below "here"?

> +			}
> +			if (!retval)
> +				retval =3D phy_power_on(priv->phy);
> +		} else {

here?

Best regardsm
Yoshihiro Shimoda
