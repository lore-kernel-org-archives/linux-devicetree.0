From: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] fpga: lattice machxo2: Add Lattice MachXO2 support
Date: Tue, 25 Apr 2017 10:59:48 -0500
Message-ID: <CANk1AXQ0=T5Bj2J=Y6xx4RGEDpuwUA7j_C=65B0W2VK5AWYn+g@mail.gmail.com>
References: <1492960845-342-1-git-send-email-p.pisati@gmail.com> <1492960845-342-3-git-send-email-p.pisati@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492960845-342-3-git-send-email-p.pisati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paolo Pisati <p.pisati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 23, 2017 at 10:20 AM, Paolo Pisati <p.pisati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

Hi Paolo,

Thanks for submitting your driver.  A few things...

> Add support for the Lattice MachXO2 FPGA chip in Slave SPI configuration.
>

Please add a bit of a description here.  Format should be subject
line, skip a line,  description, skip a line, then your signoff.

> Signed-off-by: Paolo Pisati <p.pisati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/fpga/Kconfig       |   7 ++
>  drivers/fpga/Makefile      |   1 +
>  drivers/fpga/machxo2-spi.c | 199 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 207 insertions(+)
>  create mode 100644 drivers/fpga/machxo2-spi.c
>
> diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
> index c81cb7d..cce135b 100644
> --- a/drivers/fpga/Kconfig
> +++ b/drivers/fpga/Kconfig
> @@ -26,6 +26,13 @@ config FPGA_MGR_ICE40_SPI
>         help
>           FPGA manager driver support for Lattice iCE40 FPGAs over SPI.
>
> +config FPGA_MGR_MACHXO2_SPI
> +       tristate "Lattice MachXO2 SPI"
> +       depends on SPI
> +       help
> +        FPGA manager driver support for Lattice MachXO2 configuration
> +        over slave SPI interface.
> +
>  config FPGA_MGR_SOCFPGA
>         tristate "Altera SOCFPGA FPGA Manager"
>         depends on ARCH_SOCFPGA || COMPILE_TEST
> diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
> index c6f5d74..cdab1fe 100644
> --- a/drivers/fpga/Makefile
> +++ b/drivers/fpga/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_FPGA)                      += fpga-mgr.o
>
>  # FPGA Manager Drivers
>  obj-$(CONFIG_FPGA_MGR_ICE40_SPI)       += ice40-spi.o
> +obj-$(CONFIG_FPGA_MGR_MACHXO2_SPI)     += machxo2-spi.o
>  obj-$(CONFIG_FPGA_MGR_SOCFPGA)         += socfpga.o
>  obj-$(CONFIG_FPGA_MGR_SOCFPGA_A10)     += socfpga-a10.o
>  obj-$(CONFIG_FPGA_MGR_TS73XX)          += ts73xx-fpga.o
> diff --git a/drivers/fpga/machxo2-spi.c b/drivers/fpga/machxo2-spi.c
> new file mode 100644
> index 0000000..5ee56bd
> --- /dev/null
> +++ b/drivers/fpga/machxo2-spi.c
> @@ -0,0 +1,199 @@
> +/**
> + * Lattice MachXO2 Slave SPI Driver
> + *
> + * Copyright (C) 2017 Paolo Pisati <p.pisati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * Manage Lattice FPGA firmware that is loaded over SPI using
> + * the slave serial configuration interface.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/fpga/fpga-mgr.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/spi/spi.h>
> +
> +

Please run checkpatch and fix whatever it points out, such as not to
use double blank lines.

> +/* MachXO2 Programming Guide - sysCONFIG Programming Commands */
> +
> +#define ISC_ENABLE             0x000008c6
> +#define ISC_ERASE              0x0000040e
> +#define ISC_PROGRAMDONE                0x0000005e
> +#define LSC_CHECKBUSY          0x000000f0
> +#define LSC_INITADDRESS                0x00000046
> +#define LSC_PROGINCRNV         0x01000070
> +#define LSC_REFRESH            0x00000079
> +
> +/*
> + * Max CCLK in Slave SPI mode according to 'MachXO2 Family Data
> + * Sheet' sysCONFIG Port Timing Specifications (3-36)
> + */
> +#define MACHXO2_MAX_SPEED      66000000
> +
> +#define MACHXO2_LOW_DELAY      5       /* us */
> +#define MACHXO2_HIGH_DELAY     200     /* us */
> +
> +#define MACHXO2_OP_SIZE                sizeof(uint32_t)
> +#define MACHXO2_PAGE_SIZE      16
> +#define MACHXO2_BUF_SIZE       (MACHXO2_OP_SIZE + MACHXO2_PAGE_SIZE)
> +
> +
> +static int waituntilnotbusy(struct spi_device *spi)

Could you rename to something like wait_until_not_busy?

