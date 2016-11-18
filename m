From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] of: base: add support to get machine model name
Date: Fri, 18 Nov 2016 10:41:10 +0000
Message-ID: <075d4718-8cd2-e390-b755-bc24e7497eae@arm.com>
References: <1479396775-32033-1-git-send-email-sudeep.holla@arm.com>
 <582E1A59.7040502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <582E1A59.7040502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 17/11/16 21:00, Frank Rowand wrote:
> On 11/17/16 07:32, Sudeep Holla wrote:
>> Currently platforms/drivers needing to get the machine model name are
>> replicating the same snippet of code. In some case, the OF reference
>> counting is either missing or incorrect.
>>
>> This patch adds support to read the machine model name either using
>> the "model" or the "compatible" property in the device tree root node
>> to the core OF/DT code.
>>
>> This can be used to remove all the duplicate code snippets doing exactly
>> same thing later.
>
> I find five instances of reading only property "model":
>
>   arch/arm/mach-imx/cpu.c
>   arch/arm/mach-mxs/mach-mxs.c
>   arch/c6x/kernel/setup.c
>   arch/mips/cavium-octeon/setup.c
>   arch/sh/boards/of-generic.c
>

Ah sorry you were not Cc-ed in 2/2, but that shows all the instances
that this will be used for.

> I find one instance of reading property "model", then if
> that does not exist, property "compatible":
>
>   arch/mips/generic/proc.c
>

Correct as you can check in patch 2/2

> The proposed patch matches the code used in one place, and thus
> current usage does not match the patch description.
>

Yes, but does it matter ? compatibles are somewhat informative about the
model IMO.

> Is my search bad?  Are you planning to add additional instances
> of reading "model" then "compatible"?
>

No, just replacing the existing ones as in patch 2/2

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
