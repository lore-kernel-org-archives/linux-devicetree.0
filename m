From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH v3 2/2] fpga: lattice machxo2: Add Lattice MachXO2 support
Date: Thu, 15 Jun 2017 13:03:41 -0700
Message-ID: <CAAtXAHfv75VC=J+J5Xd7xeAoPtu1k97XRp2FSOS0ttwnrvWurg@mail.gmail.com>
References: <1497525185-30232-1-git-send-email-p.pisati@gmail.com> <1497525185-30232-3-git-send-email-p.pisati@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497525185-30232-3-git-send-email-p.pisati@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Alan Tull <atull@opensource.altera.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-fpga@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 15, 2017 at 4:13 AM, Paolo Pisati <p.pisati@gmail.com> wrote:
> This patch adds support to the FPGA manager for programming
> MachXO2 device=E2=80=99s internal flash memory, via slave SPI.
>
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
> ---
>  drivers/fpga/Kconfig       |   7 ++
>  drivers/fpga/Makefile      |   1 +
>  drivers/fpga/machxo2-spi.c | 277 +++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 285 insertions(+)
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
> @@ -7,6 +7,7 @@ obj-$(CONFIG_FPGA)                      +=3D fpga-mgr.o
>
>  # FPGA Manager Drivers
>  obj-$(CONFIG_FPGA_MGR_ICE40_SPI)       +=3D ice40-spi.o
> +obj-$(CONFIG_FPGA_MGR_MACHXO2_SPI)     +=3D machxo2-spi.o
>  obj-$(CONFIG_FPGA_MGR_SOCFPGA)         +=3D socfpga.o
>  obj-$(CONFIG_FPGA_MGR_SOCFPGA_A10)     +=3D socfpga-a10.o
>  obj-$(CONFIG_FPGA_MGR_TS73XX)          +=3D ts73xx-fpga.o
> diff --git a/drivers/fpga/machxo2-spi.c b/drivers/fpga/machxo2-spi.c
> new file mode 100644
> index 0000000..ea8793c
> --- /dev/null
> +++ b/drivers/fpga/machxo2-spi.c
> @@ -0,0 +1,277 @@
> +/**
> + * Lattice MachXO2 Slave SPI Driver
> + *
> + * Copyright (C) 2017 Paolo Pisati <p.pisati@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
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
> +/* MachXO2 Programming Guide - sysCONFIG Programming Commands */
> +
> +#define ISC_DISABLE            0x00000026
> +#define ISC_ENABLE             0x000008c6
> +#define ISC_ERASE              0x0000040e
> +#define ISC_NOOP               0xffffffff
> +#define ISC_PROGRAMDONE                0x0000005e
> +#define LSC_CHECKBUSY          0x000000f0
> +#define LSC_INITADDRESS                0x00000046
> +#define LSC_PROGINCRNV         0x01000070
> +#define LSC_REFRESH            0x00000079
> +
> +#define BUSYFLAG               BIT(7)
> +
> +/*
> + * Max CCLK in Slave SPI mode according to 'MachXO2 Family Data
> + * Sheet' sysCONFIG Port Timing Specifications (3-36)
> + */
> +#define MACHXO2_MAX_SPEED      66000000
> +
> +#define MACHXO2_LOW_DELAY      5       /* us */
> +#define MACHXO2_HIGH_DELAY     200     /* us */
> +#define MACHXO2_REFRESH                4800    /* us */
> +
> +#define MACHXO2_OP_SIZE                sizeof(u32)
> +#define MACHXO2_PAGE_SIZE      16
> +#define MACHXO2_BUF_SIZE       (MACHXO2_OP_SIZE + MACHXO2_PAGE_SIZE)
> +
> +static int wait_until_not_busy(struct spi_device *spi)
> +{
> +       struct spi_message msg;
> +       struct spi_transfer rx, tx;
> +       u32 checkbusy =3D LSC_CHECKBUSY;
> +       u8 busy;
> +       int ret;
> +
> +       do {
> +               memset(&rx, 0, sizeof(rx));
> +               memset(&tx, 0, sizeof(tx));
> +               tx.tx_buf =3D &checkbusy;
> +               tx.len =3D MACHXO2_OP_SIZE;
> +               rx.rx_buf =3D &busy;
> +               rx.len =3D sizeof(busy);
> +               spi_message_init(&msg);
> +               spi_message_add_tail(&tx, &msg);
> +               spi_message_add_tail(&rx, &msg);
> +               ret =3D spi_sync(spi, &msg);
> +               if (ret)
> +                       return ret;
> +       } while (busy & BUSYFLAG);
> +
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
> +       struct spi_device *spi =3D mgr->priv;
> +       struct spi_message msg;
> +       struct spi_transfer tx[5];
> +       u32 disable =3D ISC_DISABLE;
> +       u32 bypass =3D ISC_NOOP;
> +       u32 enable =3D ISC_ENABLE;
> +       u32 erase =3D ISC_ERASE;
> +       u32 initaddr =3D LSC_INITADDRESS;
> +       int ret;
> +
> +       if ((info->flags & FPGA_MGR_PARTIAL_RECONFIG)) {
> +               dev_err(&mgr->dev,
> +                       "Partial reconfiguration is not supported\n");
> +               return -ENOTSUPP;
> +       }
> +
> +       memset(tx, 0, sizeof(tx));
> +       spi_message_init(&msg);
> +       tx[0].tx_buf =3D &disable;
> +       tx[0].len =3D MACHXO2_OP_SIZE - 1;
> +       spi_message_add_tail(&tx[0], &msg);
> +
> +       tx[1].tx_buf =3D &bypass;
> +       tx[1].len =3D MACHXO2_OP_SIZE;
> +       spi_message_add_tail(&tx[1], &msg);
> +       ret =3D spi_sync(spi, &msg);
> +       if (ret)
> +               goto fail;
> +
> +       ret =3D wait_until_not_busy(spi);
> +       if (ret)
> +               goto fail;
> +
> +       spi_message_init(&msg);
> +       tx[2].tx_buf =3D &enable;
> +       tx[2].len =3D MACHXO2_OP_SIZE;
> +       tx[2].delay_usecs =3D MACHXO2_LOW_DELAY;
> +       spi_message_add_tail(&tx[2], &msg);
> +
> +       tx[3].tx_buf =3D &erase;
> +       tx[3].len =3D MACHXO2_OP_SIZE;
> +       spi_message_add_tail(&tx[3], &msg);
> +       ret =3D spi_sync(spi, &msg);
> +       if (ret)
> +               goto fail;
> +
> +       ret =3D wait_until_not_busy(spi);
> +       if (ret)
> +               goto fail;
> +
> +       spi_message_init(&msg);
> +       tx[4].tx_buf =3D &initaddr;
> +       tx[4].len =3D MACHXO2_OP_SIZE;
> +       spi_message_add_tail(&tx[4], &msg);
> +       ret =3D spi_sync(spi, &msg);
> +       if (ret)
> +               goto fail;
> +
> +       return 0;
> +
> +fail:
> +       dev_err(&mgr->dev, "Error during FPGA init.\n");
> +       return ret;
> +}
> +
> +static int machxo2_write(struct fpga_manager *mgr, const char *buf,
> +                        size_t count)
> +{
> +       struct spi_device *spi =3D mgr->priv;
> +       struct spi_message msg;
> +       struct spi_transfer tx;
> +       u32 progincr =3D LSC_PROGINCRNV;
> +       u8 payload[MACHXO2_BUF_SIZE];
> +       int i, ret;
> +
> +       if (count % MACHXO2_PAGE_SIZE !=3D 0) {
> +               dev_err(&mgr->dev, "Malformed payload.\n");
> +               return -EINVAL;
> +       }
> +
> +       memcpy(payload, &progincr, MACHXO2_OP_SIZE);
> +       for (i =3D 0; i < count; i +=3D MACHXO2_PAGE_SIZE) {
> +               memcpy(&payload[MACHXO2_OP_SIZE], &buf[i], MACHXO2_PAGE_S=
IZE);
> +               memset(&tx, 0, sizeof(tx));
> +               spi_message_init(&msg);
> +               tx.tx_buf =3D payload;
> +               tx.len =3D MACHXO2_BUF_SIZE;
> +               tx.delay_usecs =3D MACHXO2_HIGH_DELAY;
> +               spi_message_add_tail(&tx, &msg);
> +               ret =3D spi_sync(spi, &msg);
> +               if (ret) {
> +                       dev_err(&mgr->dev, "Error loading the bitstream.\=
n");
> +                       return ret;
> +               }
> +       }

Can't you chain them together and submit it as one? Instead of calling
spi_sync in a loop?
You don't seem to wait for _wait_until_not_busy, so wouldn't that work?

> +
> +       return 0;
> +}
> +
> +static int machxo2_write_complete(struct fpga_manager *mgr,
> +                                 struct fpga_image_info *info)
> +{
> +       struct spi_device *spi =3D mgr->priv;
> +       struct spi_message msg;
> +       struct spi_transfer tx[2];
> +       u32 progdone =3D ISC_PROGRAMDONE;
> +       u32 refresh =3D LSC_REFRESH;
> +       int ret;
> +
> +       memset(tx, 0, sizeof(tx));
> +       spi_message_init(&msg);
> +       tx[0].tx_buf =3D &progdone;
> +       tx[0].len =3D MACHXO2_OP_SIZE;
> +       spi_message_add_tail(&tx[0], &msg);
> +       ret =3D spi_sync(spi, &msg);
> +       if (ret)
> +               goto fail;
> +
> +       ret =3D wait_until_not_busy(spi);
> +       if (ret)
> +               goto fail;
> +
> +       spi_message_init(&msg);
> +       tx[1].tx_buf =3D &refresh;
> +       tx[1].len =3D MACHXO2_OP_SIZE - 1;
> +       tx[1].delay_usecs =3D MACHXO2_REFRESH;
> +       spi_message_add_tail(&tx[1], &msg);
> +       ret =3D spi_sync(spi, &msg);
> +       if (ret)
> +               goto fail;
> +
> +       return 0;
> +
> +fail:
> +       dev_err(&mgr->dev, "Refresh failed.\n");
> +       return ret;
> +}
> +
> +static const struct fpga_manager_ops machxo2_ops =3D {
> +       .state =3D machxo2_spi_state,
> +       .write_init =3D machxo2_write_init,
> +       .write =3D machxo2_write,
> +       .write_complete =3D machxo2_write_complete,
> +};
> +
> +static int machxo2_spi_probe(struct spi_device *spi)
> +{
> +       struct device *dev =3D &spi->dev;
> +
> +       if (spi->max_speed_hz > MACHXO2_MAX_SPEED) {
> +               dev_err(dev, "Speed is too high\n");
> +               return -EINVAL;
> +       }
> +
> +       return fpga_mgr_register(dev, "Lattice MachXO2 SPI FPGA Manager",
> +                                &machxo2_ops, spi);
> +}
> +
> +static int machxo2_spi_remove(struct spi_device *spi)
> +{
> +       struct device *dev =3D &spi->dev;
> +
> +       fpga_mgr_unregister(dev);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id of_match[] =3D {
> +       { .compatible =3D "lattice,machxo2-slave-spi", },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, of_match);
> +
> +static const struct spi_device_id lattice_ids[] =3D {
> +       { "machxo2-slave-spi", 0 },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(spi, lattice_ids);
> +
> +static struct spi_driver machxo2_spi_driver =3D {
> +       .driver =3D {
> +               .name =3D "machxo2-slave-spi",
> +               .of_match_table =3D of_match_ptr(of_match),
> +       },
> +       .probe =3D machxo2_spi_probe,
> +       .remove =3D machxo2_spi_remove,
> +       .id_table =3D lattice_ids,
> +};
> +
> +module_spi_driver(machxo2_spi_driver)
> +
> +MODULE_AUTHOR("Paolo Pisati <p.pisati@gmail.com>");
> +MODULE_DESCRIPTION("Load Lattice FPGA firmware over SPI");
> +MODULE_LICENSE("GPL v2");
> --
> 2.7.4
>

Thanks,
Moritz
