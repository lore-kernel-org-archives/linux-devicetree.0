From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/2] of: base: add support to get machine model name
Date: Mon, 21 Nov 2016 16:20:15 +0000
Message-ID: <0f150e21-ba46-d4f2-98e8-a226eb82ca3e@arm.com>
References: <1479396775-32033-1-git-send-email-sudeep.holla@arm.com>
 <582E1A59.7040502@gmail.com> <075d4718-8cd2-e390-b755-bc24e7497eae@arm.com>
 <582F6312.5040009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <582F6312.5040009@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 18/11/16 20:22, Frank Rowand wrote:
> On 11/18/16 02:41, Sudeep Holla wrote:
>>
>>
>> On 17/11/16 21:00, Frank Rowand wrote:
>>> On 11/17/16 07:32, Sudeep Holla wrote:
>>>> Currently platforms/drivers needing to get the machine model name are
>>>> replicating the same snippet of code. In some case, the OF reference
>>>> counting is either missing or incorrect.
>>>>
>>>> This patch adds support to read the machine model name either using
>>>> the "model" or the "compatible" property in the device tree root node
>>>> to the core OF/DT code.
>>>>
>>>> This can be used to remove all the duplicate code snippets doing exactly
>>>> same thing later.
>>>
>>> I find five instances of reading only property "model":
>>>
>>>   arch/arm/mach-imx/cpu.c
>>>   arch/arm/mach-mxs/mach-mxs.c
>>>   arch/c6x/kernel/setup.c
>>>   arch/mips/cavium-octeon/setup.c
>>>   arch/sh/boards/of-generic.c
>>>
>>
>> Ah sorry you were not Cc-ed in 2/2, but that shows all the instances
>> that this will be used for.
>
> I have not seen 2/2.  I do not see it on the devicetree list or on lkml.
>

Yes on both [1][2]

> I did see a list of drivers in the RFC patch that you sent several hours
> before this patch.
>
> In that patch you replaced reading the model name from the _flat_ device
> tree with the new function in at least one location.  That is not
> correct.
>
>
>>
>>> I find one instance of reading property "model", then if
>>> that does not exist, property "compatible":
>>>
>>>   arch/mips/generic/proc.c
>>>
>>
>> Correct as you can check in patch 2/2
>>
>>> The proposed patch matches the code used in one place, and thus
>>> current usage does not match the patch description.
>>>
>>
>> Yes, but does it matter ? compatibles are somewhat informative about the
>> model IMO.
>
> Yes it does matter.  That is just sloppy and makes devicetree yet harder
> to understand.  It hurts clarity.  The new function name says get "model",
> not get "model" or "first element of the compatible list".
>

This is a implementation in the Linux and it doesn't change anything in
DT semantics. I am not able to get your concern.

> And using the _first_ element only of the compatible list to determine
> model is not a good paradigm.  It is yet another hidden, special case,
> undocumented trap to lure in the unwary.
>

The function is documented and again this doesn't enforce anything in 
the bindings. It's just the way it's used by the Linux kernel.

[...]

>
> You also ignored Arnd's comment in reply to your RFC patch.
>

OK, all I can see is that Arnd wanted to reuse of_root, which I did.
Did I miss anything else ?

-- 
Regards,
Sudeep

[1] http://marc.info/?l=linux-kernel&m=147940586616629&w=2
[2] http://marc.info/?l=linux-kernel&m=147940575116579&w=2
