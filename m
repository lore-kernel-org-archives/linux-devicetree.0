From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Date: Thu, 31 Dec 2015 16:26:44 -0600
Message-ID: <20151231222644.GA29027@rob-hp-laptop>
References: <1451442371-17703-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1451442371-17703-1-git-send-email-xuejiancheng@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiancheng Xue <xuejiancheng@huawei.com>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, dwmw2@infradead.org, computersforpeace@gmail.com, shijie.huang@intel.com, pengbinquan@huawei.com, han.xu@freescale.com, ezequiel@vanguardiasur.com.ar, fabio.estevam@freescale.com, manabian@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Wed, Dec 30, 2015 at 10:26:11AM +0800, Jiancheng Xue wrote:
> add hisilicon spi-nor flash controller driver
> 
> Signed-off-by: Binquan Peng <pengbinquan@huawei.com>
> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
> ---
>  .../devicetree/bindings/spi/spi-hisi-sfc.txt       |  24 +
>  drivers/mtd/spi-nor/Kconfig                        |   7 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/hisi-sfc.c                     | 505 +++++++++++++++++++++
>  4 files changed, 537 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
>  create mode 100644 drivers/mtd/spi-nor/hisi-sfc.c
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt b/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
> new file mode 100644
> index 0000000..170885a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
> @@ -0,0 +1,24 @@
> +HiSilicon SPI-NOR Flash Controller
> +
> +Required properties:
> +- compatible : Should be "hisilicon,hisi-sfc".
> +- address-cells: number of cells required to define a chip select
> +        address on the SPI bus. Should be set to 1. See spi-bus.txt.
> +- size-cells:Should be 0.

How about some consistency in the spacing around the ':'.

> +- reg : Offset and length of the register set for the controller device.
> +- reg-names: Must include the following two entries:"control","memory".
                                                       ^         ^
Spaces needed.

> +- clocks: handle to spi-nor flash controller clock.
> +
> +Example:
> +spi-nor-controller@14000000 {
> +	compatible = "hisilicon,hisi-sfc";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	reg = <0x10000000 0x1000>, <0x14000000 0x1000000>;
> +	reg-names = "control", "memory";
> +	clocks = <&clock HI3519_FMC_CLK>;
> +	spi-nor@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +	};
> +};
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 2fe2a7e..7fe1564 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -30,6 +30,12 @@ config SPI_FSL_QUADSPI
>  	  This controller does not support generic SPI. It only supports
>  	  SPI NOR.
>  
> +config SPI_HISI_SFC
> +	tristate "Hisilicon SPI-NOR Flash Controller(SFC)"
> +	depends on ARCH_HISI
> +	help
> +	  This enables support for hisilicon SPI-NOR flash controller.
> +
>  config SPI_NXP_SPIFI
>  	tristate "NXP SPI Flash Interface (SPIFI)"
>  	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
> @@ -41,4 +47,5 @@ config SPI_NXP_SPIFI
>  	  Flash. Enable this option if you have a device with a SPIFI
>  	  controller and want to access the Flash as a mtd device.
>  
> +

Drop this spurious change.

>  endif # MTD_SPI_NOR
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index e53333e..8cea3c5 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -1,3 +1,4 @@
>  obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
>  obj-$(CONFIG_SPI_FSL_QUADSPI)	+= fsl-quadspi.o
> +obj-$(CONFIG_SPI_HISI_SFC)	+= hisi-sfc.o
>  obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
> diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
> new file mode 100644
> index 0000000..fd9649a
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/hisi-sfc.c
> @@ -0,0 +1,505 @@
> +/* HiSilicon SPI Nor Flash Controller Driver
> + *
> + * Copyright (c) 2015 HiSilicon Technologies Co., Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
> +#include <linux/slab.h>
> +#include <linux/module.h>
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/of_platform.h>
> +#include <linux/mtd/spi-nor.h>

Some say to alphabetize includes. I don't care so much, but at least 
group subdirectories.

Rob
