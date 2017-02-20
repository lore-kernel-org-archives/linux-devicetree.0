From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] fpga manager: Add Xilinx slave serial SPI driver
Date: Mon, 20 Feb 2017 09:27:35 -0800
Message-ID: <CAAtXAHeO_+6ZXP51nxFgyLYR9cjqLrqmoYEniqXmZudF=3uhFA@mail.gmail.com>
References: <1487600724-17607-1-git-send-email-agust@denx.de> <1487600724-17607-3-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487600724-17607-3-git-send-email-agust-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Cc: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Anatolij,

small nits inline.

On Mon, Feb 20, 2017 at 6:25 AM, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org> wrote:
> The driver loads FPGA firmware over SPI, using the "slave serial"
> configuration interface on Xilinx FPGAs.
>
> Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>

Acked-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
> This patch requires patch https://lkml.org/lkml/2017/2/15/667
> for building
>
> Changes in v2:
>
>  - rebased on v4.10
>
>  drivers/fpga/Kconfig      |   7 ++
>  drivers/fpga/Makefile     |   1 +
>  drivers/fpga/xilinx-spi.c | 181 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 189 insertions(+)
>  create mode 100644 drivers/fpga/xilinx-spi.c
>
> diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
> index ce861a2..6b42786 100644
> --- a/drivers/fpga/Kconfig
> +++ b/drivers/fpga/Kconfig
> @@ -33,6 +33,13 @@ config FPGA_MGR_SOCFPGA_A10
>         help
>           FPGA manager driver support for Altera Arria10 SoCFPGA.
>
> +config FPGA_MGR_XILINX_SPI
> +       tristate "Xilinx Configuration over Slave Serial (SPI)"
> +       depends on SPI
> +       help
> +         FPGA manager driver support for Xilinx FPGA configuration
> +         over slave serial interface.
> +
>  config FPGA_MGR_ZYNQ_FPGA
>         tristate "Xilinx Zynq FPGA"
>         depends on ARCH_ZYNQ || COMPILE_TEST
> diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
> index 8df07bc..7582c5a 100644
> --- a/drivers/fpga/Makefile
> +++ b/drivers/fpga/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_FPGA)                      += fpga-mgr.o
>  # FPGA Manager Drivers
>  obj-$(CONFIG_FPGA_MGR_SOCFPGA)         += socfpga.o
>  obj-$(CONFIG_FPGA_MGR_SOCFPGA_A10)     += socfpga-a10.o
> +obj-$(CONFIG_FPGA_MGR_XILINX_SPI)      += xilinx-spi.o
>  obj-$(CONFIG_FPGA_MGR_ZYNQ_FPGA)       += zynq-fpga.o
>
>  # FPGA Bridge Drivers
> diff --git a/drivers/fpga/xilinx-spi.c b/drivers/fpga/xilinx-spi.c
> new file mode 100644
> index 0000000..16b3fa2
> --- /dev/null
> +++ b/drivers/fpga/xilinx-spi.c
> @@ -0,0 +1,181 @@
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
> +#define FPGA_MIN_CFG_WAIT_US   10
> +
> +struct xilinx_spi_conf {
> +       struct spi_device *spi;
> +       struct gpio_desc *prog_b;
> +       struct gpio_desc *done;
> +};
> +
> +static enum fpga_mgr_states xilinx_spi_state(struct fpga_manager *mgr)
> +{
> +       struct xilinx_spi_conf *conf = mgr->priv;
> +
> +       if (!gpiod_get_value(conf->done))
> +               return FPGA_MGR_STATE_RESET;
> +
> +       return FPGA_MGR_STATE_UNKNOWN;
> +}
> +
> +static int xilinx_spi_write_init(struct fpga_manager *mgr,
> +                                struct fpga_image_info *info,
> +                                const char *buf, size_t count)
> +{
> +       struct xilinx_spi_conf *conf = mgr->priv;
> +
> +       if (info->flags & FPGA_MGR_PARTIAL_RECONFIG) {
> +               dev_err(&mgr->dev, "Partial reconfiguration not supported.\n");
> +               return -EINVAL;
> +       }
> +
> +       gpiod_set_value(conf->prog_b, 1);
> +
> +       udelay(1); /* min is 500 ns */

Maybe make this a named constant.
> +
> +       gpiod_set_value(conf->prog_b, 0);
> +
> +       if (gpiod_get_value(conf->done)) {
> +               dev_err(&mgr->dev, "Unexpected DONE pin state...\n");
> +               return -EIO;
> +       }
> +
> +       /* program latency */
> +       usleep_range(1000, 1500);

Same here.
> +       return 0;
> +}
> +
> +static int xilinx_spi_write(struct fpga_manager *mgr, const char *buf,
> +                           size_t count)
> +{
> +       struct xilinx_spi_conf *conf = mgr->priv;
> +       const char *fw_data = buf;
> +       const char *fw_data_end = fw_data + count;
> +
> +       while (fw_data < fw_data_end) {
> +               int ret;
> +               size_t stride = min(fw_data_end - fw_data, SZ_4K);
> +
> +               ret = spi_write(conf->spi, fw_data, stride);
> +               if (ret) {
> +                       dev_err(&mgr->dev, "SPI error in firmware write: %d\n",
> +                               ret);
> +                       return ret;
> +               }
> +               fw_data += stride;
> +       }
> +
> +       return 0;
> +}
> +
> +static int xilinx_spi_write_complete(struct fpga_manager *mgr,
> +                                    struct fpga_image_info *info)
> +{
> +       struct xilinx_spi_conf *conf = mgr->priv;
> +       int wait;
> +
> +       if (gpiod_get_value(conf->done))
> +               return 0;
> +
> +       wait = info->config_complete_timeout_us / FPGA_MIN_CFG_WAIT_US;
> +       if (info->config_complete_timeout_us % FPGA_MIN_CFG_WAIT_US)
> +               wait += 1;
> +
> +       while (wait--) {
> +               usleep_range(FPGA_MIN_CFG_WAIT_US, FPGA_MIN_CFG_WAIT_US + 5);
> +
> +               if (gpiod_get_value(conf->done))
> +                       return 0;
> +       }
> +
> +       dev_err(&mgr->dev, "Timeout after config data transfer.\n");
> +       return -ETIMEDOUT;
> +}
> +
> +static const struct fpga_manager_ops xilinx_spi_ops = {
> +       .state = xilinx_spi_state,
> +       .write_init = xilinx_spi_write_init,
> +       .write = xilinx_spi_write,
> +       .write_complete = xilinx_spi_write_complete,
> +};
> +
> +static int xilinx_spi_probe(struct spi_device *spi)
> +{
> +       struct xilinx_spi_conf *conf;
> +
> +       conf = devm_kzalloc(&spi->dev, sizeof(*conf), GFP_KERNEL);
> +       if (!conf)
> +               return -ENOMEM;
> +
> +       conf->spi = spi;
> +
> +       /* PROGRAM_B is active low */
> +       conf->prog_b = devm_gpiod_get(&spi->dev, "prog_b", GPIOD_OUT_LOW);
> +       if (IS_ERR(conf->prog_b)) {
> +               dev_err(&spi->dev, "Failed to get PROGRAM_B gpio: %ld\n",
> +                       PTR_ERR(conf->prog_b));
> +               return PTR_ERR(conf->prog_b);
> +       }
> +
> +       conf->done = devm_gpiod_get(&spi->dev, "done", GPIOD_IN);
> +       if (IS_ERR(conf->done)) {
> +               dev_err(&spi->dev, "Failed to get DONE gpio: %ld\n",
> +                       PTR_ERR(conf->done));
> +               return PTR_ERR(conf->done);
> +       }
> +
> +       return fpga_mgr_register(&spi->dev, "Xilinx Slave Serial FPGA Manager",
> +                                &xilinx_spi_ops, conf);
> +}
> +
> +static int xilinx_spi_remove(struct spi_device *spi)
> +{
> +       fpga_mgr_unregister(&spi->dev);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id xlnx_spi_of_match[] = {
> +       { .compatible = "xlnx,fpga-slave-serial", },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, xlnx_spi_of_match);
> +
> +static struct spi_driver xilinx_slave_spi_driver = {
> +       .driver = {
> +               .name = "xlnx-slave-spi",
> +               .owner = THIS_MODULE,
> +               .of_match_table = of_match_ptr(xlnx_spi_of_match),
> +       },
> +       .probe = xilinx_spi_probe,
> +       .remove = xilinx_spi_remove,
> +};
> +
> +module_spi_driver(xilinx_slave_spi_driver)
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>");
> +MODULE_DESCRIPTION("Load Xilinx FPGA firmware over SPI");
> --
> 2.7.4
>

Thanks for the patch,

Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
