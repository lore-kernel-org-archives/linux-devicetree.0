From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] mtd: spi-nor: core code for the Altera Quadspi Flash
 Controller v2
Date: Tue, 27 Jun 2017 19:55:36 +0200
Message-ID: <9ca626e3-fc80-2b50-85aa-5db102dc9b7f@gmail.com>
References: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1498493619-4633-3-git-send-email-matthew.gerlach@linux.intel.com>
 <852b819d-ea7a-4854-cae1-3857cf92930d@gmail.com>
 <alpine.DEB.2.20.1706270737120.8058@mgerlach-VirtualBox>
 <0cb464ef-eeb8-ebc9-fde9-b6d42bf03877@gmail.com>
 <alpine.DEB.2.20.1706271019140.8058@mgerlach-VirtualBox>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.20.1706271019140.8058@mgerlach-VirtualBox>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/27/2017 07:26 PM, matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:

[...]

>>>>> +#ifndef __ALTERA_QUADSPI_H
>>>>> +#define __ALTERA_QUADSPI_H
>>>>> +
>>>>> +#include <linux/device.h>
>>>>> +
>>>>> +#define ALTERA_QUADSPI_FL_BITREV_READ BIT(0)
>>>>> +#define ALTERA_QUADSPI_FL_BITREV_WRITE BIT(1)
>>>>> +
>>>>> +#define ALTERA_QUADSPI_MAX_NUM_FLASH_CHIP 3
>>>>> +
>>>>> +int altera_quadspi_create(struct device *dev, void __iomem *csr_base,
>>>>> +              void __iomem *data_base, void __iomem *window_reg,
>>>>> +              size_t window_size, u32 flags);
>>>>> +
>>>>> +int altera_qspi_add_bank(struct device *dev,
>>>>> +             u32 bank, struct device_node *np);
>>>>> +
>>>>> +int altera_quadspi_remove_banks(struct device *dev);
>>>>
>>>> Why is this header needed at all ?
>>>
>>> This header is needed because of the very different ways
>>> FPGAs can be used with a processor running Linux.  In the case of a
>>> soft processor in the FPGA or an ARM connected to a FPGA, this header
>>> is not necessary because device trees are used to probe the driver.
>>> However, if the FPGA is on a PCIe card connected to an x86, device trees
>>> are not generally used, and the pcie driver must enumerate the
>>> "sub-driver".
>>
>> But we don't support that later part, do we ?
> 
> There is currently v2 patch set for the intel-fpga PCIe driver being
> reviewed where I am adding support for version 2 of the Altera Quadspi
> controller.

It'd be real nice to mention that in the cover letter with a link to
that patchset , otherwise it's real hard to understand why you did this.

> This technique of separating core driver code from platform/device tree
> code has been reviewed and accepted for the Altera Partial
> Reconfiguration IP, Altera Freeze Bridge, and the fpga region.

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
