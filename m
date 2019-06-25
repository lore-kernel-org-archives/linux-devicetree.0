From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v8 3/5] mtd: Add support for HyperBus memory devices
Date: Tue, 25 Jun 2019 23:00:30 +0300
Message-ID: <756e63a4-20cb-fd9e-6ec7-c2742a3d90e4@cogentembedded.com>
References: <20190625075746.10439-1-vigneshr@ti.com>
 <20190625075746.10439-4-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625075746.10439-4-vigneshr@ti.com>
Content-Language: en-MW
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Tokunori Ikegami <ikegami.t@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello!

On 06/25/2019 10:57 AM, Vignesh Raghavendra wrote:

> Cypress' HyperBus is Low Signal Count, High Performance Double Data Rate
> Bus interface between a host system master and one or more slave
> interfaces. HyperBus is used to connect microprocessor, microcontroller,
> or ASIC devices with random access NOR flash memory (called HyperFlash)
> or self refresh DRAM (called HyperRAM).
> 
> Its a 8-bit data bus (DQ[7:0]) with  Read-Write Data Strobe (RWDS)
> signal and either Single-ended clock(3.0V parts) or Differential clock
> (1.8V parts). It uses ChipSelect lines to select b/w multiple slaves.
> At bus level, it follows a separate protocol described in HyperBus
> specification[1].
> 
> HyperFlash follows CFI AMD/Fujitsu Extended Command Set (0x0002) similar
> to that of existing parallel NORs. Since HyperBus is x8 DDR bus,
> its equivalent to x16 parallel NOR flash with respect to bits per clock
> cycle. But HyperBus operates at >166MHz frequencies.
> HyperRAM provides direct random read/write access to flash memory
> array.
> 
> But, HyperBus memory controllers seem to abstract implementation details
> and expose a simple MMIO interface to access connected flash.
> 
> Add support for registering HyperFlash devices with MTD framework. MTD
> maps framework along with CFI chip support framework are used to support
> communicating with flash.
> 
> Framework is modelled along the lines of spi-nor framework. HyperBus
> memory controller (HBMC) drivers calls hyperbus_register_device() to
> register a single HyperFlash device. HyperFlash core parses MMIO access
> information from DT, sets up the map_info struct, probes CFI flash and
> registers it with MTD framework.
> 
> Some HBMC masters need calibration/training sequence[3] to be carried
> out, in order for DLL inside the controller to lock, by reading a known
> string/pattern. This is done by repeatedly reading CFI Query
> Identification String. Calibration needs to be done before trying to detect
> flash as part of CFI flash probe.
> 
> HyperRAM is not supported at the moment.
> 
> HyperBus specification can be found at[1]
> HyperFlash datasheet can be found at[2]
> 
> [1] https://www.cypress.com/file/213356/download
> [2] https://www.cypress.com/file/213346/download
> [3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
>     Table 12-5741. HyperFlash Access Sequence
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
[...]
> diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
> index 806287e80e84..62d649a959e2 100644
> --- a/drivers/mtd/Makefile
> +++ b/drivers/mtd/Makefile
> @@ -34,3 +34,4 @@ obj-y		+= chips/ lpddr/ maps/ devices/ nand/ tests/
>  
>  obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor/
>  obj-$(CONFIG_MTD_UBI)		+= ubi/
> +obj-$(CONFIG_MTD_HYPERBUS)	+= hyperbus/
> diff --git a/drivers/mtd/hyperbus/Kconfig b/drivers/mtd/hyperbus/Kconfig
> new file mode 100644
> index 000000000000..98147e28caa0
> --- /dev/null
> +++ b/drivers/mtd/hyperbus/Kconfig
> @@ -0,0 +1,11 @@
> +menuconfig MTD_HYPERBUS
> +	tristate "HyperBus support"
> +	select MTD_CFI
> +	select MTD_MAP_BANK_WIDTH_2
> +	select MTD_CFI_AMDSTD
> +	select MTD_COMPLEX_MAPPINGS
> +	help
> +	  This is the framework for the HyperBus which can be used by
> +	  the HyperBus Controller driver to communicate with
> +	  HyperFlash. See Cypress HyperBus specification for more
> +	  details
> diff --git a/drivers/mtd/hyperbus/Makefile b/drivers/mtd/hyperbus/Makefile
> new file mode 100644
> index 000000000000..ca61dedd730d
> --- /dev/null
> +++ b/drivers/mtd/hyperbus/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_MTD_HYPERBUS)	+= hyperbus-core.o
> diff --git a/drivers/mtd/hyperbus/hyperbus-core.c b/drivers/mtd/hyperbus/hyperbus-core.c
> new file mode 100644
> index 000000000000..63a9e64895bc
> --- /dev/null
> +++ b/drivers/mtd/hyperbus/hyperbus-core.c
> @@ -0,0 +1,154 @@
[...]
> +int hyperbus_register_device(struct hyperbus_device *hbdev)
> +{
[...]
> +	hbdev->mtd = do_map_probe("cfi_probe", map);
> +	if (!hbdev->mtd) {
> +		dev_err(dev, "probing of hyperbus device failed\n");
> +		return -ENODEV;
> +	}
> +
> +	hbdev->mtd->dev.parent = dev;
> +	mtd_set_of_node(hbdev->mtd, np);
> +
> +	ret = mtd_device_register(hbdev->mtd, NULL, 0);
> +	if (ret) {
> +		dev_err(dev, "failed to register mtd device\n");
> +		map_destroy(hbdev->mtd);
> +		return ret;
> +	}
> +	hbdev->registered = true;

   I doubt that you actually need this flag...

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(hyperbus_register_device);
> +
> +int hyperbus_unregister_device(struct hyperbus_device *hbdev)
> +{
> +	int ret = 0;
> +
> +	if (hbdev && hbdev->mtd && hbdev->registered) {

    ... as you missed clearing that 'registered' flag. 

> +		ret = mtd_device_unregister(hbdev->mtd);
> +		map_destroy(hbdev->mtd);
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(hyperbus_unregister_device);
[...]

MBR, Sergei
