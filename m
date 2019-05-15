Return-Path: <SRS0=FRIL=TP=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v3 11/15] usb: renesas_usbhs: Add support for RZ/A2
Date: Wed, 15 May 2019 07:52:52 +0000
Message-ID: 
 <OSBPR01MB3174F7F91A11317D353BCE9AD8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-12-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-12-chris.brandt@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Chris Brandt <Chris.Brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris-san,

Thank you for the patch!

> From: Chris Brandt, Sent: Tuesday, May 14, 2019 11:56 PM
>=20
> The RZ/A2 is similar to the R-Car Gen3 with some small differences.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v3:
>  * Removed check for CONFIG_GENERIC_PHY
>  * rebase on top of Shimoda-san (v2) patch
> v2:
>  * combined RZA1 and RZA2 for fifo setting
>  * added braces to make code easier to read
>  * fixed and clean up usbhs_rza2_power_ctrl()
> ---
>  drivers/usb/renesas_usbhs/Makefile |  2 +-
>  drivers/usb/renesas_usbhs/common.c | 15 ++++++++
>  drivers/usb/renesas_usbhs/rza.h    |  1 +
>  drivers/usb/renesas_usbhs/rza2.c   | 75 ++++++++++++++++++++++++++++++++=
++++++
>  include/linux/usb/renesas_usbhs.h  |  1 +
>  5 files changed, 93 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/usb/renesas_usbhs/rza2.c
<snip>
> diff --git a/drivers/usb/renesas_usbhs/rza2.c b/drivers/usb/renesas_usbhs=
/rza2.c
> new file mode 100644
> index 000000000000..56409cbae33c
> --- /dev/null
> +++ b/drivers/usb/renesas_usbhs/rza2.c
> @@ -0,0 +1,75 @@
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

I should have realized this on v2 patch though, this double blank lines
should be a line. After fixed it,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda
