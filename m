From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v3 01/12] reset: add the Berlin reset controller driver
Date: Wed, 16 Jul 2014 18:39:53 +0200
Message-ID: <20140716163953.GJ9858@lunn.ch>
References: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com>
 <1405499166-6726-2-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1405499166-6726-2-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 16, 2014 at 10:25:55AM +0200, Antoine T=E9nart wrote:
> Add a reset controller for Marvell Berlin SoCs which is used by the
> USB PHYs drivers (for now).
>=20
> Signed-off-by: Antoine T=E9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
>
> Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  drivers/reset/Makefile       |   1 +
>  drivers/reset/reset-berlin.c | 131 +++++++++++++++++++++++++++++++++=
++++++++++
>  2 files changed, 132 insertions(+)
>  create mode 100644 drivers/reset/reset-berlin.c
>=20
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 60fed3d7820b..157d421f755b 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -1,4 +1,5 @@
>  obj-$(CONFIG_RESET_CONTROLLER) +=3D core.o
>  obj-$(CONFIG_ARCH_SOCFPGA) +=3D reset-socfpga.o
> +obj-$(CONFIG_ARCH_BERLIN) +=3D reset-berlin.o
>  obj-$(CONFIG_ARCH_SUNXI) +=3D reset-sunxi.o
>  obj-$(CONFIG_ARCH_STI) +=3D sti/
> diff --git a/drivers/reset/reset-berlin.c b/drivers/reset/reset-berli=
n.c
> new file mode 100644
> index 000000000000..7b894047a81d
> --- /dev/null
> +++ b/drivers/reset/reset-berlin.c
> @@ -0,0 +1,131 @@
> +/*
> + * Copyright (C) 2014 Marvell Technology Group Ltd.
> + *
> + * Antoine T=E9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> + * Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +#define BERLIN_MAX_RESETS	32
> +
> +#define to_berlin_reset_priv(p)		\
> +	container_of((p), struct berlin_reset_priv, rcdev)
> +
> +struct berlin_reset_priv {
> +	void __iomem			*base;
> +	unsigned int			size;
> +	struct reset_controller_dev	rcdev;
> +};
> +
> +static int berlin_reset_reset(struct reset_controller_dev *rcdev,
> +			      unsigned long id)
> +{
> +	struct berlin_reset_priv *priv =3D to_berlin_reset_priv(rcdev);
> +	int offset =3D id >> 8;
> +	int mask =3D BIT(id & 0xff);

nit:=20

The parameter to BIT() should be 0-31. So you want to & with 5. Given
your xlate function, it should never happen that it is greater than
31. Hence it is only a nit. If you need to respin, you can change
this, but don't bother to respin just because of this.

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
