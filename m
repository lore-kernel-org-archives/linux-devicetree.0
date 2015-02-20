From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v4 4/4] phy: add phy-hi6220-usb
Date: Fri, 20 Feb 2015 08:41:19 -0600
Message-ID: <20150220144119.GB1707@saruman.tx.rr.com>
References: <1423726646-30336-1-git-send-email-zhangfei.gao@linaro.org>
 <1423726646-30336-5-git-send-email-zhangfei.gao@linaro.org>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1423726646-30336-5-git-send-email-zhangfei.gao@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, balbi@ti.com, mark.rutland@arm.com, Peter Chen <peter.chen@freescale.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "dan . zhao" <dan.zhao@hisilicon.com>, Wangbinghui <wangbinghui@hisilicon.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 12, 2015 at 03:37:26PM +0800, Zhangfei Gao wrote:
> Add usb phy controller for hi6220 platform
>=20
> Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> ---
>  drivers/phy/Kconfig          |   9 ++
>  drivers/phy/Makefile         |   1 +
>  drivers/phy/phy-hi6220-usb.c | 306 +++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 316 insertions(+)
>  create mode 100644 drivers/phy/phy-hi6220-usb.c
>=20
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index ccad880..40a1ef1 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -162,6 +162,15 @@ config PHY_HIX5HD2_SATA
>  	help
>  	  Support for SATA PHY on Hisilicon hix5hd2 Soc.
> =20
> +config PHY_HI6220_USB
> +	tristate "hi6220 USB PHY support"
> +	select USB_PHY
> +	select MFD_SYSCON
> +	help
> +	  Enable this to support the HISILICON HI6220 USB PHY.
> +
> +	  To compile this driver as a module, choose M here.
> +
>  config PHY_SUN4I_USB
>  	tristate "Allwinner sunxi SoC USB PHY driver"
>  	depends on ARCH_SUNXI && HAS_IOMEM && OF
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index aa74f96..ec43c2d 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_TI_PIPE3)			+=3D phy-ti-pipe3.o
>  obj-$(CONFIG_TWL4030_USB)		+=3D phy-twl4030-usb.o
>  obj-$(CONFIG_PHY_EXYNOS5250_SATA)	+=3D phy-exynos5250-sata.o
>  obj-$(CONFIG_PHY_HIX5HD2_SATA)		+=3D phy-hix5hd2-sata.o
> +obj-$(CONFIG_PHY_HI6220_USB)		+=3D phy-hi6220-usb.o
>  obj-$(CONFIG_PHY_SUN4I_USB)		+=3D phy-sun4i-usb.o
>  obj-$(CONFIG_PHY_SAMSUNG_USB2)		+=3D phy-exynos-usb2.o
>  phy-exynos-usb2-y			+=3D phy-samsung-usb2.o
> diff --git a/drivers/phy/phy-hi6220-usb.c b/drivers/phy/phy-hi6220-usb.c
> new file mode 100644
> index 0000000..0d9f5ac
> --- /dev/null
> +++ b/drivers/phy/phy-hi6220-usb.c
> @@ -0,0 +1,306 @@
> +/*
> + * Copyright (c) 2015 Linaro Ltd.
> + * Copyright (c) 2015 Hisilicon Limited.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of_gpio.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/usb/gadget.h>
> +#include <linux/usb/otg.h>
> +
> +#define SC_PERIPH_CTRL4			0x00c
> +
> +#define CTRL4_PICO_SIDDQ		BIT(6)
> +#define CTRL4_PICO_OGDISABLE		BIT(8)
> +#define CTRL4_PICO_VBUSVLDEXT		BIT(10)
> +#define CTRL4_PICO_VBUSVLDEXTSEL	BIT(11)
> +#define CTRL4_OTG_PHY_SEL		BIT(21)
> +
> +#define SC_PERIPH_CTRL5			0x010
> +
> +#define CTRL5_USBOTG_RES_SEL		BIT(3)
> +#define CTRL5_PICOPHY_ACAENB		BIT(4)
> +#define CTRL5_PICOPHY_BC_MODE		BIT(5)
> +#define CTRL5_PICOPHY_CHRGSEL		BIT(6)
> +#define CTRL5_PICOPHY_VDATSRCEND	BIT(7)
> +#define CTRL5_PICOPHY_VDATDETENB	BIT(8)
> +#define CTRL5_PICOPHY_DCDENB		BIT(9)
> +#define CTRL5_PICOPHY_IDDIG		BIT(10)
> +
> +#define SC_PERIPH_CTRL8			0x018
> +#define SC_PERIPH_RSTEN0		0x300
> +#define SC_PERIPH_RSTDIS0		0x304
> +
> +#define RST0_USBOTG_BUS			BIT(4)
> +#define RST0_POR_PICOPHY		BIT(5)
> +#define RST0_USBOTG			BIT(6)
> +#define RST0_USBOTG_32K			BIT(7)
> +
> +#define EYE_PATTERN_PARA		0x7053348c
> +
> +struct hi6220_priv {
> +	struct usb_phy phy;
> +	struct delayed_work work;
> +	struct regmap *reg;
> +	struct clk *clk;
> +	struct regulator *vcc;
> +	struct device *dev;
> +	int gpio_vbus;
> +	int gpio_id;
> +	enum usb_otg_state state;
> +};
> +
> +static void hi6220_start_peripheral(struct hi6220_priv *priv, bool on)
> +{
> +	struct usb_otg *otg =3D priv->phy.otg;
> +
> +	if (!otg->gadget)
> +		return;
> +
> +	if (on)
> +		usb_gadget_connect(otg->gadget);
> +	else
> +		usb_gadget_disconnect(otg->gadget);

why is the PHY fiddling with pullups ?

> +}
> +
> +static void hi6220_detect_work(struct work_struct *work)
> +{
> +	struct hi6220_priv *priv =3D
> +		container_of(work, struct hi6220_priv, work.work);
> +	int gpio_id, gpio_vbus;
> +	enum usb_otg_state state;
> +
> +	if (!gpio_is_valid(priv->gpio_id) || !gpio_is_valid(priv->gpio_vbus))
> +		return;
> +
> +	gpio_id =3D gpio_get_value_cansleep(priv->gpio_id);
> +	gpio_vbus =3D gpio_get_value_cansleep(priv->gpio_vbus);

looks like this should be using extcon

> +
> +	if (gpio_vbus =3D=3D 0) {
> +		if (gpio_id =3D=3D 1)
> +			state =3D OTG_STATE_B_PERIPHERAL;
> +		else
> +			state =3D OTG_STATE_A_HOST;
> +	} else {
> +		state =3D OTG_STATE_A_HOST;
> +	}
> +
> +	if (priv->state !=3D state) {
> +		hi6220_start_peripheral(priv, state =3D=3D OTG_STATE_B_PERIPHERAL);
> +		priv->state =3D state;
> +	}
> +}
> +
> +static irqreturn_t hiusb_gpio_intr(int irq, void *data)
> +{
> +	struct hi6220_priv *priv =3D (struct hi6220_priv *)data;
> +
> +	/* add debounce time */
> +	schedule_delayed_work(&priv->work, msecs_to_jiffies(100));

