From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V1 3/3] ARM: dts: sabreauto: Add flexcan support
Date: Wed, 24 Oct 2018 08:19:53 -0300
Message-ID: <CAOMZO5Cm2U4dR982vYTmb5zfdjfXbQ95B+mDt2Fp8D-QtvT6FA@mail.gmail.com>
References: <20181024111213.2724-1-qiangqing.zhang@nxp.com> <20181024111213.2724-4-qiangqing.zhang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024111213.2724-4-qiangqing.zhang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: qiangqing.zhang@nxp.com
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Joakim,

On Wed, Oct 24, 2018 at 8:15 AM Joakim Zhang <qiangqing.zhang@nxp.com> wrote:

> diff --git a/arch/arm/boot/dts/imx6dl-sabreauto-flexcan1.dts b/arch/arm/boot/dts/imx6dl-sabreauto-flexcan1.dts
> new file mode 100644
> index 000000000000..963e0b559d60
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6dl-sabreauto-flexcan1.dts
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2013 Freescale Semiconductor, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

You can remove this paragraph as you are using SPDX tag.

> +++ b/arch/arm/boot/dts/imx6q-sabreauto-flexcan1.dts
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2013 Freescale Semiconductor, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */

Ditto.

> +&can1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_flexcan1>;
> +       pinctrl-assert-gpios = <&max7310_b 3 GPIO_ACTIVE_HIGH>; /* TX */

This property does not exist in upstream.
