From: matthew.gerlach@linux.intel.com
Subject: Re: [PATCH 2/3] mtd: spi-nor: core code for the Altera Quadspi Flash
 Controller v2
Date: Tue, 27 Jun 2017 12:44:29 -0700 (PDT)
Message-ID: <alpine.DEB.2.20.1706271243150.8058@mgerlach-VirtualBox>
References: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com> <1498493619-4633-3-git-send-email-matthew.gerlach@linux.intel.com> <852b819d-ea7a-4854-cae1-3857cf92930d@gmail.com> <alpine.DEB.2.20.1706270737120.8058@mgerlach-VirtualBox>
 <0cb464ef-eeb8-ebc9-fde9-b6d42bf03877@gmail.com> <alpine.DEB.2.20.1706271019140.8058@mgerlach-VirtualBox> <9ca626e3-fc80-2b50-85aa-5db102dc9b7f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9ca626e3-fc80-2b50-85aa-5db102dc9b7f@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, davem@davemloft.net, mchehab@kernel.org
List-Id: devicetree@vger.kernel.org



On Tue, 27 Jun 2017, Marek Vasut wrote:

> On 06/27/2017 07:26 PM, matthew.gerlach@linux.intel.com wrote:
>
> [...]
>
>>>>>> +#ifndef __ALTERA_QUADSPI_H
>>>>>> +#define __ALTERA_QUADSPI_H
>>>>>> +
>>>>>> +#include <linux/device.h>
>>>>>> +
>>>>>> +#define ALTERA_QUADSPI_FL_BITREV_READ BIT(0)
>>>>>> +#define ALTERA_QUADSPI_FL_BITREV_WRITE BIT(1)
>>>>>> +
>>>>>> +#define ALTERA_QUADSPI_MAX_NUM_FLASH_CHIP 3
>>>>>> +
>>>>>> +int altera_quadspi_create(struct device *dev, void __iomem *csr_base,
>>>>>> +              void __iomem *data_base, void __iomem *window_reg,
>>>>>> +              size_t window_size, u32 flags);
>>>>>> +
>>>>>> +int altera_qspi_add_bank(struct device *dev,
>>>>>> +             u32 bank, struct device_node *np);
>>>>>> +
>>>>>> +int altera_quadspi_remove_banks(struct device *dev);
>>>>>
>>>>> Why is this header needed at all ?
>>>>
>>>> This header is needed because of the very different ways
>>>> FPGAs can be used with a processor running Linux.  In the case of a
>>>> soft processor in the FPGA or an ARM connected to a FPGA, this header
>>>> is not necessary because device trees are used to probe the driver.
>>>> However, if the FPGA is on a PCIe card connected to an x86, device trees
>>>> are not generally used, and the pcie driver must enumerate the
>>>> "sub-driver".
>>>
>>> But we don't support that later part, do we ?
>>
>> There is currently v2 patch set for the intel-fpga PCIe driver being
>> reviewed where I am adding support for version 2 of the Altera Quadspi
>> controller.
>
> It'd be real nice to mention that in the cover letter with a link to
> that patchset , otherwise it's real hard to understand why you did this.

The v2 patch set does not have my changes in it, but adding discussion in 
the cover letter is great idea!

Many thanks,

Matthew Gerlach
>
>> This technique of separating core driver code from platform/device tree
>> code has been reviewed and accepted for the Altera Partial
>> Reconfiguration IP, Altera Freeze Bridge, and the fpga region.
>
> -- 
> Best regards,
> Marek Vasut
>
