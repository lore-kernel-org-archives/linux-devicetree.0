From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v4 2/2] fpga manager: Add Xilinx slave serial SPI driver
Date: Thu, 16 Mar 2017 12:01:09 +0100
Message-ID: <6ef95b98-b529-49df-2a86-c2180f109b03@monstr.eu>
References: <1488300022-30150-1-git-send-email-agust@denx.de>
 <1488300022-30150-3-git-send-email-agust@denx.de>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="f2sPRoBhlRdo8dMnLqMldXUgub26obTLo"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488300022-30150-3-git-send-email-agust-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--f2sPRoBhlRdo8dMnLqMldXUgub26obTLo
Content-Type: multipart/mixed; boundary="6ccSxldJ1Abmw9fJMQXDPeW0AOL2Ie9Vr";
 protected-headers="v1"
From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>,
 Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>,
 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Message-ID: <6ef95b98-b529-49df-2a86-c2180f109b03-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v4 2/2] fpga manager: Add Xilinx slave serial SPI driver
References: <1488300022-30150-1-git-send-email-agust-ynQEQJNshbs@public.gmane.org>
 <1488300022-30150-3-git-send-email-agust-ynQEQJNshbs@public.gmane.org>
In-Reply-To: <1488300022-30150-3-git-send-email-agust-ynQEQJNshbs@public.gmane.org>

