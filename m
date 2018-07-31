From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [BUG BISECT] Ethernet fail on VF50 (OF: Don't set default
 coherent DMA mask)
Date: Tue, 31 Jul 2018 15:09:34 +0100
Message-ID: <4ce17098-850f-3bb0-b977-8d7932e74e06@arm.com>
References: <CAJKOXPeaguNxRr7pCArJ5Db4tS6Kr5BDheCxskY+vd0dUN+0GQ@mail.gmail.com>
 <CAJKOXPfageiBVXddtdJRBS+092O3QfD0yoS_Mk+PoX7+qNYNUA@mail.gmail.com>
 <20180727140448.GA29001@lst.de> <20180728165820.GA5731@roeck-us.net>
 <45f7fc82-fb9c-e666-4ada-c5338d2c1c96@arm.com>
 <39fa11ce4b7dd151d98868f375baf818@agner.ch>
 <0e893142-a5db-d119-6eb3-f849db6b5d04@arm.com>
 <f67628ad-4cae-96cd-d0c4-3b2f7d12a822@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f67628ad-4cae-96cd-d0c4-3b2f7d12a822@roeck-us.net>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Stefan Agner <stefan@agner.ch>
Cc: Christoph Hellwig <hch@lst.de>, Krzysztof Kozlowski <krzk@kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Fugang Duan <fugang.duan@nxp.com>
List-Id: devicetree@vger.kernel.org

