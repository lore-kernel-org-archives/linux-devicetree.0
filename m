From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] arm64: dts: marvell: Add device tree for uDPU board
Date: Fri, 11 Jan 2019 18:41:47 +0100
Message-ID: <20190111174147.GG20924@lunn.ch>
References: <20190111172055.30451-1-vladimir.vid@sartura.hr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190111172055.30451-1-vladimir.vid@sartura.hr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vladimir Vid <vladimir.vid@sartura.hr>
Cc: devicetree@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>, Paul Arola <paul.arola@telus.com>, Luis Torres <luis.torres@methode.com>, Scott Roberts <scott.roberts@telus.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
> new file mode 100644
> index 000000000000..eae30322a037
> --- /dev/null
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
> @@ -0,0 +1,178 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device tree for the uDPU board.
> + * Based on Marvell Armada 3720 development board (DB-88F3720-DDR3)
> + * Copyright (C) 2016 Marvell
> + * Copyright (C) 2018 Methode
> + * Copyright (C) 2018 Telus
> + *
> + * Vladimir Vid <vladimir.vid@sartura.hr>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "armada-372x.dtsi"
> +
> +/ {
> +	model = "Methode uDPU Board";
> +	compatible = "marvell,armada-3720-db", "marvell,armada3720",
> +		     "marvell,armada3710";
> +

Hi Vladimir

There should be a compatible string here for the board. It looks like
you will also need to add Methode as a vendor to
Documentation/devicetree/bindings/vendor-prefixes.txt.

> +	leds {
> +		pinctrl-names = "default";
> +		compatible = "gpio-leds";
> +
> +		led@487 {
> +			gpios = <&gpionb 11 GPIO_ACTIVE_LOW>;
> +			default-state = "off";

It is normal to have a name here, indicating what the LED is for, its
colour, etc.

> +&mdio {
> +	status = "okay";
> +	phy0: ethernet-phy@0 {
> +		reg = <0>;
> +	};
> +	phy1: ethernet-phy@1 {
> +		reg = <1>;
> +	};
> +};

These don't appear to be used anywhere. 

      Andrew
