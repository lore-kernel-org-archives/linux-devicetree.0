From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] of: base: add support to get machine model name
Date: Mon, 21 Nov 2016 08:05:49 -0800
Message-ID: <58331B5D.8060907@gmail.com>
References: <1479396775-32033-1-git-send-email-sudeep.holla@arm.com>
 <582E1A59.7040502@gmail.com> <075d4718-8cd2-e390-b755-bc24e7497eae@arm.com>
 <582F6312.5040009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <582F6312.5040009-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sudeep,

On 11/18/16 12:22, Frank Rowand wrote:
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

Can you please re-send patch 2/2?

-Frank

> 
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
> And using the _first_ element only of the compatible list to determine
> model is not a good paradigm.  It is yet another hidden, special case,
> undocumented trap to lure in the unwary.
> 
> It is extremely unlikely that the change actually changes behavior for an
> existing device tree because there is probably no dts that does not
> contain the model property but does contain the proper magic value in
> the compatible property.  But did you actually check for that?
> 
>>
>>> Is my search bad?  Are you planning to add additional instances
>>> of reading "model" then "compatible"?
>>>
>>
>> No, just replacing the existing ones as in patch 2/2
>>
> 
> You also ignored Arnd's comment in reply to your RFC patch.
> 
> -Frank
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
