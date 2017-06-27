From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 3/3] mtd: spi-nor: Altera Quadspi Flash Controller v2
 Platform driver
Date: Tue, 27 Jun 2017 11:49:49 +0200
Message-ID: <2ac33989-5665-33e0-c6f0-6791c8e46b0d@gmail.com>
References: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1498493619-4633-4-git-send-email-matthew.gerlach@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498493619-4633-4-git-send-email-matthew.gerlach@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.gerlach@linux.intel.com, vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, davem@davemloft.net, mchehab@kernel.org
List-Id: devicetree@vger.kernel.org

On 06/26/2017 06:13 PM, matthew.gerlach@linux.intel.com wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

Just wrap it into the Altera QSPI driver , no need for separate platform
driver IMO.

> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/mtd/spi-nor/Kconfig                   |   5 +
>  drivers/mtd/spi-nor/Makefile                  |   1 +
>  drivers/mtd/spi-nor/altera-quadspi-platform.c | 137 ++++++++++++++++++++++++++
>  4 files changed, 144 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/altera-quadspi-platform.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ae33fa6..c32bb98 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -653,6 +653,7 @@ M:	Matthew Gerlach <matthew.gerlach@linux.intel.com>
>  L:	linux-mtd@lists.infradead.org
>  S:	Maintained
>  F:	drivers/mtd/spi-nor/altera-quadspi.c
> +F:	drivers/mtd/spi-nor/altera-quadspi-platform.c
>  F:	inclulde/linux/mtd/altera-quadspi.h
>  
>  ALTERA SYSTEM RESOURCE DRIVER FOR ARRIA10 DEVKIT
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 89fe425..f3d5c01 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -118,4 +118,9 @@ config SPI_ALTERA_QUADSPI
>          help
>            Enable support for version 2 of Altera Quad SPI Flash Controller.
>  
> +config SPI_ALTERA_QUADSPI_PLATFORM
> +	tristate "Platform support for Altera Quad SPI Flash Controller II"
> +	help
> +	  Platform driver support for  Altera Quad SPI Flash Controller II"
> +
>  endif # MTD_SPI_NOR
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 024c6ac..042f87e 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -10,4 +10,5 @@ obj-$(CONFIG_SPI_INTEL_SPI)	+= intel-spi.o
>  obj-$(CONFIG_SPI_INTEL_SPI_PLATFORM)	+= intel-spi-platform.o
>  obj-$(CONFIG_SPI_STM32_QUADSPI)	+= stm32-quadspi.o
>  obj-$(CONFIG_SPI_ALTERA_QUADSPI) += altera-quadspi.o
> +obj-$(CONFIG_SPI_ALTERA_QUADSPI_PLATFORM) += altera-quadspi-platform.o
>  
> diff --git a/drivers/mtd/spi-nor/altera-quadspi-platform.c b/drivers/mtd/spi-nor/altera-quadspi-platform.c
> new file mode 100644
> index 0000000..c8d2a47
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/altera-quadspi-platform.c
> @@ -0,0 +1,137 @@
> +/*
> + * Copyright (C) 2014 Altera Corporation. All rights reserved.
> + * Copyright (C) 2017 Intel Corporation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/mtd/altera-quadspi.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +
> +static int altera_quadspi_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	void __iomem *csr_base;
> +	void __iomem *data_base;
> +	void __iomem *window_base = NULL;
> +	u32 window_size = 0;
> +	u32 flags = 0;
> +	u32 bank;
> +	int ret;
> +	struct device_node *pp;
> +
> +	if (!np) {
> +		dev_err(dev, "no device found\n");
> +		return -ENODEV;
> +	}
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "avl_csr");
> +	csr_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(csr_base)) {
> +		dev_err(dev, "%s: ERROR: failed to map csr base\n", __func__);
> +		return PTR_ERR(csr_base);
> +	}
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "avl_mem");
> +	data_base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(data_base)) {
> +		dev_err(dev, "%s: ERROR: failed to map data base\n", __func__);
> +		return PTR_ERR(data_base);
> +	}
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "avl_window");
> +	if (res) {
> +		window_base = NULL;
> +		window_base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(window_base)) {
> +			dev_err(dev, "%s: ERROR: failed to map window base\n",
> +				__func__);
> +			return PTR_ERR(data_base);
> +		}
> +
> +		of_property_read_u32(dev->of_node, "window-size", &window_size);
> +
> +		if (!window_size) {
> +			dev_err(dev,
> +				"alv_window defined, %s",
> +				"but no window-size defined\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (of_property_read_bool(np, "read-bit-reverse"))
> +		flags |= ALTERA_QUADSPI_FL_BITREV_READ;
> +
> +	if (of_property_read_bool(np, "write-bit-reverse"))
> +		flags |= ALTERA_QUADSPI_FL_BITREV_WRITE;
> +
> +	ret = altera_quadspi_create(dev, csr_base, data_base,
> +				    window_base, (size_t)window_size, flags);
> +
> +	if (ret) {
> +		dev_err(dev, "failed to create qspi device\n");
> +		return ret;
> +	}
> +
> +	for_each_available_child_of_node(np, pp) {
> +		of_property_read_u32(pp, "reg", &bank);
> +		if (bank >= ALTERA_QUADSPI_MAX_NUM_FLASH_CHIP) {
> +			dev_err(dev, "bad reg value %u >= %u\n", bank,
> +				ALTERA_QUADSPI_MAX_NUM_FLASH_CHIP);
> +			goto error;
> +		}
> +
> +		if (altera_qspi_add_bank(dev, bank, pp)) {
> +			dev_err(dev, "failed to add bank %u\n", bank);
> +			goto error;
> +		}
> +	}
> +
> +	return 0;
> +error:
> +	altera_quadspi_remove_banks(dev);
> +	return -EIO;
> +}
> +
> +static int altera_quadspi_remove(struct platform_device *pdev)
> +{
> +	return altera_quadspi_remove_banks(&pdev->dev);
> +}
> +
> +static const struct of_device_id altera_quadspi_id_table[] = {
> +
> +	{ .compatible = "altr,quadspi-v2",},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, altera_quadspi_id_table);
> +
> +static struct platform_driver altera_quadspi_driver = {
> +	.driver = {
> +		.name = "altera_quadspi_platform",
> +		.of_match_table = altera_quadspi_id_table,
> +	},
> +	.probe = altera_quadspi_probe,
> +	.remove = altera_quadspi_remove,
> +};
> +module_platform_driver(altera_quadspi_driver);
> +
> +MODULE_AUTHOR("Viet Nga Dao <vndao@altera.com>");
> +MODULE_AUTHOR("Yong Sern Lau <lau.yong.sern@intel.com>");
> +MODULE_AUTHOR("Matthew Gerlach <matthew.gerlach@linux.intel.com>");
> +MODULE_DESCRIPTION("Altera QuadSPI Version 2 Platform Driver");
> +MODULE_LICENSE("GPL v2");
> 


-- 
Best regards,
Marek Vasut
