From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v2 4/4] phy: ti: Add a new SERDES driver for TI's AM654x
 SoC
Date: Thu, 7 Feb 2019 13:16:12 +0200
Message-ID: <5C5C137C.2040109@ti.com>
References: <20190206110753.28738-1-kishon@ti.com>
 <20190206110753.28738-5-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206110753.28738-5-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 06/02/19 13:07, Kishon Vijay Abraham I wrote:
> Add a new SERDES driver for TI's AM654x SoC which configures
> the SERDES only for PCIe. Support fo USB3 will be added later.
> 
> SERDES in am654x has three input clocks (left input, externel reference
> clock and right input) and two output clocks (left output and right
> output) in addition to a PLL mux clock which the SERDES uses for Clock
> Multiplier Unit (CMU refclock).
> 
> The PLL mux clock can select from one of the three input clocks.
> The right output can select between left input and external reference
> clock while the left output can select between the right input and
> external reference clock.
> 
> The driver has support to select PLL mux and left/right output mux as
> specified in device tree.
> 
> [rogerq@ti.com: Fix boot lockup caused by accessing a structure member
> (hw->init) allocated in stack of probe() and accessed in get_parent]
> [rogerq@ti.com: Fix "Failed to find the parent" warnings]
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  drivers/phy/ti/Kconfig            |  11 +
>  drivers/phy/ti/Makefile           |   1 +
>  drivers/phy/ti/phy-am654-serdes.c | 539 ++++++++++++++++++++++++++++++
>  3 files changed, 551 insertions(+)
>  create mode 100644 drivers/phy/ti/phy-am654-serdes.c
> 
> diff --git a/drivers/phy/ti/Kconfig b/drivers/phy/ti/Kconfig
> index f137e0107764..6357c32de115 100644
> --- a/drivers/phy/ti/Kconfig
> +++ b/drivers/phy/ti/Kconfig
> @@ -20,6 +20,17 @@ config PHY_DM816X_USB
>  	help
>  	  Enable this for dm816x USB to work.
>  
> +config PHY_AM654_SERDES
> +	tristate "TI AM654 SERDES support"
> +	depends on OF && ARCH_K3 || COMPILE_TEST
> +	select GENERIC_PHY
> +	select MULTIPLEXER
> +	select REGMAP_MMIO
> +	select MUX_MMIO
> +	help
> +	  This option enables support for TI AM654 SerDes PHY used for
> +	  PCIe.
> +
>  config OMAP_CONTROL_PHY
>  	tristate "OMAP CONTROL PHY Driver"
>  	depends on ARCH_OMAP2PLUS || COMPILE_TEST
> diff --git a/drivers/phy/ti/Makefile b/drivers/phy/ti/Makefile
> index bea8f25a137a..bff901eb0ecc 100644
> --- a/drivers/phy/ti/Makefile
> +++ b/drivers/phy/ti/Makefile
> @@ -6,4 +6,5 @@ obj-$(CONFIG_OMAP_USB2)			+= phy-omap-usb2.o
>  obj-$(CONFIG_TI_PIPE3)			+= phy-ti-pipe3.o
>  obj-$(CONFIG_PHY_TUSB1210)		+= phy-tusb1210.o
>  obj-$(CONFIG_TWL4030_USB)		+= phy-twl4030-usb.o
> +obj-$(CONFIG_PHY_AM654_SERDES)		+= phy-am654-serdes.o
>  obj-$(CONFIG_PHY_TI_GMII_SEL)		+= phy-gmii-sel.o
> diff --git a/drivers/phy/ti/phy-am654-serdes.c b/drivers/phy/ti/phy-am654-serdes.c
> new file mode 100644
> index 000000000000..dfbd2d48503d
> --- /dev/null
> +++ b/drivers/phy/ti/phy-am654-serdes.c
> @@ -0,0 +1,539 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/**
> + * PCIe SERDES driver for AM654x SoC
> + *
> + * Copyright (C) 2018 Texas Instruments

2018-2019.

> + * Author: Kishon Vijay Abraham I <kishon@ti.com>
> + */
> +
> +#include <dt-bindings/phy/phy.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mux/consumer.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/mfd/syscon.h>
> +

<snip>

cheers,
-roger

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
