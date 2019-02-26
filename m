From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [RFC PATCH 3/5] mtd: Add support for Hyperbus memory devices
Date: Tue, 26 Feb 2019 21:16:17 +0300
Message-ID: <7e79fff7-2565-28f7-7b2b-bb3098f1a928@cogentembedded.com>
References: <20190219063607.29949-1-vigneshr@ti.com>
 <20190219063607.29949-4-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219063607.29949-4-vigneshr@ti.com>
Content-Language: en-MW
Sender: linux-kernel-owner@vger.kernel.org
To: "Vignesh R (by way of Boris Brezillon <bbrezillon@kernel.org>)" <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, tudor.ambarus@microchip.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 02/19/2019 09:36 AM, Vignesh R (by way of Boris Brezillon <bbrezillon@kernel.org>) wrote:

> Cypress HyperBus is Low Signal Count, High Performance Double Data Rate Bus
> interface between a host system master and one or more slave interfaces.
> HyperBus is used to connect microprocessor, microcontroller, or ASIC
> devices with random access NOR flash memory(called HyperFlash) or
> self refresh DRAM(called HyperRAM).
> 
> Its a 8-bit data bus (DQ[7:0]) with  Read-Write Data Strobe (RWDS)
> signal and either Single-ended clock(3.0V parts) or Differential clock
> (1.8V parts). It uses ChipSelect lines to select b/w multiple slaves.
> At bus level, it follows a separate protocol described in HyperBus
> specification[1].
> 
> HyperFlash follows CFI AMD/Fujitsu Extended Command Set (0x0002) similar
> to that of existing parallel NORs. Since Hyperbus is x8 DDR bus,
> its equivalent to x16 parallel NOR flash wrt bits per clk. But Hyperbus
> operates at >166MHz frequencies.
> HyperRAM provides direct random read/write access to flash memory
> array.
> 
> But, Hyperbus memory controllers seem to abstract implementation details
> and expose a simple MMIO interface to access connected flash.
> 
> Add support for registering HyperFlash devices with MTD framework. MTD
> maps framework along with CFI chip support framework are used to support
> communicate with flash.
> 
> Framework is modelled along the lines of spi-nor framework. HyperBus
> memory controller(HBMC) drivers call hb_register_device() to register a
> single HyperFlash device. HyperFlash core parses MMIO access
> information from DT, sets up the map_info struct, probes CFI flash and
> registers it with MTD framework.
> 
> Some HBMC masters need calibration/training sequence[3] to be carried
> out, in order for DLL inside the controller to lock, by reading a known
> string/pattern. This is done by repeatedly reading CFI Query
> Identification String. Calibration needs to be done before try to detect
> flash as part of CFI flash probe.
> 
> HyperRAM is not supported atm.
> 
> HyperBus specification can be found at[1]
> HyperFlash datasheet can be found at[2]
> 
> [1] https://www.cypress.com/file/213356/download
> [2] https://www.cypress.com/file/213346/download
> [3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
>     Table 12-5741. HyperFlash Access Sequence
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
[...]
> diff --git a/include/linux/mtd/hyperbus.h b/include/linux/mtd/hyperbus.h
> new file mode 100644
> index 000000000000..0aa11458c424
> --- /dev/null
> +++ b/include/linux/mtd/hyperbus.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +#ifndef __LINUX_MTD_HYPERBUS_H__
> +#define __LINUX_MTD_HYPERBUS_H__
> +
> +#include <linux/mtd/map.h>
> +
> +enum hb_memtype {
> +	HYPERFLASH,
> +	HYPERRAM,
> +};
> +
> +/**
> + * struct hb_device - struct representing Hyperbus slave device
> + * @map: map_info struct for accessing MMIO Hyperbus flash memory
> + * @dev: device pointer of Hyperbus Controller

   I think we need a separate structure for the HyperBus controller, not just
for the slave devices...

> + * @np:	pointer to Hyperbus slave device node
> + * @mtd: pointer to MTD struct
> + * @ops: pointer to custom Hyperbus ops
> + * @memtype: type of memory device: Hyperflash or HyperRAM
> + * @needs_calib: flag to indicate whether calibration sequence is needed
> + * @registered: flag to indicate whether device is registered with MTD core
> + */
> +
> +struct hb_device {
> +	struct map_info map;
> +	struct device *dev;
> +	struct device_node *np;
> +	struct mtd_info *mtd;
> +	struct hb_ops *ops;
> +	enum hb_memtype memtype;
> +	bool needs_calib;
> +	bool registered;
> +};
> +
> +/**
> + * struct hb_ops - struct representing custom Hyperbus operations
> + * @read16: read 16 bit of data, usually from register/ID-CFI space
> + * @write16: write 16 bit of data, usually to register/ID-CFI space
> + * copy_from: copy data from flash memory
> + * copy_to: copy data to flash_memory
> + */
> +
> +struct hb_ops {
> +	u16 (*read16)(struct hb_device *hbdev, unsigned long addr);
> +	void (*write16)(struct hb_device *hbdev, unsigned long addr, u16 val);
> +
> +	void (*copy_from)(struct hb_device *hbdev, void *to,
> +			  unsigned long from, ssize_t len);
> +	void (*copy_to)(struct hb_device *dev, unsigned long to,
> +			const void *from, ssize_t len);

   ... else these methods won't fly if you need to "massage" the controller
registers inside them...

> +};
[...]

MBR, Sergei
