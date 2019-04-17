From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3 3/5] mtd: Add support for HyperBus memory devices
Date: Wed, 17 Apr 2019 12:12:41 +0530
Message-ID: <f4ca7582-bfec-06fc-0b1c-e1eaad6ecebf@ti.com>
References: <20190412092923.24919-1-vigneshr@ti.com>
 <20190412092923.24919-4-vigneshr@ti.com>
 <53a92396-2535-ace7-3a31-1daf719ff323@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <53a92396-2535-ace7-3a31-1daf719ff323@cogentembedded.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>, nsekhar@ti.com, linux-kernel@vger.kernel.org, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On 14/04/19 11:21 PM, Sergei Shtylyov wrote:
> Hello!
> 
> On 04/12/2019 12:29 PM, Vignesh Raghavendra wrote:
> 
>> Cypress' HyperBus is Low Signal Count, High Performance Double Data Rate
>> Bus interface between a host system master and one or more slave
>> interfaces. HyperBus is used to connect microprocessor, microcontroller,
>> or ASIC devices with random access NOR flash memory (called HyperFlash)
>> or self refresh DRAM (called HyperRAM).
>>
>> Its a 8-bit data bus (DQ[7:0]) with  Read-Write Data Strobe (RWDS)
>> signal and either Single-ended clock(3.0V parts) or Differential clock
>> (1.8V parts). It uses ChipSelect lines to select b/w multiple slaves.
>> At bus level, it follows a separate protocol described in HyperBus
>> specification[1].
>>
>> HyperFlash follows CFI AMD/Fujitsu Extended Command Set (0x0002) similar
>> to that of existing parallel NORs. Since HyperBus is x8 DDR bus,
>> its equivalent to x16 parallel NOR flash wrt bits per clock cycle. But
>> HyperBus operates at >166MHz frequencies.
>> HyperRAM provides direct random read/write access to flash memory
>> array.
>>
>> But, HyperBus memory controllers seem to abstract implementation details
>> and expose a simple MMIO interface to access connected flash.
>>
>> Add support for registering HyperFlash devices with MTD framework. MTD
>> maps framework along with CFI chip support framework are used to support
>> communicating with flash.
>>
>> Framework is modelled along the lines of spi-nor framework. HyperBus
>> memory controller (HBMC) drivers calls hyperbus_register_device() to
>> register a single HyperFlash device. HyperFlash core parses MMIO access
>> information from DT, sets up the map_info struct, probes CFI flash and
>> registers it with MTD framework.
>>
>> Some HBMC masters need calibration/training sequence[3] to be carried
>> out, in order for DLL inside the controller to lock, by reading a known
>> string/pattern. This is done by repeatedly reading CFI Query
>> Identification String. Calibration needs to be done before trying to detect
>> flash as part of CFI flash probe.
>>
>> HyperRAM is not supported at the moment.
>>
>> HyperBus specification can be found at[1]
>> HyperFlash datasheet can be found at[2]
>>
>> [1] https://www.cypress.com/file/213356/download
>> [2] https://www.cypress.com/file/213346/download
>> [3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
>>     Table 12-5741. HyperFlash Access Sequence
>>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> [...]
>> diff --git a/drivers/mtd/hyperbus/Kconfig b/drivers/mtd/hyperbus/Kconfig
>> new file mode 100644
>> index 000000000000..98147e28caa0
>> --- /dev/null
>> +++ b/drivers/mtd/hyperbus/Kconfig
>> @@ -0,0 +1,11 @@
>> +menuconfig MTD_HYPERBUS
>> +	tristate "HyperBus support"
>> +	select MTD_CFI
>> +	select MTD_MAP_BANK_WIDTH_2
>> +	select MTD_CFI_AMDSTD
>> +	select MTD_COMPLEX_MAPPINGS
>> +	help
>> +	  This is the framework for the HyperBus which can be used by
>> +	  the HyperBus Controller driver to communicate with
>> +	  HyperFlash. See Cypress HyperBus specification for more
>> +	  details
>> diff --git a/drivers/mtd/hyperbus/Makefile b/drivers/mtd/hyperbus/Makefile
>> new file mode 100644
>> index 000000000000..ca61dedd730d
>> --- /dev/null
>> +++ b/drivers/mtd/hyperbus/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +obj-$(CONFIG_MTD_HYPERBUS)	+= hyperbus-core.o
>> diff --git a/drivers/mtd/hyperbus/hyperbus-core.c b/drivers/mtd/hyperbus/hyperbus-core.c
>> new file mode 100644
>> index 000000000000..49aeb59742c6
>> --- /dev/null
>> +++ b/drivers/mtd/hyperbus/hyperbus-core.c
>> @@ -0,0 +1,192 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +//
>> +// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
>> +// Author: Vignesh Raghavendra <vigneshr@ti.com>
> [...]
>> +/* Default calibration routine for use by HyperBus controller.
>> + * Controller is calibrated by repeatedly reading known pattern ("QRY"
>> + * string from CFI space)
>> + * Lets ensure "QRY" string is read correctly at least 5 times to ensure
>> + * stability of the DLL lock.
>> + */
>> +int hyperbus_calibrate(struct hyperbus_device *hbdev)
>> +{
>> +	struct map_info *map = &hbdev->map;
>> +	struct cfi_private cfi;
>> +	int count = HYPERBUS_CALIB_COUNT;
>> +	int pass_count = 0;
>> +	int ret;
>> +
>> +	cfi.interleave = 1;
>> +	cfi.device_type = CFI_DEVICETYPE_X16;
>> +	cfi_send_gen_cmd(0xF0, 0, 0, map, &cfi, cfi.device_type, NULL);
>> +	cfi_send_gen_cmd(0x98, 0x55, 0, map, &cfi, cfi.device_type, NULL);
>> +
>> +	while (count--) {
>> +		cfi_qry_present(map, 0, &cfi);
>> +		ret = cfi_qry_present(map, 0, &cfi);
> 
>    Why call it twice in a row?
> 

Oops, will fix in v2

>> +		if (ret)
>> +			pass_count++;
>> +		else
>> +			pass_count = 0;
>> +		if (pass_count == 5)
>> +			break;
>> +	}
>> +
>> +	cfi_qry_mode_off(0, map, &cfi);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(hyperbus_calibrate);
> [...]
>> diff --git a/include/linux/mtd/hyperbus.h b/include/linux/mtd/hyperbus.h
>> new file mode 100644
>> index 000000000000..19340cc56aa4
>> --- /dev/null
>> +++ b/include/linux/mtd/hyperbus.h
>> @@ -0,0 +1,91 @@
> [...]
>> +/**
>> + * hb_unregister_device - deregister HyperBus slave memory device
> 
>    You forgot to update the function name in the kernel-doc. :-)
> 

Indeed, thanks for catching this!

>> + * @hbdev: hyperbus_device to be unregistered
>> + *
>> + * Return: 0 for success, others for failure.
>> + */
>> +int hyperbus_unregister_device(struct hyperbus_device *hbdev);
>> +
>> +#endif /* __LINUX_MTD_HYPERBUS_H__ */
> 
> MBR, Sergei
> 

-- 
Regards
Vignesh
