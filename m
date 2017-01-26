From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 06/11] clk: sunxi-ng: Add A80 USB CCU
Date: Thu, 26 Jan 2017 11:14:05 +0100
Message-ID: <20170126101405.npxzp2bmto5oeyex@lukather>
References: <20170124023230.3990-1-wens@csie.org>
 <20170124023230.3990-7-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dzto6hprgehagboz"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB3UXU7CAKGQEC7OJUNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170124023230.3990-7-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--dzto6hprgehagboz
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Tue, Jan 24, 2017 at 10:32:25AM +0800, Chen-Yu Tsai wrote:
> Add support for the USB clock controls found on the A80.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  .../devicetree/bindings/clock/sun9i-usb.txt        |  24 ++++
>  drivers/clk/sunxi-ng/Makefile                      |   1 +
>  drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c           | 144 +++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.h           |  25 ++++
>  include/dt-bindings/clock/sun9i-a80-usb.h          |  59 +++++++++
>  include/dt-bindings/reset/sun9i-a80-usb.h          |  56 ++++++++
>  6 files changed, 309 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sun9i-usb.txt
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.h
>  create mode 100644 include/dt-bindings/clock/sun9i-a80-usb.h
>  create mode 100644 include/dt-bindings/reset/sun9i-a80-usb.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/sun9i-usb.txt b/Documentation/devicetree/bindings/clock/sun9i-usb.txt
> new file mode 100644
> index 000000000000..c2d38626eaaa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sun9i-usb.txt
> @@ -0,0 +1,24 @@
> +Allwinner A80 USB Clock Control Binding
> +------------------------------------
> +
> +Required properties :
> +- compatible: must contain one of the following compatibles:
> +		- "allwinner,sun9i-a80-usb-clocks"
> +
> +- reg: Must contain the registers base address and length
> +- clocks: phandle to the clocks feeding the USB subsystem. Two are needed:
> +  - "bus": the bus clock for the whole USB subsystem
> +  - "hosc": the high frequency oscillator (usually at 24MHz)
> +- clock-names: Must contain the clock names described just above
> +- #clock-cells : must contain 1
> +- #reset-cells : must contain 1
> +
> +Example:
> +usb_clocks: clock@00a08000 {
> +	compatible = "allwinner,sun9i-a80-usb-clks";
> +	reg = <0x00a08000 0x8>;
> +	clocks = <&ccu CLK_BUS_USB>, <&osc24M>;
> +	clock-names = "bus", "hosc";
> +	#clock-cells = <1>;
> +	#reset-cells = <1>;
> +};
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
> index 126bb7c1c3f7..8f37ef7fb67d 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -26,3 +26,4 @@ obj-$(CONFIG_SUN8I_A33_CCU)	+= ccu-sun8i-a33.o
>  obj-$(CONFIG_SUN8I_H3_CCU)	+= ccu-sun8i-h3.o
>  obj-$(CONFIG_SUN8I_V3S_CCU)	+= ccu-sun8i-v3s.o
>  obj-$(CONFIG_SUN9I_A80_CCU)	+= ccu-sun9i-a80.o
> +obj-$(CONFIG_SUN9I_A80_CCU)	+= ccu-sun9i-a80-usb.o
> diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c b/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
> new file mode 100644
> index 000000000000..1d76f24f7df3
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
> @@ -0,0 +1,144 @@
> +/*
> + * Copyright (c) 2016 Chen-Yu Tsai. All rights reserved.
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +
> +#include "ccu_common.h"
> +#include "ccu_gate.h"
> +#include "ccu_reset.h"
> +
> +#include "ccu-sun9i-a80-usb.h"
> +
> +static SUNXI_CCU_GATE(bus_hci0_clk, "bus-hci0", "bus-usb", 0x0, BIT(1), 0);
> +static SUNXI_CCU_GATE(usb_ohci0_clk, "usb-ohci0", "osc24M", 0x0, BIT(2), 0);
> +static SUNXI_CCU_GATE(bus_hci1_clk, "bus-hci1", "bus-usb", 0x0, BIT(3), 0);
> +static SUNXI_CCU_GATE(bus_hci2_clk, "bus-hci2", "bus-usb", 0x0, BIT(5), 0);
> +static SUNXI_CCU_GATE(usb_ohci2_clk, "usb-ohci2", "osc24M", 0x0, BIT(6), 0);

In the current !sunxi-ng driver, there's a clock at offset 4, did you
forget it?

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--dzto6hprgehagboz--