this is really bad. We have threaded interrupt support, right ?

--=20
balbi

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU50ePAAoJEIaOsuA1yqREJIkP/0S2/nYVx/WW8g9gsb8aOnCl
cWlaZyYitY/FQavTW7h2mGpkaTnal/6oDVy0k01+7EPEbihF054K94iwXOfL0EFA
/d4UskLbgTNGcGPfh9wIP8moC19uIHU3CD0pDcHQwLlBfkc7zAOHZe7wMIDtQlB7
MhPcM+JOgEe2g76eHTjQagnQEa6S9I95HsNFLYOMVGBU9qLPiORrwpFwR+6J75pg
Tirr1VX2eFlH/YpFxdfswTERnZK4Kqgp16odlqRNzsxUbSYaJRU4u+/XvVxnCInv
uSFz4IlvhnEe2FRyNQgvpRKw2wt+NAMKtoHY6L41pM8TZKZZJydJ41eSfFDCAiyC
ueOTCELCEiC5TV7EhlWlVIvUjGrTDR04pVFEbdnOkZG8tJoxShqO65IPxiO/xeDa
fRImfkJ9sEhUjpdPPk7BUCmUUwckOacmKWdxR3Bm9tK2y9Bwcy5SkOIUunvHZiS7
W530BWlhq0YNNePkqoH3raPF8EHskqonMwEg9+J4XwsAZXFQTQjQ02DORm/hV1Nm
cY10uR6lzPkzkQne/v88tlOQbsQh7Rgu3XQBe1gt+7/dXRhAxq9+/zSVRnr48F/8
84ZVWkY/2+/yRe58ARlRAScwKT8AMNWZW/pqGZ5aCwzO4KrqjVGwlKgiwbSbkogu
Y8mOYufx4gZwB+9nv7m4
=pEsG
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
