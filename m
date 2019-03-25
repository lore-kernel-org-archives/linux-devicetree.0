From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [RFC PATCH v2 1/5] mtd: cfi_cmdset_0002: Add support for polling
 status register
Date: Mon, 25 Mar 2019 18:27:41 +0530
Message-ID: <b1961c49-6795-89e7-e154-6270bf43d49c@ti.com>
References: <20190321174548.9288-1-vigneshr@ti.com>
 <20190321174548.9288-2-vigneshr@ti.com>
 <f92362a0678b07d22ccc0f271fe3483dc77364a9.camel@infinera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <f92362a0678b07d22ccc0f271fe3483dc77364a9.camel@infinera.com>
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
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "richard@nod.at" <richard@nod.at>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "sergei.shtylyov@cogentembedded.com" <sergei.shtylyov@cogentembedded.com>, "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "nsekhar@ti.com" <nsekhar@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "masonccyang@mxic.com.tw" <masonccyang@mxic.com.tw>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 21/03/19 11:41 PM, Joakim Tjernlund wrote:
> On Thu, 2019-03-21 at 23:15 +0530, Vignesh Raghavendra wrote:
>>
>> HyperFlash devices are compliant with CFI AMD/Fujitsu Extended Command
>> Set(0x0002) for flash operations, therefore drivers/mtd/chips/cfi_cmdset_0002.c
>> can be use as is. But these devices do not support DQ polling method of
>> determining chip ready/good status. These flashes provide Status
>> Register whose bits can be polled to know status of flash operation.
>>
>> Cypress HyperFlash datasheet here[1], talks about CFI Amd/Fujitsu
>> Extended Query version 1.5. Bit 0 of "Software Features supported" field
>> of CFI Primary Vendor-Specific Extended Query table indicates
>> presence/absence of status register and Bit 1 indicates whether or not
>> DQ polling is supported. Using these bits, its possible to determine
>> whether flash supports DQ polling or need to use Status Register.
>>
>> Add support for polling status register to know device ready/status of
>> erase/write operations when DQ polling is not supported.
> 
> Isn't this new Status scheme just a copy of Intels(cmdset_0001)?

Yes, but with one difference: At the end of program/erase operation,
device directly enters status register mode and  starts reflecting
status register content at any address.
The device remains in the read status register state until another
command is written to the device. Therefore there is notion of device is
in "status register read mode" (FL_STATUS) state

But in case of cfi_cmdset_0002, once program/erase operation is
complete, device returns to previous address space overlay from which
operation was started from (mostly read mode)

In order to enter status register overlay mode, Read Status command is
to be written to addr_unlock1(0x555) address. The overlay is in effect
for one read access, specifically the next read access that follows the
Status Register Read command
Therefore code around FL_STATUS state in cfi_cmdset_0001 is not
applicable to cfi_cmdset_0002 as is.


> If so I think the new status impl. in 0002 should borrow from 0001 as this is a
> hardened and battle tested impl.
>

In case of cfi_cmdset_0001.c, program/erase is followed by
inval_cache_and_wait_for_operation() to poll ready bit and based on
status register value, success or the error handling is done.

Most of the code corresponding to inval_cache_and_wait_for_operation()
is already in cfi_cmdset_0002.c. So, whats missing in this patch is
handling and reporting of errors as reflected in status register after
write/erase failures. I will add that in the next version.

But, I don't see much to borrow apart from error handling sequence.
Please, let me know if I missed something.

> I know other modern 0002 chips supports both old and new impl. of Status and I world
> guess that we will see more chips with new Status only.
> 

Agreed. Newer devices would mostly be CFI 1.5.

-- 
Regards
Vignesh
