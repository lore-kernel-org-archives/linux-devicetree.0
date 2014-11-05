From: leizhen <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] of/fdt: simplify early_init_dt_verify
Date: Wed, 5 Nov 2014 08:49:15 +0800
Message-ID: <5459740B.6000906@huawei.com>
References: <1414497065-9808-1-git-send-email-thunder.leizhen@huawei.com> <20141104162054.4CC9BC423D0@trevor.secretlab.ca> <CAErSpo6Upf=QPn7=Cd=XDazXVnSPhb-9gDZjH9_CcY37-xUKLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAErSpo6Upf=QPn7=Cd=XDazXVnSPhb-9gDZjH9_CcY37-xUKLw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2014/11/5 1:03, Bjorn Helgaas wrote:
> On Tue, Nov 4, 2014 at 9:20 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On Tue, 28 Oct 2014 19:51:05 +0800
>> , Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>  wrote:
>>> put off initial_boot_params = params; until all checks finished. If any check
>>> failed, initial_boot_params is equal NULL, base upon bss segment initial value.
>>>
>>> Signed-off-by: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>
>> Interesting. I received exactly the same patch from Bjorn Helgaas. Were
>> the two of you working together, or is this merely a coincedence?
> 
> LOL, that's really funny.  We're not working together, so it's a total
> coincidence :)
> 
Haha!!!

Hi, Bjorn Helgaas. Nice to meet you.

>>> ---
>>>  drivers/of/fdt.c | 10 ++++------
>>>  1 file changed, 4 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>>> index d1ffca8..325c638 100644
>>> --- a/drivers/of/fdt.c
>>> +++ b/drivers/of/fdt.c
>>> @@ -994,14 +994,12 @@ bool __init early_init_dt_verify(void *params)
>>>       if (!params)
>>>               return false;
>>>
>>> -     /* Setup flat device-tree pointer */
>>> -     initial_boot_params = params;
>>> -
>>>       /* check device tree validity */
>>> -     if (fdt_check_header(params)) {
>>> -             initial_boot_params = NULL;
>>> +     if (fdt_check_header(params))
>>>               return false;
>>> -     }
>>> +
>>> +     /* Setup flat device-tree pointer */
>>> +     initial_boot_params = params;
>>>
>>>       return true;
>>>  }
>>> --
>>> 1.8.0
>>>
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>> Please read the FAQ at  http://www.tux.org/lkml/
>>
> 
> .
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