On 31/07/18 14:26, Guenter Roeck wrote:
> On 07/31/2018 05:32 AM, Robin Murphy wrote:
>> On 31/07/18 09:19, Stefan Agner wrote:
>>> On 30.07.2018 16:38, Robin Murphy wrote:
>>>> On 28/07/18 17:58, Guenter Roeck wrote:
>>>>> On Fri, Jul 27, 2018 at 04:04:48PM +0200, Christoph Hellwig wrote:
>>>>>> On Fri, Jul 27, 2018 at 03:18:14PM +0200, Krzysztof Kozlowski wrote:
>>>>>>> On 27 July 2018 at 15:11, Krzysztof Kozlowski <krzk@kernel.org> 
>>>>>>> wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On today's next, the bisect pointed commit
>>>>>>>> ff33d1030a6ca87cea9a41e1a2ea7750a781ab3d as fault for my boot 
>>>>>>>> failures
>>>>>>>> with NFSv4 root on Toradex Colibri VF50 (Iris carrier board).
>>>>>>>>
>>>>>>>> Author: Robin Murphy <robin.murphy@arm.com>
>>>>>>>> Date:   Mon Jul 23 23:16:12 2018 +0100
>>>>>>>>       OF: Don't set default coherent DMA mask
>>>>>>>>
>>>>>>>> Board: Toradex Colibri VF50 (NXP VF500, Cortex A5, serial 
>>>>>>>> configured
>>>>>>>> with DMA) on Iris Carrier.
>>>>>>>>
>>>>>>>> It looks like problem with Freescale Ethernet driver:
>>>>>>>> [   15.458477] fsl-edma 40018000.dma-controller: coherent DMA 
>>>>>>>> mask is unset
>>>>>>>> [   15.465284] fsl-lpuart 40027000.serial: Cannot prepare cyclic 
>>>>>>>> DMA
>>>>>>>> [   15.472086] Root-NFS: no NFS server address
>>>>>>>> [   15.476359] VFS: Unable to mount root fs via NFS, trying floppy.
>>>>>>>> [   15.484228] VFS: Cannot open root device "nfs" or
>>>>>>>> unknown-block(2,0): error -6
>>>>>>>> [   15.491664] Please append a correct "root=" boot option; here 
>>>>>>>> are
>>>>>>>> the available partitions:
>>>>>>>> [   15.500188] 0100           16384 ram0
>>>>>>>> [   15.500200]  (driver?)
>>>>>>>> [   15.506406] Kernel panic - not syncing: VFS: Unable to mount 
>>>>>>>> root
>>>>>>>> fs on unknown-block(2,0)
>>>>>>>> [   15.514747] ---[ end Kernel panic - not syncing: VFS: Unable to
>>>>>>>> mount root fs on unknown-block(2,0) ]---
>>>>>>>>
>>>>>>>> Attached - defconfig and full boot log.
>>>>>>>>
>>>>>>>> Any hints?
>>>>>>>> Let me know if you need any more information.
>>>>>>>
>>>>>>> My Exynos boards also fail to boot on missing network:
>>>>>>> https://krzk.eu/#/builders/21/builds/799/steps/10/logs/serial0
>>>>>>>
>>>>>>> As expected there are plenty of "DMA mask not set" warnings... and
>>>>>>> later dwc3 driver fails with:
>>>>>>>       dwc3: probe of 12400000.dwc3 failed with error -12
>>>>>>> which is probably the answer why LAN attached to USB is not present.
>>>>>>
>>>>>> Looks like all the drivers failed to set a dma mask and were lucky.
>>>>>
>>>>> I would call it a serious regression. Also, no longer setting a 
>>>>> default
>>>>> coherent DMA mask is a quite substantial behavioral change, especially
>>>>> if and since the code worked just fine up to now.
>>>>
>>>> To reiterate, that particular side-effect was an unintentional
>>>> oversight, and I was simply (un)lucky enough that none of the drivers
>>>> I did test depended on that default mask. Sorry for the blip; please
>>>> check whether it's now fixed in next-20180730 as it should be.
>>>>
>>>
>>> Just for my understanding:
>>>
>>> Your first patch ("OF: Don't set default coherent DMA mask") sounded
>>> like that *not* setting default coherent DMA mask was intentionally.
>>> Since the commit message reads: "...the bus code has not initialised any
>>> default value" that was assuming that all bus code sets a default DMA
>>> mask which wasn't the case for "simple-bus".
>>
>> Yes, reading the patches in the order they were written is perhaps a 
>> little unclear, but hopefully the order in which they are now applied 
>> makes more sense.
>>
>>> So I guess that is what ("of/platform: Initialise default DMA masks")
>>> makes up for in the typical device tree case ("simple-bus")?
>>
>> Indeed, I'd missed the fact that the now-out-of-place-looking 
>> initialisation in of_dma_configure() still actually belonged to 
>> of_platform_device_create_pdata() - that patch should make the 
>> assumptions of "OF: Don't set default coherent DMA mask" true again, 
>> even for OF-platform devices.
>>
>>> Now, since almost all drivers are inside a soc "simple-bus" and DMA mask
>>> is set again, can/should we rely on the coherent DMA mask set?
>>>
>>> Or is the expectation still that this is set on driver level too?
>>
>> Ideally, we'd like all drivers to explicitly request their masks as 
>> the documentation in DMA-API-HOWTO.txt recommends, if only to ensure 
>> DMA is actually possible - there can be systems where even the default 
>> 32-bit mask is no good - but clearly we're a little way off trying to 
>> enforce that just yet.
>>
>> Robin.
>>
> 
> Please note that sparc images still generate the warning (next-20180731).

Ugh, OK, any ideas what sparc does to create these platform devices that 
isn't of_platform_device_create_pdata() and has somehow grown an 
implicit dependency on of_dma_configure() since 4.12? I'm looking, but 
nothing jumps out...

Robin.

> sunlance ffd35110: DMA mask not set
> sunlance.c:v2.02 8/24/03 Miguel de Icaza (miguel@nuclecu.unam.mx)
> ioremap: done with statics, switching to malloc
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at ./include/linux/dma-mapping.h:516 
> sparc_lance_probe_one+0x428/0x4f4
> 
> esp ffd38e90: DMA mask not set
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at ./include/linux/dma-mapping.h:516 
> esp_sbus_probe+0x408/0x6e8
> 
> Guenter
> 
