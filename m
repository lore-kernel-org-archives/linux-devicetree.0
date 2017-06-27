From: matthew.gerlach@linux.intel.com
Subject: Re: [PATCH 2/3] mtd: spi-nor: core code for the Altera Quadspi Flash
 Controller v2
Date: Tue, 27 Jun 2017 10:26:35 -0700 (PDT)
Message-ID: <alpine.DEB.2.20.1706271019140.8058@mgerlach-VirtualBox>
References: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com> <1498493619-4633-3-git-send-email-matthew.gerlach@linux.intel.com> <852b819d-ea7a-4854-cae1-3857cf92930d@gmail.com> <alpine.DEB.2.20.1706270737120.8058@mgerlach-VirtualBox>
 <0cb464ef-eeb8-ebc9-fde9-b6d42bf03877@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0cb464ef-eeb8-ebc9-fde9-b6d42bf03877@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, davem@davemloft.net, mchehab@kernel.org
List-Id: devicetree@vger.kernel.org



On Tue, 27 Jun 2017, Marek Vasut wrote:

> On 06/27/2017 04:57 PM, matthew.gerlach@linux.intel.com wrote:
>
> [...]
>
>>>> +static int altera_quadspi_read_reg(struct spi_nor *nor, u8 opcode,
>>>> u8 *val,
>>>> +                   int len)
>>>> +{
>>>> +    struct altera_quadspi_flash *flash = nor->priv;
>>>> +    struct altera_quadspi *q = flash->q;
>>>> +    u32 data = 0;
>>>> +
>>>> +    memset(val, 0, len);
>>>> +
>>>> +    altera_quadspi_chip_select(q, flash->bank);
>>>> +
>>>> +    switch (opcode) {
>>>> +    case SPINOR_OP_RDSR:
>>>> +        data = alt_qspi_readl(q->csr_base, QUADSPI_SR_REG);
>>>> +        dev_dbg(q->dev, "%s RDSR 0x%x\n", __func__, data);
>>>> +        *val = (u8)data & QUADSPI_SR_MASK;
>>>> +        break;
>>>> +    case SPINOR_OP_RDID:
>>>> +        if (q->opcode_id == EPCS_OPCODE_ID)
>>>> +            data = alt_qspi_readl(q->csr_base, QUADSPI_SID_REG);
>>>> +        else
>>>> +            data = alt_qspi_readl(q->csr_base, QUADSPI_RDID_REG);
>>>> +
>>>> +        *((u32 *)val) = data;
>>>
>>> What are these awful casts ?
>>
>> This component requires reading the registers as 32 bit quantities. So it
>> seemed the right thing to do to me.
>
> Does this handle endianness well ?

Good point.  This would break horribly on a big endian cpu.

>
>>>> +        break;
>>>> +    case SPINOR_OP_RDFSR:
>>>> +        data = alt_qspi_readl(q->csr_base, QUADSPI_FLAG_STATUS_REG);
>>>> +        dev_dbg(q->dev, "%s RDFSR 0x%x\n", __func__, data);
>>>> +        *val = (u8)(data & 0xff);
>>>> +        break;
>>>> +    default:
>>>> +        dev_dbg(q->dev, "%s UNHANDLED read_reg 0x%x\n",
>>>> +            __func__, opcode);
>>>> +        *val = 0;
>>>> +        break;
>>>> +    }
>>>> +    return 0;
>>>> +}
>
> [...]
>
>>>> +#define WINDOW_ALIGN 4
>>>> +#define WINDOW_MASK (WINDOW_ALIGN - 1)
>>>
>>> What are these undocumented macros in the middle of the code ?
>>
>> The bindings document states that when a windowed bridge
>> is used, all accesses must be 32 bit.  I can comment/rename
>> and put at the top.
>
> Yes please.
>
> [...]
>
>>>> diff --git a/include/linux/mtd/altera-quadspi.h
>>>> b/include/linux/mtd/altera-quadspi.h
>>>> new file mode 100644
>>>> index 0000000..58f31ee
>>>> --- /dev/null
>>>> +++ b/include/linux/mtd/altera-quadspi.h
>>>> @@ -0,0 +1,28 @@
>>>> +/*
>>>> + *
>>>> + * Copyright 2017 Intel Corporation, Inc.
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modify
>>>> + * it under the terms of the GNU General Public License as published by
>>>> + * the Free Software Foundation; either version 2 of the License, or
>>>> + * (at your option) any later version.
>>>> + */
>>>> +#ifndef __ALTERA_QUADSPI_H
>>>> +#define __ALTERA_QUADSPI_H
>>>> +
>>>> +#include <linux/device.h>
>>>> +
>>>> +#define ALTERA_QUADSPI_FL_BITREV_READ BIT(0)
>>>> +#define ALTERA_QUADSPI_FL_BITREV_WRITE BIT(1)
>>>> +
>>>> +#define ALTERA_QUADSPI_MAX_NUM_FLASH_CHIP 3
>>>> +
>>>> +int altera_quadspi_create(struct device *dev, void __iomem *csr_base,
>>>> +              void __iomem *data_base, void __iomem *window_reg,
>>>> +              size_t window_size, u32 flags);
>>>> +
>>>> +int altera_qspi_add_bank(struct device *dev,
>>>> +             u32 bank, struct device_node *np);
>>>> +
>>>> +int altera_quadspi_remove_banks(struct device *dev);
>>>
>>> Why is this header needed at all ?
>>
>> This header is needed because of the very different ways
>> FPGAs can be used with a processor running Linux.  In the case of a
>> soft processor in the FPGA or an ARM connected to a FPGA, this header
>> is not necessary because device trees are used to probe the driver.
>> However, if the FPGA is on a PCIe card connected to an x86, device trees
>> are not generally used, and the pcie driver must enumerate the
>> "sub-driver".
>
> But we don't support that later part, do we ?

There is currently v2 patch set for the intel-fpga PCIe driver being 
reviewed where I am adding support for version 2 of the Altera Quadspi 
controller.

This technique of separating core driver code from platform/device tree 
code has been reviewed and accepted for the Altera Partial Reconfiguration 
IP, Altera Freeze Bridge, and the fpga region.

Matthew Gerlach
>
> -- 
> Best regards,
> Marek Vasut
>
