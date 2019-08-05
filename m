From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 01/16] net: phy: adin: add support for Analog Devices PHYs
Date: Mon, 5 Aug 2019 22:54:01 +0200
Message-ID: <206ec97f-3115-9a2c-91a0-e5f7aec4a39e@gmail.com>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
 <20190805165453.3989-2-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190805165453.3989-2-alexandru.ardelean@analog.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

On 05.08.2019 18:54, Alexandru Ardelean wrote:
> This change adds support for Analog Devices Industrial Ethernet PHYs.
> Particularly the PHYs this driver adds support for:
>  * ADIN1200 - Robust, Industrial, Low Power 10/100 Ethernet PHY
>  * ADIN1300 - Robust, Industrial, Low Latency 10/100/1000 Gigabit
>    Ethernet PHY
> 
> The 2 chips are pin & register compatible with one another. The main
> difference being that ADIN1200 doesn't operate in gigabit mode.
> 
> The chips can be operated by the Generic PHY driver as well via the
> standard IEEE PHY registers (0x0000 - 0x000F) which are supported by the
> kernel as well. This assumes that configuration of the PHY has been done
> required.
> 
> Configuration can also be done via registers, which will be implemented by
> the driver in the next changes.
> 
> Datasheets:
>   https://www.analog.com/media/en/technical-documentation/data-sheets/ADIN1300.pdf
>   https://www.analog.com/media/en/technical-documentation/data-sheets/ADIN1200.pdf
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  MAINTAINERS              |  7 +++++
>  drivers/net/phy/Kconfig  |  9 ++++++
>  drivers/net/phy/Makefile |  1 +
>  drivers/net/phy/adin.c   | 59 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 76 insertions(+)
>  create mode 100644 drivers/net/phy/adin.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ee663e0e2f2e..faf5723610c8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -938,6 +938,13 @@ S:	Supported
>  F:	drivers/mux/adgs1408.c
>  F:	Documentation/devicetree/bindings/mux/adi,adgs1408.txt
>  
> +ANALOG DEVICES INC ADIN DRIVER
> +M:	Alexandru Ardelean <alexaundru.ardelean@analog.com>
> +L:	netdev@vger.kernel.org
> +W:	http://ez.analog.com/community/linux-device-drivers
> +S:	Supported
> +F:	drivers/net/phy/adin.c
> +
>  ANALOG DEVICES INC ADIS DRIVER LIBRARY
>  M:	Alexandru Ardelean <alexandru.ardelean@analog.com>
>  S:	Supported
> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> index 206d8650ee7f..5966d3413676 100644
> --- a/drivers/net/phy/Kconfig
> +++ b/drivers/net/phy/Kconfig
> @@ -257,6 +257,15 @@ config SFP
>  	depends on HWMON || HWMON=n
>  	select MDIO_I2C
>  
> +config ADIN_PHY
> +	tristate "Analog Devices Industrial Ethernet PHYs"
> +	help
> +	  Adds support for the Analog Devices Industrial Ethernet PHYs.
> +	  Currently supports the:
> +	  - ADIN1200 - Robust,Industrial, Low Power 10/100 Ethernet PHY
> +	  - ADIN1300 - Robust,Industrial, Low Latency 10/100/1000 Gigabit
> +	    Ethernet PHY
> +
>  config AMD_PHY
>  	tristate "AMD PHYs"
>  	---help---
> diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
> index ba07c27e4208..a03437e091f3 100644
> --- a/drivers/net/phy/Makefile
> +++ b/drivers/net/phy/Makefile
> @@ -47,6 +47,7 @@ obj-$(CONFIG_SFP)		+= sfp.o
>  sfp-obj-$(CONFIG_SFP)		+= sfp-bus.o
>  obj-y				+= $(sfp-obj-y) $(sfp-obj-m)
>  
> +obj-$(CONFIG_ADIN_PHY)		+= adin.o
>  obj-$(CONFIG_AMD_PHY)		+= amd.o
>  aquantia-objs			+= aquantia_main.o
>  ifdef CONFIG_HWMON
> diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
> new file mode 100644
> index 000000000000..6a610d4563c3
> --- /dev/null
> +++ b/drivers/net/phy/adin.c
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/**
> + *  Driver for Analog Devices Industrial Ethernet PHYs
> + *
> + * Copyright 2019 Analog Devices Inc.
> + */
> +#include <linux/kernel.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/mii.h>
> +#include <linux/phy.h>
> +
> +#define PHY_ID_ADIN1200				0x0283bc20
> +#define PHY_ID_ADIN1300				0x0283bc30
> +
> +static int adin_config_init(struct phy_device *phydev)
> +{
> +	int rc;
> +
> +	rc = genphy_config_init(phydev);
> +	if (rc < 0)
> +		return rc;
> +
> +	return 0;
> +}
> +
> +static struct phy_driver adin_driver[] = {
> +	{
> +		.phy_id		= PHY_ID_ADIN1200,

You could use PHY_ID_MATCH_MODEL here.

> +		.name		= "ADIN1200",
> +		.phy_id_mask	= 0xfffffff0,
> +		.features	= PHY_BASIC_FEATURES,

Setting features is deprecated, instead the get_features callback
should be implemented if the default genphy_read_abilities needs
to be extended / replaced. You say that the PHY's work with the
genphy driver, so I suppose the default feature detection is ok
in your case. Then you could simply remove setting "features".

> +		.config_init	= adin_config_init,
> +		.config_aneg	= genphy_config_aneg,
> +		.read_status	= genphy_read_status,
> +	},
> +	{
> +		.phy_id		= PHY_ID_ADIN1300,
> +		.name		= "ADIN1300",
> +		.phy_id_mask	= 0xfffffff0,
> +		.features	= PHY_GBIT_FEATURES,
> +		.config_init	= adin_config_init,
> +		.config_aneg	= genphy_config_aneg,
> +		.read_status	= genphy_read_status,
> +	},
> +};
> +
> +module_phy_driver(adin_driver);
> +
> +static struct mdio_device_id __maybe_unused adin_tbl[] = {
> +	{ PHY_ID_ADIN1200, 0xfffffff0 },
> +	{ PHY_ID_ADIN1300, 0xfffffff0 },

PHY_ID_MATCH_MODEL could be used here too.

> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(mdio, adin_tbl);
> +MODULE_DESCRIPTION("Analog Devices Industrial Ethernet PHY driver");
> +MODULE_LICENSE("GPL");
> 
