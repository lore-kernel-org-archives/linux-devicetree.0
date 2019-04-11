From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 3/5] ARM: dts: tq imx7 common board support
Date: Thu, 11 Apr 2019 09:24:25 +0800
Message-ID: <20190411012424.GB26817@dragon>
References: <20190304165630.18225-1-bruno.thomsen@gmail.com>
 <20190403064427.30041-1-bruno.thomsen@gmail.com>
 <20190403064427.30041-4-bruno.thomsen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190403064427.30041-4-bruno.thomsen@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: markus.niebel@tq-group.com, devicetree@vger.kernel.org, laa@kamstrup.com, s.hauer@pengutronix.de, clemens.ml@gmx.net, bth@kamstrup.com, ksc@kamstrup.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 03, 2019 at 08:44:25AM +0200, Bruno Thomsen wrote:
> diff --git a/arch/arm/boot/dts/imx7-mba7.dtsi b/arch/arm/boot/dts/imx7-mba7.dtsi
> new file mode 100644
> index 000000000000..a880a698bdaf
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx7-mba7.dtsi
> @@ -0,0 +1,563 @@
> +// SPDX-License-Identifier: GPL-2.0 OR X11
> +/*
> + * Device Tree Include file for TQ Systems MBa7 carrier board.
> + *
> + * Copyright (C) 2016 TQ Systems GmbH
> + * Author: Markus Niebel <Markus.Niebel@tq-group.com>
> + * Copyright (C) 2019 Bruno Thomsen <bruno.thomsen@gmail.com>
> + *
> + * Note: This file does not include nodes for all peripheral devices.
> + * As device driver coverage increases additional nodes can be added.
> + */
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +
> +/ {
> +	beeper {
> +		compatible = "gpio-beeper";
> +		gpios = <&pca9555 0 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	chosen {
> +		bootargs="ttymxc5,115200";

I do not think this is really needed.

> +		linux,stdout-path = &uart6;

The property is deprecated and unnecessary since we have stdout-path
just below.

I dropped these two lines when applying.

Shawn

> +		stdout-path = &uart6;
> +	};
