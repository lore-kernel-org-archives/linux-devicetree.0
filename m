From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH 1/2] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Sat, 31 Oct 2015 13:34:29 -0400
Message-ID: <5634FBA5.70403@codeaurora.org>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
 <20151030150025.GF31073@leverpostej>
 <CAHp75VdHxGC841cFY3M+ujZKSX04nT4+7gc3iKsgwzLRC4AYWQ@mail.gmail.com>
 <5633B207.5030505@codeaurora.org>
 <CAHp75Ve_7NeyJD==EpgzKes9n9wb5oTwtNt7FvZHUSUxqZ4+=Q@mail.gmail.com>
 <20151030182537.GB30791@leverpostej>
 <CAHp75Vd-z22XJboxQ=CMxDQ9UaTatbCmpAPLO0jPM0FwJadBOg@mail.gmail.com>
 <5633BB66.3070505@codeaurora.org> <20151030190106.GC30791@leverpostej>
 <5633CE23.7060303@linaro.org>
 <CAHp75VcQ6r2FGqsP2mtnv95etCGJmeQ=T7aKSB5H3cvwhdSbDw@mail.gmail.com>
 <5634366D.9080307@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5634366D.9080307@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Masters <jcm@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Al Stone <al.stone@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, dmaengine <dmaengine@vger.kernel.org>, timur@codeaurora.org, cov@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, leif.lindholm@linaro.org
List-Id: devicetree@vger.kernel.org



On 10/30/2015 11:33 PM, Jon Masters wrote:
> Hi Andy,
>
> On 10/30/2015 04:15 PM, Andy Shevchenko wrote:
>> On Fri, Oct 30, 2015 at 10:08 PM, Al Stone <al.stone@linaro.org> wrote:
>>> On 10/30/2015 01:01 PM, Mark Rutland wrote:
>>>> On Fri, Oct 30, 2015 at 02:48:06PM -0400, Sinan Kaya wrote:
>>
>>>> The CSRT is listed under "Want", not "Never" or "Don't Care", so Linaro
>>>> have certainly not said that CSRT will not be supported. If anything,
>>>> they have stated that the table should be supported.
>>>
>>> "Want" means interesting, and probably useful, but no clear indication that
>>> anyone actually needs it.  At one point, we thought we might use the CSRT
>>> for describing DMA, but it turns out we have not needed to.
>>
>> Then you are going to have either 1 or 0 DMAC for slave devices, right?
>
> I believe what Al means is that such hardware has not appeared
> (publicly) until this time and so such situation was theoretical and
> thus not covered by the Linaro wiki. Linaro had not prioritized CSRT
> because it didn't seem that the need to support it would arise soon.
>
>> The CSRT, unfortunately, the only way how to enumerate DMAC to be used
>> by slave devices.
>> You may look into drivers/dma/acpi-dma.c for usage in Linux.
>>
>> Yes, I know about _DSD, but I don't think it will provide soon any
>> other official mechanisms to what we have now. Better to ask Rafael
>> and Mika.
>
> Thanks for the feedback. I agree that generally the plan is to use
> existing tables from x86 on arm64 when possible. Please see below.
>
>>> However, let's make sure we're saying the same thing: the CSRT table is
>>> properly defined in the kernel include/acpi/actbl2.h file so one can read
>>> such a table and use it if they so choose.  Nothing that we have done at
>>> Linaro in the arm64 part of the kernel relies on any of the content from
>>> the CSRT, nor does it preclude someone relying on that content.  So, the
>>> CSRT is defined, and is usable, but is just not being used -- by Linaro --
>>> at present.
>>
>> This sounds clear.
>>
>>> If that needs to change, let me know; no one has asked us to use the CSRT
>>> for a DMA engine, and we have not been provided any hardware that requires
>>> it.
>>
>> See above.
>
> Here's, what I believe to be the summary:
>
> 1). QCOM are not implementing slave device support in their current
> HIDMA hardware, therefore the requirement for CSRT does not exist *at
> present* for this specific driver to be merged and the discussion in
> this sub-thread pertains only to a situation not affecting HIDMA.
>
> 2). A requirement upon the CSRT should be clarified in the various
> specifications. The SBBR[0] currently "recommends" CSRT but does not
> necessarily provide guidance about what kinds of system resources would
> be covered by that, and so there is a potential for this to be missed.
>
> As one of the lead authors of certain ARM server specifications, I will
> contact those involved in such and ensure that this is addressed with a
> clarification in a future release.
>
> Thanks for raising the concern,
>
> Jon.
>
> [0]
> http://infocenter.arm.com/help/topic/com.arm.doc.den0044a/Server_Base_Boot_Requirements.pdf
>

Apologies for creating confusion.

I tried using the dma-acpi.c implementation at the beginning. It didn't 
quite play well with what I was trying to do with HIDMA. Since the file 
header said Intel, I assumed it was an Intel specific implementation.

To confirm my suspicion, I looked at the Linaro wiki. I haven't seen 
CSRT in MUST tables.

I considered WANT meaning some spec work required similar to DMAR vs. 
IORT table.


-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