--6ccSxldJ1Abmw9fJMQXDPeW0AOL2Ie9Vr
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 28.2.2017 17:40, Anatolij Gustschin wrote:
> The driver loads FPGA firmware over SPI, using the "slave serial"
> configuration interface on Xilinx FPGAs.
>=20
> Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
> ---
> This patch requires patch https://lkml.org/lkml/2017/2/15/667
> for building
>=20
> Changes in v4:
>=20
>  - increase program latency up to 7.5ms for other Xilinx FPGAs
>  - continue to apply CCLK cycles until specified timeout elapses (to
>    cover more possible configuration DONE scenarios)
>  - apply 8 CCLK cycles afer DONE signal
>  - rebased to apply on top of Kconfig/Makefile changes by queued
>    fpga manager patches
>=20
> Changes in v3:
>=20
>  - use named constant for udelay()/usleep_range() arguments
>  - drop not needed .owner init
>  - correct module licence (GPL v2)
>  - fix build warning with newer gcc (in min() macro)
>=20
> Changes in v2:
>=20
>  - rebased on v4.10
>=20
>  drivers/fpga/Kconfig      |   7 ++
>  drivers/fpga/Makefile     |   1 +
>  drivers/fpga/xilinx-spi.c | 198 ++++++++++++++++++++++++++++++++++++++=
++++++++
>  3 files changed, 206 insertions(+)
>  create mode 100644 drivers/fpga/xilinx-spi.c
>=20
> diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
> index dee470f..c81cb7d 100644
> --- a/drivers/fpga/Kconfig
> +++ b/drivers/fpga/Kconfig
> @@ -46,6 +46,13 @@ config FPGA_MGR_TS73XX
>  	  FPGA manager driver support for the Altera Cyclone II FPGA
>  	  present on the TS-73xx SBC boards.
> =20
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
> index a5ee3ff..c6f5d74 100644
> --- a/drivers/fpga/Makefile
> +++ b/drivers/fpga/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_FPGA_MGR_ICE40_SPI)	+=3D ice40-spi.o
>  obj-$(CONFIG_FPGA_MGR_SOCFPGA)		+=3D socfpga.o
>  obj-$(CONFIG_FPGA_MGR_SOCFPGA_A10)	+=3D socfpga-a10.o
>  obj-$(CONFIG_FPGA_MGR_TS73XX)		+=3D ts73xx-fpga.o
> +obj-$(CONFIG_FPGA_MGR_XILINX_SPI)	+=3D xilinx-spi.o
>  obj-$(CONFIG_FPGA_MGR_ZYNQ_FPGA)	+=3D zynq-fpga.o
> =20
>  # FPGA Bridge Drivers
> diff --git a/drivers/fpga/xilinx-spi.c b/drivers/fpga/xilinx-spi.c
> new file mode 100644
> index 0000000..9b62a4c
> --- /dev/null
> +++ b/drivers/fpga/xilinx-spi.c
> @@ -0,0 +1,198 @@
> +/*
> + * Xilinx Spartan6 Slave Serial SPI Driver
> + *
> + * Copyright (C) 2017 DENX Software Engineering
> + *
> + * Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modif=
y it
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
> +struct xilinx_spi_conf {
> +	struct spi_device *spi;
> +	struct gpio_desc *prog_b;
> +	struct gpio_desc *done;
> +};
> +
> +static enum fpga_mgr_states xilinx_spi_state(struct fpga_manager *mgr)=

> +{
> +	struct xilinx_spi_conf *conf =3D mgr->priv;
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
> +	struct xilinx_spi_conf *conf =3D mgr->priv;
> +	const size_t prog_latency_7500us =3D 7500;
> +	const size_t prog_pulse_1us =3D 1;
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
> +	usleep_range(prog_latency_7500us, prog_latency_7500us + 100);
> +	return 0;
> +}
> +
> +static int xilinx_spi_write(struct fpga_manager *mgr, const char *buf,=

> +			    size_t count)
> +{
> +	struct xilinx_spi_conf *conf =3D mgr->priv;
> +	const char *fw_data =3D buf;
> +	const char *fw_data_end =3D fw_data + count;
> +
> +	while (fw_data < fw_data_end) {
> +		size_t remaining, stride;
> +		int ret;
> +
> +		remaining =3D fw_data_end - fw_data;
> +		stride =3D min_t(size_t, remaining, SZ_4K);
> +
> +		ret =3D spi_write(conf->spi, fw_data, stride);
> +		if (ret) {
> +			dev_err(&mgr->dev, "SPI error in firmware write: %d\n",
> +				ret);
> +			return ret;
> +		}
> +		fw_data +=3D stride;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xilinx_spi_apply_cclk_cycles(struct xilinx_spi_conf *conf)
> +{
> +	struct spi_device *spi =3D conf->spi;
> +	const u8 din_data[1] =3D { 0xff };
> +	int ret;
> +
> +	ret =3D spi_write(conf->spi, din_data, sizeof(din_data));
> +	if (ret)
> +		dev_err(&spi->dev, "applying CCLK cycles failed: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int xilinx_spi_write_complete(struct fpga_manager *mgr,
> +				     struct fpga_image_info *info)
> +{
> +	struct xilinx_spi_conf *conf =3D mgr->priv;
> +	unsigned long timeout;
> +	int ret;
> +
> +	if (gpiod_get_value(conf->done))
> +		return xilinx_spi_apply_cclk_cycles(conf);
> +
> +	timeout =3D jiffies + usecs_to_jiffies(info->config_complete_timeout_=
us);
> +
> +	while (time_before(jiffies, timeout)) {
> +
> +		ret =3D xilinx_spi_apply_cclk_cycles(conf);
> +		if (ret)
> +			return ret;
> +
> +		if (gpiod_get_value(conf->done))
> +			return xilinx_spi_apply_cclk_cycles(conf);
> +	}
> +
> +	dev_err(&mgr->dev, "Timeout after config data transfer.\n");
> +	return -ETIMEDOUT;
> +}
> +
> +static const struct fpga_manager_ops xilinx_spi_ops =3D {
> +	.state =3D xilinx_spi_state,
> +	.write_init =3D xilinx_spi_write_init,
> +	.write =3D xilinx_spi_write,
> +	.write_complete =3D xilinx_spi_write_complete,
> +};
> +
> +static int xilinx_spi_probe(struct spi_device *spi)
> +{
> +	struct xilinx_spi_conf *conf;
> +
> +	conf =3D devm_kzalloc(&spi->dev, sizeof(*conf), GFP_KERNEL);
> +	if (!conf)
> +		return -ENOMEM;
> +
> +	conf->spi =3D spi;
> +
> +	/* PROGRAM_B is active low */
> +	conf->prog_b =3D devm_gpiod_get(&spi->dev, "prog_b", GPIOD_OUT_LOW);
> +	if (IS_ERR(conf->prog_b)) {
> +		dev_err(&spi->dev, "Failed to get PROGRAM_B gpio: %ld\n",
> +			PTR_ERR(conf->prog_b));
> +		return PTR_ERR(conf->prog_b);
> +	}
> +
> +	conf->done =3D devm_gpiod_get(&spi->dev, "done", GPIOD_IN);
> +	if (IS_ERR(conf->done)) {
> +		dev_err(&spi->dev, "Failed to get DONE gpio: %ld\n",
> +			PTR_ERR(conf->done));
> +		return PTR_ERR(conf->done);
> +	}
> +
> +	return fpga_mgr_register(&spi->dev, "Xilinx Slave Serial FPGA Manager=
",
> +				 &xilinx_spi_ops, conf);
> +}
> +
> +static int xilinx_spi_remove(struct spi_device *spi)
> +{
> +	fpga_mgr_unregister(&spi->dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id xlnx_spi_of_match[] =3D {
> +	{ .compatible =3D "xlnx,fpga-slave-serial", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, xlnx_spi_of_match);
> +
> +static struct spi_driver xilinx_slave_spi_driver =3D {
> +	.driver =3D {
> +		.name =3D "xlnx-slave-spi",
> +		.of_match_table =3D of_match_ptr(xlnx_spi_of_match),
> +	},
> +	.probe =3D xilinx_spi_probe,
> +	.remove =3D xilinx_spi_remove,
> +};
> +
> +module_spi_driver(xilinx_slave_spi_driver)
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>");
> +MODULE_DESCRIPTION("Load Xilinx FPGA firmware over SPI");
>=20

Acked-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--6ccSxldJ1Abmw9fJMQXDPeW0AOL2Ie9Vr--

--f2sPRoBhlRdo8dMnLqMldXUgub26obTLo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAljKcHUACgkQykllyylKDCHbXgCfR5byJ8BK4PLWEv11HQX6LSOS
x5wAn0fmwOpSjfF8JbGh1kDXpvnMSaGm
=TExD
-----END PGP SIGNATURE-----

--f2sPRoBhlRdo8dMnLqMldXUgub26obTLo--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
