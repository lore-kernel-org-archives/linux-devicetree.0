From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [RFC PATCH v2 1/5] mtd: cfi_cmdset_0002: Add support for polling
 status register
Date: Mon, 25 Mar 2019 22:36:37 +0530
Message-ID: <08f5424f-3ce3-492a-d2b3-4798993d35b9@ti.com>
References: <20190321174548.9288-1-vigneshr@ti.com>
 <20190321174548.9288-2-vigneshr@ti.com>
 <f92362a0678b07d22ccc0f271fe3483dc77364a9.camel@infinera.com>
 <b1961c49-6795-89e7-e154-6270bf43d49c@ti.com>
 <107cd92703919f97f4cf2d9cd279b091bc90518e.camel@infinera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <107cd92703919f97f4cf2d9cd279b091bc90518e.camel@infinera.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, "richard@nod.at" <richard@nod.at>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Cc: "Nori, Sekhar" <nsekhar@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "masonccyang@mxic.com.tw" <masonccyang@mxic.com.tw>, "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "sergei.shtylyov@cogentembedded.com" <sergei.shtylyov@cogentembedded.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "arnd@arndb.de" <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org



On 25/03/19 7:21 PM, Joakim Tjernlund wrote:
> On Mon, 2019-03-25 at 18:27 +0530, Vignesh Raghavendra wrote:
>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>>
>> Hi,
>>
>> On 21/03/19 11:41 PM, Joakim Tjernlund wrote:
>>> On Thu, 2019-03-21 at 23:15 +0530, Vignesh Raghavendra wrote:
>>>> HyperFlash devices are compliant with CFI AMD/Fujitsu Extended Command
>>>> Set(0x0002) for flash operations, therefore drivers/mtd/chips/cfi_cmdset_0002.c
>>>> can be use as is. But these devices do not support DQ polling method of
>>>> determining chip ready/good status. These flashes provide Status
>>>> Register whose bits can be polled to know status of flash operation.
>>>>
>>>> Cypress HyperFlash datasheet here[1], talks about CFI Amd/Fujitsu
>>>> Extended Query version 1.5. Bit 0 of "Software Features supported" field
>>>> of CFI Primary Vendor-Specific Extended Query table indicates
>>>> presence/absence of status register and Bit 1 indicates whether or not
>>>> DQ polling is supported. Using these bits, its possible to determine
>>>> whether flash supports DQ polling or need to use Status Register.
>>>>
>>>> Add support for polling status register to know device ready/status of
>>>> erase/write operations when DQ polling is not supported.
>>>
>>> Isn't this new Status scheme just a copy of Intels(cmdset_0001)?
>>
>> Yes, but with one difference: At the end of program/erase operation,
>> device directly enters status register mode and  starts reflecting
>> status register content at any address.
>> The device remains in the read status register state until another
>> command is written to the device. Therefore there is notion of device is
>> in "status register read mode" (FL_STATUS) state
> 
> That seems to vary and long time ago RMK added this:
> 		/* If the flash has finished erasing, then 'erase suspend'
> 		 * appears to make some (28F320) flash devices switch to
> 		 * 'read' mode.  Make sure that we switch to 'read status'
> 		 * mode so we get the right data. --rmk
> 		 */
> 		map_write(map, CMD(0x70), chip->in_progress_block_addr);
> 

This behavior is expected with cmdset_0001. Because "The device remains
in the read status register state until another command is written",
therefore "erase suspend' command after erase completion will switch
device to read mode. And therefore read status is safe thing to do for
cmdset_0001.

But in case of cmdset_0002 erase completion will not put device to read
status mode and therefore no special status tracking is required.

>>
>> But in case of cfi_cmdset_0002, once program/erase operation is
>> complete, device returns to previous address space overlay from which
>> operation was started from (mostly read mode)
> 
> I hope you can do the same as Intel here, issue an explicit Status CMD or you will be in trouble.

Even if we issue Read Status command to enter read status mode, any
single subsequent read will put device back to read mode. So, sending
explicit Status CMD is of not much use.

As long as cmdset_0002 driver ensures sending Read Status cmd and next
single read can be done in one go (ie. mutex held), I don't see any
trouble here. This is already take care off.

> 
> Also, I think you need to use the various map_word_xxx as in:
> status = map_read(map, chip->in_progress_block_addr);
> if (map_word_andequal(map, status, status_OK, status_OK))
> 	break;

Yes, I will fixup this patch to use map_word_* wherever necessary in the
next revision.


> otherwise you will break interleaved setups(like two 8-bit flashes in parallel to
> form one 16 bit bus). Maybe this is not supported for CMDSET 0002 ?
> 

Interleaved is indeed supported by cmdset_0002. Thanks for pointing that
out!

>  Jocke
> 
>>
>> In order to enter status register overlay mode, Read Status command is
>> to be written to addr_unlock1(0x555) address. The overlay is in effect
>> for one read access, specifically the next read access that follows the
>> Status Register Read command
>> Therefore code around FL_STATUS state in cfi_cmdset_0001 is not
>> applicable to cfi_cmdset_0002 as is.
>>
>>
>>> If so I think the new status impl. in 0002 should borrow from 0001 as this is a
>>> hardened and battle tested impl.
>>>
>>
>> In case of cfi_cmdset_0001.c, program/erase is followed by
>> inval_cache_and_wait_for_operation() to poll ready bit and based on
>> status register value, success or the error handling is done.
>>
>> Most of the code corresponding to inval_cache_and_wait_for_operation()
>> is already in cfi_cmdset_0002.c. So, whats missing in this patch is
>> handling and reporting of errors as reflected in status register after
>> write/erase failures. I will add that in the next version.
>>
>> But, I don't see much to borrow apart from error handling sequence.
>> Please, let me know if I missed something.
>>
>>> I know other modern 0002 chips supports both old and new impl. of Status and I world
>>> guess that we will see more chips with new Status only.
>>>
>>
>> Agreed. Newer devices would mostly be CFI 1.5.
>>
>> --
>> Regards
>> Vignesh
> 

-- 
Regards
Vignesh
