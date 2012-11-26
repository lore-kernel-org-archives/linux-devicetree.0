From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 5/9] usb: add phy connection by phy-mode
Date: Mon, 26 Nov 2012 17:56:49 +0800
Message-ID: <20121126095648.GA15824@nchen-desktop>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de>
 <1352909950-32555-6-git-send-email-m.grzeschik@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1352909950-32555-6-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 14, 2012 at 05:19:06PM +0100, Michael Grzeschik wrote:
> This patch makes it possible to set the connection of the usbphy to the
> soc. It is derived from the oftree bindings for the ethernetphy and adds
> similar helperfunctions.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  drivers/of/Kconfig        |    4 ++++
>  drivers/of/Makefile       |    1 +
>  drivers/of/of_usbphy.c    |   49 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of_usbphy.h |   15 ++++++++++++++
>  include/linux/usb/phy.h   |    8 ++++++++
>  5 files changed, 77 insertions(+)
>  create mode 100644 drivers/of/of_usbphy.c
>  create mode 100644 include/linux/of_usbphy.h
> 
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index dfba3e6..28f99fb 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -67,6 +67,10 @@ config OF_MDIO
>  	help
>  	  OpenFirmware MDIO bus (Ethernet PHY) accessors
>  
> +config OF_USBPHY
> +	depends on USB
> +	def_bool y
> +
>  config OF_PCI
>  	def_tristate PCI
>  	depends on PCI
> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> index e027f44..fdcaf51 100644
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_OF_IRQ)    += irq.o
>  obj-$(CONFIG_OF_DEVICE) += device.o platform.o
>  obj-$(CONFIG_OF_I2C)	+= of_i2c.o
>  obj-$(CONFIG_OF_NET)	+= of_net.o
> +obj-$(CONFIG_OF_USBPHY)	+= of_usbphy.o
>  obj-$(CONFIG_OF_SELFTEST) += selftest.o
>  obj-$(CONFIG_OF_MDIO)	+= of_mdio.o
>  obj-$(CONFIG_OF_PCI)	+= of_pci.o
> diff --git a/drivers/of/of_usbphy.c b/drivers/of/of_usbphy.c
> new file mode 100644
> index 0000000..2e71f7b
> --- /dev/null
> +++ b/drivers/of/of_usbphy.c
> @@ -0,0 +1,49 @@
> +/*
> + * OF helpers for network devices.
> + *
> + * This file is released under the GPLv2
> + *
> + * Initially copied out of drivers/of/of_net.c
> + */
> +#include <linux/etherdevice.h>
> +#include <linux/kernel.h>
> +#include <linux/of_usbphy.h>
> +#include <linux/usb/phy.h>
> +#include <linux/export.h>
> +
> +/**
> + * It maps 'enum usb_phy_interface' found in include/linux/usb/phy.h
> + * into the device tree binding of 'phy-mode', so that USB
> + * device driver can get phy interface from device tree.
> + */
> +static const char *usbphy_modes[] = {
> +	[USBPHY_INTERFACE_MODE_NA]	= "",
> +	[USBPHY_INTERFACE_MODE_UTMI]	= "utmi",
> +	[USBPHY_INTERFACE_MODE_UTMIW]	= "utmiw",
> +	[USBPHY_INTERFACE_MODE_ULPI]	= "ulpi",
> +	[USBPHY_INTERFACE_MODE_SERIAL]	= "fsls",
"fsls"? or should be "serial"?
> +};
> +

Best Regards,
Peter Chen

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
