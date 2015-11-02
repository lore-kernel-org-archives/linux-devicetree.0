From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH 2/2] dma: add Qualcomm Technologies HIDMA channel driver
Date: Mon, 2 Nov 2015 14:21:37 -0500
Message-ID: <5637B7C1.2070200@codeaurora.org>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
 <4552697.VhjWnxQoIo@wuerfel> <56365F0D.6010508@codeaurora.org>
 <3962829.iR3I63FEm8@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3962829.iR3I63FEm8@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/2/2015 11:33 AM, Arnd Bergmann wrote:
> On Sunday 01 November 2015 13:50:53 Sinan Kaya wrote:
>>
>>>> The issue is not writel_relaxed vs. writel. After I issue reset, I need
>>>> wait for some time to confirm reset was done. I can use readl_polling
>>>> instead of mdelay if we don't like mdelay.
>>>
>>> I meant that both _relaxed() and mdelay() are probably wrong here.
>>
>> You are right about redundant writel_relaxed + wmb. They are effectively
>> equal to writel.
>
> Actually, writel() is wmb()+writel_relaxed(), not the other way round:

I agree. Semantics... but important one since order matters this time.

>
> When sending a command to a device that can start a DMA transfer,
> the barrier is required to ensure that the DMA happens after previously
> written data has gone from the CPU write buffers into the memory that
> is used as the source for the transfer.
>
Agreed.

> A barrier after the writel() has no effect, as MMIO writes are posted
> on the bus.

I had two use cases in the original code. We are talking about start 
routine here. I was giving reference to enable/reset/disable uses above.

1. Start routine
--------------
spin_lock
writel_relaxed
spin_unlock

and

2. enable/reset/disable
--------------
writel_relaxed
wmb

I changed writel_relaxed to writel now in start routine and submitted 
the second version of the patchset yesterday. I hope you have received 
it. I was relying on the spinlocks before.


>
>> However, after issuing the command; I still need to wait some amount of
>> time until hardware acknowledges the commands like reset/enable/disable.
>> These are relatively faster operations happening in microseconds. That's
>> why, I have mdelay there.
>>
>> I'll take a look at workqueues but it could turn out to be an overkill
>> for few microseconds.
>
> Most devices are able to provide an interrupt for long-running commands.
> Are you sure that yours is unable to do this? If so, is this a design
> mistake or an implementation bug?

I think I was not clear on how long these command take. These command 
are really fast and get acknowledged at status register in few 
microseconds. That's why I choose polling.

I was waiting up to 10ms before and manually sleeping 1 milliseconds in 
between each using mdelay. I followed your suggestion and got rid of the 
mdelay. Then, I used polled read command which calls the usleep_range 
function as you suggested.

Hardware supports error interrupts but this is a SW design philosophy 
discussion. Why would you want to trigger an interrupt for few 
microseconds delay that only happens during the first time init from probe?

>
>>>>> Reading the status probably requires a readl() rather than readl_relaxed()
>>>>> to guarantee that the DMA data has arrived in memory by the time that the
>>>>> register data is seen by the CPU. If using readl_relaxed() here is a valid
>>>>> and required optimization, please add a comment to explain why it works
>>>>> and how much you gain.
>>>>
>>>> I will add some description. This is a high speed peripheral. I don't
>>>> like spreading barriers as candies inside the readl and writel unless I
>>>> have to.
>>>>
>>>> According to the barriers video, I watched on youtube this should be the
>>>> rule for ordering.
>>>>
>>>> "if you do two relaxed reads and check the results of the returned
>>>> variables, ARM architecture guarantees that these two relaxed variables
>>>> will get observed during the check."
>>>>
>>>> this is called implied ordering or something of that sort.
>>>
>>> My point was a bit different: while it is guaranteed that the
>>> result of the readl_relaxed() is observed in order, they do not
>>> guarantee that a DMA from device to memory that was started by
>>> the device before the readl_relaxed() has arrived in memory
>>> by the time that the readl_relaxed() result is visible to the
>>> CPU and it starts accessing the memory.
>>>
>> I checked with the hardware designers. Hardware guarantees that by the
>> time interrupt is observed, all data transactions in flight are
>> delivered to their respective places and are visible to the CPU. I'll
>> add a comment in the code about this.
>
> I'm curious about this. Does that mean the device is not meant for
> high-performance transfers and just synchronizes the bus before
> triggering the interrupt?

HIDMA meaning, as you probably guessed, is high performance DMA. We had 
several name iterations in the company and this was the one that sticked.

I'm a SW person. I don't have the expertise to go deeper into HW design.
I'm following the programming document. It says coherency and guaranteed 
interrupt ordering. High performance can mean how fast you can move data 
from one location to the other one vs. how fast you can queue up 
multiple requests and get acks in response.

I followed a simple design here. HW can take multiple requests 
simultaneously and give me an ack when it is finished with interrupt.

If there are requests in flight, other requests will get queued up in SW 
and will not be serviced until the previous requests get acknowledged. 
Then, as soon as HW stops processing; I queue a bunch of other requests 
and kick start it. Current SW design does not allow simultaneous SW 
queuing vs. HW processing. I can try this on the next iteration. This 
implementation, IMO, is good enough now and has been working reliably 
for a long time (since 2014).

>
>>> In other words, when the hardware sends you data followed by an
>>> interrupt to tell you the data is there, your interrupt handler
>>> can tell the driver that is waiting for this data that the DMA
>>> is complete while the data itself is still in flight, e.g. waiting
>>> for an IOMMU to fetch page table entries.
>>>
>> There is HW guarantee for ordering.
>>
>> On demand paging for IOMMU is only supported for PCIe via PRI (Page
>> Request Interface) not for HIDMA. All other hardware instances work on
>> pinned DMA addresses. I'll drop a note about this too to the code as well.
>
> I wasn't talking about paging, just fetching the IOTLB from the
> preloaded page tables in RAM. This can takes several uncached memory
> accesses, so it would generally be slow.
>
I see.

HIDMA is not aware of IOMMU presence since it follows the DMA API. All 
IOMMU latency will be built into the data movement time. By the time 
interrupt happens, IOMMU lookups + data movement has already taken place.

>
> 	Arnd
>

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
