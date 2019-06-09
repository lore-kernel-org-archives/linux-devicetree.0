From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V5 02/11] misc: xilinx-sdfec: add core driver
Date: Sun, 9 Jun 2019 13:22:35 +0200
Message-ID: <20190609112235.GA16574@kroah.com>
References: <1560038656-380620-1-git-send-email-dragan.cvetic@xilinx.com>
 <1560038656-380620-3-git-send-email-dragan.cvetic@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560038656-380620-3-git-send-email-dragan.cvetic@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dragan Cvetic <dragan.cvetic@xilinx.com>
Cc: arnd@arndb.de, michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Derek Kiernan <derek.kiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 09, 2019 at 01:04:07AM +0100, Dragan Cvetic wrote:
> Implement a platform driver that matches with xlnx,
> sd-fec-1.1 device tree node and registers as a character
> device, including:
> - SD-FEC driver binds to sdfec DT node.
> - creates and initialise an initial driver dev structure.
> - add the driver in Linux build and Kconfig.
> 
> Tested-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
> Signed-off-by: Derek Kiernan <derek.kiernan@xilinx.com>
> Signed-off-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
> ---
>  drivers/misc/Kconfig        |  12 +++++
>  drivers/misc/Makefile       |   1 +
>  drivers/misc/xilinx_sdfec.c | 118 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 131 insertions(+)
>  create mode 100644 drivers/misc/xilinx_sdfec.c
> 
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 6b0417b..319a6bf 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -471,6 +471,18 @@ config PCI_ENDPOINT_TEST
>             Enable this configuration option to enable the host side test driver
>             for PCI Endpoint.
>  
> +config XILINX_SDFEC
> +	tristate "Xilinx SDFEC 16"
> +	help
> +	  This option enables support for the Xilinx SDFEC (Soft Decision
> +	  Forward Error Correction) driver. This enables a char driver
> +	  for the SDFEC.
> +
> +	  You may select this driver if your design instantiates the
> +	  SDFEC(16nm) hardened block. To compile this as a module choose M.
> +
> +	  If unsure, say N.
> +
>  config MISC_RTSX
>  	tristate
>  	default MISC_RTSX_PCI || MISC_RTSX_USB
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index b9affcd..0cb3546 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -59,3 +59,4 @@ obj-$(CONFIG_OCXL)		+= ocxl/
>  obj-y				+= cardreader/
>  obj-$(CONFIG_PVPANIC)   	+= pvpanic.o
>  obj-$(CONFIG_HABANA_AI)		+= habanalabs/
> +obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
> diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
> new file mode 100644
> index 0000000..75cc980
> --- /dev/null
> +++ b/drivers/misc/xilinx_sdfec.c
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Xilinx SDFEC
> + *
> + * Copyright (C) 2019 Xilinx, Inc.
> + *
> + * Description:
> + * This driver is developed for SDFEC16 (Soft Decision FEC 16nm)
> + * IP. It exposes a char device which supports file operations
> + * like  open(), close() and ioctl().
> + */
> +
> +#include <linux/miscdevice.h>
> +#include <linux/io.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/poll.h>
> +#include <linux/slab.h>
> +#include <linux/clk.h>
> +
> +static int xsdfec_ndevs;

You should use an idr for this, not just a number you bump up and down.
This will not work properly at all.

Think about this situation:
	probe device 0
	xsdfec_ndevs = 1
	probe device 1
	xsdfec_ndevs = 2
	remove device 0
	xsdfec_ndevs = 0
	probe another device
	misc device fails due to duplicate name.

thanks,

greg k-h
