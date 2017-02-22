From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/2] fpga manager: Add Xilinx slave serial SPI driver
Date: Wed, 22 Feb 2017 16:04:47 +0100
Message-ID: <e9620f07-48bd-1f83-a686-6874becbba86@xilinx.com>
References: <1487759951-20711-1-git-send-email-agust@denx.de>
 <1487759951-20711-3-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487759951-20711-3-git-send-email-agust-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 22.2.2017 11:39, Anatolij Gustschin wrote:
> The driver loads FPGA firmware over SPI, using the "slave serial"
> configuration interface on Xilinx FPGAs.
> 
> Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
> ---
> This patch requires patch https://lkml.org/lkml/2017/2/15/667
> for building
> 
> Changes in v3:
> 
>  - use named constant for udelay()/usleep_range() arguments
>  - drop not needed .owner init
>  - correct module licence (GPL v2)
>  - fix build warning with newer gcc (in min() macro)
> 
> Changes in v2:
> 
>  - rebased on v4.10
> 
>  drivers/fpga/Kconfig      |   7 ++
>  drivers/fpga/Makefile     |   1 +
>  drivers/fpga/xilinx-spi.c | 185 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 193 insertions(+)
>  create mode 100644 drivers/fpga/xilinx-spi.c
> 
> diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
> index ce861a2..6b42786 100644
> --- a/drivers/fpga/Kconfig
> +++ b/drivers/fpga/Kconfig
> @@ -33,6 +33,13 @@ config FPGA_MGR_SOCFPGA_A10
>  	help
>  	  FPGA manager driver support for Altera Arria10 SoCFPGA.
>  
> +config FPGA_MGR_XILINX_SPI
> +	tristate "Xilinx Configuration over Slave Serial (SPI)"
> +	depends on SPI
> +	help
> +	  FPGA manager driver support for Xilinx FPGA configuration
> +	  over slave serial interface.
> +
>  config FPGA_MGR_ZYNQ_FPGA
>  	tristate "Xilinx Zynq FPGA"
>  	depends on ARCH_ZYNQ || COMPILE_TEST
> diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
> index 8df07bc..7582c5a 100644
> --- a/drivers/fpga/Makefile
> +++ b/drivers/fpga/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_FPGA)			+= fpga-mgr.o
>  # FPGA Manager Drivers
>  obj-$(CONFIG_FPGA_MGR_SOCFPGA)		+= socfpga.o
>  obj-$(CONFIG_FPGA_MGR_SOCFPGA_A10)	+= socfpga-a10.o
> +obj-$(CONFIG_FPGA_MGR_XILINX_SPI)	+= xilinx-spi.o
>  obj-$(CONFIG_FPGA_MGR_ZYNQ_FPGA)	+= zynq-fpga.o
>  
>  # FPGA Bridge Drivers
> diff --git a/drivers/fpga/xilinx-spi.c b/drivers/fpga/xilinx-spi.c
> new file mode 100644
> index 0000000..af95727
> --- /dev/null
> +++ b/drivers/fpga/xilinx-spi.c
> @@ -0,0 +1,185 @@
> +/*
> + * Xilinx Spartan6 Slave Serial SPI Driver
> + *
> + * Copyright (C) 2017 DENX Software Engineering
> + *
> + * Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * Manage Xilinx FPGA firmware that is loaded over SPI using
> + * the slave serial configuration interface.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/fpga/fpga-mgr.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/of.h>
> +#include <linux/spi/spi.h>
> +#include <linux/sizes.h>
> +
> +#define FPGA_MIN_CFG_WAIT_US	10
> +
> +struct xilinx_spi_conf {
> +	struct spi_device *spi;
> +	struct gpio_desc *prog_b;
> +	struct gpio_desc *done;
> +};
> +
> +static enum fpga_mgr_states xilinx_spi_state(struct fpga_manager *mgr)
> +{
> +	struct xilinx_spi_conf *conf = mgr->priv;
> +
> +	if (!gpiod_get_value(conf->done))
> +		return FPGA_MGR_STATE_RESET;
> +
> +	return FPGA_MGR_STATE_UNKNOWN;
> +}
> +
> +static int xilinx_spi_write_init(struct fpga_manager *mgr,
> +				 struct fpga_image_info *info,
> +				 const char *buf, size_t count)
> +{
> +	struct xilinx_spi_conf *conf = mgr->priv;
> +	const size_t prog_latency_1000us = 1000;
> +	const size_t prog_pulse_1us = 1;
> +
> +	if (info->flags & FPGA_MGR_PARTIAL_RECONFIG) {
> +		dev_err(&mgr->dev, "Partial reconfiguration not supported.\n");
> +		return -EINVAL;
> +	}
> +
> +	gpiod_set_value(conf->prog_b, 1);
> +
> +	udelay(prog_pulse_1us); /* min is 500 ns */
> +
> +	gpiod_set_value(conf->prog_b, 0);
> +
> +	if (gpiod_get_value(conf->done)) {
> +		dev_err(&mgr->dev, "Unexpected DONE pin state...\n");
> +		return -EIO;
> +	}
> +
> +	/* program latency */
> +	usleep_range(prog_latency_1000us, prog_latency_1000us + 500);

Based on my colleague for spartan6 this should be 5ms and other xilinx
fpgas can take up to 7.5ms.

In general, it is better to poll for INIT_B pin==High (but that takes
another GPIO) and wait until at least 10 ms before timeout.


> +	return 0;
> +}
> +
> +static int xilinx_spi_write(struct fpga_manager *mgr, const char *buf,
> +			    size_t count)
> +{
> +	struct xilinx_spi_conf *conf = mgr->priv;
> +	const char *fw_data = buf;
> +	const char *fw_data_end = fw_data + count;
> +
> +	while (fw_data < fw_data_end) {
> +		size_t remaining, stride;
> +		int ret;
> +
> +		remaining = fw_data_end - fw_data;
> +		stride = min_t(size_t, remaining, SZ_4K);
> +
> +		ret = spi_write(conf->spi, fw_data, stride);
> +		if (ret) {
> +			dev_err(&mgr->dev, "SPI error in firmware write: %d\n",
> +				ret);
> +			return ret;
> +		}
> +		fw_data += stride;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xilinx_spi_write_complete(struct fpga_manager *mgr,
> +				     struct fpga_image_info *info)
> +{
> +	struct xilinx_spi_conf *conf = mgr->priv;
> +	int wait;
> +
> +	if (gpiod_get_value(conf->done))
> +		return 0;
> +
> +	wait = info->config_complete_timeout_us / FPGA_MIN_CFG_WAIT_US;
> +	if (info->config_complete_timeout_us % FPGA_MIN_CFG_WAIT_US)
> +		wait += 1;
> +
> +	while (wait--) {
> +		usleep_range(FPGA_MIN_CFG_WAIT_US, FPGA_MIN_CFG_WAIT_US + 5);
> +
> +		if (gpiod_get_value(conf->done))
> +			return 0;
> +	}
> +

Based on my colleague:
IMHO, for step 4 it is better to do these steps to cover more possible
configuration DONE scenarios:

While ((DONE==0) and (NOT TIMEOUT)) {
    Continue to apply CCLK cycles;
    Check DONE;
    timeout++;
}

Apply at least 8 more CCLK cycles.

The timeout should be equivalent to at least 10 ms of time.

Thanks,
Michal

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
