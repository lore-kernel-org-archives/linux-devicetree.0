From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] of: base: add support to get machine model name
Date: Mon, 21 Nov 2016 12:49:08 -0800
Message-ID: <58335DC4.1030905@gmail.com>
References: <1479396775-32033-1-git-send-email-sudeep.holla@arm.com>
 <582E1A59.7040502@gmail.com> <075d4718-8cd2-e390-b755-bc24e7497eae@arm.com>
 <582F6312.5040009@gmail.com> <58331B5D.8060907@gmail.com>
 <55e27115-421e-b67b-eb7a-9b1c3d662711@arm.com> <58334A06.103@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58334A06.103-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/21/16 11:24, Frank Rowand wrote:
> On 11/21/16 08:23, Sudeep Holla wrote:
>>
>>
>> On 21/11/16 16:05, Frank Rowand wrote:
>>> Hi Sudeep,
>>>
>>> On 11/18/16 12:22, Frank Rowand wrote:
>>>> On 11/18/16 02:41, Sudeep Holla wrote:
>>>>>
>>>>>
>>>>> On 17/11/16 21:00, Frank Rowand wrote:
>>>>>> On 11/17/16 07:32, Sudeep Holla wrote:
>>>>>>> Currently platforms/drivers needing to get the machine model name are
>>>>>>> replicating the same snippet of code. In some case, the OF reference
>>>>>>> counting is either missing or incorrect.
>>>>>>>
>>>>>>> This patch adds support to read the machine model name either using
>>>>>>> the "model" or the "compatible" property in the device tree root node
>>>>>>> to the core OF/DT code.
>>>>>>>
>>>>>>> This can be used to remove all the duplicate code snippets doing exactly
>>>>>>> same thing later.
>>>>>>
>>>>>> I find five instances of reading only property "model":
>>>>>>
>>>>>>   arch/arm/mach-imx/cpu.c
>>>>>>   arch/arm/mach-mxs/mach-mxs.c
>>>>>>   arch/c6x/kernel/setup.c
>>>>>>   arch/mips/cavium-octeon/setup.c
>>>>>>   arch/sh/boards/of-generic.c
>>>>>>
>>>>>
>>>>> Ah sorry you were not Cc-ed in 2/2, but that shows all the instances
>>>>> that this will be used for.
>>>>
>>>> I have not seen 2/2.  I do not see it on the devicetree list or on lkml.
>>>
>>> Can you please re-send patch 2/2?
>>>
>>
>> Since it is based on -next, I would prefer to wait until next merge
>> window to resend. You should be able to check in the link I sent if
>> that's OK.
> 
> I am missing or misunderstanding something.
> 
> I do not know what "the link I sent" means.

Ah, the links were in the email you sent before this one, but I read this
one first.  Got it now.


> 
> For some reason, the devicetree mail list and lmkl mail failed to send
> me a copy of patch 2/2.  Or my mail server failed to receive them.  That
> is why I asked you to resend the patch. I just now looked in the devicetree
> archive and found it there.
> 
> So I now can see how you plan to use the new function.
> 
> -Frank
> 
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
