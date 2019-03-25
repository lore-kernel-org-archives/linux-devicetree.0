From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [RFC PATCH v2 3/5] mtd: Add support for Hyperbus memory devices
Date: Mon, 25 Mar 2019 23:13:40 +0300
Message-ID: <98e1e3ad-75d3-670f-bcf7-27389cc60a98@cogentembedded.com>
References: <20190321174548.9288-1-vigneshr@ti.com>
 <20190321174548.9288-4-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321174548.9288-4-vigneshr@ti.com>
Content-Language: en-MW
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh Raghavendra <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tudor.ambarus@microchip.com, nsekhar@ti.com, Mason Yang <masonccyang@mxic.com.tw>
List-Id: devicetree@vger.kernel.org

Hello!

On 03/21/2019 08:45 PM, Vignesh Raghavendra wrote:

> Cypress' Hyperbus is Low Signal Count, High Performance Double Data Rate

   It's HyperBus, according to the spec...

> Bus interface between a host system master and one or more slave
> interfaces. Hyperbus is used to connect microprocessor, microcontroller,
> or ASIC devices with random access NOR flash memory (called Hyperflash)
> or self refresh DRAM (called HyperRAM).
> 
> Its a 8-bit data bus (DQ[7:0]) with  Read-Write Data Strobe (RWDS)
> signal and either Single-ended clock(3.0V parts) or Differential clock
> (1.8V parts). It uses ChipSelect lines to select b/w multiple slaves.
> At bus level, it follows a separate protocol described in Hyperbus
> specification[1].

   HyperBus. 
> Hyperflash follows CFI AMD/Fujitsu Extended Command Set (0x0002) similar
> to that of existing parallel NORs. Since Hyperbus is x8 DDR bus,
> its equivalent to x16 parallel NOR flash wrt bits per clock cycle. But
> Hyperbus operates at >166MHz frequencies.
> HyperRAM provides direct random read/write access to flash memory
> array.
> 
> But, Hyperbus memory controllers seem to abstract implementation details

   HyperBus.

> and expose a simple MMIO interface to access connected flash.
> 
> Add support for registering Hyperflash devices with MTD framework. MTD

   HyperFlash.

> maps framework along with CFI chip support framework are used to support
> communicating with flash.
> 
> Framework is modelled along the lines of spi-nor framework. Hyperbus

   HyperBus.

> memory controller (HBMC) drivers calls hyperbus_register_device() to
> register a single Hyperflash device. Hyperflash core parses MMIO access

   HyperFlash.

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
> Hyperbus specification can be found at[1]
> Hyperflash datasheet can be found at[2]

  HyperBus & HyperFlash.
 
> [1] https://www.cypress.com/file/213356/download
> [2] https://www.cypress.com/file/213346/download
> [3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
>     Table 12-5741. HyperFlash Access Sequence
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
[...]
> diff --git a/drivers/mtd/hyperbus/hyperbus-core.c b/drivers/mtd/hyperbus/hyperbus-core.c
> new file mode 100644
> index 000000000000..4c2876c367fc
> --- /dev/null
> +++ b/drivers/mtd/hyperbus/hyperbus-core.c
> @@ -0,0 +1,183 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> +// Author: Vignesh Raghavendra <vigneshr@ti.com>
> +
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mtd/hyperbus.h>
> +#include <linux/mtd/map.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/cfi.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/types.h>
> +
> +#define HYPERBUS_CALIB_COUNT 25

   As I said, this seems platform specific...

[...]
> +/* Default calibration routine for use by Hyperbus controller.

   No, there should be easy opt-out from the calibration method.
Currently, the driver will have to define its own calibrate method, even
if does't need any calibration...

> + * Controller is calibrated by repeatedly reading known pattern ("QRY"
> + * string from CFI space)
> + * It is not enough to just ensure "QRY" string is read correctly, need
> + * to read mulitple times to ensure stability of the DLL lock.
> + */
> +int hyperbus_calibrate(struct hyperbus_device *hbdev)
> +{
> +	struct map_info *map = &hbdev->map;
> +	struct cfi_private cfi;
> +	int count = HYPERBUS_CALIB_COUNT;
> +	int ret;
> +
> +	cfi.interleave = 1;
> +	cfi.device_type = CFI_DEVICETYPE_X16;
> +	cfi_send_gen_cmd(0xF0, 0, 0, map, &cfi, cfi.device_type, NULL);
> +	cfi_send_gen_cmd(0x98, 0x55, 0, map, &cfi, cfi.device_type, NULL);
> +
> +	while (count--)
> +		cfi_qry_present(map, 0, &cfi);

   I still don't understand why we have to spin all 25 times here if QRY
appears earlier than that.

> +
> +	ret = cfi_qry_present(map, 0, &cfi);
> +	cfi_qry_mode_off(0, map, &cfi);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(hyperbus_calibrate);
[...]
> diff --git a/include/linux/mtd/hyperbus.h b/include/linux/mtd/hyperbus.h
> new file mode 100644
> index 000000000000..57f273e87f29
> --- /dev/null
> +++ b/include/linux/mtd/hyperbus.h
> @@ -0,0 +1,91 @@
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
> +enum hyperbus_memtype {
> +	HYPERFLASH,
> +	HYPERRAM,
> +};
> +
> +/**
> + * struct hyerbus_device - struct representing Hyperbus slave device

   hyperbus_device.

> + * @map: map_info struct for accessing MMIO Hyperbus flash memory
> + * @np:	pointer to Hyperbus slave device node
> + * @mtd: pointer to MTD struct
> + * @ctlr: pointer to Hyperbus controller struct
> + * @memtype: type of memory device: Hyperflash or HyperRAM

   HyperFlash.

[...]
> +/**
> + * hyperbus_calibrate - default calibration routine for use by Hyperbus ctlr.
> + * @hbdev: hyperbus_device to be used for calibration

   HyperBus.

[...]

MBR, Sergei
