From: Jeff Garzik <jeff@garzik.org>
Subject: Re: pata_of_platform.c cannot build on sparc
Date: Thu, 22 Dec 2011 14:38:17 -0500
Message-ID: <4EF38729.8070804@garzik.org>
References: <20111221.173810.971054965060472866.davem@davemloft.net> <4EF26ADB.2040504@gmail.com> <20111221.191459.1775781797635505733.davem@davemloft.net> <4EF28A8A.5070600@garzik.org> <4EF332ED.1050200@gmail.com> <4EF38C64.4030801@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-ide-owner@vger.kernel.org>
In-Reply-To: <4EF38C64.4030801@mvista.com>
Sender: linux-ide-owner@vger.kernel.org
To: Sergei Shtylyov <sshtylyov@mvista.com>
Cc: Rob Herring <robherring2@gmail.com>, David Miller <davem@davemloft.net>, pawel.moll@arm.com, linux-ide@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, jgarzik@redhat.com
List-Id: devicetree@vger.kernel.org

On 12/22/2011 03:00 PM, Sergei Shtylyov wrote:
> Hello.
>
> On 12/22/2011 04:38 PM, Rob Herring wrote:
>
>>>>>> It depends upon CONFIG_OF_IRQ which not all CONFIG_OF platforms
>>>>>> support,
>>>>>> in particular sparc does not support CONFIG_OF_PLATFORM because it
>>>>>> precomputes all IRQs at boot time when it scans the device tree so
>>>>>> all
>>>>>> of the CONFIG_OF_IRQ infrastructure to probe and resolve IRQs at
>>>>>> driver
>>>>>> probe time is wrong and completely unnecessary.
>
>>>>>> Add the proper dependencies so that pata_of_platform.c doesn't get
>>>>>> built on sparc.
>
>>>>>> CONFIG_OF_IRQ was severely misdesigned, it should just NOP out on
>>>>>> platforms where the architecture has the final IRQ values already
>>>>>> like
>>>>>> sparc does. But that's not how it was implemented at all, and now
>>>>>> we're starting to have all of these drivers get hard dependencies on
>>>>>> this mechanism and it's datastructures, and the resulting sparc build
>>>>>> failures from time to time.
>
>>>>>> Jeff, please push something like the following to Linus so that
>>>>>> sparc's allmodconfig builds again. Thanks.
>
>>>>> Really, drivers should no longer use of_irq_to_resource (or
>>>>> of_address_to_resource for that matter). The resources are setup by
>>>>> the
>>>>> core OF code. The patch I sent does this.
>
>>>> Thanks for taking care of this.
>
>>> Being so late in 3.2-rc, it would be preferred to apply&push David's
>>> patch for 3.2, and then get Rob's into libata-dev#upstream (linux-next).
>
>>> That OK?
>
>> Fine by me.
>
> But then it should be extended to undo David's patch, right? Or that
> patch just be reverted afterwards...

Correct.

	Jeff