> +{
> +       uint8_t rx, busyflag = 0x80;

Please create a macro for the 0x80 value and use it here.

> +       uint32_t checkbusy = LSC_CHECKBUSY;

Another checkpatch: u32 is preferred over uint32_t.

> +
> +       do {
> +               if (spi_write_then_read(spi, &checkbusy, MACHXO2_OP_SIZE,
> +                                         &rx, sizeof(rx)))
> +                       return -EIO;

Please pass down the spi_write_then_read error code like:

ret = spi_write_then_read(...);
if (ret)
        return ret;

There's a few places below where I will point that out for spi_write as well.

> +       } while (rx & busyflag);

Skip a line before the return.

> +       return 0;
> +}
> +
> +static enum fpga_mgr_states machxo2_spi_state(struct fpga_manager *mgr)
> +{
> +       return FPGA_MGR_STATE_UNKNOWN;
> +}
> +
> +static int machxo2_write_init(struct fpga_manager *mgr,
> +                             struct fpga_image_info *info,
> +                             const char *buf, size_t count)
> +{
> +       struct spi_device *spi = mgr->priv;
> +       uint32_t enable = ISC_ENABLE;
> +       uint32_t erase = ISC_ERASE;
> +       uint32_t initaddr = LSC_INITADDRESS;
> +
> +       if ((info->flags & FPGA_MGR_PARTIAL_RECONFIG)) {
> +               dev_err(&mgr->dev,
> +                       "Partial reconfiguration is not supported\n");
> +               return -ENOTSUPP;
> +       }
> +
> +       if (spi_write(spi, &enable, MACHXO2_OP_SIZE))
> +               goto fail;

Please skip a line here.

> +       udelay(MACHXO2_LOW_DELAY);
> +       if (spi_write(spi, &erase, MACHXO2_OP_SIZE))
> +               goto fail;

Again, it's better to pass the spi_write error code.

ret = spi_write(...)
if (ret)
     goto fail;

Then skip a line.

> +       waituntilnotbusy(spi);
> +       if (spi_write(spi, &initaddr, MACHXO2_OP_SIZE))
> +               goto fail;

Pass through the error code, same as above.

> +       return 0;
> +
> +fail:
> +       dev_err(&mgr->dev, "Error during FPGA init.\n");
> +       return -EIO;

return ret;

> +}
> +
> +static int machxo2_write(struct fpga_manager *mgr, const char *buf,
> +                        size_t count)
> +{
> +       struct spi_device *spi = mgr->priv;
> +       uint32_t progincr = LSC_PROGINCRNV;
> +       uint8_t payload[MACHXO2_BUF_SIZE];
> +       int i;
> +
> +       if (count % MACHXO2_PAGE_SIZE != 0) {
> +               dev_err(&mgr->dev, "Malformed payload.\n");
> +               return -EINVAL;
> +       }
> +
> +       memcpy(payload, &progincr, MACHXO2_OP_SIZE);
> +       for (i = 0; i < count; i += MACHXO2_PAGE_SIZE) {
> +               memcpy(&payload[MACHXO2_OP_SIZE], &buf[i], MACHXO2_PAGE_SIZE);
> +               if (spi_write(spi, payload, MACHXO2_BUF_SIZE)) {
> +                       dev_err(&mgr->dev, "Error loading the bitstream.\n");
> +                       return -EIO;

Pass through spi_write error code.

> +               }
> +               udelay(MACHXO2_HIGH_DELAY);
> +       }
> +
> +       return 0;
> +}
> +
> +static int machxo2_write_complete(struct fpga_manager *mgr,
> +                                 struct fpga_image_info *info)
> +{
> +       struct spi_device *spi = mgr->priv;
> +       uint32_t progdone = ISC_PROGRAMDONE;
> +       uint32_t refresh = LSC_REFRESH;
> +
> +       if (spi_write(spi, &progdone, MACHXO2_OP_SIZE))
> +               goto fail;

Pass spi_write error code if error.  And skip a line.

> +       /* yep, LSC_REFRESH is 3 bytes long actually */
> +       if (spi_write(spi, &refresh, MACHXO2_OP_SIZE-1))
> +               goto fail;

Here too.  Also add spaces around the minus sign.

> +       return 0;
> +
> +fail:
> +       dev_err(&mgr->dev, "Refresh failed.\n");
> +       return -EIO;

Will be return ret;

> +}
> +
> +static const struct fpga_manager_ops machxo2_ops = {
> +       .state = machxo2_spi_state,
> +       .write_init = machxo2_write_init,
> +       .write = machxo2_write,
> +       .write_complete = machxo2_write_complete,
> +};
> +
> +static int machxo2_spi_probe(struct spi_device *spi)
> +{
> +       struct device *dev = &spi->dev;
> +       int ret = 0;
> +
> +       if (spi->max_speed_hz > MACHXO2_MAX_SPEED) {
> +               dev_err(dev, "Speed is too high\n");
> +               return -EINVAL;
> +       }
> +
> +       ret =  fpga_mgr_register(dev, "Lattice MachXO2 SPI FPGA Manager",
> +                                &machxo2_ops, spi);
> +       if (ret)
> +               dev_err(dev, "Unable to register FPGA manager");

You can just 'return fpga_mgr_register(...);' here.

> +
> +       return ret;
> +}
> +
> +static int machxo2_spi_remove(struct spi_device *spi)
> +{
> +       struct device *dev = &spi->dev;
> +
> +       fpga_mgr_unregister(dev);

Skip  a line.

> +       return 0;
> +}
> +
> +static const struct of_device_id of_match[] = {
> +       { .compatible = "lattice,machxo2-slave-spi", },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, of_match);
> +
> +static const struct spi_device_id lattice_ids[] = {
> +       { "machxo2-slave-spi", 0 },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(spi, lattice_ids);
> +
> +static struct spi_driver machxo2_spi_driver = {
> +       .driver = {
> +               .name = "machxo2-slave-spi",
> +               .owner = THIS_MODULE,

You don't need to specify THIS_MODULE here.  spi_register_driver will
add that for you.

> +               .of_match_table = of_match_ptr(of_match),
> +       },
> +       .probe = machxo2_spi_probe,
> +       .remove = machxo2_spi_remove,
> +       .id_table = lattice_ids,
> +};
> +
> +module_spi_driver(machxo2_spi_driver)
> +
> +MODULE_AUTHOR("Paolo Pisati <p.pisati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>");
> +MODULE_DESCRIPTION("Load Lattice FPGA firmware over SPI");
> +MODULE_LICENSE("GPL v2");
> --
> 2.7.4
>

Thanks,
Alan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
